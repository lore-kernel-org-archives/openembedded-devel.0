Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48F8760167
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 09:05:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4995o71010701
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 May 2014 02:05:50 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 9 May 2014 02:05:49 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 May 2014 17:05:50 +0800
Message-ID: <1399626350-21897-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] strongswan: Security Advisory - strongswan - CVE-2014-2338
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
X-List-Received-Date: Fri, 09 May 2014 09:05:52 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

IKEv2 in strongSwan 4.0.7 before 5.1.3 allows remote attackers to bypass
authentication by rekeying an IKE_SA during (1) initiation or (2)
re-authentication, which triggers the IKE_SA state to be set to
established.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2338

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../strongswan-5.0.0-5.1.2_reject_child_sa.patch   |   36 ++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.1.1.bb |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch

diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch b/meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch
new file mode 100644
index 0000000..ab95992
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch
@@ -0,0 +1,36 @@
+From b980ba7757dcfedd756aa055b3271ea58cf85aa6 Mon Sep 17 00:00:00 2001
+From: Martin Willi <martin@revosec.ch>
+Date: Thu, 20 Feb 2014 16:08:43 +0100
+Subject: [PATCH] ikev2: Reject CREATE_CHILD_SA exchange on unestablished
+ IKE_SAs
+
+Prevents a responder peer to trick us into established state by starting
+IKE_SA rekeying before the IKE_SA has been authenticated during IKE_AUTH.
+
+Fixes CVE-2014-2338 for 5.x versions of strongSwan.
+---
+ src/libcharon/sa/ikev2/task_manager_v2.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa/ikev2/task_manager_v2.c
+index ac3be90..a5252ab 100644
+--- a/src/libcharon/sa/ikev2/task_manager_v2.c
++++ b/src/libcharon/sa/ikev2/task_manager_v2.c
+@@ -780,6 +780,15 @@ static status_t process_request(private_
+ 			case CREATE_CHILD_SA:
+ 			{	/* FIXME: we should prevent this on mediation connections */
+ 				bool notify_found = FALSE, ts_found = FALSE;
++
++				if (this->ike_sa->get_state(this->ike_sa) == IKE_CREATED ||
++					this->ike_sa->get_state(this->ike_sa) == IKE_CONNECTING)
++				{
++					DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
++						 "unestablished IKE_SA, rejected");
++					return FAILED;
++				}
++
+ 				enumerator = message->create_payload_enumerator(message);
+ 				while (enumerator->enumerate(enumerator, &payload))
+ 				{
+--
+1.8.1.2
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
index a2a2333..f8116e3 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
@@ -9,6 +9,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
+        file://strongswan-5.0.0-5.1.2_reject_child_sa.patch \
 "
 
 SRC_URI[md5sum] = "e3af3d493d22286be3cd794533a8966a"
-- 
1.7.10.4


