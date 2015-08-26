Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A938C734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 09:10:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7Q9ABPk027669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 02:10:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 26 Aug 2015 02:10:10 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Aug 2015 17:05:48 +0800
Message-ID: <1440579948-23260-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] opensaf: fix build errors with gcc 5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 09:10:12 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patches from upstream to fix opensaf build failures with gcc 5.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../opensaf/Fix_GCC_5.1.0_compiler_warning.patch   | 64 +++++++++++++++++
 ...client_node_replyPending_to_unsigned_char.patch | 80 ++++++++++++++++++++++
 .../recipes-daemons/opensaf/opensaf_4.6.0.bb       |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch b/meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch
new file mode 100644
index 0000000..860d612
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+# HG changeset patch
+# User Anders Widell <anders.widell@ericsson.com>
+# Date 1431081180 -7200
+#      Fri May 08 12:33:00 2015 +0200
+# Branch opensaf-4.5.x
+# Node ID ee74d1846cadf5c237f420279610968216e3bbe0
+# Parent  32079e2039d2a31c1adfbe7eef2e6ee8a2e25810
+amf: Fix GCC 5.1.0 compiler warning [#1340]
+
+The following warning was fixed by replacing the case statement with an if
+statement:
+
+susm.cc: In function 'uint32_t avnd_evt_avd_su_pres_evh(AVND_CB*, AVND_EVT*)':
+susm.cc:1237:26: error: switch condition has type bool [-Werror=switch-bool]
+  switch (info->term_state) {
+                          ^
+
+diff -r 32079e2039d2 -r ee74d1846cad osaf/services/saf/amf/amfnd/susm.cc
+--- a/osaf/services/saf/amf/amfnd/susm.cc	Fri May 08 12:10:55 2015 +0530
++++ b/osaf/services/saf/amf/amfnd/susm.cc	Fri May 08 12:33:00 2015 +0200
+@@ -1234,8 +1234,7 @@
+ 		goto done;
+ 	}
+ 
+-	switch (info->term_state) {
+-	case true:		/* => terminate the su */
++	if (info->term_state) { /* => terminate the su */
+ 		/* Stop saAmfSGSuRestartProb timer if started */
+ 		if (su->su_err_esc_level == AVND_ERR_ESC_LEVEL_1) {
+ 			tmr_su_err_esc_stop(cb, su);
+@@ -1269,9 +1268,7 @@
+ 			if (NCSCC_RC_SUCCESS != rc)
+ 				goto done;
+ 		}
+-		break;
+-
+-	case false:		/* => instantiate the su */
++	} else { /* => instantiate the su */
+ 		TRACE("SU term state is set to false");
+ 		/* Reset admn term operation flag */
+ 		m_AVND_SU_ADMN_TERM_RESET(su);
+@@ -1299,7 +1296,7 @@
+ 			/* Will transition to instantiation-failed when instantiated */
+ 			LOG_ER("'%s':FAILED", __FUNCTION__); 
+ 			rc = NCSCC_RC_FAILURE;
+-			break;
++			goto done;
+ 		}
+ 		/* trigger su instantiation for pi su */
+ 		if (m_AVND_SU_IS_PREINSTANTIABLE(su)) {
+@@ -1315,8 +1312,7 @@
+ 			} else
+ 				osafassert(0);
+ 		}
+-		break;
+-	}			/* switch */
++	}
+ 
+ done:
+ 	TRACE_LEAVE2("%u", rc);
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch b/meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch
new file mode 100644
index 0000000..68d051e
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch
@@ -0,0 +1,80 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+# HG changeset patch
+# User Anders Bjornerstedt <anders.bjornerstedt@ericsson.com>
+# Date 1430120883 -7200
+#      Mon Apr 27 09:48:03 2015 +0200
+# Branch opensaf-4.6.x
+# Node ID 97eb2e7b29bbe0aacee0ad9b13cf84f1a4d5d9b0
+# Parent  60b2136fcadf82f653b43ba1b5790f6dc3be3161
+immsv: Revert imma_client_node->replyPending to unsigned char [#1341]
+
+
+The member imma_client_node->replyPending was in OpenSAF4.1 and earlier
+defined as 'uns8', i.e. a byte. But this member is a counter and not a boolean.
+The uns8 type was often used as a proxy for a boolean type in OpenSAF 4.1 and
+earlier. This was before 'bool' was available as a first class type for gcc.
+At some point in OpenSAF 4.2 the bool C type became available in gcc. There
+was then a general sweep across all services to change the use of uns8 to bool.
+The replyPending member was swept along in this change, but code actually
+still increments and decrements the value, which makes no sense for a boolean
+type.
+
+The intent of the replyPending member is to keep track of outstanding
+replies on requests from imma library to immnd server using the handle.
+This so that a restart of the local IMMND will result in the handle being
+marked as 'exposed' and not resurrected.
+An IMMND restart will mean that any unreplied requests will have lost
+their replies. This violates the interface contract from the imm service
+side towards the client using the handle and so the handle must not be
+allowed to get resurrected. Instead the handle must be marked as exposed.
+The client will then get an ERR_BAD_HANDLE from either saImmOxDispatch
+(failed active resurrect) or from the next syncronous downcall made after
+IMMND went down (failed reactive resurrect).
+
+For syncronous requests, the count will only go from 0 to 1 and back to 0 on
+reply. This ticket does not affect syncronous requests. For asyncronous
+requests it is possible for the client to invoke more than one request,
+before entering poll to receive replies. For asyncronous requests the
+replyPending member must work as a counter and not a boolean. The effect
+of being a boolean is that a handle may get resurrected when there is
+still asyncronous requests unreplied to, i.e. the replies would get silently
+lost.
+
+This changeset restores the type of the repliesPending member to unsigned char.
+
+diff -r 60b2136fcadf -r 97eb2e7b29bb osaf/libs/agents/saf/imma/imma_cb.h
+--- a/osaf/libs/agents/saf/imma/imma_cb.h	Fri Apr 24 14:40:09 2015 +0200
++++ b/osaf/libs/agents/saf/imma/imma_cb.h	Mon Apr 27 09:48:03 2015 +0200
+@@ -50,13 +50,13 @@
+ 	SaUint32T mImplementerId;	/*Only used for OI.*/
+ 	SaImmOiImplementerNameT  mImplementerName; /* needed for active resurrect*/
+ 	SaUint32T syncr_timeout;/* Timeout on syncr downcalls, dflt 10s, or setenv IMMA_SYNCR_TIMEOUT */
++	unsigned char replyPending; /* Syncronous or asyncronous call made towards IMMND */
+ 	bool isOm;		/*If true => then this is an OM client */
+ 	bool stale;		/*Loss of connection with immnd 
+ 					  will set this to true for the 
+ 					  connection. A resurrect can remove it.*/
+ 	bool exposed;    /* Exposed => stale is irreversible */
+ 	bool selObjUsable; /* Active resurrect possible for this client */
+-	bool replyPending; /* Syncronous or asyncronous call made towards IMMND */
+ 	bool isPbe;  /* True => This is the PBE-OI */
+ 	bool isImmA2b;       /* Version A.02.11 */
+ 	bool isImmA2bCbk;    /* Version A.02.11 callback*/
+diff -r 60b2136fcadf -r 97eb2e7b29bb osaf/libs/agents/saf/imma/imma_proc.c
+--- a/osaf/libs/agents/saf/imma/imma_proc.c	Fri Apr 24 14:40:09 2015 +0200
++++ b/osaf/libs/agents/saf/imma/imma_proc.c	Mon Apr 27 09:48:03 2015 +0200
+@@ -3346,7 +3346,10 @@
+ 				cl_node->handle);
+ 		}
+ 	} else {
+-		/* Reaching 255 is sticky. */
++		/* Decrementing from zero implies a bug in the library logic. 
++		   The real count has been lost. Set the value to 255. This does not
++		   disturb current function, but makes the handle not resurrectable in
++		   case of iMMND restart while handle is still open. */
+ 		TRACE_3("Will not decrement zero pending reply count for handle %llx",
+ 			cl_node->handle);
+ 		cl_node->replyPending = 0xff;
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
index 83cb1be..28f4c00 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
@@ -18,6 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://plmcd.service \
            file://plmcboot.service \
            file://0001-plmcd-error-fix.patch \
+           file://Revert_imma_client_node_replyPending_to_unsigned_char.patch \
+           file://Fix_GCC_5.1.0_compiler_warning.patch \
            "
 
 SRC_URI[md5sum] = "a1ceddb517c0972aa7e899b092d7f464"
-- 
1.9.1


