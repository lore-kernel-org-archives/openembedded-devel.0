Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.10694.1593397367253212395
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 19:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: dhuo@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05T2MjHM002664
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 19:22:46 -0700 (PDT)
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Sun, 28 Jun 2020
 19:22:27 -0700
Received: by pek-lpggp2 (Postfix, from userid 18189)	id 52D7D72154E; Mon, 29
 Jun 2020 10:21:52 +0800 (CST)
From: "De Huo" <de.huo@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <de.huo@windriver.com>
Subject: [oe][meta-oe][zeus][PATCH] perl: Fix CVE-2020-10543
Date: Mon, 29 Jun 2020 10:21:49 +0800
Message-ID: <1593397309-58266-1-git-send-email-De.Huo@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain

(CVE-2020-10543) On 32bit systems the size calculations for nested regular
expression quantifiers could overflow causing heap memory corruption.

Fixes: Perl/perl5-security#125
(cherry picked from commit bfd31397db5dc1a5c5d3e0a1f753a4f89a736e71)

Signed-off-by: De Huo <De.Huo@windriver.com>
---
 .../perl/files/CVE-2020-10543.patch                | 41 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2020-10543.patch b/meta/recipes-devtools/perl/files/CVE-2020-10543.patch
new file mode 100644
index 0000000..c24ebc1
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2020-10543.patch
@@ -0,0 +1,41 @@
+From 897d1f7fd515b828e4b198d8b8bef76c6faf03ed Mon Sep 17 00:00:00 2001
+From: John Lightsey <jd@cpanel.net>
+Date: Wed, 20 Nov 2019 20:02:45 -0600
+Subject: [PATCH] regcomp.c: Prevent integer overflow from nested regex
+ quantifiers.
+
+(CVE-2020-10543) On 32bit systems the size calculations for nested regular
+expression quantifiers could overflow causing heap memory corruption.
+
+Fixes: Perl/perl5-security#125
+(cherry picked from commit bfd31397db5dc1a5c5d3e0a1f753a4f89a736e71)
+
+CVE: CVE-2020-10543
+Upstream-Status: Backport [https://github.com/perl/perl5/commit/897d1f7fd515b828e4b198d8b8bef76c6faf03ed]
+
+Signed-off-by: John Lightsey <jd@cpanel.net>
+Signed-off-by: De Huo <de.huo@windriver.com>
+---
+ regcomp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/regcomp.c b/regcomp.c
+index 93c8d98..5f86be8 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -5489,6 +5489,12 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regnode **scanp,
+ 				  RExC_precomp)));
+                 }
+ 
++                if ( ( minnext > 0 && mincount >= SSize_t_MAX / minnext )
++                    || min >= SSize_t_MAX - minnext * mincount )
++                {
++                    FAIL("Regexp out of space");
++                }
++
+ 		min += minnext * mincount;
+ 		is_inf_internal |= deltanext == SSize_t_MAX
+                          || (maxcount == REG_INFTY && minnext + deltanext > 0);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 32746c7..ba9424c 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
            file://determinism.patch  \
            file://racefix.patch \
+           file://CVE-2020-10543.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
1.9.1

