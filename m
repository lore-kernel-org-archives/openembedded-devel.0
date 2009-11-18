Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1NAhwX-0006mE-TR for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:39:24 +0100
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 4141C140B2;
	Wed, 18 Nov 2009 11:37:58 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 11:37:50 +0100
Message-Id: <1258540671-652-3-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1258540671-652-2-git-send-email-zlo@zlo.nu>
References: <1258540671-652-1-git-send-email-zlo@zlo.nu>
	<1258540671-652-2-git-send-email-zlo@zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marc Olzheim <marc@iphion.nl>
Subject: [PATCH 2/3] Move all patches to one directory to avoid duplication.
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
X-List-Received-Date: Wed, 18 Nov 2009 10:39:25 -0000

From: Marc Olzheim <marc@iphion.nl>

---
 recipes/iproute2/files/ip6tunnel.patch             |   12 +++
 .../iproute2/files/iproute2-2.6.15_no_strip.diff   |   25 ++++++
 .../files/iproute2-2.6.18_new-flex-fix.patch       |   83 ++++++++++++++++++++
 .../files/iproute2-2.6.20_new-flex-fix.patch       |   83 ++++++++++++++++++++
 recipes/iproute2/files/man-pages-fix.patch         |   13 +++
 .../iproute2/files/missing_linux_ip_header.patch   |   12 +++
 recipes/iproute2/files/no-strip.patch              |   36 +++++++++
 .../iproute2-2.6.18/iproute2-2.6.15_no_strip.diff  |   25 ------
 .../iproute2/iproute2-2.6.18/new-flex-fix.patch    |   83 --------------------
 recipes/iproute2/iproute2-2.6.20/ip6tunnel.patch   |   10 ---
 .../iproute2/iproute2-2.6.20/man-pages-fix.patch   |   13 ---
 .../iproute2/iproute2-2.6.20/new-flex-fix.patch    |   83 --------------------
 recipes/iproute2/iproute2-2.6.20/no-strip.patch    |   36 ---------
 recipes/iproute2/iproute2-2.6.22/ip6tunnel.patch   |   12 ---
 .../iproute2/iproute2-2.6.22/new-flex-fix.patch    |   83 --------------------
 recipes/iproute2/iproute2-2.6.22/no-strip.patch    |   36 ---------
 .../iproute2/iproute2-2.6.29/compilation-fix.patch |   12 ---
 .../iproute2/iproute2-2.6.29/new-flex-fix.patch    |   83 --------------------
 recipes/iproute2/iproute2_2.6.18.bb                |    4 +-
 recipes/iproute2/iproute2_2.6.20.bb                |    4 +-
 recipes/iproute2/iproute2_2.6.22.bb                |    4 +-
 recipes/iproute2/iproute2_2.6.29.bb                |    6 +-
 22 files changed, 273 insertions(+), 485 deletions(-)
 create mode 100644 recipes/iproute2/files/ip6tunnel.patch
 create mode 100644 recipes/iproute2/files/iproute2-2.6.15_no_strip.diff
 create mode 100644 recipes/iproute2/files/iproute2-2.6.18_new-flex-fix.patch
 create mode 100644 recipes/iproute2/files/iproute2-2.6.20_new-flex-fix.patch
 create mode 100644 recipes/iproute2/files/man-pages-fix.patch
 create mode 100644 recipes/iproute2/files/missing_linux_ip_header.patch
 create mode 100644 recipes/iproute2/files/no-strip.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.18/iproute2-2.6.15_no_strip.diff
 delete mode 100644 recipes/iproute2/iproute2-2.6.18/new-flex-fix.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.20/ip6tunnel.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.20/man-pages-fix.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.20/new-flex-fix.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.20/no-strip.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.22/ip6tunnel.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.22/new-flex-fix.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.22/no-strip.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.29/compilation-fix.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.29/new-flex-fix.patch

