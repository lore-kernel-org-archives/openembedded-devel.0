Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE217169F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:25:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T9P3lV017429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 02:25:03 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 29 Apr 2015 02:25:03 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Apr 2015 17:25:02 +0800
Message-ID: <1430299502-26023-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-oe] samba: upgrade to 3.6.25
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
X-List-Received-Date: Wed, 29 Apr 2015 09:25:06 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to fix a CVE defect: CVE-2015-0240
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-0240

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../bug_221618_precise-64bit-prototype.patch                          | 0
 ...ug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch | 0
 .../bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch | 0
 .../bug_601406_fix-perl-path-in-example.patch                         | 0
 .../bug_604768_upstream_7826_drop-using-samba-link.patch              | 0
 .../bug_604768_upstream_7826_fix-WHATSNEW-link.patch                  | 0
 .../configure-disable-core_pattern-cross-check.patch                  | 0
 .../configure-disable-getaddrinfo-cross.patch                         | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/configure-libunwind.patch    | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/documentation.patch          | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/documentation2.patch         | 0
 .../{samba-3.6.24 => samba-3.6.25}/dont-build-VFS-examples.patch      | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/fhs-filespaths.patch         | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/installswat.sh.patch         | 0
 .../{samba-3.6.24 => samba-3.6.25}/libutil_drop_AI_ADDRCONFIG.patch   | 0
 .../{samba-3.6.24 => samba-3.6.25}/only_export_public_symbols.patch   | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/pam-examples.patch           | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/shadow_copy2_backport.patch  | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/smbclient-pager.patch        | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/smbtar-bashism.patch         | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/smbtorture-manpage.patch     | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/undefined-symbols.patch      | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/usershare.patch              | 0
 .../samba/{samba-3.6.24 => samba-3.6.25}/waf-as-source.patch          | 0
 .../recipes-connectivity/samba/{samba_3.6.24.bb => samba_3.6.25.bb}   | 4 ++--
 25 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/bug_221618_precise-64bit-prototype.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/bug_601406_fix-perl-path-in-example.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/bug_604768_upstream_7826_drop-using-samba-link.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/bug_604768_upstream_7826_fix-WHATSNEW-link.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/configure-disable-core_pattern-cross-check.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/configure-disable-getaddrinfo-cross.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/configure-libunwind.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/documentation.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/documentation2.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/dont-build-VFS-examples.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/fhs-filespaths.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/installswat.sh.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/libutil_drop_AI_ADDRCONFIG.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/only_export_public_symbols.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/pam-examples.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/shadow_copy2_backport.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/smbclient-pager.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/smbtar-bashism.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/smbtorture-manpage.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/undefined-symbols.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/usershare.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.24 => samba-3.6.25}/waf-as-source.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba_3.6.24.bb => samba_3.6.25.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_221618_precise-64bit-prototype.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_221618_precise-64bit-prototype.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_221618_precise-64bit-prototype.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_221618_precise-64bit-prototype.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_601406_fix-perl-path-in-example.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_601406_fix-perl-path-in-example.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_601406_fix-perl-path-in-example.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_601406_fix-perl-path-in-example.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_drop-using-samba-link.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_604768_upstream_7826_drop-using-samba-link.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_drop-using-samba-link.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_604768_upstream_7826_drop-using-samba-link.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_fix-WHATSNEW-link.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-core_pattern-cross-check.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/configure-disable-core_pattern-cross-check.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-core_pattern-cross-check.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/configure-disable-core_pattern-cross-check.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-getaddrinfo-cross.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/configure-disable-getaddrinfo-cross.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-getaddrinfo-cross.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/configure-disable-getaddrinfo-cross.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-libunwind.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/configure-libunwind.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-libunwind.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/configure-libunwind.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/documentation.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/documentation.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation2.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/documentation2.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation2.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/documentation2.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/dont-build-VFS-examples.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/dont-build-VFS-examples.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/dont-build-VFS-examples.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/dont-build-VFS-examples.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/fhs-filespaths.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/fhs-filespaths.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/fhs-filespaths.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/fhs-filespaths.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/installswat.sh.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/installswat.sh.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/installswat.sh.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/installswat.sh.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/libutil_drop_AI_ADDRCONFIG.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/libutil_drop_AI_ADDRCONFIG.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/only_export_public_symbols.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/only_export_public_symbols.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/only_export_public_symbols.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/only_export_public_symbols.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/pam-examples.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/pam-examples.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/pam-examples.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/pam-examples.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/shadow_copy2_backport.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/shadow_copy2_backport.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/shadow_copy2_backport.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/shadow_copy2_backport.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/smbclient-pager.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/smbclient-pager.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/smbclient-pager.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/smbclient-pager.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtar-bashism.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/smbtar-bashism.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtar-bashism.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/smbtar-bashism.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtorture-manpage.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/smbtorture-manpage.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtorture-manpage.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/smbtorture-manpage.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/undefined-symbols.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/undefined-symbols.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/undefined-symbols.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/undefined-symbols.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/usershare.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/usershare.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/usershare.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/usershare.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.24/waf-as-source.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.25/waf-as-source.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.24/waf-as-source.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.25/waf-as-source.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.24.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.25.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/samba/samba_3.6.24.bb
rename to meta-oe/recipes-connectivity/samba/samba_3.6.25.bb
index 8860da0..01861fb 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.24.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.25.bb
@@ -29,8 +29,8 @@ SRC_URI += "\
     file://configure-disable-core_pattern-cross-check.patch;patchdir=.. \
     file://configure-libunwind.patch;patchdir=.. \
 "
-SRC_URI[md5sum] = "d98425c0c2b73e08f048d31ffc727fb0"
-SRC_URI[sha256sum] = "11d0bd04b734731970259efc6692b8e749ff671a9b56d8cc5fa98c192ab234a7"
+SRC_URI[md5sum] = "76da2fa64edd94a0188531e7ecb27c4e"
+SRC_URI[sha256sum] = "8f2c8a7f2bd89b0dfd228ed917815852f7c625b2bc0936304ac3ed63aaf83751"
 
 S = "${WORKDIR}/samba-${PV}/source3"
 
-- 
2.1.0


