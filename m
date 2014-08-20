Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB1E565DD6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 09:41:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7K9f7d8005183
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 02:41:07 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 20 Aug 2014 02:41:07 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Aug 2014 17:41:02 +0800
Message-ID: <1408527662-14865-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [meta-oe][PATCH] samba: upgrade to 3.6.24
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
X-List-Received-Date: Wed, 20 Aug 2014 09:41:08 -0000
Content-Type: text/plain

Upgrade samba to latest 3.6.x version.

* remove PR
* remove backport CVE patches
* update 4 patches: documentation.patch, documentation2.patch, undefined-symbols.patch
  and bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../bug_221618_precise-64bit-prototype.patch       |   0
 ...4104_mention-kerberos-in-smbspool-manpage.patch |   4 +-
 ...m_7499-nss_wins-dont-clobber-daemons-logs.patch |   0
 .../bug_601406_fix-perl-path-in-example.patch      |   0
 ...04768_upstream_7826_drop-using-samba-link.patch |   0
 ...ug_604768_upstream_7826_fix-WHATSNEW-link.patch |   0
 ...onfigure-disable-core_pattern-cross-check.patch |   0
 .../configure-disable-getaddrinfo-cross.patch      |   0
 .../configure-libunwind.patch                      |   0
 .../documentation.patch                            |  16 +-
 .../documentation2.patch                           |   8 +-
 .../dont-build-VFS-examples.patch                  |   0
 .../fhs-filespaths.patch                           |   0
 .../installswat.sh.patch                           |   0
 .../libutil_drop_AI_ADDRCONFIG.patch               |   0
 .../only_export_public_symbols.patch               |   0
 .../pam-examples.patch                             |   0
 .../shadow_copy2_backport.patch                    |   0
 .../smbclient-pager.patch                          |   0
 .../smbtar-bashism.patch                           |   0
 .../smbtorture-manpage.patch                       |   0
 .../undefined-symbols.patch                        |   6 +-
 .../{samba-3.6.8 => samba-3.6.24}/usershare.patch  |   0
 .../waf-as-source.patch                            |   0
 .../samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch | 160 ----
 .../samba/samba/samba-3.6.16-CVE-2013-4124.patch   |  43 -
 .../samba/samba/samba-3.6.19-CVE-2013-4475.patch   | 102 ---
 .../samba/samba/samba-3.6.22-CVE-2013-4496.patch   | 966 ---------------------
 .../samba/{samba_3.6.8.bb => samba_3.6.24.bb}      |  11 +-
 29 files changed, 19 insertions(+), 1297 deletions(-)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/bug_221618_precise-64bit-prototype.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch (79%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/bug_601406_fix-perl-path-in-example.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/bug_604768_upstream_7826_drop-using-samba-link.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/bug_604768_upstream_7826_fix-WHATSNEW-link.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/configure-disable-core_pattern-cross-check.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/configure-disable-getaddrinfo-cross.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/configure-libunwind.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/documentation.patch (92%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/documentation2.patch (99%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/dont-build-VFS-examples.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/fhs-filespaths.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/installswat.sh.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/libutil_drop_AI_ADDRCONFIG.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/only_export_public_symbols.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/pam-examples.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/shadow_copy2_backport.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/smbclient-pager.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/smbtar-bashism.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/smbtorture-manpage.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/undefined-symbols.patch (86%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/usershare.patch (100%)
 rename meta-oe/recipes-connectivity/samba/{samba-3.6.8 => samba-3.6.24}/waf-as-source.patch (100%)
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/samba-3.6.22-CVE-2013-4496.patch
 rename meta-oe/recipes-connectivity/samba/{samba_3.6.8.bb => samba_3.6.24.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_221618_precise-64bit-prototype.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_221618_precise-64bit-prototype.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_221618_precise-64bit-prototype.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_221618_precise-64bit-prototype.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
similarity index 79%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
index ea499a6..d9cc633 100644
--- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
@@ -27,8 +27,8 @@ Index: samba/docs/manpages/smbspool.8
  .sp -1
  .IP \(bu 2.3
  .\}
--The user argument (argv[2]) contains the print user\'s name and is presently not used by smbspool\&.
-+The user argument (argv[2]) contains the print user\'s name and is presently not used by smbspool except in Kerberos environments to access the user\'s ticket cache\&.
+-The user argument (argv[2]) contains the print user\*(Aqs name and is presently not used by smbspool\&.
++The user argument (argv[2]) contains the print user\*(Aqs name and is presently not used by smbspool except in Kerberos environments to access the user\'s ticket cache\&.
  .RE
  .sp
  .RS 4
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_601406_fix-perl-path-in-example.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_601406_fix-perl-path-in-example.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_601406_fix-perl-path-in-example.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_601406_fix-perl-path-in-example.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_604768_upstream_7826_drop-using-samba-link.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_drop-using-samba-link.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_604768_upstream_7826_drop-using-samba-link.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_drop-using-samba-link.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_604768_upstream_7826_fix-WHATSNEW-link.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-disable-core_pattern-cross-check.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-core_pattern-cross-check.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-disable-core_pattern-cross-check.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-core_pattern-cross-check.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-disable-getaddrinfo-cross.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-getaddrinfo-cross.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-disable-getaddrinfo-cross.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-getaddrinfo-cross.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-libunwind.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-libunwind.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-libunwind.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-libunwind.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation.patch
similarity index 92%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation.patch
index 46ace23..73111fe 100644
--- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation.patch
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation.patch
@@ -6,7 +6,7 @@ Index: experimental/docs/manpages/swat.8
 ===================================================================
 --- experimental.orig/docs/manpages/swat.8
 +++ experimental/docs/manpages/swat.8
-@@ -111,86 +111,6 @@
+@@ -120,86 +120,6 @@
  .RS 4
  Print a summary of command line options\&.
  .RE
@@ -73,7 +73,7 @@ Index: experimental/docs/manpages/swat.8
 -/etc/services
 -file\&.
 -.PP
--the choice of port number isn\'t really important except that it should be less than 1024 and not currently used (using a number above 1024 presents an obscure security hole depending on the implementation details of your
+-the choice of port number isn\*(Aqt really important except that it should be less than 1024 and not currently used (using a number above 1024 presents an obscure security hole depending on the implementation details of your
 -inetd
 -daemon)\&.
 -.PP
@@ -93,7 +93,7 @@ Index: experimental/docs/manpages/swat.8
  .SH "LAUNCHING"
  .PP
  To launch SWAT just run your favorite web browser and point it at "http://localhost:901/"\&.
-@@ -208,14 +128,11 @@
+@@ -217,14 +137,11 @@
  This file must contain a mapping of service name (e\&.g\&., swat) to service port (e\&.g\&., 901) and protocol type (e\&.g\&., tcp)\&.
  .RE
  .PP
@@ -260,20 +260,20 @@ Index: experimental/docs/manpages/winbindd.8
 ===================================================================
 --- experimental.orig/docs/manpages/winbindd.8
 +++ experimental/docs/manpages/winbindd.8
-@@ -550,16 +550,16 @@
+@@ -539,16 +539,16 @@
  file are owned by root\&.
  .RE
  .PP
 -$LOCKDIR/winbindd_privileged/pipe
 +/var/run/samba/winbindd_privileged/pipe
  .RS 4
- The UNIX pipe over which \'privileged\' clients communicate with the
+ The UNIX pipe over which \*(Aqprivileged\*(Aq clients communicate with the
  winbindd
  program\&. For security reasons, access to some winbindd functions \- like those needed by the
  ntlm_auth
--utility \- is restricted\&. By default, only users in the \'root\' group will get this access, however the administrator may change the group permissions on $LOCKDIR/winbindd_privileged to allow programs like \'squid\' to use ntlm_auth\&. Note that the winbind client will only attempt to connect to the winbindd daemon if both the
+-utility \- is restricted\&. By default, only users in the \*(Aqroot\*(Aq group will get this access, however the administrator may change the group permissions on $LOCKDIR/winbindd_privileged to allow programs like \*(Aqsquid\*(Aq to use ntlm_auth\&. Note that the winbind client will only attempt to connect to the winbindd daemon if both the
 -$LOCKDIR/winbindd_privileged
-+utility \- is restricted\&. By default, only users in the \'root\' group will get this access, however the administrator may change the group permissions on /var/run/samba/winbindd_privileged to allow programs like \'squid\' to use ntlm_auth\&. Note that the winbind client will only attempt to connect to the winbindd daemon if both the
++utility \- is restricted\&. By default, only users in the \'root\' group will get this access, however the administrator may change the group permissions on /var/run/samba/winbindd_privileged to allow programs like \'squid\' to use ntlm_auth\&. Note that the winbind client will only attempt to connect to the winbindd daemon if both the                   
 +/var/run/samba/winbindd_privileged
  directory and
 -$LOCKDIR/winbindd_privileged/pipe
@@ -281,7 +281,7 @@ Index: experimental/docs/manpages/winbindd.8
  file are owned by root\&.
  .RE
  .PP
-@@ -568,15 +568,12 @@
+@@ -557,15 +557,12 @@
  Implementation of name service switch library\&.
  .RE
  .PP
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation2.patch
similarity index 99%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation2.patch
index 902e8e2..af8da32 100644
--- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation2.patch
@@ -212,8 +212,8 @@ Index: samba/docs/manpages/nmbd.8
  \fBsmb.conf\fR(5),
  \fBsmbclient\fR(1),
 -\fBtestparm\fR(1),
--\fBtestprns\fR(1), and the Internet RFC\'s
-+\fBtestparm\fR(1), and the Internet RFC\'s
+-\fBtestprns\fR(1), and the Internet RFC\*(Aqs
++\fBtestparm\fR(1), and the Internet RFC\*(Aqs
  rfc1001\&.txt,
  rfc1002\&.txt\&. In addition the CIFS (formerly SMB) specification is available as a link from the Web page
  http://samba\&.org/cifs/\&.
@@ -269,8 +269,8 @@ Index: samba/docs/manpages/smbd.8
  \fBsmb.conf\fR(5),
  \fBsmbclient\fR(1),
 -\fBtestparm\fR(1),
--\fBtestprns\fR(1), and the Internet RFC\'s
-+\fBtestparm\fR(1), and the Internet RFC\'s
+-\fBtestprns\fR(1), and the Internet RFC\*(Aqs
++\fBtestparm\fR(1), and the Internet RFC\*(Aqs
  rfc1001\&.txt,
  rfc1002\&.txt\&. In addition the CIFS (formerly SMB) specification is available as a link from the Web page
  http://samba\&.org/cifs/\&.
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/dont-build-VFS-examples.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/dont-build-VFS-examples.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/dont-build-VFS-examples.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/dont-build-VFS-examples.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/fhs-filespaths.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/fhs-filespaths.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/fhs-filespaths.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/fhs-filespaths.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/installswat.sh.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/installswat.sh.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/installswat.sh.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/installswat.sh.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/libutil_drop_AI_ADDRCONFIG.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/libutil_drop_AI_ADDRCONFIG.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/only_export_public_symbols.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/only_export_public_symbols.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/only_export_public_symbols.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/only_export_public_symbols.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/pam-examples.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/pam-examples.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/pam-examples.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/pam-examples.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/shadow_copy2_backport.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/shadow_copy2_backport.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/shadow_copy2_backport.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/shadow_copy2_backport.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/smbclient-pager.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/smbclient-pager.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/smbclient-pager.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/smbclient-pager.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/smbtar-bashism.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtar-bashism.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/smbtar-bashism.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtar-bashism.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/smbtorture-manpage.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtorture-manpage.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/smbtorture-manpage.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtorture-manpage.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/undefined-symbols.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/undefined-symbols.patch
similarity index 86%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/undefined-symbols.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/undefined-symbols.patch
index 3ab0027..5babc1e 100644
--- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/undefined-symbols.patch
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.24/undefined-symbols.patch
@@ -13,12 +13,12 @@ Index: experimental/source3/Makefile.in
 ===================================================================
 --- experimental.orig/source3/Makefile.in
 +++ experimental/source3/Makefile.in
-@@ -2281,7 +2281,7 @@
+@@ -2594,7 +2594,7 @@
  
- $(LIBSMBCLIENT_SHARED_TARGET_SONAME): $(BINARY_PREREQS) $(LIBSMBCLIENT_OBJ) $(LIBSMBCLIENT_THREAD_OBJ) $(LIBSMBCLIENT_SYMS) $(LIBTALLOC) $(LIBTDB) $(LIBWBCLIENT)
+ $(LIBSMBCLIENT_SHARED_TARGET_SONAME): $(BINARY_PREREQS) $(LIBSMBCLIENT_OBJ) $(LIBSMBCLIENT_THREAD_OBJ) $(LIBSMBCLIENT_SYMS) $(LIBTALLOC) $(LIBTEVENT) $(LIBTDB) $(LIBWBCLIENT)
  	@echo Linking shared library $@
 -	@$(SHLD_DSO) $(LIBSMBCLIENT_OBJ) $(LIBSMBCLIENT_THREAD_OBJ) \
 +	@$(SHLD_DSO) -Wl,-z,defs $(LIBSMBCLIENT_OBJ) $(LIBSMBCLIENT_THREAD_OBJ) \
- 		$(LIBTALLOC_LIBS) $(LIBTDB_LIBS) $(LIBWBCLIENT_LIBS) $(LIBS) \
+ 		$(LIBTALLOC_LIBS) $(LIBTEVENT_LIBS) $(LIBTDB_LIBS) $(LIBWBCLIENT_LIBS) $(LIBS) \
  		$(KRB5LIBS) $(LDAP_LIBS) $(NSCD_LIBS) $(ZLIB_LIBS) $(PTHREAD_LDFLAGS) \
  		@SONAMEFLAG@`basename $@`
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/usershare.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/usershare.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/usershare.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/usershare.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.24/waf-as-source.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
rename to meta-oe/recipes-connectivity/samba/samba-3.6.24/waf-as-source.patch
diff --git a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch
deleted file mode 100644
index cccb341..0000000
--- a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-Upstream-Status: Backport
-
-From 71225948a249f079120282740fcc39fd6faa880e Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 18 Jan 2013 23:11:07 +0100
-Subject: [PATCH 1/2] swat: Use X-Frame-Options header to avoid clickjacking
-
-Jann Horn reported a potential clickjacking vulnerability in SWAT where
-the SWAT page could be embedded into an attacker's page using a frame or
-iframe and then used to trick the user to change Samba settings.
-
-Avoid this by telling the browser to refuse the frame embedding via the
-X-Frame-Options: DENY header.
-
-Signed-off-by: Kai Blin <kai@samba.org>
-
-Fix bug #9576 - CVE-2013-0213: Clickjacking issue in SWAT.
----
- source3/web/swat.c |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/source3/web/swat.c b/source3/web/swat.c
-index 1f6eb6c..ed80c38 100644
---- a/source3/web/swat.c
-+++ b/source3/web/swat.c
-@@ -266,7 +266,8 @@ static void print_header(void)
- 	if (!cgi_waspost()) {
- 		printf("Expires: 0\r\n");
- 	}
--	printf("Content-type: text/html\r\n\r\n");
-+	printf("Content-type: text/html\r\n");
-+	printf("X-Frame-Options: DENY\r\n\r\n");
- 
- 	if (!include_html("include/header.html")) {
- 		printf("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n");
--- 
-1.7.7
-
-
-From 91f4275873ebeda8f57684f09df67162ae80515a Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Mon, 28 Jan 2013 21:41:07 +0100
-Subject: [PATCH 2/2] swat: Use additional nonce on XSRF protection
-
-If the user had a weak password on the root account of a machine running
-SWAT, there still was a chance of being targetted by an XSRF on a
-malicious web site targetting the SWAT setup.
-
-Use a random nonce stored in secrets.tdb to close this possible attack
-window. Thanks to Jann Horn for reporting this issue.
-
-Signed-off-by: Kai Blin <kai@samba.org>
-
-Fix bug #9577: CVE-2013-0214: Potential XSRF in SWAT.
----
- source3/web/cgi.c        |   40 ++++++++++++++++++++++++++--------------
- source3/web/swat.c       |    2 ++
- source3/web/swat_proto.h |    1 +
- 3 files changed, 29 insertions(+), 14 deletions(-)
-
-diff --git a/source3/web/cgi.c b/source3/web/cgi.c
-index ef1b856..861bc84 100644
---- a/source3/web/cgi.c
-+++ b/source3/web/cgi.c
-@@ -48,6 +48,7 @@ static const char *baseurl;
- static char *pathinfo;
- static char *C_user;
- static char *C_pass;
-+static char *C_nonce;
- static bool inetd_server;
- static bool got_request;
- 
-@@ -329,20 +330,7 @@ static void cgi_web_auth(void)
- 	C_user = SMB_STRDUP(user);
- 
- 	if (!setuid(0)) {
--		C_pass = secrets_fetch_generic("root", "SWAT");
--		if (C_pass == NULL) {
--			char *tmp_pass = NULL;
--			tmp_pass = generate_random_password(talloc_tos(),
--							    16, 16);
--			if (tmp_pass == NULL) {
--				printf("%sFailed to create random nonce for "
--				       "SWAT session\n<br>%s\n", head, tail);
--				exit(0);
--			}
--			secrets_store_generic("root", "SWAT", tmp_pass);
--			C_pass = SMB_STRDUP(tmp_pass);
--			TALLOC_FREE(tmp_pass);
--		}
-+		C_pass = SMB_STRDUP(cgi_nonce());
- 	}
- 	setuid(pwd->pw_uid);
- 	if (geteuid() != pwd->pw_uid || getuid() != pwd->pw_uid) {
-@@ -459,6 +447,30 @@ char *cgi_user_pass(void)
- }
- 
- /***************************************************************************
-+return a ptr to the nonce
-+  ***************************************************************************/
-+char *cgi_nonce(void)
-+{
-+	const char *head = "Content-Type: text/html\r\n\r\n<HTML><BODY><H1>SWAT installation Error</H1>\n";
-+	const char *tail = "</BODY></HTML>\r\n";
-+	C_nonce = secrets_fetch_generic("root", "SWAT");
-+	if (C_nonce == NULL) {
-+		char *tmp_pass = NULL;
-+		tmp_pass = generate_random_password(talloc_tos(),
-+						    16, 16);
-+		if (tmp_pass == NULL) {
-+			printf("%sFailed to create random nonce for "
-+			       "SWAT session\n<br>%s\n", head, tail);
-+			exit(0);
-+		}
-+		secrets_store_generic("root", "SWAT", tmp_pass);
-+		C_nonce = SMB_STRDUP(tmp_pass);
-+		TALLOC_FREE(tmp_pass);
-+	}
-+        return(C_nonce);
-+}
-+
-+/***************************************************************************
- handle a file download
-   ***************************************************************************/
- static void cgi_download(char *file)
-diff --git a/source3/web/swat.c b/source3/web/swat.c
-index ed80c38..f8933d2 100644
---- a/source3/web/swat.c
-+++ b/source3/web/swat.c
-@@ -154,6 +154,7 @@ void get_xsrf_token(const char *username, const char *pass,
- 	MD5_CTX md5_ctx;
- 	uint8_t token[16];
- 	int i;
-+	char *nonce = cgi_nonce();
- 
- 	token_str[0] = '\0';
- 	ZERO_STRUCT(md5_ctx);
-@@ -167,6 +168,7 @@ void get_xsrf_token(const char *username, const char *pass,
- 	if (pass != NULL) {
- 		MD5Update(&md5_ctx, (uint8_t *)pass, strlen(pass));
- 	}
-+	MD5Update(&md5_ctx, (uint8_t *)nonce, strlen(nonce));
- 
- 	MD5Final(token, &md5_ctx);
- 
-diff --git a/source3/web/swat_proto.h b/source3/web/swat_proto.h
-index 424a3af..fe51b1f 100644
---- a/source3/web/swat_proto.h
-+++ b/source3/web/swat_proto.h
-@@ -32,6 +32,7 @@ const char *cgi_variable_nonull(const char *name);
- bool am_root(void);
- char *cgi_user_name(void);
- char *cgi_user_pass(void);
-+char *cgi_nonce(void);
- void cgi_setup(const char *rootdir, int auth_required);
- const char *cgi_baseurl(void);
- const char *cgi_pathinfo(void);
--- 
-1.7.7
-
diff --git a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch
deleted file mode 100644
index 54b8edf..0000000
--- a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Backport
-
-From efdbcabbe97a594572d71d714d258a5854c5d8ce Mon Sep 17 00:00:00 2001
-From: Jeremy Allison <jra@samba.org>
-Date: Wed, 10 Jul 2013 17:10:17 -0700
-Subject: [PATCH] Fix bug #10010 - Missing integer wrap protection in EA list
- reading can cause server to loop with DOS.
-
-Ensure we never wrap whilst adding client provided input.
-CVE-2013-4124
-
-Signed-off-by: Jeremy Allison <jra@samba.org>
----
- source3/smbd/nttrans.c |   12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/source3/smbd/nttrans.c b/source3/smbd/nttrans.c
-index ea9d417..5fc3a09 100644
---- a/source3/smbd/nttrans.c
-+++ b/source3/smbd/nttrans.c
-@@ -989,7 +989,19 @@ struct ea_list *read_nttrans_ea_list(TALLOC_CTX *ctx, const char *pdata, size_t
- 		if (next_offset == 0) {
- 			break;
- 		}
-+
-+		/* Integer wrap protection for the increment. */
-+		if (offset + next_offset < offset) {
-+			break;
-+		}
-+
- 		offset += next_offset;
-+
-+		/* Integer wrap protection for while loop. */
-+		if (offset + 4 < offset) {
-+			break;
-+		}
-+
- 	}
- 
- 	return ea_list_head;
--- 
-1.7.10.4
-
diff --git a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch
deleted file mode 100644
index a435c08..0000000
--- a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-Upstream-Status: Backport
-
-From 928910f01f951657ea4629a6d573ac00646d16f8 Mon Sep 17 00:00:00 2001
-From: Jeremy Allison <jra@samba.org>
-Date: Thu, 31 Oct 2013 13:48:42 -0700
-Subject: [PATCH] Fix bug #10229 - No access check verification on stream
- files.
-
-https://bugzilla.samba.org/show_bug.cgi?id=10229
-
-We need to check if the requested access mask
-could be used to open the underlying file (if
-it existed), as we're passing in zero for the
-access mask to the base filename.
-
-Signed-off-by: Jeremy Allison <jra@samba.org>
----
- source3/smbd/open.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 61 insertions(+)
-
-diff --git a/source3/smbd/open.c b/source3/smbd/open.c
-index 447de80..441b8cd 100644
---- a/source3/smbd/open.c
-+++ b/source3/smbd/open.c
-@@ -152,6 +152,48 @@ NTSTATUS smbd_check_open_rights(struct connection_struct *conn,
- }
- 
- /****************************************************************************
-+ Ensure when opening a base file for a stream open that we have permissions
-+ to do so given the access mask on the base file.
-+****************************************************************************/
-+
-+static NTSTATUS check_base_file_access(struct connection_struct *conn,
-+				struct smb_filename *smb_fname,
-+				uint32_t access_mask)
-+{
-+	uint32_t access_granted = 0;
-+	NTSTATUS status;
-+
-+	status = smbd_calculate_access_mask(conn, smb_fname,
-+					false,
-+					access_mask,
-+					&access_mask);
-+	if (!NT_STATUS_IS_OK(status)) {
-+		DEBUG(10, ("smbd_calculate_access_mask "
-+			"on file %s returned %s\n",
-+			smb_fname_str_dbg(smb_fname),
-+			nt_errstr(status)));
-+		return status;
-+	}
-+
-+	if (access_mask & (FILE_WRITE_DATA|FILE_APPEND_DATA)) {
-+		uint32_t dosattrs;
-+		if (!CAN_WRITE(conn)) {
-+			return NT_STATUS_ACCESS_DENIED;
-+		}
-+		dosattrs = dos_mode(conn, smb_fname);
-+ 		if (IS_DOS_READONLY(dosattrs)) {
-+			return NT_STATUS_ACCESS_DENIED;
-+		}
-+	}
-+
-+
-+	return smbd_check_open_rights(conn,
-+				smb_fname,
-+				access_mask,
-+				&access_granted);
-+}
-+
-+/****************************************************************************
-  fd support routines - attempt to do a dos_open.
- ****************************************************************************/
- 
-@@ -3227,6 +3269,25 @@ static NTSTATUS create_file_unixpath(connection_struct *conn,
- 		if (SMB_VFS_STAT(conn, smb_fname_base) == -1) {
- 			DEBUG(10, ("Unable to stat stream: %s\n",
- 				   smb_fname_str_dbg(smb_fname_base)));
-+		} else {
-+			/*
-+			 * https://bugzilla.samba.org/show_bug.cgi?id=10229
-+			 * We need to check if the requested access mask
-+			 * could be used to open the underlying file (if
-+			 * it existed), as we're passing in zero for the
-+			 * access mask to the base filename.
-+			 */
-+			status = check_base_file_access(conn,
-+							smb_fname_base,
-+							access_mask);
-+
-+			if (!NT_STATUS_IS_OK(status)) {
-+				DEBUG(10, ("Permission check "
-+					"for base %s failed: "
-+					"%s\n", smb_fname->base_name,
-+					nt_errstr(status)));
-+				goto fail;
-+			}
- 		}
- 
- 		/* Open the base file. */
--- 
-1.8.4.1
-
diff --git a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.22-CVE-2013-4496.patch b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.22-CVE-2013-4496.patch
deleted file mode 100644
index c190a6c..0000000
--- a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.22-CVE-2013-4496.patch
+++ /dev/null
@@ -1,966 +0,0 @@
-Upstream-Status: Backport
-
-From 25066eb31d6608075b5993b0d19b3e0843cdadeb Mon Sep 17 00:00:00 2001
-From: Andrew Bartlett <abartlet@samba.org>
-Date: Fri, 1 Nov 2013 14:55:44 +1300
-Subject: [PATCH 1/3] CVE-2013-4496:s3-samr: Block attempts to crack passwords
- via repeated password changes
-
-Bug: https://bugzilla.samba.org/show_bug.cgi?id=10245
-
-Signed-off-by: Andrew Bartlett <abartlet@samba.org>
-Signed-off-by: Stefan Metzmacher <metze@samba.org>
-Signed-off-by: Jeremy Allison <jra@samba.org>
-Reviewed-by: Stefan Metzmacher <metze@samba.org>
-Reviewed-by: Jeremy Allison <jra@samba.org>
-Reviewed-by: Andreas Schneider <asn@samba.org>
----
- source3/rpc_server/samr/srv_samr_chgpasswd.c |   55 ++++++++++++++++
- source3/rpc_server/samr/srv_samr_nt.c        |   90 +++++++++++++++++++++-----
- 2 files changed, 129 insertions(+), 16 deletions(-)
-
-diff --git a/source3/rpc_server/samr/srv_samr_chgpasswd.c b/source3/rpc_server/samr/srv_samr_chgpasswd.c
-index 0b4b25b..59905be 100644
---- a/source3/rpc_server/samr/srv_samr_chgpasswd.c
-+++ b/source3/rpc_server/samr/srv_samr_chgpasswd.c
-@@ -1106,6 +1106,8 @@ NTSTATUS pass_oem_change(char *user, const char *rhost,
- 	struct samu *sampass = NULL;
- 	NTSTATUS nt_status;
- 	bool ret = false;
-+	bool updated_badpw = false;
-+	NTSTATUS update_login_attempts_status;
- 
- 	if (!(sampass = samu_new(NULL))) {
- 		return NT_STATUS_NO_MEMORY;
-@@ -1121,6 +1123,13 @@ NTSTATUS pass_oem_change(char *user, const char *rhost,
- 		return NT_STATUS_NO_SUCH_USER;
- 	}
- 
-+	/* Quit if the account was locked out. */
-+	if (pdb_get_acct_ctrl(sampass) & ACB_AUTOLOCK) {
-+		DEBUG(3,("check_sam_security: Account for user %s was locked out.\n", user));
-+		TALLOC_FREE(sampass);
-+		return NT_STATUS_ACCOUNT_LOCKED_OUT;
-+	}
-+
- 	nt_status = check_oem_password(user,
- 				       password_encrypted_with_lm_hash,
- 				       old_lm_hash_encrypted,
-@@ -1129,6 +1138,52 @@ NTSTATUS pass_oem_change(char *user, const char *rhost,
- 				       sampass,
- 				       &new_passwd);
- 
-+	/*
-+	 * Notify passdb backend of login success/failure. If not
-+	 * NT_STATUS_OK the backend doesn't like the login
-+	 */
-+	update_login_attempts_status = pdb_update_login_attempts(sampass,
-+						NT_STATUS_IS_OK(nt_status));
-+
-+	if (!NT_STATUS_IS_OK(nt_status)) {
-+		bool increment_bad_pw_count = false;
-+
-+		if (NT_STATUS_EQUAL(nt_status, NT_STATUS_WRONG_PASSWORD) &&
-+		    (pdb_get_acct_ctrl(sampass) & ACB_NORMAL) &&
-+		    NT_STATUS_IS_OK(update_login_attempts_status))
-+		{
-+			increment_bad_pw_count = true;
-+		}
-+
-+		if (increment_bad_pw_count) {
-+			pdb_increment_bad_password_count(sampass);
-+			updated_badpw = true;
-+		} else {
-+			pdb_update_bad_password_count(sampass,
-+						      &updated_badpw);
-+		}
-+	} else {
-+
-+		if ((pdb_get_acct_ctrl(sampass) & ACB_NORMAL) &&
-+		    (pdb_get_bad_password_count(sampass) > 0)){
-+			pdb_set_bad_password_count(sampass, 0, PDB_CHANGED);
-+			pdb_set_bad_password_time(sampass, 0, PDB_CHANGED);
-+			updated_badpw = true;
-+		}
-+	}
-+
-+	if (updated_badpw) {
-+		NTSTATUS update_status;
-+		become_root();
-+		update_status = pdb_update_sam_account(sampass);
-+		unbecome_root();
-+
-+		if (!NT_STATUS_IS_OK(update_status)) {
-+			DEBUG(1, ("Failed to modify entry: %s\n",
-+				  nt_errstr(update_status)));
-+		}
-+	}
-+
- 	if (!NT_STATUS_IS_OK(nt_status)) {
- 		TALLOC_FREE(sampass);
- 		return nt_status;
-diff --git a/source3/rpc_server/samr/srv_samr_nt.c b/source3/rpc_server/samr/srv_samr_nt.c
-index 78ef1ba..3241b97 100644
---- a/source3/rpc_server/samr/srv_samr_nt.c
-+++ b/source3/rpc_server/samr/srv_samr_nt.c
-@@ -1715,9 +1715,11 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 	NTSTATUS status;
- 	bool ret = false;
- 	struct samr_user_info *uinfo;
--	struct samu *pwd;
-+	struct samu *pwd = NULL;
- 	struct samr_Password new_lmPwdHash, new_ntPwdHash, checkHash;
- 	struct samr_Password lm_pwd, nt_pwd;
-+	bool updated_badpw = false;
-+	NTSTATUS update_login_attempts_status;
- 
- 	uinfo = policy_handle_find(p, r->in.user_handle,
- 				   SAMR_USER_ACCESS_SET_PASSWORD, NULL,
-@@ -1729,6 +1731,15 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 	DEBUG(5,("_samr_ChangePasswordUser: sid:%s\n",
- 		  sid_string_dbg(&uinfo->sid)));
- 
-+	/* basic sanity checking on parameters.  Do this before any database ops */
-+	if (!r->in.lm_present || !r->in.nt_present ||
-+	    !r->in.old_lm_crypted || !r->in.new_lm_crypted ||
-+	    !r->in.old_nt_crypted || !r->in.new_nt_crypted) {
-+		/* we should really handle a change with lm not
-+		   present */
-+		return NT_STATUS_INVALID_PARAMETER_MIX;
-+	}
-+
- 	if (!(pwd = samu_new(NULL))) {
- 		return NT_STATUS_NO_MEMORY;
- 	}
-@@ -1742,6 +1753,14 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 		return NT_STATUS_WRONG_PASSWORD;
- 	}
- 
-+	/* Quit if the account was locked out. */
-+	if (pdb_get_acct_ctrl(pwd) & ACB_AUTOLOCK) {
-+		DEBUG(3, ("Account for user %s was locked out.\n",
-+			  pdb_get_username(pwd)));
-+		status = NT_STATUS_ACCOUNT_LOCKED_OUT;
-+		goto out;
-+	}
-+
- 	{
- 		const uint8_t *lm_pass, *nt_pass;
- 
-@@ -1750,29 +1769,19 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 
- 		if (!lm_pass || !nt_pass) {
- 			status = NT_STATUS_WRONG_PASSWORD;
--			goto out;
-+			goto update_login;
- 		}
- 
- 		memcpy(&lm_pwd.hash, lm_pass, sizeof(lm_pwd.hash));
- 		memcpy(&nt_pwd.hash, nt_pass, sizeof(nt_pwd.hash));
- 	}
- 
--	/* basic sanity checking on parameters.  Do this before any database ops */
--	if (!r->in.lm_present || !r->in.nt_present ||
--	    !r->in.old_lm_crypted || !r->in.new_lm_crypted ||
--	    !r->in.old_nt_crypted || !r->in.new_nt_crypted) {
--		/* we should really handle a change with lm not
--		   present */
--		status = NT_STATUS_INVALID_PARAMETER_MIX;
--		goto out;
--	}
--
- 	/* decrypt and check the new lm hash */
- 	D_P16(lm_pwd.hash, r->in.new_lm_crypted->hash, new_lmPwdHash.hash);
- 	D_P16(new_lmPwdHash.hash, r->in.old_lm_crypted->hash, checkHash.hash);
- 	if (memcmp(checkHash.hash, lm_pwd.hash, 16) != 0) {
- 		status = NT_STATUS_WRONG_PASSWORD;
--		goto out;
-+		goto update_login;
- 	}
- 
- 	/* decrypt and check the new nt hash */
-@@ -1780,7 +1789,7 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 	D_P16(new_ntPwdHash.hash, r->in.old_nt_crypted->hash, checkHash.hash);
- 	if (memcmp(checkHash.hash, nt_pwd.hash, 16) != 0) {
- 		status = NT_STATUS_WRONG_PASSWORD;
--		goto out;
-+		goto update_login;
- 	}
- 
- 	/* The NT Cross is not required by Win2k3 R2, but if present
-@@ -1789,7 +1798,7 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 		D_P16(lm_pwd.hash, r->in.nt_cross->hash, checkHash.hash);
- 		if (memcmp(checkHash.hash, new_ntPwdHash.hash, 16) != 0) {
- 			status = NT_STATUS_WRONG_PASSWORD;
--			goto out;
-+			goto update_login;
- 		}
- 	}
- 
-@@ -1799,7 +1808,7 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 		D_P16(nt_pwd.hash, r->in.lm_cross->hash, checkHash.hash);
- 		if (memcmp(checkHash.hash, new_lmPwdHash.hash, 16) != 0) {
- 			status = NT_STATUS_WRONG_PASSWORD;
--			goto out;
-+			goto update_login;
- 		}
- 	}
- 
-@@ -1810,6 +1819,55 @@ NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 	}
- 
- 	status = pdb_update_sam_account(pwd);
-+
-+update_login:
-+
-+	/*
-+	 * Notify passdb backend of login success/failure. If not
-+	 * NT_STATUS_OK the backend doesn't like the login
-+	 */
-+	update_login_attempts_status = pdb_update_login_attempts(pwd,
-+						NT_STATUS_IS_OK(status));
-+
-+	if (!NT_STATUS_IS_OK(status)) {
-+		bool increment_bad_pw_count = false;
-+
-+		if (NT_STATUS_EQUAL(status,NT_STATUS_WRONG_PASSWORD) &&
-+		    (pdb_get_acct_ctrl(pwd) & ACB_NORMAL) &&
-+		    NT_STATUS_IS_OK(update_login_attempts_status))
-+		{
-+			increment_bad_pw_count = true;
-+		}
-+
-+		if (increment_bad_pw_count) {
-+			pdb_increment_bad_password_count(pwd);
-+			updated_badpw = true;
-+		} else {
-+			pdb_update_bad_password_count(pwd,
-+						      &updated_badpw);
-+		}
-+	} else {
-+
-+		if ((pdb_get_acct_ctrl(pwd) & ACB_NORMAL) &&
-+		    (pdb_get_bad_password_count(pwd) > 0)){
-+			pdb_set_bad_password_count(pwd, 0, PDB_CHANGED);
-+			pdb_set_bad_password_time(pwd, 0, PDB_CHANGED);
-+			updated_badpw = true;
-+		}
-+	}
-+
-+	if (updated_badpw) {
-+		NTSTATUS update_status;
-+		become_root();
-+		update_status = pdb_update_sam_account(pwd);
-+		unbecome_root();
-+
-+		if (!NT_STATUS_IS_OK(update_status)) {
-+			DEBUG(1, ("Failed to modify entry: %s\n",
-+				  nt_errstr(update_status)));
-+		}
-+	}
-+
-  out:
- 	TALLOC_FREE(pwd);
- 
--- 
-1.7.9.5
-
-
-From 059da248cf69a3b0ef29836f49367b938fb1cbda Mon Sep 17 00:00:00 2001
-From: Stefan Metzmacher <metze@samba.org>
-Date: Tue, 5 Nov 2013 14:04:20 +0100
-Subject: [PATCH 2/3] CVE-2013-4496:s3:auth: fix memory leak in the
- ACCOUNT_LOCKED_OUT case.
-
-Bug: https://bugzilla.samba.org/show_bug.cgi?id=10245
-
-Signed-off-by: Stefan Metzmacher <metze@samba.org>
-Reviewed-by: Jeremy Allison <jra@samba.org>
-Signed-off-by: Andrew Bartlett <abartlet@samba.org>
-Reviewed-by: Andreas Schneider <asn@samba.org>
----
- source3/auth/check_samsec.c |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/source3/auth/check_samsec.c b/source3/auth/check_samsec.c
-index f918dc0..e2c42d6 100644
---- a/source3/auth/check_samsec.c
-+++ b/source3/auth/check_samsec.c
-@@ -408,6 +408,7 @@ NTSTATUS check_sam_security(const DATA_BLOB *challenge,
- 	/* Quit if the account was locked out. */
- 	if (pdb_get_acct_ctrl(sampass) & ACB_AUTOLOCK) {
- 		DEBUG(3,("check_sam_security: Account for user %s was locked out.\n", username));
-+		TALLOC_FREE(sampass);
- 		return NT_STATUS_ACCOUNT_LOCKED_OUT;
- 	}
- 
--- 
-1.7.9.5
-
-
-From 27f982ef33a1238ae48d7a38d608dd23ebde61ae Mon Sep 17 00:00:00 2001
-From: Andrew Bartlett <abartlet@samba.org>
-Date: Tue, 5 Nov 2013 16:16:46 +1300
-Subject: [PATCH 3/3] CVE-2013-4496:samr: Remove ChangePasswordUser
-
-This old password change mechanism does not provide the plaintext to
-validate against password complexity, and it is not used by modern
-clients.
-
-The missing features in both implementations (by design) were:
-
- - the password complexity checks (no plaintext)
- - the minimum password length (no plaintext)
-
-Additionally, the source3 version did not check:
-
- - the minimum password age
- - pdb_get_pass_can_change() which checks the security
-   descriptor for the 'user cannot change password' setting.
- - the password history
- - the output of the 'passwd program' if 'unix passwd sync = yes'.
-
-Finally, the mechanism was almost useless, as it was incorrectly
-only made available to administrative users with permission
-to reset the password.  It is removed here so that it is not
-mistakenly reinstated in the future.
-
-Andrew Bartlett
-
-Bug: https://bugzilla.samba.org/show_bug.cgi?id=10245
-
-Signed-off-by: Andrew Bartlett <abartlet@samba.org>
-Reviewed-by: Andreas Schneider <asn@samba.org>
-Reviewed-by: Stefan Metzmacher <metze@samba.org>
----
- source3/rpc_server/samr/srv_samr_nt.c   |  169 +-------------------
- source3/smbd/lanman.c                   |  254 -------------------------------
- source4/rpc_server/samr/samr_password.c |  126 +--------------
- source4/torture/rpc/samr.c              |   12 +-
- 4 files changed, 24 insertions(+), 537 deletions(-)
-
-diff --git a/source3/rpc_server/samr/srv_samr_nt.c b/source3/rpc_server/samr/srv_samr_nt.c
-index 3241b97..2519a3f 100644
---- a/source3/rpc_server/samr/srv_samr_nt.c
-+++ b/source3/rpc_server/samr/srv_samr_nt.c
-@@ -1706,172 +1706,19 @@ NTSTATUS _samr_LookupNames(struct pipes_struct *p,
- }
- 
- /****************************************************************
-- _samr_ChangePasswordUser
-+ _samr_ChangePasswordUser.
-+
-+ So old it is just not worth implementing
-+ because it does not supply a plaintext and so we can't do password
-+ complexity checking and cannot update other services that use a
-+ plaintext password via passwd chat/pam password change/ldap password
-+ sync.
- ****************************************************************/
- 
- NTSTATUS _samr_ChangePasswordUser(struct pipes_struct *p,
- 				  struct samr_ChangePasswordUser *r)
- {
--	NTSTATUS status;
--	bool ret = false;
--	struct samr_user_info *uinfo;
--	struct samu *pwd = NULL;
--	struct samr_Password new_lmPwdHash, new_ntPwdHash, checkHash;
--	struct samr_Password lm_pwd, nt_pwd;
--	bool updated_badpw = false;
--	NTSTATUS update_login_attempts_status;
--
--	uinfo = policy_handle_find(p, r->in.user_handle,
--				   SAMR_USER_ACCESS_SET_PASSWORD, NULL,
--				   struct samr_user_info, &status);
--	if (!NT_STATUS_IS_OK(status)) {
--		return status;
--	}
--
--	DEBUG(5,("_samr_ChangePasswordUser: sid:%s\n",
--		  sid_string_dbg(&uinfo->sid)));
--
--	/* basic sanity checking on parameters.  Do this before any database ops */
--	if (!r->in.lm_present || !r->in.nt_present ||
--	    !r->in.old_lm_crypted || !r->in.new_lm_crypted ||
--	    !r->in.old_nt_crypted || !r->in.new_nt_crypted) {
--		/* we should really handle a change with lm not
--		   present */
--		return NT_STATUS_INVALID_PARAMETER_MIX;
--	}
--
--	if (!(pwd = samu_new(NULL))) {
--		return NT_STATUS_NO_MEMORY;
--	}
--
--	become_root();
--	ret = pdb_getsampwsid(pwd, &uinfo->sid);
--	unbecome_root();
--
--	if (!ret) {
--		TALLOC_FREE(pwd);
--		return NT_STATUS_WRONG_PASSWORD;
--	}
--
--	/* Quit if the account was locked out. */
--	if (pdb_get_acct_ctrl(pwd) & ACB_AUTOLOCK) {
--		DEBUG(3, ("Account for user %s was locked out.\n",
--			  pdb_get_username(pwd)));
--		status = NT_STATUS_ACCOUNT_LOCKED_OUT;
--		goto out;
--	}
--
--	{
--		const uint8_t *lm_pass, *nt_pass;
--
--		lm_pass = pdb_get_lanman_passwd(pwd);
--		nt_pass = pdb_get_nt_passwd(pwd);
--
--		if (!lm_pass || !nt_pass) {
--			status = NT_STATUS_WRONG_PASSWORD;
--			goto update_login;
--		}
--
--		memcpy(&lm_pwd.hash, lm_pass, sizeof(lm_pwd.hash));
--		memcpy(&nt_pwd.hash, nt_pass, sizeof(nt_pwd.hash));
--	}
--
--	/* decrypt and check the new lm hash */
--	D_P16(lm_pwd.hash, r->in.new_lm_crypted->hash, new_lmPwdHash.hash);
--	D_P16(new_lmPwdHash.hash, r->in.old_lm_crypted->hash, checkHash.hash);
--	if (memcmp(checkHash.hash, lm_pwd.hash, 16) != 0) {
--		status = NT_STATUS_WRONG_PASSWORD;
--		goto update_login;
--	}
--
--	/* decrypt and check the new nt hash */
--	D_P16(nt_pwd.hash, r->in.new_nt_crypted->hash, new_ntPwdHash.hash);
--	D_P16(new_ntPwdHash.hash, r->in.old_nt_crypted->hash, checkHash.hash);
--	if (memcmp(checkHash.hash, nt_pwd.hash, 16) != 0) {
--		status = NT_STATUS_WRONG_PASSWORD;
--		goto update_login;
--	}
--
--	/* The NT Cross is not required by Win2k3 R2, but if present
--	   check the nt cross hash */
--	if (r->in.cross1_present && r->in.nt_cross) {
--		D_P16(lm_pwd.hash, r->in.nt_cross->hash, checkHash.hash);
--		if (memcmp(checkHash.hash, new_ntPwdHash.hash, 16) != 0) {
--			status = NT_STATUS_WRONG_PASSWORD;
--			goto update_login;
--		}
--	}
--
--	/* The LM Cross is not required by Win2k3 R2, but if present
--	   check the lm cross hash */
--	if (r->in.cross2_present && r->in.lm_cross) {
--		D_P16(nt_pwd.hash, r->in.lm_cross->hash, checkHash.hash);
--		if (memcmp(checkHash.hash, new_lmPwdHash.hash, 16) != 0) {
--			status = NT_STATUS_WRONG_PASSWORD;
--			goto update_login;
--		}
--	}
--
--	if (!pdb_set_nt_passwd(pwd, new_ntPwdHash.hash, PDB_CHANGED) ||
--	    !pdb_set_lanman_passwd(pwd, new_lmPwdHash.hash, PDB_CHANGED)) {
--		status = NT_STATUS_ACCESS_DENIED;
--		goto out;
--	}
--
--	status = pdb_update_sam_account(pwd);
--
--update_login:
--
--	/*
--	 * Notify passdb backend of login success/failure. If not
--	 * NT_STATUS_OK the backend doesn't like the login
--	 */
--	update_login_attempts_status = pdb_update_login_attempts(pwd,
--						NT_STATUS_IS_OK(status));
--
--	if (!NT_STATUS_IS_OK(status)) {
--		bool increment_bad_pw_count = false;
--
--		if (NT_STATUS_EQUAL(status,NT_STATUS_WRONG_PASSWORD) &&
--		    (pdb_get_acct_ctrl(pwd) & ACB_NORMAL) &&
--		    NT_STATUS_IS_OK(update_login_attempts_status))
--		{
--			increment_bad_pw_count = true;
--		}
--
--		if (increment_bad_pw_count) {
--			pdb_increment_bad_password_count(pwd);
--			updated_badpw = true;
--		} else {
--			pdb_update_bad_password_count(pwd,
--						      &updated_badpw);
--		}
--	} else {
--
--		if ((pdb_get_acct_ctrl(pwd) & ACB_NORMAL) &&
--		    (pdb_get_bad_password_count(pwd) > 0)){
--			pdb_set_bad_password_count(pwd, 0, PDB_CHANGED);
--			pdb_set_bad_password_time(pwd, 0, PDB_CHANGED);
--			updated_badpw = true;
--		}
--	}
--
--	if (updated_badpw) {
--		NTSTATUS update_status;
--		become_root();
--		update_status = pdb_update_sam_account(pwd);
--		unbecome_root();
--
--		if (!NT_STATUS_IS_OK(update_status)) {
--			DEBUG(1, ("Failed to modify entry: %s\n",
--				  nt_errstr(update_status)));
--		}
--	}
--
-- out:
--	TALLOC_FREE(pwd);
--
--	return status;
-+	return NT_STATUS_NOT_IMPLEMENTED;
- }
- 
- /*******************************************************************
-diff --git a/source3/smbd/lanman.c b/source3/smbd/lanman.c
-index aef12df..3b4ec65 100644
---- a/source3/smbd/lanman.c
-+++ b/source3/smbd/lanman.c
-@@ -2947,259 +2947,6 @@ static bool api_NetRemoteTOD(struct smbd_server_connection *sconn,
- }
- 
- /****************************************************************************
-- Set the user password.
--*****************************************************************************/
--
--static bool api_SetUserPassword(struct smbd_server_connection *sconn,
--				connection_struct *conn,uint16 vuid,
--				char *param, int tpscnt,
--				char *data, int tdscnt,
--				int mdrcnt,int mprcnt,
--				char **rdata,char **rparam,
--				int *rdata_len,int *rparam_len)
--{
--	char *np = get_safe_str_ptr(param,tpscnt,param,2);
--	char *p = NULL;
--	fstring user;
--	fstring pass1,pass2;
--	TALLOC_CTX *mem_ctx = talloc_tos();
--	NTSTATUS status, result;
--	struct rpc_pipe_client *cli = NULL;
--	struct policy_handle connect_handle, domain_handle, user_handle;
--	struct lsa_String domain_name;
--	struct dom_sid2 *domain_sid;
--	struct lsa_String names;
--	struct samr_Ids rids;
--	struct samr_Ids types;
--	struct samr_Password old_lm_hash;
--	struct samr_Password new_lm_hash;
--	int errcode = NERR_badpass;
--	uint32_t rid;
--	int encrypted;
--	int min_pwd_length;
--	struct dcerpc_binding_handle *b = NULL;
--
--	/* Skip 2 strings. */
--	p = skip_string(param,tpscnt,np);
--	p = skip_string(param,tpscnt,p);
--
--	if (!np || !p) {
--		return False;
--	}
--
--	/* Do we have a string ? */
--	if (skip_string(param,tpscnt,p) == NULL) {
--		return False;
--	}
--	pull_ascii_fstring(user,p);
--
--	p = skip_string(param,tpscnt,p);
--	if (!p) {
--		return False;
--	}
--
--	memset(pass1,'\0',sizeof(pass1));
--	memset(pass2,'\0',sizeof(pass2));
--	/*
--	 * We use 31 here not 32 as we're checking
--	 * the last byte we want to access is safe.
--	 */
--	if (!is_offset_safe(param,tpscnt,p,31)) {
--		return False;
--	}
--	memcpy(pass1,p,16);
--	memcpy(pass2,p+16,16);
--
--	encrypted = get_safe_SVAL(param,tpscnt,p+32,0,-1);
--	if (encrypted == -1) {
--		errcode = W_ERROR_V(WERR_INVALID_PARAM);
--		goto out;
--	}
--
--	min_pwd_length = get_safe_SVAL(param,tpscnt,p+34,0,-1);
--	if (min_pwd_length == -1) {
--		errcode = W_ERROR_V(WERR_INVALID_PARAM);
--		goto out;
--	}
--
--	*rparam_len = 4;
--	*rparam = smb_realloc_limit(*rparam,*rparam_len);
--	if (!*rparam) {
--		return False;
--	}
--
--	*rdata_len = 0;
--
--	DEBUG(3,("Set password for <%s> (encrypted: %d, min_pwd_length: %d)\n",
--		user, encrypted, min_pwd_length));
--
--	ZERO_STRUCT(connect_handle);
--	ZERO_STRUCT(domain_handle);
--	ZERO_STRUCT(user_handle);
--
--	status = rpc_pipe_open_interface(mem_ctx, &ndr_table_samr.syntax_id,
--					conn->session_info,
--					&conn->sconn->client_id,
--					conn->sconn->msg_ctx,
--					&cli);
--	if (!NT_STATUS_IS_OK(status)) {
--		DEBUG(0,("api_SetUserPassword: could not connect to samr: %s\n",
--			  nt_errstr(status)));
--		errcode = W_ERROR_V(ntstatus_to_werror(status));
--		goto out;
--	}
--
--	b = cli->binding_handle;
--
--	status = dcerpc_samr_Connect2(b, mem_ctx,
--				      global_myname(),
--				      SAMR_ACCESS_CONNECT_TO_SERVER |
--				      SAMR_ACCESS_ENUM_DOMAINS |
--				      SAMR_ACCESS_LOOKUP_DOMAIN,
--				      &connect_handle,
--				      &result);
--	if (!NT_STATUS_IS_OK(status)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(status));
--		goto out;
--	}
--	if (!NT_STATUS_IS_OK(result)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(result));
--		goto out;
--	}
--
--	init_lsa_String(&domain_name, get_global_sam_name());
--
--	status = dcerpc_samr_LookupDomain(b, mem_ctx,
--					  &connect_handle,
--					  &domain_name,
--					  &domain_sid,
--					  &result);
--	if (!NT_STATUS_IS_OK(status)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(status));
--		goto out;
--	}
--	if (!NT_STATUS_IS_OK(result)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(result));
--		goto out;
--	}
--
--	status = dcerpc_samr_OpenDomain(b, mem_ctx,
--					&connect_handle,
--					SAMR_DOMAIN_ACCESS_OPEN_ACCOUNT,
--					domain_sid,
--					&domain_handle,
--					&result);
--	if (!NT_STATUS_IS_OK(status)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(status));
--		goto out;
--	}
--	if (!NT_STATUS_IS_OK(result)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(result));
--		goto out;
--	}
--
--	init_lsa_String(&names, user);
--
--	status = dcerpc_samr_LookupNames(b, mem_ctx,
--					 &domain_handle,
--					 1,
--					 &names,
--					 &rids,
--					 &types,
--					 &result);
--	if (!NT_STATUS_IS_OK(status)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(status));
--		goto out;
--	}
--	if (!NT_STATUS_IS_OK(result)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(result));
--		goto out;
--	}
--
--	if (rids.count != 1) {
--		errcode = W_ERROR_V(WERR_NO_SUCH_USER);
--		goto out;
--	}
--	if (rids.count != types.count) {
--		errcode = W_ERROR_V(WERR_INVALID_PARAM);
--		goto out;
--	}
--	if (types.ids[0] != SID_NAME_USER) {
--		errcode = W_ERROR_V(WERR_INVALID_PARAM);
--		goto out;
--	}
--
--	rid = rids.ids[0];
--
--	status = dcerpc_samr_OpenUser(b, mem_ctx,
--				      &domain_handle,
--				      SAMR_USER_ACCESS_CHANGE_PASSWORD,
--				      rid,
--				      &user_handle,
--				      &result);
--	if (!NT_STATUS_IS_OK(status)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(status));
--		goto out;
--	}
--	if (!NT_STATUS_IS_OK(result)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(result));
--		goto out;
--	}
--
--	if (encrypted == 0) {
--		E_deshash(pass1, old_lm_hash.hash);
--		E_deshash(pass2, new_lm_hash.hash);
--	} else {
--		ZERO_STRUCT(old_lm_hash);
--		ZERO_STRUCT(new_lm_hash);
--		memcpy(old_lm_hash.hash, pass1, MIN(strlen(pass1), 16));
--		memcpy(new_lm_hash.hash, pass1, MIN(strlen(pass2), 16));
--	}
--
--	status = dcerpc_samr_ChangePasswordUser(b, mem_ctx,
--						&user_handle,
--						true, /* lm_present */
--						&old_lm_hash,
--						&new_lm_hash,
--						false, /* nt_present */
--						NULL, /* old_nt_crypted */
--						NULL, /* new_nt_crypted */
--						false, /* cross1_present */
--						NULL, /* nt_cross */
--						false, /* cross2_present */
--						NULL, /* lm_cross */
--						&result);
--	if (!NT_STATUS_IS_OK(status)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(status));
--		goto out;
--	}
--	if (!NT_STATUS_IS_OK(result)) {
--		errcode = W_ERROR_V(ntstatus_to_werror(result));
--		goto out;
--	}
--
--	errcode = NERR_Success;
-- out:
--
--	if (b && is_valid_policy_hnd(&user_handle)) {
--		dcerpc_samr_Close(b, mem_ctx, &user_handle, &result);
--	}
--	if (b && is_valid_policy_hnd(&domain_handle)) {
--		dcerpc_samr_Close(b, mem_ctx, &domain_handle, &result);
--	}
--	if (b && is_valid_policy_hnd(&connect_handle)) {
--		dcerpc_samr_Close(b, mem_ctx, &connect_handle, &result);
--	}
--
--	memset((char *)pass1,'\0',sizeof(fstring));
--	memset((char *)pass2,'\0',sizeof(fstring));
--
--	SSVAL(*rparam,0,errcode);
--	SSVAL(*rparam,2,0);		/* converter word */
--	return(True);
--}
--
--/****************************************************************************
-   Set the user password (SamOEM version - gets plaintext).
- ****************************************************************************/
- 
-@@ -5790,7 +5537,6 @@ static const struct {
- 	{"NetServerEnum2",	RAP_NetServerEnum2,	api_RNetServerEnum2}, /* anon OK */
- 	{"NetServerEnum3",	RAP_NetServerEnum3,	api_RNetServerEnum3}, /* anon OK */
- 	{"WAccessGetUserPerms",RAP_WAccessGetUserPerms,api_WAccessGetUserPerms},
--	{"SetUserPassword",	RAP_WUserPasswordSet2,	api_SetUserPassword},
- 	{"WWkstaUserLogon",	RAP_WWkstaUserLogon,	api_WWkstaUserLogon},
- 	{"PrintJobInfo",	RAP_WPrintJobSetInfo,	api_PrintJobInfo},
- 	{"WPrintDriverEnum",	RAP_WPrintDriverEnum,	api_WPrintDriverEnum},
-diff --git a/source4/rpc_server/samr/samr_password.c b/source4/rpc_server/samr/samr_password.c
-index ee13a11..e618740 100644
---- a/source4/rpc_server/samr/samr_password.c
-+++ b/source4/rpc_server/samr/samr_password.c
-@@ -32,131 +32,17 @@
- 
- /*
-   samr_ChangePasswordUser
-+
-+  So old it is just not worth implementing
-+  because it does not supply a plaintext and so we can't do password
-+  complexity checking and cannot update all the other password hashes.
-+
- */
- NTSTATUS dcesrv_samr_ChangePasswordUser(struct dcesrv_call_state *dce_call,
- 					TALLOC_CTX *mem_ctx,
- 					struct samr_ChangePasswordUser *r)
- {
--	struct dcesrv_handle *h;
--	struct samr_account_state *a_state;
--	struct ldb_context *sam_ctx;
--	struct ldb_message **res;
--	int ret;
--	struct samr_Password new_lmPwdHash, new_ntPwdHash, checkHash;
--	struct samr_Password *lm_pwd, *nt_pwd;
--	NTSTATUS status = NT_STATUS_OK;
--	const char * const attrs[] = { "dBCSPwd", "unicodePwd" , NULL };
--
--	DCESRV_PULL_HANDLE(h, r->in.user_handle, SAMR_HANDLE_USER);
--
--	a_state = h->data;
--
--	/* basic sanity checking on parameters.  Do this before any database ops */
--	if (!r->in.lm_present || !r->in.nt_present ||
--	    !r->in.old_lm_crypted || !r->in.new_lm_crypted ||
--	    !r->in.old_nt_crypted || !r->in.new_nt_crypted) {
--		/* we should really handle a change with lm not
--		   present */
--		return NT_STATUS_INVALID_PARAMETER_MIX;
--	}
--
--	/* Connect to a SAMDB with system privileges for fetching the old pw
--	 * hashes. */
--	sam_ctx = samdb_connect(mem_ctx, dce_call->event_ctx,
--				dce_call->conn->dce_ctx->lp_ctx,
--				system_session(dce_call->conn->dce_ctx->lp_ctx), 0);
--	if (sam_ctx == NULL) {
--		return NT_STATUS_INVALID_SYSTEM_SERVICE;
--	}
--
--	/* fetch the old hashes */
--	ret = gendb_search_dn(sam_ctx, mem_ctx,
--			      a_state->account_dn, &res, attrs);
--	if (ret != 1) {
--		return NT_STATUS_WRONG_PASSWORD;
--	}
--
--	status = samdb_result_passwords(mem_ctx,
--					dce_call->conn->dce_ctx->lp_ctx,
--					res[0], &lm_pwd, &nt_pwd);
--	if (!NT_STATUS_IS_OK(status) || !nt_pwd) {
--		return NT_STATUS_WRONG_PASSWORD;
--	}
--
--	/* decrypt and check the new lm hash */
--	if (lm_pwd) {
--		D_P16(lm_pwd->hash, r->in.new_lm_crypted->hash, new_lmPwdHash.hash);
--		D_P16(new_lmPwdHash.hash, r->in.old_lm_crypted->hash, checkHash.hash);
--		if (memcmp(checkHash.hash, lm_pwd, 16) != 0) {
--			return NT_STATUS_WRONG_PASSWORD;
--		}
--	}
--
--	/* decrypt and check the new nt hash */
--	D_P16(nt_pwd->hash, r->in.new_nt_crypted->hash, new_ntPwdHash.hash);
--	D_P16(new_ntPwdHash.hash, r->in.old_nt_crypted->hash, checkHash.hash);
--	if (memcmp(checkHash.hash, nt_pwd, 16) != 0) {
--		return NT_STATUS_WRONG_PASSWORD;
--	}
--
--	/* The NT Cross is not required by Win2k3 R2, but if present
--	   check the nt cross hash */
--	if (r->in.cross1_present && r->in.nt_cross && lm_pwd) {
--		D_P16(lm_pwd->hash, r->in.nt_cross->hash, checkHash.hash);
--		if (memcmp(checkHash.hash, new_ntPwdHash.hash, 16) != 0) {
--			return NT_STATUS_WRONG_PASSWORD;
--		}
--	}
--
--	/* The LM Cross is not required by Win2k3 R2, but if present
--	   check the lm cross hash */
--	if (r->in.cross2_present && r->in.lm_cross && lm_pwd) {
--		D_P16(nt_pwd->hash, r->in.lm_cross->hash, checkHash.hash);
--		if (memcmp(checkHash.hash, new_lmPwdHash.hash, 16) != 0) {
--			return NT_STATUS_WRONG_PASSWORD;
--		}
--	}
--
--	/* Start a SAM with user privileges for the password change */
--	sam_ctx = samdb_connect(mem_ctx, dce_call->event_ctx,
--				dce_call->conn->dce_ctx->lp_ctx,
--				dce_call->conn->auth_state.session_info, 0);
--	if (sam_ctx == NULL) {
--		return NT_STATUS_INVALID_SYSTEM_SERVICE;
--	}
--
--	/* Start transaction */
--	ret = ldb_transaction_start(sam_ctx);
--	if (ret != LDB_SUCCESS) {
--		DEBUG(1, ("Failed to start transaction: %s\n", ldb_errstring(sam_ctx)));
--		return NT_STATUS_TRANSACTION_ABORTED;
--	}
--
--	/* Performs the password modification. We pass the old hashes read out
--	 * from the database since they were already checked against the user-
--	 * provided ones. */
--	status = samdb_set_password(sam_ctx, mem_ctx,
--				    a_state->account_dn,
--				    a_state->domain_state->domain_dn,
--				    NULL, &new_lmPwdHash, &new_ntPwdHash,
--				    lm_pwd, nt_pwd, /* this is a user password change */
--				    NULL,
--				    NULL);
--	if (!NT_STATUS_IS_OK(status)) {
--		ldb_transaction_cancel(sam_ctx);
--		return status;
--	}
--
--	/* And this confirms it in a transaction commit */
--	ret = ldb_transaction_commit(sam_ctx);
--	if (ret != LDB_SUCCESS) {
--		DEBUG(1,("Failed to commit transaction to change password on %s: %s\n",
--			 ldb_dn_get_linearized(a_state->account_dn),
--			 ldb_errstring(sam_ctx)));
--		return NT_STATUS_TRANSACTION_ABORTED;
--	}
--
--	return NT_STATUS_OK;
-+	return NT_STATUS_NOT_IMPLEMENTED;
- }
- 
- /*
-diff --git a/source4/torture/rpc/samr.c b/source4/torture/rpc/samr.c
-index 7d9a1e2..adfc5d4 100644
---- a/source4/torture/rpc/samr.c
-+++ b/source4/torture/rpc/samr.c
-@@ -1728,8 +1728,16 @@ static bool test_ChangePasswordUser(struct dcerpc_binding_handle *b,
- 
- 	torture_assert_ntstatus_ok(tctx, dcerpc_samr_ChangePasswordUser_r(b, tctx, &r),
- 		"ChangePasswordUser failed");
--	torture_assert_ntstatus_equal(tctx, r.out.result, NT_STATUS_WRONG_PASSWORD,
--		"ChangePasswordUser failed: expected NT_STATUS_WRONG_PASSWORD because we broke the LM hash");
-+
-+	/* Do not proceed if this call has been removed */
-+	if (NT_STATUS_EQUAL(r.out.result, NT_STATUS_NOT_IMPLEMENTED)) {
-+		return true;
-+	}
-+
-+	if (!NT_STATUS_EQUAL(r.out.result, NT_STATUS_PASSWORD_RESTRICTION)) {
-+		torture_assert_ntstatus_equal(tctx, r.out.result, NT_STATUS_WRONG_PASSWORD,
-+			"ChangePasswordUser failed: expected NT_STATUS_WRONG_PASSWORD because we broke the LM hash");
-+	}
- 
- 	/* Unbreak the LM hash */
- 	hash1.hash[0]--;
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.24.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
rename to meta-oe/recipes-connectivity/samba/samba_3.6.24.bb
index cf13a0f..8860da0 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.24.bb
@@ -3,8 +3,6 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r8"
-
 SRC_URI += "\
     file://config-h.patch \
     file://documentation.patch;patchdir=.. \
@@ -30,14 +28,9 @@ SRC_URI += "\
     file://configure-disable-getaddrinfo-cross.patch;patchdir=.. \
     file://configure-disable-core_pattern-cross-check.patch;patchdir=.. \
     file://configure-libunwind.patch;patchdir=.. \
-    file://samba-3.6.22-CVE-2013-4496.patch;patchdir=.. \
-    file://0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch;patchdir=.. \
-    file://samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch;patchdir=.. \
-    file://samba-3.6.16-CVE-2013-4124.patch;patchdir=.. \
-    file://samba-3.6.19-CVE-2013-4475.patch;patchdir=.. \
 "
-SRC_URI[md5sum] = "fbb245863eeef2fffe172df779a217be"
-SRC_URI[sha256sum] = "4f5a171a8d902c6b4f822ed875c51eb8339196d9ccf0ecd7f6521c966b3514de"
+SRC_URI[md5sum] = "d98425c0c2b73e08f048d31ffc727fb0"
+SRC_URI[sha256sum] = "11d0bd04b734731970259efc6692b8e749ff671a9b56d8cc5fa98c192ab234a7"
 
 S = "${WORKDIR}/samba-${PV}/source3"
 
-- 
1.9.1