diff --git a/recipes/iproute2/files/ip6tunnel.patch b/recipes/iproute2/files/ip6tunnel.patch
new file mode 100644
index 0000000..a00a7e7
--- /dev/null
+++ b/recipes/iproute2/files/ip6tunnel.patch
@@ -0,0 +1,12 @@
+This fix is needed when building with uclibc
+
+--- iproute-2.6.20-070313/ip/ip6tunnel.c	2007/03/17 03:44:27	1.1
++++ iproute-2.6.20-070313/ip/ip6tunnel.c	2007/03/17 03:43:14
+@@ -33,6 +33,7 @@
+ #include <sys/socket.h>
+ #include <arpa/inet.h>
+ #include <sys/ioctl.h>
++#include <linux/types.h>
+ #include <linux/ip.h>
+ #include <linux/if.h>
+ #include <linux/if_arp.h>
diff --git a/recipes/iproute2/files/iproute2-2.6.15_no_strip.diff b/recipes/iproute2/files/iproute2-2.6.15_no_strip.diff
new file mode 100644
index 0000000..4965069
--- /dev/null
+++ b/recipes/iproute2/files/iproute2-2.6.15_no_strip.diff
@@ -0,0 +1,25 @@
+--- ip/Makefile	2006/02/23 21:22:18	1.1
++++ ip/Makefile	2006/02/23 21:22:27
+@@ -16,7 +16,7 @@
+ rtmon: $(RTMONOBJ) $(LIBNETLINK)
+ 
+ install: all
+-	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
++	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
+ 	install -m 0755 $(SCRIPTS) $(DESTDIR)$(SBINDIR)
+ 
+ clean:
+--- tc/Makefile	2006/02/23 21:23:52	1.1
++++ tc/Makefile	2006/02/23 21:23:57
+@@ -70,9 +70,9 @@
+ 
+ install: all
+ 	mkdir -p $(DESTDIR)/usr/lib/tc
+-	install -m 0755 -s tc $(DESTDIR)$(SBINDIR)
++	install -m 0755 tc $(DESTDIR)$(SBINDIR)
+ 	for i in $(TCSO); \
+-	do install -m 755 -s $$i $(DESTDIR)/usr/lib/tc; \
++	do install -m 755 $$i $(DESTDIR)/usr/lib/tc; \
+ 	done
+ 
+ clean:
diff --git a/recipes/iproute2/files/iproute2-2.6.18_new-flex-fix.patch b/recipes/iproute2/files/iproute2-2.6.18_new-flex-fix.patch
new file mode 100644
index 0000000..2c04087
--- /dev/null
+++ b/recipes/iproute2/files/iproute2-2.6.18_new-flex-fix.patch
@@ -0,0 +1,83 @@
+The tc command was failing to build due to flex errors. These errors are
+caused by an incompatible change to flex in recent versions, including the
+version shipped with OE. 
+
+This fix is as per the one used by opensure:
+
+  http://lists.opensuse.org/opensuse-commit/2006-04/msg00090.html
+
+and simple renames str to prevent it conflicting.
+
+--- iproute2-2.6.16-060323/tc/emp_ematch.l	2006/10/30 22:46:29	1.1
++++ iproute2-2.6.16-060323/tc/emp_ematch.l	2006/10/30 22:47:26
+@@ -63,7 +63,7 @@
+ 
+ %}
+ 
+-%x str
++%x STR
+ 
+ %option 8bit stack warn noyywrap prefix="ematch_"
+ %%
+@@ -78,17 +78,17 @@
+ 						}
+ 						strbuf_index = 0;
+ 						
+-						BEGIN(str);
++						BEGIN(STR);
+ 					}
+ 
+-<str>\"					{
++<STR>\"					{
+ 						BEGIN(INITIAL);
+ 						yylval.b = bstr_new(strbuf, strbuf_index);
+ 						yylval.b->quoted = 1;
+ 						return ATTRIBUTE;
+ 					}
+ 
+-<str>\\[0-7]{1,3}			{ /* octal escape sequence */
++<STR>\\[0-7]{1,3}			{ /* octal escape sequence */
+ 						int res;
+ 						
+ 						sscanf(yytext + 1, "%o", &res);
+@@ -100,12 +100,12 @@
+ 						strbuf_append_char((unsigned char) res);
+ 					}
+ 
+-<str>\\[0-9]+				{ /* catch wrong octal escape seq. */
++<STR>\\[0-9]+				{ /* catch wrong octal escape seq. */
+ 						fprintf(stderr, "error: invalid octale escape sequence\n");
+ 						return ERROR;
+ 					}
+ 
+-<str>\\x[0-9a-fA-F]{1,2}		{
++<STR>\\x[0-9a-fA-F]{1,2}		{
+ 						int res;
+ 						
+ 						sscanf(yytext + 2, "%x", &res);
+@@ -118,16 +118,16 @@
+ 						strbuf_append_char((unsigned char) res);
+ 					}
+ 
+-<str>\\n				strbuf_append_char('\n');
+-<str>\\r				strbuf_append_char('\r');
+-<str>\\t				strbuf_append_char('\t');
+-<str>\\v				strbuf_append_char('\v');
+-<str>\\b				strbuf_append_char('\b');
+-<str>\\f				strbuf_append_char('\f');
+-<str>\\a				strbuf_append_char('\a');
++<STR>\\n				strbuf_append_char('\n');
++<STR>\\r				strbuf_append_char('\r');
++<STR>\\t				strbuf_append_char('\t');
++<STR>\\v				strbuf_append_char('\v');
++<STR>\\b				strbuf_append_char('\b');
++<STR>\\f				strbuf_append_char('\f');
++<STR>\\a				strbuf_append_char('\a');
+ 
+-<str>\\(.|\n)				strbuf_append_char(yytext[1]);
+-<str>[^\\\n\"]+				strbuf_append_charp(yytext);
++<STR>\\(.|\n)				strbuf_append_char(yytext[1]);
++<STR>[^\\\n\"]+				strbuf_append_charp(yytext);
+ 
+ [aA][nN][dD]				return AND;
+ [oO][rR]				return OR;
diff --git a/recipes/iproute2/files/iproute2-2.6.20_new-flex-fix.patch b/recipes/iproute2/files/iproute2-2.6.20_new-flex-fix.patch
new file mode 100644
index 0000000..af72721
--- /dev/null
+++ b/recipes/iproute2/files/iproute2-2.6.20_new-flex-fix.patch
@@ -0,0 +1,83 @@
+The tc command was failing to build due to flex errors. These errors are
+caused by an incompatible change to flex in recent versions, including the
+version shipped with OE. 
+
+This fix is as per the one used by opensure:
+
+  http://lists.opensuse.org/opensuse-commit/2006-04/msg00090.html
+
+and simple renames str to prevent it conflicting.
+
+--- iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:52:20	1.1
++++ iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:54:01
+@@ -63,7 +63,7 @@
+ 
+ %}
+ 
+-%x str
++%x STR
+ 
+ %option 8bit stack warn noyywrap prefix="ematch_"
+ %%
+@@ -78,17 +78,17 @@
+ 						}
+ 						strbuf_index = 0;
+ 
+-						BEGIN(str);
++						BEGIN(STR);
+ 					}
+ 
+-<str>\"					{
++<STR>\"					{
+ 						BEGIN(INITIAL);
+ 						yylval.b = bstr_new(strbuf, strbuf_index);
+ 						yylval.b->quoted = 1;
+ 						return ATTRIBUTE;
+ 					}
+ 
+-<str>\\[0-7]{1,3}			{ /* octal escape sequence */
++<STR>\\[0-7]{1,3}			{ /* octal escape sequence */
+ 						int res;
+ 
+ 						sscanf(yytext + 1, "%o", &res);
+@@ -100,12 +100,12 @@
+ 						strbuf_append_char((unsigned char) res);
+ 					}
+ 
+-<str>\\[0-9]+				{ /* catch wrong octal escape seq. */
++<STR>\\[0-9]+				{ /* catch wrong octal escape seq. */
+ 						fprintf(stderr, "error: invalid octale escape sequence\n");
+ 						return ERROR;
+ 					}
+ 
+-<str>\\x[0-9a-fA-F]{1,2}		{
++<STR>\\x[0-9a-fA-F]{1,2}		{
+ 						int res;
+ 
+ 						sscanf(yytext + 2, "%x", &res);
+@@ -118,16 +118,16 @@
+ 						strbuf_append_char((unsigned char) res);
+ 					}
+ 
+-<str>\\n				strbuf_append_char('\n');
+-<str>\\r				strbuf_append_char('\r');
+-<str>\\t				strbuf_append_char('\t');
+-<str>\\v				strbuf_append_char('\v');
+-<str>\\b				strbuf_append_char('\b');
+-<str>\\f				strbuf_append_char('\f');
+-<str>\\a				strbuf_append_char('\a');
++<STR>\\n				strbuf_append_char('\n');
++<STR>\\r				strbuf_append_char('\r');
++<STR>\\t				strbuf_append_char('\t');
++<STR>\\v				strbuf_append_char('\v');
++<STR>\\b				strbuf_append_char('\b');
++<STR>\\f				strbuf_append_char('\f');
++<STR>\\a				strbuf_append_char('\a');
+ 
+-<str>\\(.|\n)				strbuf_append_char(yytext[1]);
+-<str>[^\\\n\"]+				strbuf_append_charp(yytext);
++<STR>\\(.|\n)				strbuf_append_char(yytext[1]);
++<STR>[^\\\n\"]+				strbuf_append_charp(yytext);
+ 
+ [aA][nN][dD]				return AND;
+ [oO][rR]				return OR;
diff --git a/recipes/iproute2/files/man-pages-fix.patch b/recipes/iproute2/files/man-pages-fix.patch
new file mode 100644
index 0000000..924d0ed
--- /dev/null
+++ b/recipes/iproute2/files/man-pages-fix.patch
@@ -0,0 +1,13 @@
+--- iproute-2.6.20-070313/Makefile	2007/03/17 04:24:45	1.1
++++ iproute-2.6.20-070313/Makefile	2007/03/17 04:27:39
+@@ -52,8 +52,8 @@
+ 	install -m 0644 $(shell find etc/iproute2 -maxdepth 1 -type f) $(DESTDIR)$(CONFDIR)
+ 	install -m 0755 -d $(DESTDIR)$(MANDIR)/man8
+ 	install -m 0644 $(shell find man/man8 -maxdepth 1 -type f) $(DESTDIR)$(MANDIR)/man8
+-	ln -sf tc-pbfifo.8  $(DESTDIR)$(MANDIR)/man8/tc-bfifo.8
+-	ln -sf tc-pbfifo.8  $(DESTDIR)$(MANDIR)/man8/tc-pfifo.8
++	ln -sf tc-bfifo.8 $(DESTDIR)$(MANDIR)/man8/tc-pfifo.8
++	ln -sf tc-bfifo.8 $(DESTDIR)$(MANDIR)/man8/tc-pbfifo.8
+ 	install -m 0755 -d $(DESTDIR)$(MANDIR)/man3
+ 	install -m 0644 $(shell find man/man3 -maxdepth 1 -type f) $(DESTDIR)$(MANDIR)/man3
+ 
diff --git a/recipes/iproute2/files/missing_linux_ip_header.patch b/recipes/iproute2/files/missing_linux_ip_header.patch
new file mode 100644
index 0000000..2012807
--- /dev/null
+++ b/recipes/iproute2/files/missing_linux_ip_header.patch
@@ -0,0 +1,12 @@
+Index: iproute2-2.6.29/ip/link_gre.c
+===================================================================
+--- iproute2-2.6.29.orig/ip/link_gre.c	2009-06-22 11:10:24.212963299 +0400
++++ iproute2-2.6.29/ip/link_gre.c	2009-06-22 11:10:33.940691491 +0400
+@@ -12,6 +12,7 @@
+ 
+ #include <string.h>
+ #include <net/if.h>
++#include <linux/ip.h>
+ #include <linux/if_tunnel.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
diff --git a/recipes/iproute2/files/no-strip.patch b/recipes/iproute2/files/no-strip.patch
new file mode 100644
index 0000000..6490dad
--- /dev/null
+++ b/recipes/iproute2/files/no-strip.patch
@@ -0,0 +1,36 @@
+--- iproute-2.6.20-070313/ip/Makefile	2007/03/17 05:17:30	1.1
++++ iproute-2.6.20-070313/ip/Makefile	2007/03/17 05:17:37
+@@ -16,7 +16,7 @@
+ rtmon: $(RTMONOBJ) $(LIBNETLINK)
+ 
+ install: all
+-	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
++	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
+ 	install -m 0755 $(SCRIPTS) $(DESTDIR)$(SBINDIR)
+ 
+ clean:
+--- iproute-2.6.20-070313/misc/Makefile	2007/03/17 05:18:20	1.1
++++ iproute-2.6.20-070313/misc/Makefile	2007/03/17 05:18:26
+@@ -27,7 +27,7 @@
+ lnstat: $(LNSTATOBJ)
+ 
+ install: all
+-	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
++	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
+ 	ln -sf lnstat $(DESTDIR)$(SBINDIR)/rtstat
+ 	ln -sf lnstat $(DESTDIR)$(SBINDIR)/ctstat
+ 
+--- iproute-2.6.20-070313/tc/Makefile	2007/03/17 05:17:42	1.1
++++ iproute-2.6.20-070313/tc/Makefile	2007/03/17 05:17:54
+@@ -70,9 +70,9 @@
+ 
+ install: all
+ 	mkdir -p $(DESTDIR)/usr/lib/tc
+-	install -m 0755 -s tc $(DESTDIR)$(SBINDIR)
++	install -m 0755 tc $(DESTDIR)$(SBINDIR)
+ 	for i in $(TCSO); \
+-	do install -m 755 -s $$i $(DESTDIR)/usr/lib/tc; \
++	do install -m 755 $$i $(DESTDIR)/usr/lib/tc; \
+ 	done
+ 
+ clean:
diff --git a/recipes/iproute2/iproute2-2.6.18/iproute2-2.6.15_no_strip.diff b/recipes/iproute2/iproute2-2.6.18/iproute2-2.6.15_no_strip.diff
deleted file mode 100644
index 4965069..0000000
--- a/recipes/iproute2/iproute2-2.6.18/iproute2-2.6.15_no_strip.diff
+++ /dev/null
@@ -1,25 +0,0 @@
---- ip/Makefile	2006/02/23 21:22:18	1.1
-+++ ip/Makefile	2006/02/23 21:22:27
-@@ -16,7 +16,7 @@
- rtmon: $(RTMONOBJ) $(LIBNETLINK)
- 
- install: all
--	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
-+	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
- 	install -m 0755 $(SCRIPTS) $(DESTDIR)$(SBINDIR)
- 
- clean:
---- tc/Makefile	2006/02/23 21:23:52	1.1
-+++ tc/Makefile	2006/02/23 21:23:57
-@@ -70,9 +70,9 @@
- 
- install: all
- 	mkdir -p $(DESTDIR)/usr/lib/tc
--	install -m 0755 -s tc $(DESTDIR)$(SBINDIR)
-+	install -m 0755 tc $(DESTDIR)$(SBINDIR)
- 	for i in $(TCSO); \
--	do install -m 755 -s $$i $(DESTDIR)/usr/lib/tc; \
-+	do install -m 755 $$i $(DESTDIR)/usr/lib/tc; \
- 	done
- 
- clean:
diff --git a/recipes/iproute2/iproute2-2.6.18/new-flex-fix.patch b/recipes/iproute2/iproute2-2.6.18/new-flex-fix.patch
deleted file mode 100644
index 2c04087..0000000
--- a/recipes/iproute2/iproute2-2.6.18/new-flex-fix.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-The tc command was failing to build due to flex errors. These errors are
-caused by an incompatible change to flex in recent versions, including the
-version shipped with OE. 
-
-This fix is as per the one used by opensure:
-
-  http://lists.opensuse.org/opensuse-commit/2006-04/msg00090.html
-
-and simple renames str to prevent it conflicting.
-
---- iproute2-2.6.16-060323/tc/emp_ematch.l	2006/10/30 22:46:29	1.1
-+++ iproute2-2.6.16-060323/tc/emp_ematch.l	2006/10/30 22:47:26
-@@ -63,7 +63,7 @@
- 
- %}
- 
--%x str
-+%x STR
- 
- %option 8bit stack warn noyywrap prefix="ematch_"
- %%
-@@ -78,17 +78,17 @@
- 						}
- 						strbuf_index = 0;
- 						
--						BEGIN(str);
-+						BEGIN(STR);
- 					}
- 
--<str>\"					{
-+<STR>\"					{
- 						BEGIN(INITIAL);
- 						yylval.b = bstr_new(strbuf, strbuf_index);
- 						yylval.b->quoted = 1;
- 						return ATTRIBUTE;
- 					}
- 
--<str>\\[0-7]{1,3}			{ /* octal escape sequence */
-+<STR>\\[0-7]{1,3}			{ /* octal escape sequence */
- 						int res;
- 						
- 						sscanf(yytext + 1, "%o", &res);
-@@ -100,12 +100,12 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\[0-9]+				{ /* catch wrong octal escape seq. */
-+<STR>\\[0-9]+				{ /* catch wrong octal escape seq. */
- 						fprintf(stderr, "error: invalid octale escape sequence\n");
- 						return ERROR;
- 					}
- 
--<str>\\x[0-9a-fA-F]{1,2}		{
-+<STR>\\x[0-9a-fA-F]{1,2}		{
- 						int res;
- 						
- 						sscanf(yytext + 2, "%x", &res);
-@@ -118,16 +118,16 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\n				strbuf_append_char('\n');
--<str>\\r				strbuf_append_char('\r');
--<str>\\t				strbuf_append_char('\t');
--<str>\\v				strbuf_append_char('\v');
--<str>\\b				strbuf_append_char('\b');
--<str>\\f				strbuf_append_char('\f');
--<str>\\a				strbuf_append_char('\a');
-+<STR>\\n				strbuf_append_char('\n');
-+<STR>\\r				strbuf_append_char('\r');
-+<STR>\\t				strbuf_append_char('\t');
-+<STR>\\v				strbuf_append_char('\v');
-+<STR>\\b				strbuf_append_char('\b');
-+<STR>\\f				strbuf_append_char('\f');
-+<STR>\\a				strbuf_append_char('\a');
- 
--<str>\\(.|\n)				strbuf_append_char(yytext[1]);
--<str>[^\\\n\"]+				strbuf_append_charp(yytext);
-+<STR>\\(.|\n)				strbuf_append_char(yytext[1]);
-+<STR>[^\\\n\"]+				strbuf_append_charp(yytext);
- 
- [aA][nN][dD]				return AND;
- [oO][rR]				return OR;
diff --git a/recipes/iproute2/iproute2-2.6.20/ip6tunnel.patch b/recipes/iproute2/iproute2-2.6.20/ip6tunnel.patch
deleted file mode 100644
index 371de01..0000000
--- a/recipes/iproute2/iproute2-2.6.20/ip6tunnel.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- iproute-2.6.20-070313/ip/ip6tunnel.c	2007/03/17 03:44:27	1.1
-+++ iproute-2.6.20-070313/ip/ip6tunnel.c	2007/03/17 03:43:14
-@@ -33,6 +33,7 @@
- #include <sys/socket.h>
- #include <arpa/inet.h>
- #include <sys/ioctl.h>
-+#include <linux/types.h>
- #include <linux/ip.h>
- #include <linux/if.h>
- #include <linux/if_arp.h>
diff --git a/recipes/iproute2/iproute2-2.6.20/man-pages-fix.patch b/recipes/iproute2/iproute2-2.6.20/man-pages-fix.patch
deleted file mode 100644
index 924d0ed..0000000
--- a/recipes/iproute2/iproute2-2.6.20/man-pages-fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- iproute-2.6.20-070313/Makefile	2007/03/17 04:24:45	1.1
-+++ iproute-2.6.20-070313/Makefile	2007/03/17 04:27:39
-@@ -52,8 +52,8 @@
- 	install -m 0644 $(shell find etc/iproute2 -maxdepth 1 -type f) $(DESTDIR)$(CONFDIR)
- 	install -m 0755 -d $(DESTDIR)$(MANDIR)/man8
- 	install -m 0644 $(shell find man/man8 -maxdepth 1 -type f) $(DESTDIR)$(MANDIR)/man8
--	ln -sf tc-pbfifo.8  $(DESTDIR)$(MANDIR)/man8/tc-bfifo.8
--	ln -sf tc-pbfifo.8  $(DESTDIR)$(MANDIR)/man8/tc-pfifo.8
-+	ln -sf tc-bfifo.8 $(DESTDIR)$(MANDIR)/man8/tc-pfifo.8
-+	ln -sf tc-bfifo.8 $(DESTDIR)$(MANDIR)/man8/tc-pbfifo.8
- 	install -m 0755 -d $(DESTDIR)$(MANDIR)/man3
- 	install -m 0644 $(shell find man/man3 -maxdepth 1 -type f) $(DESTDIR)$(MANDIR)/man3
- 
diff --git a/recipes/iproute2/iproute2-2.6.20/new-flex-fix.patch b/recipes/iproute2/iproute2-2.6.20/new-flex-fix.patch
deleted file mode 100644
index af72721..0000000
--- a/recipes/iproute2/iproute2-2.6.20/new-flex-fix.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-The tc command was failing to build due to flex errors. These errors are
-caused by an incompatible change to flex in recent versions, including the
-version shipped with OE. 
-
-This fix is as per the one used by opensure:
-
-  http://lists.opensuse.org/opensuse-commit/2006-04/msg00090.html
-
-and simple renames str to prevent it conflicting.
-
---- iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:52:20	1.1
-+++ iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:54:01
-@@ -63,7 +63,7 @@
- 
- %}
- 
--%x str
-+%x STR
- 
- %option 8bit stack warn noyywrap prefix="ematch_"
- %%
-@@ -78,17 +78,17 @@
- 						}
- 						strbuf_index = 0;
- 
--						BEGIN(str);
-+						BEGIN(STR);
- 					}
- 
--<str>\"					{
-+<STR>\"					{
- 						BEGIN(INITIAL);
- 						yylval.b = bstr_new(strbuf, strbuf_index);
- 						yylval.b->quoted = 1;
- 						return ATTRIBUTE;
- 					}
- 
--<str>\\[0-7]{1,3}			{ /* octal escape sequence */
-+<STR>\\[0-7]{1,3}			{ /* octal escape sequence */
- 						int res;
- 
- 						sscanf(yytext + 1, "%o", &res);
-@@ -100,12 +100,12 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\[0-9]+				{ /* catch wrong octal escape seq. */
-+<STR>\\[0-9]+				{ /* catch wrong octal escape seq. */
- 						fprintf(stderr, "error: invalid octale escape sequence\n");
- 						return ERROR;
- 					}
- 
--<str>\\x[0-9a-fA-F]{1,2}		{
-+<STR>\\x[0-9a-fA-F]{1,2}		{
- 						int res;
- 
- 						sscanf(yytext + 2, "%x", &res);
-@@ -118,16 +118,16 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\n				strbuf_append_char('\n');
--<str>\\r				strbuf_append_char('\r');
--<str>\\t				strbuf_append_char('\t');
--<str>\\v				strbuf_append_char('\v');
--<str>\\b				strbuf_append_char('\b');
--<str>\\f				strbuf_append_char('\f');
--<str>\\a				strbuf_append_char('\a');
-+<STR>\\n				strbuf_append_char('\n');
-+<STR>\\r				strbuf_append_char('\r');
-+<STR>\\t				strbuf_append_char('\t');
-+<STR>\\v				strbuf_append_char('\v');
-+<STR>\\b				strbuf_append_char('\b');
-+<STR>\\f				strbuf_append_char('\f');
-+<STR>\\a				strbuf_append_char('\a');
- 
--<str>\\(.|\n)				strbuf_append_char(yytext[1]);
--<str>[^\\\n\"]+				strbuf_append_charp(yytext);
-+<STR>\\(.|\n)				strbuf_append_char(yytext[1]);
-+<STR>[^\\\n\"]+				strbuf_append_charp(yytext);
- 
- [aA][nN][dD]				return AND;
- [oO][rR]				return OR;
diff --git a/recipes/iproute2/iproute2-2.6.20/no-strip.patch b/recipes/iproute2/iproute2-2.6.20/no-strip.patch
deleted file mode 100644
index 6490dad..0000000
--- a/recipes/iproute2/iproute2-2.6.20/no-strip.patch
+++ /dev/null
@@ -1,36 +0,0 @@
---- iproute-2.6.20-070313/ip/Makefile	2007/03/17 05:17:30	1.1
-+++ iproute-2.6.20-070313/ip/Makefile	2007/03/17 05:17:37
-@@ -16,7 +16,7 @@
- rtmon: $(RTMONOBJ) $(LIBNETLINK)
- 
- install: all
--	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
-+	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
- 	install -m 0755 $(SCRIPTS) $(DESTDIR)$(SBINDIR)
- 
- clean:
---- iproute-2.6.20-070313/misc/Makefile	2007/03/17 05:18:20	1.1
-+++ iproute-2.6.20-070313/misc/Makefile	2007/03/17 05:18:26
-@@ -27,7 +27,7 @@
- lnstat: $(LNSTATOBJ)
- 
- install: all
--	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
-+	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
- 	ln -sf lnstat $(DESTDIR)$(SBINDIR)/rtstat
- 	ln -sf lnstat $(DESTDIR)$(SBINDIR)/ctstat
- 
---- iproute-2.6.20-070313/tc/Makefile	2007/03/17 05:17:42	1.1
-+++ iproute-2.6.20-070313/tc/Makefile	2007/03/17 05:17:54
-@@ -70,9 +70,9 @@
- 
- install: all
- 	mkdir -p $(DESTDIR)/usr/lib/tc
--	install -m 0755 -s tc $(DESTDIR)$(SBINDIR)
-+	install -m 0755 tc $(DESTDIR)$(SBINDIR)
- 	for i in $(TCSO); \
--	do install -m 755 -s $$i $(DESTDIR)/usr/lib/tc; \
-+	do install -m 755 $$i $(DESTDIR)/usr/lib/tc; \
- 	done
- 
- clean:
diff --git a/recipes/iproute2/iproute2-2.6.22/ip6tunnel.patch b/recipes/iproute2/iproute2-2.6.22/ip6tunnel.patch
deleted file mode 100644
index a00a7e7..0000000
--- a/recipes/iproute2/iproute2-2.6.22/ip6tunnel.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-This fix is needed when building with uclibc
-
---- iproute-2.6.20-070313/ip/ip6tunnel.c	2007/03/17 03:44:27	1.1
-+++ iproute-2.6.20-070313/ip/ip6tunnel.c	2007/03/17 03:43:14
-@@ -33,6 +33,7 @@
- #include <sys/socket.h>
- #include <arpa/inet.h>
- #include <sys/ioctl.h>
-+#include <linux/types.h>
- #include <linux/ip.h>
- #include <linux/if.h>
- #include <linux/if_arp.h>
diff --git a/recipes/iproute2/iproute2-2.6.22/new-flex-fix.patch b/recipes/iproute2/iproute2-2.6.22/new-flex-fix.patch
deleted file mode 100644
index af72721..0000000
--- a/recipes/iproute2/iproute2-2.6.22/new-flex-fix.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-The tc command was failing to build due to flex errors. These errors are
-caused by an incompatible change to flex in recent versions, including the
-version shipped with OE. 
-
-This fix is as per the one used by opensure:
-
-  http://lists.opensuse.org/opensuse-commit/2006-04/msg00090.html
-
-and simple renames str to prevent it conflicting.
-
---- iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:52:20	1.1
-+++ iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:54:01
-@@ -63,7 +63,7 @@
- 
- %}
- 
--%x str
-+%x STR
- 
- %option 8bit stack warn noyywrap prefix="ematch_"
- %%
-@@ -78,17 +78,17 @@
- 						}
- 						strbuf_index = 0;
- 
--						BEGIN(str);
-+						BEGIN(STR);
- 					}
- 
--<str>\"					{
-+<STR>\"					{
- 						BEGIN(INITIAL);
- 						yylval.b = bstr_new(strbuf, strbuf_index);
- 						yylval.b->quoted = 1;
- 						return ATTRIBUTE;
- 					}
- 
--<str>\\[0-7]{1,3}			{ /* octal escape sequence */
-+<STR>\\[0-7]{1,3}			{ /* octal escape sequence */
- 						int res;
- 
- 						sscanf(yytext + 1, "%o", &res);
-@@ -100,12 +100,12 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\[0-9]+				{ /* catch wrong octal escape seq. */
-+<STR>\\[0-9]+				{ /* catch wrong octal escape seq. */
- 						fprintf(stderr, "error: invalid octale escape sequence\n");
- 						return ERROR;
- 					}
- 
--<str>\\x[0-9a-fA-F]{1,2}		{
-+<STR>\\x[0-9a-fA-F]{1,2}		{
- 						int res;
- 
- 						sscanf(yytext + 2, "%x", &res);
-@@ -118,16 +118,16 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\n				strbuf_append_char('\n');
--<str>\\r				strbuf_append_char('\r');
--<str>\\t				strbuf_append_char('\t');
--<str>\\v				strbuf_append_char('\v');
--<str>\\b				strbuf_append_char('\b');
--<str>\\f				strbuf_append_char('\f');
--<str>\\a				strbuf_append_char('\a');
-+<STR>\\n				strbuf_append_char('\n');
-+<STR>\\r				strbuf_append_char('\r');
-+<STR>\\t				strbuf_append_char('\t');
-+<STR>\\v				strbuf_append_char('\v');
-+<STR>\\b				strbuf_append_char('\b');
-+<STR>\\f				strbuf_append_char('\f');
-+<STR>\\a				strbuf_append_char('\a');
- 
--<str>\\(.|\n)				strbuf_append_char(yytext[1]);
--<str>[^\\\n\"]+				strbuf_append_charp(yytext);
-+<STR>\\(.|\n)				strbuf_append_char(yytext[1]);
-+<STR>[^\\\n\"]+				strbuf_append_charp(yytext);
- 
- [aA][nN][dD]				return AND;
- [oO][rR]				return OR;
diff --git a/recipes/iproute2/iproute2-2.6.22/no-strip.patch b/recipes/iproute2/iproute2-2.6.22/no-strip.patch
deleted file mode 100644
index 6490dad..0000000
--- a/recipes/iproute2/iproute2-2.6.22/no-strip.patch
+++ /dev/null
@@ -1,36 +0,0 @@
---- iproute-2.6.20-070313/ip/Makefile	2007/03/17 05:17:30	1.1
-+++ iproute-2.6.20-070313/ip/Makefile	2007/03/17 05:17:37
-@@ -16,7 +16,7 @@
- rtmon: $(RTMONOBJ) $(LIBNETLINK)
- 
- install: all
--	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
-+	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
- 	install -m 0755 $(SCRIPTS) $(DESTDIR)$(SBINDIR)
- 
- clean:
---- iproute-2.6.20-070313/misc/Makefile	2007/03/17 05:18:20	1.1
-+++ iproute-2.6.20-070313/misc/Makefile	2007/03/17 05:18:26
-@@ -27,7 +27,7 @@
- lnstat: $(LNSTATOBJ)
- 
- install: all
--	install -m 0755 -s $(TARGETS) $(DESTDIR)$(SBINDIR)
-+	install -m 0755 $(TARGETS) $(DESTDIR)$(SBINDIR)
- 	ln -sf lnstat $(DESTDIR)$(SBINDIR)/rtstat
- 	ln -sf lnstat $(DESTDIR)$(SBINDIR)/ctstat
- 
---- iproute-2.6.20-070313/tc/Makefile	2007/03/17 05:17:42	1.1
-+++ iproute-2.6.20-070313/tc/Makefile	2007/03/17 05:17:54
-@@ -70,9 +70,9 @@
- 
- install: all
- 	mkdir -p $(DESTDIR)/usr/lib/tc
--	install -m 0755 -s tc $(DESTDIR)$(SBINDIR)
-+	install -m 0755 tc $(DESTDIR)$(SBINDIR)
- 	for i in $(TCSO); \
--	do install -m 755 -s $$i $(DESTDIR)/usr/lib/tc; \
-+	do install -m 755 $$i $(DESTDIR)/usr/lib/tc; \
- 	done
- 
- clean:
diff --git a/recipes/iproute2/iproute2-2.6.29/compilation-fix.patch b/recipes/iproute2/iproute2-2.6.29/compilation-fix.patch
deleted file mode 100644
index 2012807..0000000
--- a/recipes/iproute2/iproute2-2.6.29/compilation-fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: iproute2-2.6.29/ip/link_gre.c
-===================================================================
---- iproute2-2.6.29.orig/ip/link_gre.c	2009-06-22 11:10:24.212963299 +0400
-+++ iproute2-2.6.29/ip/link_gre.c	2009-06-22 11:10:33.940691491 +0400
-@@ -12,6 +12,7 @@
- 
- #include <string.h>
- #include <net/if.h>
-+#include <linux/ip.h>
- #include <linux/if_tunnel.h>
- #include <sys/types.h>
- #include <sys/socket.h>
diff --git a/recipes/iproute2/iproute2-2.6.29/new-flex-fix.patch b/recipes/iproute2/iproute2-2.6.29/new-flex-fix.patch
deleted file mode 100644
index af72721..0000000
--- a/recipes/iproute2/iproute2-2.6.29/new-flex-fix.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-The tc command was failing to build due to flex errors. These errors are
-caused by an incompatible change to flex in recent versions, including the
-version shipped with OE. 
-
-This fix is as per the one used by opensure:
-
-  http://lists.opensuse.org/opensuse-commit/2006-04/msg00090.html
-
-and simple renames str to prevent it conflicting.
-
---- iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:52:20	1.1
-+++ iproute-2.6.20-070313/tc/emp_ematch.l	2007/03/17 02:54:01
-@@ -63,7 +63,7 @@
- 
- %}
- 
--%x str
-+%x STR
- 
- %option 8bit stack warn noyywrap prefix="ematch_"
- %%
-@@ -78,17 +78,17 @@
- 						}
- 						strbuf_index = 0;
- 
--						BEGIN(str);
-+						BEGIN(STR);
- 					}
- 
--<str>\"					{
-+<STR>\"					{
- 						BEGIN(INITIAL);
- 						yylval.b = bstr_new(strbuf, strbuf_index);
- 						yylval.b->quoted = 1;
- 						return ATTRIBUTE;
- 					}
- 
--<str>\\[0-7]{1,3}			{ /* octal escape sequence */
-+<STR>\\[0-7]{1,3}			{ /* octal escape sequence */
- 						int res;
- 
- 						sscanf(yytext + 1, "%o", &res);
-@@ -100,12 +100,12 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\[0-9]+				{ /* catch wrong octal escape seq. */
-+<STR>\\[0-9]+				{ /* catch wrong octal escape seq. */
- 						fprintf(stderr, "error: invalid octale escape sequence\n");
- 						return ERROR;
- 					}
- 
--<str>\\x[0-9a-fA-F]{1,2}		{
-+<STR>\\x[0-9a-fA-F]{1,2}		{
- 						int res;
- 
- 						sscanf(yytext + 2, "%x", &res);
-@@ -118,16 +118,16 @@
- 						strbuf_append_char((unsigned char) res);
- 					}
- 
--<str>\\n				strbuf_append_char('\n');
--<str>\\r				strbuf_append_char('\r');
--<str>\\t				strbuf_append_char('\t');
--<str>\\v				strbuf_append_char('\v');
--<str>\\b				strbuf_append_char('\b');
--<str>\\f				strbuf_append_char('\f');
--<str>\\a				strbuf_append_char('\a');
-+<STR>\\n				strbuf_append_char('\n');
-+<STR>\\r				strbuf_append_char('\r');
-+<STR>\\t				strbuf_append_char('\t');
-+<STR>\\v				strbuf_append_char('\v');
-+<STR>\\b				strbuf_append_char('\b');
-+<STR>\\f				strbuf_append_char('\f');
-+<STR>\\a				strbuf_append_char('\a');
- 
--<str>\\(.|\n)				strbuf_append_char(yytext[1]);
--<str>[^\\\n\"]+				strbuf_append_charp(yytext);
-+<STR>\\(.|\n)				strbuf_append_char(yytext[1]);
-+<STR>[^\\\n\"]+				strbuf_append_charp(yytext);
- 
- [aA][nN][dD]				return AND;
- [oO][rR]				return OR;
diff --git a/recipes/iproute2/iproute2_2.6.18.bb b/recipes/iproute2/iproute2_2.6.18.bb
index cbe8f6e..42af5f4 100644
--- a/recipes/iproute2/iproute2_2.6.18.bb
+++ b/recipes/iproute2/iproute2_2.6.18.bb
@@ -1,8 +1,8 @@
 require iproute2.inc
 
-PR = "${INC_PR}"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://iproute2-2.6.15_no_strip.diff;patch=1;pnum=0 \
-            file://new-flex-fix.patch;patch=1"
+            file://iproute2-2.6.18_new-flex-fix.patch;patch=1"
 
 DATE = "061002"
diff --git a/recipes/iproute2/iproute2_2.6.20.bb b/recipes/iproute2/iproute2_2.6.20.bb
index 2dea62e..2509f36 100644
--- a/recipes/iproute2/iproute2_2.6.20.bb
+++ b/recipes/iproute2/iproute2_2.6.20.bb
@@ -1,10 +1,10 @@
 require iproute2.inc
 
-PR = "${INC_PR}"
+PR = "${INC_PR}.0"
 
 DATE = "070313"
 
-SRC_URI_append = " file://new-flex-fix.patch;patch=1 \
+SRC_URI_append = " file://iproute2-2.6.20_new-flex-fix.patch;patch=1 \
                    file://ip6tunnel.patch;patch=1 \
                    file://man-pages-fix.patch;patch=1 \
                    file://no-strip.patch;patch=1"
diff --git a/recipes/iproute2/iproute2_2.6.22.bb b/recipes/iproute2/iproute2_2.6.22.bb
index 6d06f64..fe13d6c 100644
--- a/recipes/iproute2/iproute2_2.6.22.bb
+++ b/recipes/iproute2/iproute2_2.6.22.bb
@@ -1,10 +1,10 @@
 require iproute2.inc
 
-PR = "${INC_PR}"
+PR = "${INC_PR}.0"
 
 DATE = "070710"
 
-SRC_URI_append = " file://new-flex-fix.patch;patch=1 \
+SRC_URI_append = " file://iproute2-2.6.20_new-flex-fix.patch;patch=1 \
                    file://ip6tunnel.patch;patch=1 \
                    file://no-strip.patch;patch=1"
 
diff --git a/recipes/iproute2/iproute2_2.6.29.bb b/recipes/iproute2/iproute2_2.6.29.bb
index 47ea720..0554d6b 100644
--- a/recipes/iproute2/iproute2_2.6.29.bb
+++ b/recipes/iproute2/iproute2_2.6.29.bb
@@ -1,10 +1,10 @@
 require iproute2.inc
 
-PR = "${INC_PR}"
+PR = "${INC_PR}.0"
 
 SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
-	   file://new-flex-fix.patch;patch=1 \
-	   file://compilation-fix.patch;patch=1 \
+	   file://iproute2-2.6.20_new-flex-fix.patch;patch=1 \
+	   file://missing_linux_ip_header.patch;patch=1 \
 	  "
 
 S = "${WORKDIR}/iproute2-${PV}"
-- 
1.6.3.3



