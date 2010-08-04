Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjAw-000642-PL
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:58:55 +0200
Received: by pxi16 with SMTP id 16so42772pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ic0MgrY3bKzducyO3FaskRl2hNT2Qo4VN7BYhXljwKY=;
	b=RvV2NoTmWwt71V8rjDnI+BvTh2rVo2jqrBnTUuJSUyp5JnqW9TV+SvDbj0XWRvDcuJ
	MPgIFB2PKteED86KdQWjNLh8FXogOycA2oA/VlUOokV8gaeh6oT4HxXxDmN29ncO6foG
	rsGW09Nmc/NXSpIUbSxRS98KWrIxAB8R8QodY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hWxDTdbz5wVQGbqD6REiCYw9tCsA4yKWoI9qXSMxiE6lYkrEOoxvCuyA8ULSEqBgr8
	N4FVF0usF3OFTMyknp+LSdq63zva9iV13YgjEfoUN+Fc0yK3VdZoRLp861w3KJr7g8QJ
	zhyDcJe0AXikBpzZBf+2VT8vBO5lv6V9VEatE=
Received: by 10.142.209.12 with SMTP id h12mr8130544wfg.197.1280948293855;
	Wed, 04 Aug 2010 11:58:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10876016wfl.1.2010.08.04.11.58.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:58:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:57:59 -0700
Message-Id: <1280948285-3458-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/7] popt: Use BBCLASSEXTEND instead of native recipes.
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
X-List-Received-Date: Wed, 04 Aug 2010 18:58:57 -0000

* Use INC_PR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/popt/popt-native_1.14.bb |    5 -----
 recipes/popt/popt-native_1.7.bb  |   10 ----------
 recipes/popt/popt.inc            |    4 ++--
 recipes/popt/popt_1.14.bb        |    5 ++---
 recipes/popt/popt_1.7.bb         |    8 +++-----
 5 files changed, 7 insertions(+), 25 deletions(-)
 delete mode 100644 recipes/popt/popt-native_1.14.bb
 delete mode 100644 recipes/popt/popt-native_1.7.bb

diff --git a/recipes/popt/popt-native_1.14.bb b/recipes/popt/popt-native_1.14.bb
deleted file mode 100644
index dfad9fb..0000000
--- a/recipes/popt/popt-native_1.14.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require popt_${PV}.bb
-DEPENDS = "gettext-native"
-inherit native
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/popt-${PV}"
diff --git a/recipes/popt/popt-native_1.7.bb b/recipes/popt/popt-native_1.7.bb
deleted file mode 100644
index c3c5a63..0000000
--- a/recipes/popt/popt-native_1.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require popt_${PV}.bb
-DEPENDS = "gettext-native"
-inherit native
-
-S = "${WORKDIR}/popt-${PV}"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/popt-${PV}"
-
-SRC_URI[md5sum] = "5988e7aeb0ae4dac8d83561265984cc9"
-SRC_URI[sha256sum] = "4e75cb28793f0d44134f71fae53057d5f250805e6268fbd9c9780654b73b0dc1"
diff --git a/recipes/popt/popt.inc b/recipes/popt/popt.inc
index 07671d7..d95bc49 100644
--- a/recipes/popt/popt.inc
+++ b/recipes/popt/popt.inc
@@ -4,6 +4,6 @@ AUTHOR = "Jeff Johnson"
 LICENSE = "MIT"
 SECTION = "libs"
 
-S = "${WORKDIR}/popt-${PV}"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/popt-${PV}"
+INC_PR = "r3"
 
+inherit autotools gettext
diff --git a/recipes/popt/popt_1.14.bb b/recipes/popt/popt_1.14.bb
index 1f6a220..d5e9a60 100644
--- a/recipes/popt/popt_1.14.bb
+++ b/recipes/popt/popt_1.14.bb
@@ -1,11 +1,10 @@
 require popt.inc
-PR = "r2"
-
-inherit autotools_stage gettext
+PR = "${INC_PR}.0"
 
 SRC_URI = "\
   http://rpm5.org/files/popt/popt-${PV}.tar.gz \
 "
+BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "4f90a07316eb825604dd10ae4f9f3f04"
 SRC_URI[sha256sum] = "175be17571e9af3ad622531b494a0738ae632c60c8c6329273778b2b6fbbad74"
diff --git a/recipes/popt/popt_1.7.bb b/recipes/popt/popt_1.7.bb
index aab8094..c568539 100644
--- a/recipes/popt/popt_1.7.bb
+++ b/recipes/popt/popt_1.7.bb
@@ -1,10 +1,6 @@
 require popt.inc
 
-PR = "r1"
-
-DEPENDS = "gettext virtual/libintl"
-
-inherit autotools autotools_stage
+PR = "${INC_PR}.0"
 
 SRC_URI = "\
   http://rpm.org/releases/historical/rpm-4.1.x/popt-${PV}.tar.gz \
@@ -22,5 +18,7 @@ do_configure() {
        oe_runconf
 }
 
+BBCLASSEXTEND = "native"
+
 SRC_URI[md5sum] = "5988e7aeb0ae4dac8d83561265984cc9"
 SRC_URI[sha256sum] = "4e75cb28793f0d44134f71fae53057d5f250805e6268fbd9c9780654b73b0dc1"
-- 
1.7.1



