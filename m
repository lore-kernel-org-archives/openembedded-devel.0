Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXf-0002vo-9y
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:39 +0100
Received: (qmail 13965 invoked by uid 813007); 22 Mar 2010 11:08:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:48 +0100
Message-Id: <1269256016-13155-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David-John Willis <John.Willis@Distant-earth.com>
Subject: [PATCH][STABLE] shadow: Add version 4.1.4.2 and checksum.
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:42 -0000

From: David-John Willis <John.Willis@Distant-earth.com>

* This version now has Linux-PAM support enabled in OE so will need some testing and maybe a little tweaking.
* Add pam.d config files for common shadow utils in addition to the default ones.
* Cleanup shadow defaults and make shadow 'play nice' with PAM.
* Update pam.d service files to suggested upstream Linux-PAM layout.
* TODO: Some Shadow default session files still use the older layout (incluse system-auth for everything). These will need newer files to be added to the pam.d folder in the recipe as they are found.
---
 conf/checksums.ini                      |    8 +++
 recipes/shadow/files/login_defs_pam.sed |   25 +++++++++
 recipes/shadow/files/pam.d/chfn         |   14 +++++
 recipes/shadow/files/pam.d/chpasswd     |    4 ++
 recipes/shadow/files/pam.d/chsh         |   19 +++++++
 recipes/shadow/files/pam.d/login        |   91 +++++++++++++++++++++++++++++++
 recipes/shadow/files/pam.d/newusers     |    4 ++
 recipes/shadow/files/pam.d/passwd       |    5 ++
 recipes/shadow/files/pam.d/su           |   60 ++++++++++++++++++++
 recipes/shadow/shadow_4.1.4.2.bb        |   52 ++++++++++++++++++
 10 files changed, 282 insertions(+), 0 deletions(-)
 create mode 100644 recipes/shadow/files/login_defs_pam.sed
 create mode 100644 recipes/shadow/files/pam.d/chfn
 create mode 100644 recipes/shadow/files/pam.d/chpasswd
 create mode 100644 recipes/shadow/files/pam.d/chsh
 create mode 100644 recipes/shadow/files/pam.d/login
 create mode 100644 recipes/shadow/files/pam.d/newusers
 create mode 100644 recipes/shadow/files/pam.d/passwd
 create mode 100644 recipes/shadow/files/pam.d/su
 create mode 100644 recipes/shadow/shadow_4.1.4.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 08166db..fa8d4b9 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -24126,6 +24126,10 @@ sha256=7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959
 md5=45f77f33a6b2a5c09c28511ebb733b87
 sha256=7fd6495d6c3e8dac7ba086c68abed4930c958a94afc15359223074614559e462
 
+[ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-4.1.4.2.tar.bz2]
+md5=d593a9cab93c48ee0a6ba056db8c1997
+sha256=97987f6a7967a85e6aa0dba2a1d52db8bd69af5a717391de5693db768fb78990
+
 [ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-4.1.4.tar.gz]
 md5=e1072df927bfb4410ee4dfe26dd81a17
 sha256=7e38a7826f6e71e89b55669e8343af05ae33ecfba99aad178cad45845d950a93
@@ -29906,6 +29910,10 @@ sha256=86b176b6efc52557b1c7631bfdd5c17e7060a438e1e85ce15ec9657be356c50b
 md5=11080456822146ebc0118b15f4b911d9
 sha256=6b5b3ef58e6646f004a5f1cbc6be8f32b824cfbf78a30bf242e4f07083668770
 
