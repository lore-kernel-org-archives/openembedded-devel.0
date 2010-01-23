Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYcYs-0008DH-TL
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:45:50 +0100
Received: by yxe5 with SMTP id 5so1646640yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MArdPyP7wX+K2r2e14yCWn+2LqVKQMIWrzJnEOLyJf0=;
	b=J7y/8GHI6xrbsorhNbzqAZROurJGTTwAIyVBKp+YwgWUg9UMR8bOBjiUli6Rc2D+ST
	gjf66Ro4j5QUwRJCuB2WDqi80Y2tXW6Tr0LGqDWEnxh+BBYCVj8UuJxJOmi8KsPOGv/V
	tL4fUOuoPcOxs8vJXyvI8EE1y/Na4I6pFr+EI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UDvuB5gxq8ngh0dX7W/w8UVXOkFFhSeXFEDtVyu3tz/+h2WwOdL2fw2z6mZlMIfiaN
	MWmwCGgmbRbXzR2rqp81SFyKs8U//e6NkzFIOSKHWuodcdcJ5RRhTrMkasGeycRlhq8k
	mglwXV7PkKmGAmHYAUqdwtGuZ9BkOYURoqhg0=
Received: by 10.150.119.42 with SMTP id r42mr5442147ybc.325.1264239807998;
	Sat, 23 Jan 2010 01:43:27 -0800 (PST)
Received: from localhost ([123.162.71.84])
	by mx.google.com with ESMTPS id 22sm1110590ywh.30.2010.01.23.01.43.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 01:43:27 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 17:43:05 +0800
Message-Id: <1264239785-28226-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux-storcenter: add fw-and-powerpc-install.patch
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
X-List-Received-Date: Sat, 23 Jan 2010 09:45:50 -0000

* fw-and-powerpc-install.patch is included in SRC_URI of linux-storcenter_2.6.27.7.bb
* but this patch is not located in linux-storcenter directory

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 .../linux-storcenter/fw-and-powerpc-install.patch  |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-storcenter/fw-and-powerpc-install.patch

diff --git a/recipes/linux/linux-storcenter/fw-and-powerpc-install.patch b/recipes/linux/linux-storcenter/fw-and-powerpc-install.patch
new file mode 100644
index 0000000..9f1eda7
--- /dev/null
+++ b/recipes/linux/linux-storcenter/fw-and-powerpc-install.patch
@@ -0,0 +1,36 @@
+diff -urN linux-2.6.27.7.old//arch/powerpc/boot/Makefile linux-2.6.27.7//arch/powerpc/boot/Makefile
+--- linux-2.6.27.7.old//arch/powerpc/boot/Makefile	2008-11-20 23:02:37.000000000 +0000
++++ linux-2.6.27.7//arch/powerpc/boot/Makefile	2008-11-22 21:02:13.456791583 +0000
+@@ -376,16 +376,16 @@
+       cmd_mkdir           = mkdir -p $@
+ 
+ quiet_cmd_install	  = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_OBJDIR)/%,%,$@)
+-      cmd_install	  = $(INSTALL)  -m0644 $(patsubst $(DESTDIR)$(WRAPPER_OBJDIR)/%,$(obj)/%,$@) $@
++      cmd_install	  = $(INSTALL)  -m 0644 $(patsubst $(DESTDIR)$(WRAPPER_OBJDIR)/%,$(obj)/%,$@) $@
+ 
+ quiet_cmd_install_dts	  = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_DTSDIR)/%,dts/%,$@)
+-      cmd_install_dts	  = $(INSTALL)  -m0644 $(patsubst $(DESTDIR)$(WRAPPER_DTSDIR)/%,$(srctree)/$(obj)/dts/%,$@) $@
++      cmd_install_dts	  = $(INSTALL)  -m 0644 $(patsubst $(DESTDIR)$(WRAPPER_DTSDIR)/%,$(srctree)/$(obj)/dts/%,$@) $@
+ 
+ quiet_cmd_install_exe	  = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,%,$@)
+-      cmd_install_exe	  = $(INSTALL)  -m0755 $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,$(obj)/%,$@) $@
++      cmd_install_exe	  = $(INSTALL)  -m 0755 $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,$(obj)/%,$@) $@
+ 
+ quiet_cmd_install_wrapper = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,%,$@)
+-      cmd_install_wrapper = $(INSTALL)  -m0755 $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,$(srctree)/$(obj)/%,$@) $@ ;\
++      cmd_install_wrapper = $(INSTALL)  -m 0755 $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,$(srctree)/$(obj)/%,$@) $@ ;\
+ 				sed -i $@ -e 's%^object=.*%object=$(WRAPPER_OBJDIR)%' \
+ 					  -e 's%^objbin=.*%objbin=$(WRAPPER_BINDIR)%' \
+ 
+diff -urN linux-2.6.27.7.old//scripts/Makefile.fwinst linux-2.6.27.7//scripts/Makefile.fwinst
+--- linux-2.6.27.7.old//scripts/Makefile.fwinst	2008-11-20 23:02:37.000000000 +0000
++++ linux-2.6.27.7//scripts/Makefile.fwinst	2008-11-22 21:01:50.870504646 +0000
+@@ -37,7 +37,7 @@
+ 	@true
+ 
+ quiet_cmd_install = INSTALL $(subst $(srctree)/,,$@)
+-      cmd_install = $(INSTALL) -m0644 $< $@
++      cmd_install = $(INSTALL) -m 0644 $< $@
+ 
+ $(installed-fw-dirs):
+ 	$(call cmd,mkdir)
-- 
1.5.4.3



