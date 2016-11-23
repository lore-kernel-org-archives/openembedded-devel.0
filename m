Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 362F871A7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i88so444930pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=143Zis35JqTmsoWkAXokrNB0nGVJv9QDpOeQH50bDak=;
	b=wx8MCKHk6rBbic+v7ORu1/xW96EuT9gLXrH6i6orU8QKn/1fGqXsOr74SVv+Dah3Gh
	+YFLCe3L3mC7r6YyFCw1U+kzHC+ojamwDsLJXHG7jku+i6ps6yAsw1Qp+/NVDyJeJClS
	Prq+wJ6PLOPFxGFKhkZsYYBHHm5unYOwaSXNKlLGpuj4iMki19bNZjuB/TN9dDNwUfU0
	jaOrrAqDLWN8ganqfdgioVnyAWBc4gJjWd5I/OIYJkDQKBlchOcyAOo5QCuE1Y5TYF1Y
	mc28UFRStBERweNt1N0GPP8stqllf2/p4PhTcbPj6874+Jyw5B1ePF1YKlIOpNenW+lR
	7kLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=143Zis35JqTmsoWkAXokrNB0nGVJv9QDpOeQH50bDak=;
	b=BBuoHCyqAzGy1e9xfaOSipeQ6Rks0Hl6rRGNhrH/Vx78zvOotoDPTjmqo8WLml2YZL
	YoPk6rbh+h6ybdkU72+Bu3x+SLhBpgs8LkQlv6w6akbLKrEUOlwOW1JBKnDZu//VtXZB
	TCKGET6iON9aqTapHh4KFdeG6+yi5O8yaqIQ9xHs3uZIFhdjoAnFdqapm13FXVjTyNfM
	zG8Ze0NrhQj8QYE4yGgExT+MdgFSY8+wrdZUFF71j7SupnfWgkNFL9dC6+/rY9olyVAG
	4s5do+lp2GzO8RAjWejIVN6l3pM+p25e0JUFp+2l3aMNSauxoDH1AJ4YpU5Wq9ZvFHUD
	4quA==
X-Gm-Message-State: AKaTC01L+8CSh9eVTiWwLVEl5zLInA4/mMvD/ZZB/lMHgPXpJntztUCW9k09WrApFSB8VA==
X-Received: by 10.98.19.137 with SMTP id 9mr1912714pft.150.1479892955925;
	Wed, 23 Nov 2016 01:22:35 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:45 -0800
Message-Id: <20161123092209.23699-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 25/49] ssmtp: Add recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ssmtp/ssmtp/build-ouside_srcdir.patch          | 17 +++++
 .../recipes-support/ssmtp/ssmtp/use-DESTDIR.patch  | 74 ++++++++++++++++++++++
 .../recipes-support/ssmtp/ssmtp_2.64.bb            | 31 +++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/build-ouside_srcdir.patch
 create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch
 create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/build-ouside_srcdir.patch b/meta-networking/recipes-support/ssmtp/ssmtp/build-ouside_srcdir.patch
