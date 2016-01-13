Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0F7A731D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 02:27:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2524360"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2016 10:27:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 958C5418915F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:27:12 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 13 Jan 2016 10:27:12 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jan 2016 18:26:58 -0800
Message-ID: <1452652018-26386-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20160107105715.GB2512@jama>
References: <20160107105715.GB2512@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 958C5418915F.AC882
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH v2] opensaf: 4.6.0 -> 4.7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2016 02:27:28 -0000
Content-Type: text/plain

1) Upgrade opensaf from 4.6.0 to 4.7.0.
2) Delete two patches,since they are not needed any more.
    Revert_imma_client_node_replyPending_to_unsigned_char.patch
    Fix_GCC_5.1.0_compiler_warning.patch

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../opensaf/Fix_GCC_5.1.0_compiler_warning.patch   | 64 -----------------
 ...client_node_replyPending_to_unsigned_char.patch | 80 ----------------------
 .../opensaf/{opensaf_4.6.0.bb => opensaf_4.7.0.bb} |  6 +-
 3 files changed, 2 insertions(+), 148 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch
 rename meta-networking/recipes-daemons/opensaf/{opensaf_4.6.0.bb => opensaf_4.7.0.bb} (89%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch b/meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch
deleted file mode 100644
index 860d612..0000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/Fix_GCC_5.1.0_compiler_warning.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-# HG changeset patch
-# User Anders Widell <anders.widell@ericsson.com>
-# Date 1431081180 -7200
-#      Fri May 08 12:33:00 2015 +0200
-# Branch opensaf-4.5.x
-# Node ID ee74d1846cadf5c237f420279610968216e3bbe0
-# Parent  32079e2039d2a31c1adfbe7eef2e6ee8a2e25810
-amf: Fix GCC 5.1.0 compiler warning [#1340]
-
-The following warning was fixed by replacing the case statement with an if
-statement:
-
-susm.cc: In function 'uint32_t avnd_evt_avd_su_pres_evh(AVND_CB*, AVND_EVT*)':
-susm.cc:1237:26: error: switch condition has type bool [-Werror=switch-bool]
-  switch (info->term_state) {
-                          ^
-
-diff -r 32079e2039d2 -r ee74d1846cad osaf/services/saf/amf/amfnd/susm.cc
---- a/osaf/services/saf/amf/amfnd/susm.cc	Fri May 08 12:10:55 2015 +0530
-+++ b/osaf/services/saf/amf/amfnd/susm.cc	Fri May 08 12:33:00 2015 +0200
-@@ -1234,8 +1234,7 @@
- 		goto done;
- 	}
- 
--	switch (info->term_state) {
--	case true:		/* => terminate the su */
-+	if (info->term_state) { /* => terminate the su */
- 		/* Stop saAmfSGSuRestartProb timer if started */
- 		if (su->su_err_esc_level == AVND_ERR_ESC_LEVEL_1) {
- 			tmr_su_err_esc_stop(cb, su);
-@@ -1269,9 +1268,7 @@
- 			if (NCSCC_RC_SUCCESS != rc)
- 				goto done;
- 		}
--		break;
--
--	case false:		/* => instantiate the su */
-+	} else { /* => instantiate the su */
- 		TRACE("SU term state is set to false");
- 		/* Reset admn term operation flag */
- 		m_AVND_SU_ADMN_TERM_RESET(su);
-@@ -1299,7 +1296,7 @@
- 			/* Will transition to instantiation-failed when instantiated */
- 			LOG_ER("'%s':FAILED", __FUNCTION__); 
- 			rc = NCSCC_RC_FAILURE;
--			break;
-+			goto done;
- 		}
- 		/* trigger su instantiation for pi su */
- 		if (m_AVND_SU_IS_PREINSTANTIABLE(su)) {
-@@ -1315,8 +1312,7 @@
- 			} else
- 				osafassert(0);
- 		}
--		break;
--	}			/* switch */
-+	}
- 
- done:
- 	TRACE_LEAVE2("%u", rc);
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch b/meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch
deleted file mode 100644
index 68d051e..0000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/Revert_imma_client_node_replyPending_to_unsigned_char.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-# HG changeset patch
-# User Anders Bjornerstedt <anders.bjornerstedt@ericsson.com>
-# Date 1430120883 -7200
-#      Mon Apr 27 09:48:03 2015 +0200
-# Branch opensaf-4.6.x
-# Node ID 97eb2e7b29bbe0aacee0ad9b13cf84f1a4d5d9b0
-# Parent  60b2136fcadf82f653b43ba1b5790f6dc3be3161
-immsv: Revert imma_client_node->replyPending to unsigned char [#1341]
-
-
-The member imma_client_node->replyPending was in OpenSAF4.1 and earlier
-defined as 'uns8', i.e. a byte. But this member is a counter and not a boolean.
-The uns8 type was often used as a proxy for a boolean type in OpenSAF 4.1 and
-earlier. This was before 'bool' was available as a first class type for gcc.
-At some point in OpenSAF 4.2 the bool C type became available in gcc. There
-was then a general sweep across all services to change the use of uns8 to bool.
-The replyPending member was swept along in this change, but code actually
-still increments and decrements the value, which makes no sense for a boolean
-type.
-
-The intent of the replyPending member is to keep track of outstanding
-replies on requests from imma library to immnd server using the handle.
-This so that a restart of the local IMMND will result in the handle being
-marked as 'exposed' and not resurrected.
-An IMMND restart will mean that any unreplied requests will have lost
-their replies. This violates the interface contract from the imm service
-side towards the client using the handle and so the handle must not be
-allowed to get resurrected. Instead the handle must be marked as exposed.
-The client will then get an ERR_BAD_HANDLE from either saImmOxDispatch
-(failed active resurrect) or from the next syncronous downcall made after
-IMMND went down (failed reactive resurrect).
-
-For syncronous requests, the count will only go from 0 to 1 and back to 0 on
-reply. This ticket does not affect syncronous requests. For asyncronous
-requests it is possible for the client to invoke more than one request,
-before entering poll to receive replies. For asyncronous requests the
-replyPending member must work as a counter and not a boolean. The effect
-of being a boolean is that a handle may get resurrected when there is
-still asyncronous requests unreplied to, i.e. the replies would get silently
-lost.
-
-This changeset restores the type of the repliesPending member to unsigned char.
-
-diff -r 60b2136fcadf -r 97eb2e7b29bb osaf/libs/agents/saf/imma/imma_cb.h
---- a/osaf/libs/agents/saf/imma/imma_cb.h	Fri Apr 24 14:40:09 2015 +0200
-+++ b/osaf/libs/agents/saf/imma/imma_cb.h	Mon Apr 27 09:48:03 2015 +0200
-@@ -50,13 +50,13 @@
- 	SaUint32T mImplementerId;	/*Only used for OI.*/
- 	SaImmOiImplementerNameT  mImplementerName; /* needed for active resurrect*/
- 	SaUint32T syncr_timeout;/* Timeout on syncr downcalls, dflt 10s, or setenv IMMA_SYNCR_TIMEOUT */
-+	unsigned char replyPending; /* Syncronous or asyncronous call made towards IMMND */
- 	bool isOm;		/*If true => then this is an OM client */
- 	bool stale;		/*Loss of connection with immnd 
- 					  will set this to true for the 
- 					  connection. A resurrect can remove it.*/
- 	bool exposed;    /* Exposed => stale is irreversible */
- 	bool selObjUsable; /* Active resurrect possible for this client */
--	bool replyPending; /* Syncronous or asyncronous call made towards IMMND */
- 	bool isPbe;  /* True => This is the PBE-OI */
- 	bool isImmA2b;       /* Version A.02.11 */
- 	bool isImmA2bCbk;    /* Version A.02.11 callback*/
-diff -r 60b2136fcadf -r 97eb2e7b29bb osaf/libs/agents/saf/imma/imma_proc.c
---- a/osaf/libs/agents/saf/imma/imma_proc.c	Fri Apr 24 14:40:09 2015 +0200
-+++ b/osaf/libs/agents/saf/imma/imma_proc.c	Mon Apr 27 09:48:03 2015 +0200
-@@ -3346,7 +3346,10 @@
- 				cl_node->handle);
- 		}
- 	} else {
--		/* Reaching 255 is sticky. */
-+		/* Decrementing from zero implies a bug in the library logic. 
-+		   The real count has been lost. Set the value to 255. This does not
-+		   disturb current function, but makes the handle not resurrectable in
-+		   case of iMMND restart while handle is still open. */
- 		TRACE_3("Will not decrement zero pending reply count for handle %llx",
- 			cl_node->handle);
- 		cl_node->replyPending = 0xff;
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
similarity index 89%
rename from meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
index 9084524..42e883a 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
@@ -16,12 +16,10 @@ inherit autotools useradd systemd pkgconfig
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://install-samples-from-srcdir.patch \
            file://0001-plmcd-error-fix.patch \
-           file://Revert_imma_client_node_replyPending_to_unsigned_char.patch \
-           file://Fix_GCC_5.1.0_compiler_warning.patch \
            "
 
-SRC_URI[md5sum] = "a1ceddb517c0972aa7e899b092d7f464"
-SRC_URI[sha256sum] = "f6ea754a145ae42552f328f96c32f38429ad06478a351b9d0aed812adcecb2b4"
+SRC_URI[md5sum] = "82dd2777a672140e22b8205f10aa55d3"
+SRC_URI[sha256sum] = "da9e138650b835728ad51d99268d3a31419b254c4cb4e87c6ec90bc45266d7d2"
 
 SECTION = "admin"
 LICENSE = "LGPLv2.1"
-- 
1.9.1




