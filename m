Received: from ausc60ps301.us.dell.com ([143.166.148.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan_d_phillips@dell.com>) id 1PSBzK-0002rX-N6
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 18:15:04 +0100
X-Loopcount0: from 10.210.138.66
Message-ID: <4D065431.6080304@dell.com>
Date: Mon, 13 Dec 2010 11:13:21 -0600
From: Ryan D Phillips <ryan_d_phillips@dell.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 143.166.148.206
X-SA-Exim-Mail-From: ryan_d_phillips@dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc: use HTTP for svn checkout
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Dec 2010 17:15:04 -0000
X-Groupsio-MsgNum: 27126
Content-Type: multipart/mixed; boundary="------------090409010604050707080008"

--------------090409010604050707080008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  SVN over HTTP is a more reliable transport for developers behind 
restrictive
proxies.

Regards,
Ryan

--------------090409010604050707080008
Content-Type: text/plain;
 name="0001-eglibc-Use-HTTP-for-svn-checkout.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-eglibc-Use-HTTP-for-svn-checkout.patch"

From c0a5ad76e64d961735b5c07326d86107ef98f6a1 Mon Sep 17 00:00:00 2001
From: Ryan D Phillips <ryan_d_phillips@dell.com>
Date: Mon, 13 Dec 2010 10:00:27 -0600
Subject: [PATCH] eglibc: Use HTTP for svn checkout

SVN over HTTP is a more reliable transport for developers behind restrictive
proxies.

Signed-off-by: Ryan D Phillips <ryan_d_phillips@dell.com>
---
 recipes/eglibc/eglibc_2.10.bb |    2 +-
 recipes/eglibc/eglibc_2.11.bb |    2 +-
 recipes/eglibc/eglibc_2.12.bb |    2 +-
 recipes/eglibc/eglibc_2.9.bb  |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index 1eab7eb..e873bea 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.10"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10152"
 EGLIBC_BRANCH="eglibc-2_10"
-SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
+SRC_URI = "svn://svn.eglibc.org/svn/branches;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://armv4t-interworking.patch \
            file://IO-acquire-lock-fix.patch \
diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index b249f29..4a6f25d 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.8"
 PR_append = "+svnr${SRCPV}"
 SRCREV="12231"
 EGLIBC_BRANCH="eglibc-2_11"
-SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
+SRC_URI = "svn://svn.eglibc.org/svn/branches;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index 1285568..214da69 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.7"
 PR_append = "+svnr${SRCPV}"
 SRCREV="12230"
 EGLIBC_BRANCH="eglibc-2_12"
-SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
+SRC_URI = "svn://svn.eglibc.org/svn/branches;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index c06345e..b096469 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.10"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10153"
 EGLIBC_BRANCH="eglibc-2_9"
-SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
+SRC_URI = "svn://svn.eglibc.org/svn/branches;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://armv4t-interworking.patch \
            file://IO-acquire-lock-fix.patch \
-- 
1.7.2.3


--------------090409010604050707080008--