new file mode 100644
index 0000000..d53cff2
--- /dev/null
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/build-ouside_srcdir.patch
@@ -0,0 +1,17 @@
+help compile when S != B
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: ssmtp-2.64/Makefile.in
+===================================================================
+--- ssmtp-2.64.orig/Makefile.in
++++ ssmtp-2.64/Makefile.in
+@@ -24,7 +24,7 @@ INSTALLED_REVALIASES_FILE=$(REVALIASES_F
+ # Programs
+ GEN_CONFIG=$(srcdir)/generate_config
+ 
+-SRCS=ssmtp.c arpadate.c base64.c xgethostname.c @SRCS@
++SRCS=$(srcdir)/ssmtp.c $(srcdir)/arpadate.c $(srcdir)/base64.c $(srcdir)/xgethostname.c @SRCS@
+ 
+ OBJS=$(SRCS:.c=.o)
+ 
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch b/meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch
new file mode 100644
index 0000000..26d8527
--- /dev/null
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch
@@ -0,0 +1,74 @@
+Use DESTDIR during  install/uninstall, this helps
+with cross or staged builds. Additionally pass LDFLAGS
+during linking.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+
+Index: ssmtp-2.64/Makefile.in
+===================================================================
+--- ssmtp-2.64.orig/Makefile.in
++++ ssmtp-2.64/Makefile.in
+@@ -46,40 +46,40 @@ all: ssmtp
+ 
+ .PHONY: install
+ install: ssmtp $(GEN_CONFIG)
+-	$(INSTALL) -d -m 755 $(bindir)
+-	$(INSTALL) -s -m 755 ssmtp $(bindir)/ssmtp
+-	$(INSTALL) -d -m 755 $(mandir)
+-	$(INSTALL) -m 644 $(srcdir)/ssmtp.8 $(mandir)/ssmtp.8
+-	$(INSTALL) -d -m 755 $(SSMTPCONFDIR)
+-	$(INSTALL) -m 644 $(srcdir)/revaliases $(INSTALLED_REVALIASES_FILE)
+-	$(GEN_CONFIG) $(INSTALLED_CONFIGURATION_FILE)
++	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
++	$(INSTALL) -m 755 ssmtp $(DESTDIR)$(bindir)/ssmtp
++	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)
++	$(INSTALL) -m 644 $(srcdir)/ssmtp.8 $(DESTDIR)$(mandir)/ssmtp.8
++	$(INSTALL) -d -m 755 $(DESTDIR)$(SSMTPCONFDIR)
++	$(INSTALL) -m 644 $(srcdir)/revaliases $(DESTDIR)$(INSTALLED_REVALIASES_FILE)
++	$(GEN_CONFIG) $(DESTDIR)$(INSTALLED_CONFIGURATION_FILE)
+ 
+ 
+ .PHONY: install-sendmail
+ install-sendmail: install
+-	$(RM) $(bindir)/sendmail
+-	$(LN_S) ssmtp $(bindir)/sendmail
+-	$(INSTALL) -d -m 755 $(libexecdir)
+-	$(RM) $(libexecdir)/sendmail
+-	$(LN_S) sendmail /lib/sendmail
+-	$(RM) $(mandir)/sendmail.8
+-	$(LN_S) ssmtp.8 $(mandir)/sendmail.8
++	$(RM) $(DESTDIR)$(bindir)/sendmail
++	$(LN_S) ssmtp $(DESTDIR)$(bindir)/sendmail
++	$(INSTALL) -d -m 755 $(DESTDIR)$(libexecdir)
++	$(RM) $(DESTDIR)$(libexecdir)/sendmail
++	$(LN_S) sendmail $(DESTDIR)/lib/sendmail
++	$(RM) $(DESTDIR)$(mandir)/sendmail.8
++	$(LN_S) ssmtp.8 $(DESTDIR)$(mandir)/sendmail.8
+ 
+ .PHONY: uninstall
+ uninstall:
+-	$(RM) $(bindir)/ssmtp
+-	$(RM) $(mandir)/ssmtp.8
+-	$(RM) $(CONFIGURATION_FILE) $(REVALIASES_FILE)
+-	$(RM) -r $(SSMTPCONFDIR)
++	$(RM) $(DESTDIR)$(bindir)/ssmtp
++	$(RM) $(DESTDIR)$(mandir)/ssmtp.8
++	$(RM) $(DESTDIR)$(CONFIGURATION_FILE) $(DESTDIR)$(REVALIASES_FILE)
++	$(RM) -r $(DESTDIR)$(SSMTPCONFDIR)
+ 
+ .PHONY: uninstall-sendmail
+ uninstall-sendmail: uninstall
+-	$(RM)  $(bindir)/sendmail /lib/sendmail
+-	$(RM)  $(mandir)/sendmail.8
++	$(RM)  $(DESTDIR)$(bindir)/sendmail $(DESTDIR)/lib/sendmail
++	$(RM)  $(DESTDIR)$(mandir)/sendmail.8
+ 
+ # Binaries:
+ ssmtp: $(OBJS)
+-	$(CC) -o ssmtp $(OBJS) @LIBS@ $(CFLAGS)
++	$(CC) -o ssmtp $(OBJS) @LIBS@ $(CFLAGS) $(LDFLAGS)
+ 
+ .PHONY: clean
+ clean:
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
new file mode 100644
index 0000000..9d4864d
--- /dev/null
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -0,0 +1,31 @@
+SUMMARY = "extremely simple MTA to get mail off the system to a mail hub"
+HOMEPAGE = "http://packages.qa.debian.org/s/ssmtp.html"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
+
+SRC_URI = "\
+           ${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
+           file://build-ouside_srcdir.patch \
+           file://use-DESTDIR.patch \
+          "
+
+EXTRA_OECONF += "--mandir=${mandir}"
+
+EXTRA_OEMAKE = "GEN_CONFIG='/bin/true'"
+
+SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
+SRC_URI[sha256sum] = "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
+
+inherit autotools pkgconfig
+
+DEPENDS += "openssl inetutils"
+
+do_install_append () {
+    install -d ${D}${mandir}/
+    mv ${D}${exec_prefix}/man/* ${D}${mandir}/
+    rmdir ${D}${exec_prefix}/man
+    ln -s ssmtp ${D}${sbindir}/sendmail
+    ln -s ssmtp ${D}${sbindir}/newaliases
+    ln -s ssmtp ${D}${sbindir}/mailq
+}
-- 
2.10.2