+[ftp://ftp.x.org/R5contrib/xloadimage.4.1.tar.gz]
+md5=7331850fc04056ab8ae6b5725d1fb3d2
+sha256=400bc7d84dcfb3265a7a1ce51819679dc3adaeda231514bd89b0f932b78ff5c4
+
 [http://xorg.freedesktop.org/releases/individual/app/xlogo-1.0.1.tar.bz2]
 md5=4c5482552f38a7d42398a694cc9b2ee6
 sha256=de59f9be3d45fe93f445f39bec3cea09753a671e56863ce77e3a797d2df526b2
diff --git a/recipes/shadow/files/login_defs_pam.sed b/recipes/shadow/files/login_defs_pam.sed
new file mode 100644
index 0000000..655f115
--- /dev/null
+++ b/recipes/shadow/files/login_defs_pam.sed
@@ -0,0 +1,25 @@
+/^FAILLOG_ENAB/b comment
+/^LASTLOG_ENAB/b comment
+/^MAIL_CHECK_ENAB/b comment
+/^OBSCURE_CHECKS_ENAB/b comment
+/^PORTTIME_CHECKS_ENAB/b comment
+/^QUOTAS_ENAB/b comment
+/^MOTD_FILE/b comment
+/^FTMP_FILE/b comment
+/^NOLOGINS_FILE/b comment
+/^ENV_HZ/b comment
+/^PASS_MIN_LEN/b comment
+/^SU_WHEEL_ONLY/b comment
+/^CRACKLIB_DICTPATH/b comment
+/^PASS_CHANGE_TRIES/b comment
+/^PASS_ALWAYS_WARN/b comment
+/^CHFN_AUTH/b comment
+/^ENVIRON_FILE/b comment
+
+b exit
+
+: comment
+  s:^:#:
+
+: exit
+
diff --git a/recipes/shadow/files/pam.d/chfn b/recipes/shadow/files/pam.d/chfn
new file mode 100644
index 0000000..baf7698
--- /dev/null
+++ b/recipes/shadow/files/pam.d/chfn
@@ -0,0 +1,14 @@
+#
+# The PAM configuration file for the Shadow `chfn' service
+#
+
+# This allows root to change user infomation without being
+# prompted for a password
+auth		sufficient	pam_rootok.so
+
+# The standard Unix authentication modules, used with
+# NIS (man nsswitch) as well as normal /etc/passwd and
+# /etc/shadow entries.
+auth       include      common-auth
+account    include      common-account
+session    include      common-session
diff --git a/recipes/shadow/files/pam.d/chpasswd b/recipes/shadow/files/pam.d/chpasswd
new file mode 100644
index 0000000..9e3efa6
--- /dev/null
+++ b/recipes/shadow/files/pam.d/chpasswd
@@ -0,0 +1,4 @@
+# The PAM configuration file for the Shadow 'chpasswd' service
+#
+
+password   include      common-password
diff --git a/recipes/shadow/files/pam.d/chsh b/recipes/shadow/files/pam.d/chsh
new file mode 100644
index 0000000..8fb169f
--- /dev/null
+++ b/recipes/shadow/files/pam.d/chsh
@@ -0,0 +1,19 @@
+#
+# The PAM configuration file for the Shadow `chsh' service
+#
+
+# This will not allow a user to change their shell unless
+# their current one is listed in /etc/shells. This keeps
+# accounts with special shells from changing them.
+auth       required   pam_shells.so
+
+# This allows root to change user shell without being
+# prompted for a password
+auth		sufficient	pam_rootok.so
+
+# The standard Unix authentication modules, used with
+# NIS (man nsswitch) as well as normal /etc/passwd and
+# /etc/shadow entries.
+auth       include      common-auth
+account    include      common-account
+session    include      common-session
diff --git a/recipes/shadow/files/pam.d/login b/recipes/shadow/files/pam.d/login
new file mode 100644
index 0000000..2186d3e
--- /dev/null
+++ b/recipes/shadow/files/pam.d/login
@@ -0,0 +1,91 @@
+#
+# The PAM configuration file for the Shadow `login' service
+#
+
+# Enforce a minimal delay in case of failure (in microseconds).
+# (Replaces the `FAIL_DELAY' setting from login.defs)
+# Note that other modules may require another minimal delay. (for example,
+# to disable any delay, you should add the nodelay option to pam_unix)
+auth       optional   pam_faildelay.so  delay=3000000
+
+# Outputs an issue file prior to each login prompt (Replaces the
+# ISSUE_FILE option from login.defs). Uncomment for use
+# auth       required   pam_issue.so issue=/etc/issue
+
+# Disallows root logins except on tty's listed in /etc/securetty
+# (Replaces the `CONSOLE' setting from login.defs)
+# Note that it is included as a "requisite" module. No password prompts will
+# be displayed if this module fails to avoid having the root password
+# transmitted on unsecure ttys.
+# You can change it to a "required" module if you think it permits to
+# guess valid user names of your system (invalid user names are considered
+# as possibly being root).
+auth       requisite  pam_securetty.so
+
+# Disallows other than root logins when /etc/nologin exists
+# (Replaces the `NOLOGINS_FILE' option from login.defs)
+auth       requisite  pam_nologin.so
+
+# SELinux needs to be the first session rule. This ensures that any 
+# lingering context has been cleared. Without out this it is possible 
+# that a module could execute code in the wrong domain.
+# When the module is present, "required" would be sufficient (When SELinux
+# is disabled, this returns success.)
+session [success=ok ignore=ignore module_unknown=ignore default=bad] pam_selinux.so close
+
+# This module parses environment configuration file(s)
+# and also allows you to use an extended config
+# file /etc/security/pam_env.conf.
+# 
+# parsing /etc/environment needs "readenv=1"
+session       required   pam_env.so readenv=1
+# locale variables are also kept into /etc/default/locale in etch
+# reading this file *in addition to /etc/environment* does not hurt
+session       required   pam_env.so readenv=1 envfile=/etc/default/locale
+
+# Standard Un*x authentication.
+@include common-auth
+
+# This allows certain extra groups to be granted to a user
+# based on things like time of day, tty, service, and user.
+# Please edit /etc/security/group.conf to fit your needs
+# (Replaces the `CONSOLE_GROUPS' option in login.defs)
+auth       optional   pam_group.so
+
+# Uncomment and edit /etc/security/time.conf if you need to set
+# time restrainst on logins.
+# (Replaces the `PORTTIME_CHECKS_ENAB' option from login.defs
+# as well as /etc/porttime)
+# account    requisite  pam_time.so
+
+# Uncomment and edit /etc/security/access.conf if you need to
+# set access limits.
+# (Replaces /etc/login.access file)
+# account  required       pam_access.so
+
+# Sets up user limits according to /etc/security/limits.conf
+# (Replaces the use of /etc/limits in old login)
+session    required   pam_limits.so
+
+# Prints the last login info upon succesful login
+# (Replaces the `LASTLOG_ENAB' option from login.defs)
+session    optional   pam_lastlog.so
+
+# Prints the motd upon succesful login
+# (Replaces the `MOTD_FILE' option in login.defs)
+session    optional   pam_motd.so
+
+# Prints the status of the user's mailbox upon succesful login
+# (Replaces the `MAIL_CHECK_ENAB' option from login.defs). 
+#
+# This also defines the MAIL environment variable
+# However, userdel also needs MAIL_DIR and MAIL_FILE variables
+# in /etc/login.defs to make sure that removing a user 
+# also removes the user's mail spool file.
+# See comments in /etc/login.defs
+session    optional   pam_mail.so standard
+
+# Standard Un*x account and session
+account    include      common-account
+password   include      common-password
+session    include      common-session
diff --git a/recipes/shadow/files/pam.d/newusers b/recipes/shadow/files/pam.d/newusers
new file mode 100644
index 0000000..4aa3dde
--- /dev/null
+++ b/recipes/shadow/files/pam.d/newusers
@@ -0,0 +1,4 @@
+# The PAM configuration file for the Shadow 'newusers' service
+#
+
+password   include      common-password
diff --git a/recipes/shadow/files/pam.d/passwd b/recipes/shadow/files/pam.d/passwd
new file mode 100644
index 0000000..f534992
--- /dev/null
+++ b/recipes/shadow/files/pam.d/passwd
@@ -0,0 +1,5 @@
+#
+# The PAM configuration file for the Shadow `passwd' service
+#
+
+password   include      common-password
diff --git a/recipes/shadow/files/pam.d/su b/recipes/shadow/files/pam.d/su
new file mode 100644
index 0000000..8e35137
--- /dev/null
+++ b/recipes/shadow/files/pam.d/su
@@ -0,0 +1,60 @@
+#
+# The PAM configuration file for the Shadow `su' service
+#
+
+# This allows root to su without passwords (normal operation)
+auth       sufficient pam_rootok.so
+
+# Uncomment this to force users to be a member of group root
+# before they can use `su'. You can also add "group=foo"
+# to the end of this line if you want to use a group other
+# than the default "root" (but this may have side effect of
+# denying "root" user, unless she's a member of "foo" or explicitly
+# permitted earlier by e.g. "sufficient pam_rootok.so").
+# (Replaces the `SU_WHEEL_ONLY' option from login.defs)
+# auth       required   pam_wheel.so
+
+# Uncomment this if you want wheel members to be able to
+# su without a password.
+# auth       sufficient pam_wheel.so trust
+
+# Uncomment this if you want members of a specific group to not
+# be allowed to use su at all.
+# auth       required   pam_wheel.so deny group=nosu
+
+# Uncomment and edit /etc/security/time.conf if you need to set
+# time restrainst on su usage.
+# (Replaces the `PORTTIME_CHECKS_ENAB' option from login.defs
+# as well as /etc/porttime)
+# account    requisite  pam_time.so
+
+# This module parses environment configuration file(s)
+# and also allows you to use an extended config
+# file /etc/security/pam_env.conf.
+# 
+# parsing /etc/environment needs "readenv=1"
+session       required   pam_env.so readenv=1
+# locale variables are also kept into /etc/default/locale in etch
+# reading this file *in addition to /etc/environment* does not hurt
+session       required   pam_env.so readenv=1 envfile=/etc/default/locale
+
+# Defines the MAIL environment variable
+# However, userdel also needs MAIL_DIR and MAIL_FILE variables
+# in /etc/login.defs to make sure that removing a user 
+# also removes the user's mail spool file.
+# See comments in /etc/login.defs
+#
+# "nopen" stands to avoid reporting new mail when su'ing to another user
+session    optional   pam_mail.so nopen
+
+# Sets up user limits, please uncomment and read /etc/security/limits.conf
+# to enable this functionality.
+# (Replaces the use of /etc/limits in old login)
+# session    required   pam_limits.so
+
+# The standard Unix authentication modules, used with
+# NIS (man nsswitch) as well as normal /etc/passwd and
+# /etc/shadow entries.
+auth       include      common-auth
+account    include      common-account
+session    include      common-session
diff --git a/recipes/shadow/shadow_4.1.4.2.bb b/recipes/shadow/shadow_4.1.4.2.bb
new file mode 100644
index 0000000..04887a0
--- /dev/null
+++ b/recipes/shadow/shadow_4.1.4.2.bb
@@ -0,0 +1,52 @@
+DESCRIPTION = "login/password and account utilities"
+LICENSE = "GPL"
+
+DEPEND = "libpam"
+RDEPEND = "${DEPEND}"
+
+PR = "r5"
+
+EXTRA_OECONF += " --enable-shared  --enable-static --with-libpam --without-libcrack"
+
+inherit autotools
+
+HOMEPAGE = "http://pkg-shadow.alioth.debian.org/"
+SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
+           file://login_defs_pam.sed \
+"
+
+# Additional Policy files for PAM
+SRC_URI_append = " \
+           file://pam.d/chfn \ 
+           file://pam.d/chpasswd \
+           file://pam.d/chsh \
+           file://pam.d/login \
+           file://pam.d/newusers \
+           file://pam.d/passwd \
+           file://pam.d/su \
+"
+
+S = "${WORKDIR}/shadow-${PV}"
+
+CFLAGS_append = " -I../include"
+
+do_install_append() {
+  # Ensure that the image has as /var/spool/mail dir so shadow can put mailboxes there if the user
+  # reconfigures Shadow to default (see sed below).
+  install -d ${D}${localstatedir}/spool/mail/  
+  
+  install -d ${D}${sysconfdir}/pam.d/  
+  install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
+
+  # Remove defaults that are not used when supporting PAM
+  sed -i -f ${WORKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
+
+  # Enable CREATE_HOME by default.
+  sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs 
+  
+  # As we are on an embedded system ensure the users mailbox is in ~/ not 
+  # /var/spool/mail by default as who knows where or how big /var is.
+  # The system MDA will set this later anyway.
+  sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs 
+  sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs 
+}
-- 
1.7.0.2





