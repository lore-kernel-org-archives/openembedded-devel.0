Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5764.1608859980852569780
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 17:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,446,1599494400"; 
   d="scan'208";a="102919547"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Dec 2020 09:32:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 268354CE5CCA
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 09:32:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Dec 2020 09:32:34 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] ebtables: upgrade 2.0.10-4 -> 2.0.11
Date: Fri, 25 Dec 2020 09:32:32 +0800
Message-ID: <1608859952-71027-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 268354CE5CCA.A8E57
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
0010-Adjust-header-include-sequence.patch

Referring to Fedora style, ebtables-legacy-save and ebtables.service are retained.

The upstream address has been modified.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...kefile-do-not-install-etc-ethertypes.patch |  35 ---
 .../0001-add-RARP-and-update-iana-url.patch   |  45 ----
 .../0002-fix-compilation-warning.patch        |  25 --
 .../0003-add-info-about-Wl-no-as-needed.patch |  25 --
 ...ernel-regression-bug-IPv6-source-des.patch |  28 ---
 ...and-line-support-for-ebtables-restor.patch |  75 ------
 ...-mask-if-it-s-all-ones-based-on-patc.patch |  69 ------
 .../0007-extensions-Use-stdint-types.patch    |  67 ------
 ...ove-C-specific-compiler-hint-macro-_.patch |  48 ----
 ...ETURN-target-rules-in-user-defined-c.patch |  48 ----
 .../0010-Adjust-header-include-sequence.patch | 216 ------------------
 .../01debian_defaultconfig.patch              |  50 ----
 .../ebtables-2.0.10-4/ebtables.common         | 163 -------------
 .../ebtables/ebtables-2.0.10-4/ebtables.init  |  26 ---
 .../ebtables-2.0.10-4/installnonroot.patch    |  43 ----
 .../ebtables-2.0.10-4/no-as-needed.patch      |  25 --
 .../0010-Adjust-header-include-sequence.patch |  84 +++++++
 .../ebtables-legacy-save}                     |   0
 .../ebtables.service                          |   0
 .../ebtables/ebtables_2.0.10-4.bb             | 115 ----------
 .../ebtables/ebtables_2.0.11.bb               |  48 ++++
 21 files changed, 132 insertions(+), 1103 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-add-RARP-and-update-iana-url.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0002-fix-compilation-warning.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0003-add-info-about-Wl-no-as-needed.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0004-workaround-for-kernel-regression-bug-IPv6-source-des.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0005-Add-noflush-command-line-support-for-ebtables-restor.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0006-don-t-print-IPv6-mask-if-it-s-all-ones-based-on-patc.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0007-extensions-Use-stdint-types.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0010-Adjust-header-include-sequence.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
 delete mode 100755 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/installnonroot.patch
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch
 rename meta-networking/recipes-filter/ebtables/{ebtables-2.0.10-4/ebtables-save => ebtables-2.0.11/ebtables-legacy-save} (100%)
 rename meta-networking/recipes-filter/ebtables/{ebtables-2.0.10-4 => ebtables-2.0.11}/ebtables.service (100%)
 delete mode 100644 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
deleted file mode 100644
index 65f593880..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d3d72c9ca6a0ce2597adb02c786de28268973ccd Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 16 Dec 2020 15:49:24 +0800
-Subject: [PATCH] Makefile: do not install /etc/ethertypes
-
-The /etc/ethertypes is provided by netbase since 6.0[1].
-Do not instal the file in ebtables, otherwise there would be a conflict:
-Error: Transaction test error:
-  file /etc/ethertypes conflicts between attempted installs of netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
-
-[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3eebf88781f609d35)
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 95651b6..85c5f98 100644
---- a/Makefile
-+++ b/Makefile
-@@ -184,7 +184,7 @@ exec: ebtables ebtables-restore
- 	install -m 0755 ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
- 
- .PHONY: install
--install: $(MANDIR)/man8/ebtables.8 $(DESTDIR)$(ETHERTYPESFILE) exec scripts
-+install: $(MANDIR)/man8/ebtables.8 exec scripts
- 	mkdir -p $(DESTDIR)$(LIBDIR)
- 	install -m 0755 extensions/*.so $(DESTDIR)$(LIBDIR)
- 	install -m 0755 *.so $(DESTDIR)$(LIBDIR)
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-add-RARP-and-update-iana-url.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-add-RARP-and-update-iana-url.patch
deleted file mode 100644
index 90b69792b..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-add-RARP-and-update-iana-url.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From dd35afc9ce1004128a754d5eeb8c5c2cb32ae420 Mon Sep 17 00:00:00 2001
-From: Bart De Schuymer <bdschuym@pandora.be>
-Date: Tue, 3 Jul 2012 18:47:32 +0000
-Subject: [PATCH 01/10] add RARP and update iana url
-
----
- ethertypes | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/ethertypes b/ethertypes
-index 5e700f6..813177b 100644
---- a/ethertypes
-+++ b/ethertypes
-@@ -5,6 +5,7 @@
- #
- # This list could be found on:
- #         http://www.iana.org/assignments/ethernet-numbers
-+#         http://www.iana.org/assignments/ieee-802-numbers
- #
- # <name>    <hexnumber> <alias1>...<alias35> #Comment
- #
-@@ -21,15 +22,16 @@ LAT		6004			# DEC LAT
- DIAG		6005			# DEC Diagnostics
- CUST		6006			# DEC Customer use
- SCA		6007			# DEC Systems Comms Arch
--TEB		6558             	# Trans Ether Bridging   [RFC1701]
--RAW_FR  	6559                   	# Raw Frame Relay        [RFC1701]
-+TEB		6558			# Trans Ether Bridging   [RFC1701]
-+RAW_FR  	6559			# Raw Frame Relay        [RFC1701]
-+RARP		8035			# Reverse ARP            [RFC903]
- AARP		80F3			# Appletalk AARP
--ATALK		809B                  	# Appletalk
-+ATALK		809B			# Appletalk
- 802_1Q		8100	8021q 1q 802.1q	dot1q # 802.1Q Virtual LAN tagged frame
- IPX		8137			# Novell IPX
- NetBEUI		8191			# NetBEUI
- IPv6		86DD	ip6 		# IP version 6
--PPP		880B                    # PPP
-+PPP		880B			# PPP
- ATMMPOA		884C			# MultiProtocol over ATM
- PPP_DISC	8863			# PPPoE discovery messages
- PPP_SES		8864			# PPPoE session messages
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0002-fix-compilation-warning.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0002-fix-compilation-warning.patch
deleted file mode 100644
index 87b0e9b87..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0002-fix-compilation-warning.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 2a5333fc8b4825251adfb717d980d89cefde38d6 Mon Sep 17 00:00:00 2001
-From: Petri Gynther <petri.gynther@gmail.com>
-Date: Sun, 24 Feb 2013 10:56:59 +0100
-Subject: [PATCH 02/10] fix compilation warning
-
----
- communication.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/communication.c b/communication.c
-index 62ed667..ba058c0 100644
---- a/communication.c
-+++ b/communication.c
-@@ -282,7 +282,7 @@ static int store_counters_in_file(char *filename, struct ebt_u_replace *repl)
- 	}
- close_file:
- 	fclose(file);
--	return 0;
-+	return ret;
- }
- 
- /* Gets executed after ebt_deliver_table. Delivers the counters to the kernel
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0003-add-info-about-Wl-no-as-needed.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0003-add-info-about-Wl-no-as-needed.patch
deleted file mode 100644
index c8573a464..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0003-add-info-about-Wl-no-as-needed.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a6faf3b50d6af4768b7b853cb536944fb18e1450 Mon Sep 17 00:00:00 2001
-From: Bart De Schuymer <bdschuym@pandora.be>
-Date: Wed, 3 Jul 2013 22:12:47 +0200
-Subject: [PATCH 03/10] add info about -Wl,-no-as-needed
-
----
- INSTALL | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/INSTALL b/INSTALL
-index 4a05c67..e90d5c1 100644
---- a/INSTALL
-+++ b/INSTALL
-@@ -39,6 +39,8 @@ That's all
- You can also use a base directory different from the root directory (/),
- using the DESTDIR option. See the Makefile for more details.
- 
-+You might need to set LDFLAGS=-Wl,-no-as-needed to build ebtables correctly
-+on your system.
- 
- ADDITIONAL PROGRAMS:
- ----------------------
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0004-workaround-for-kernel-regression-bug-IPv6-source-des.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0004-workaround-for-kernel-regression-bug-IPv6-source-des.patch
deleted file mode 100644
index d8f2795bc..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0004-workaround-for-kernel-regression-bug-IPv6-source-des.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b0617af37b8b1aafb43e8019135bea44c2d94c28 Mon Sep 17 00:00:00 2001
-From: Luis Fernando <tdthp@terra.com.br>
-Date: Wed, 3 Jul 2013 22:19:55 +0200
-Subject: [PATCH 04/10] workaround for kernel regression bug: IPv6
- source/destination addresses are potentially not matched correctly
-
----
- extensions/ebt_ip6.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/extensions/ebt_ip6.c b/extensions/ebt_ip6.c
-index 0465e77..bbdc4ae 100644
---- a/extensions/ebt_ip6.c
-+++ b/extensions/ebt_ip6.c
-@@ -312,6 +312,10 @@ static void init(struct ebt_entry_match *match)
- 
- 	ipinfo->invflags = 0;
- 	ipinfo->bitmask = 0;
-+	memset(ipinfo->saddr.s6_addr, 0, sizeof(ipinfo->saddr.s6_addr));
-+	memset(ipinfo->smsk.s6_addr, 0, sizeof(ipinfo->smsk.s6_addr));
-+	memset(ipinfo->daddr.s6_addr, 0, sizeof(ipinfo->daddr.s6_addr));
-+	memset(ipinfo->dmsk.s6_addr, 0, sizeof(ipinfo->dmsk.s6_addr));
- }
- 
- #define OPT_SOURCE 0x01
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0005-Add-noflush-command-line-support-for-ebtables-restor.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0005-Add-noflush-command-line-support-for-ebtables-restor.patch
deleted file mode 100644
index 9585fd20e..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0005-Add-noflush-command-line-support-for-ebtables-restor.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 15d3ab8a4a167dc44396b003d2ec01841949972f Mon Sep 17 00:00:00 2001
-From: Sanket Shah <sanket.shah@cyberoam.com>
-Date: Wed, 31 Jul 2013 21:40:08 +0200
-Subject: [PATCH 05/10] Add --noflush command line support for ebtables-restore
-
----
- ebtables-restore.c | 29 +++++++++++++++++++++++++----
- 1 file changed, 25 insertions(+), 4 deletions(-)
-
-diff --git a/ebtables-restore.c b/ebtables-restore.c
-index ea02960..bb4d0cf 100644
---- a/ebtables-restore.c
-+++ b/ebtables-restore.c
-@@ -22,13 +22,25 @@
- #include <string.h>
- #include <errno.h>
- #include <unistd.h>
-+#include <getopt.h>
- #include "include/ebtables_u.h"
- 
-+static const struct option options[] = {
-+	{.name = "noflush", .has_arg = 0, .val = 'n'},
-+	{ 0 }
-+};
-+
- static struct ebt_u_replace replace[3];
- void ebt_early_init_once();
- 
- #define OPT_KERNELDATA  0x800 /* Also defined in ebtables.c */
- 
-+static void print_usage()
-+{
-+	fprintf(stderr, "Usage: ebtables-restore [ --noflush ]\n");
-+	exit(1);
-+}
-+
- static void copy_table_names()
- {
- 	strcpy(replace[0].name, "filter");
-@@ -41,11 +53,20 @@ static void copy_table_names()
- int main(int argc_, char *argv_[])
- {
- 	char *argv[EBTD_ARGC_MAX], cmdline[EBTD_CMDLINE_MAXLN];
--	int i, offset, quotemode = 0, argc, table_nr = -1, line = 0, whitespace;
-+	int i, offset, quotemode = 0, argc, table_nr = -1, line = 0, whitespace, c, flush = 1;
- 	char ebtables_str[] = "ebtables";
- 
--	if (argc_ != 1)
--		ebtrest_print_error("options are not supported");
-+	while ((c = getopt_long(argc_, argv_, "n", options, NULL)) != -1) {
-+		switch(c) {
-+			case 'n':
-+				flush = 0;
-+				break;
-+			default:
-+				print_usage();
-+				break;
-+		}
-+	}
-+
- 	ebt_silent = 0;
- 	copy_table_names();
- 	ebt_early_init_once();
-@@ -68,7 +89,7 @@ int main(int argc_, char *argv_[])
- 				ebtrest_print_error("table '%s' was not recognized", cmdline+1);
- 			table_nr = i;
- 			replace[table_nr].command = 11;
--			ebt_get_kernel_table(&replace[table_nr], 1);
-+			ebt_get_kernel_table(&replace[table_nr], flush);
- 			replace[table_nr].command = 0;
- 			replace[table_nr].flags = OPT_KERNELDATA; /* Prevent do_command from initialising replace */
- 			continue;
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0006-don-t-print-IPv6-mask-if-it-s-all-ones-based-on-patc.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0006-don-t-print-IPv6-mask-if-it-s-all-ones-based-on-patc.patch
deleted file mode 100644
index 21f8e588d..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0006-don-t-print-IPv6-mask-if-it-s-all-ones-based-on-patc.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 85a0f6d77a9d5c0e7ef7948395f0f6b1612dc987 Mon Sep 17 00:00:00 2001
-From: Bart De Schuymer <bdschuym@pandora.be>
-Date: Mon, 14 Apr 2014 22:04:55 +0200
-Subject: [PATCH 06/10] don't print IPv6 mask if it's all ones (based on patch
- by Mariusz Mazur <mmazur at axeos.com>)
-
----
- extensions/ebt_ip6.c |  4 ++--
- include/ebtables_u.h |  1 +
- useful_functions.c   | 13 +++++++++++++
- 3 files changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/extensions/ebt_ip6.c b/extensions/ebt_ip6.c
-index bbdc4ae..e3e0956 100644
---- a/extensions/ebt_ip6.c
-+++ b/extensions/ebt_ip6.c
-@@ -449,14 +449,14 @@ static void print(const struct ebt_u_entry *entry,
- 		if (ipinfo->invflags & EBT_IP6_SOURCE)
- 			printf("! ");
- 		printf("%s", ebt_ip6_to_numeric(&ipinfo->saddr));
--		printf("/%s ", ebt_ip6_to_numeric(&ipinfo->smsk));
-+		printf("%s ", ebt_ip6_mask_to_string(&ipinfo->smsk));
- 	}
- 	if (ipinfo->bitmask & EBT_IP6_DEST) {
- 		printf("--ip6-dst ");
- 		if (ipinfo->invflags & EBT_IP6_DEST)
- 			printf("! ");
- 		printf("%s", ebt_ip6_to_numeric(&ipinfo->daddr));
--		printf("/%s ", ebt_ip6_to_numeric(&ipinfo->dmsk));
-+		printf("%s ", ebt_ip6_mask_to_string(&ipinfo->dmsk));
- 	}
- 	if (ipinfo->bitmask & EBT_IP6_TCLASS) {
- 		printf("--ip6-tclass ");
-diff --git a/include/ebtables_u.h b/include/ebtables_u.h
-index ab615c1..35a5bcc 100644
---- a/include/ebtables_u.h
-+++ b/include/ebtables_u.h
-@@ -303,6 +303,7 @@ char *ebt_mask_to_dotted(uint32_t mask);
- void ebt_parse_ip6_address(char *address, struct in6_addr *addr, 
- 						   struct in6_addr *msk);
- char *ebt_ip6_to_numeric(const struct in6_addr *addrp);
-+char *ebt_ip6_mask_to_string(const struct in6_addr *msk);
- 
- 
- int do_command(int argc, char *argv[], int exec_style,
-diff --git a/useful_functions.c b/useful_functions.c
-index d20b68e..d14cbe9 100644
---- a/useful_functions.c
-+++ b/useful_functions.c
-@@ -411,3 +411,16 @@ char *ebt_ip6_to_numeric(const struct in6_addr *addrp)
- 	static char buf[50+1];
- 	return (char *)inet_ntop(AF_INET6, addrp, buf, sizeof(buf));
- }
-+
-+char *ebt_ip6_mask_to_string(const struct in6_addr *msk)
-+{
-+   	/* /0000:0000:0000:0000:0000:000.000.000.000
-+	 * /0000:0000:0000:0000:0000:0000:0000:0000 */
-+	static char buf[51+1];
-+	if (msk->s6_addr32[0] == 0xFFFFFFFFL && msk->s6_addr32[1] == 0xFFFFFFFFL &&
-+	    msk->s6_addr32[2] == 0xFFFFFFFFL && msk->s6_addr32[3] == 0xFFFFFFFFL)
-+		*buf = '\0';
-+	else
-+		sprintf(buf, "/%s", ebt_ip6_to_numeric(msk));
-+	return buf;
-+}
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0007-extensions-Use-stdint-types.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0007-extensions-Use-stdint-types.patch
deleted file mode 100644
index 6fbe7df4c..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0007-extensions-Use-stdint-types.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From a60c7d4a6d05387aceb8ae9c38390d0f9bae84a2 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 12:22:39 +0200
-Subject: [PATCH 07/10] extensions: Use stdint types
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- extensions/ebt_ip6.c   |  4 ++--
- extensions/ebt_limit.c | 10 +++++-----
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/extensions/ebt_ip6.c b/extensions/ebt_ip6.c
-index e3e0956..dd48547 100644
---- a/extensions/ebt_ip6.c
-+++ b/extensions/ebt_ip6.c
-@@ -53,8 +53,8 @@ static const struct option opts[] =
- 
- struct icmpv6_names {
- 	const char *name;
--	u_int8_t type;
--	u_int8_t code_min, code_max;
-+	uint8_t type;
-+	uint8_t code_min, code_max;
- };
- 
- static const struct icmpv6_names icmpv6_codes[] = {
-diff --git a/extensions/ebt_limit.c b/extensions/ebt_limit.c
-index ee40e5c..d189a09 100644
---- a/extensions/ebt_limit.c
-+++ b/extensions/ebt_limit.c
-@@ -59,11 +59,11 @@ static void print_help(void)
- "                                default %u\n", EBT_LIMIT_BURST);
- }
- 
--static int parse_rate(const char *rate, u_int32_t *val)
-+static int parse_rate(const char *rate, uint32_t *val)
- {
- 	const char *delim;
--	u_int32_t r;
--	u_int32_t mult = 1;  /* Seconds by default. */
-+	uint32_t r;
-+	uint32_t mult = 1;  /* Seconds by default. */
- 
- 	delim = strchr(rate, '/');
- 	if (delim) {
-@@ -151,7 +151,7 @@ static void final_check(const struct ebt_u_entry *entry,
- struct rates
- {
- 	const char *name;
--	u_int32_t mult;
-+	uint32_t mult;
- };
- 
- static struct rates g_rates[] =
-@@ -162,7 +162,7 @@ static struct rates g_rates[] =
- 	{ "sec", EBT_LIMIT_SCALE }
- };
- 
--static void print_rate(u_int32_t period)
-+static void print_rate(uint32_t period)
- {
- 	unsigned int i;
- 
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
deleted file mode 100644
index df3f52143..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6ed23c8c2bc5efc3956e7bb6155afc8f45e6ae1a Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 12:31:58 +0200
-Subject: [PATCH 08/10] ethernetdb.h: Remove C++ specific compiler hint macro
- _THROW
-
-Fixes compilation with musl libc
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- include/ethernetdb.h | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/include/ethernetdb.h b/include/ethernetdb.h
-index 46d8bfd..1683abe 100644
---- a/include/ethernetdb.h
-+++ b/include/ethernetdb.h
-@@ -38,21 +38,20 @@ struct ethertypeent {
- 
- /* Open ethertype data base files and mark them as staying open even
-    after a later search if STAY_OPEN is non-zero.  */
--extern void setethertypeent(int __stay_open) __THROW;
-+extern void setethertypeent(int __stay_open);
- 
- /* Close ethertype data base files and clear `stay open' flag.  */
--extern void endethertypeent(void) __THROW;
-+extern void endethertypeent(void);
- 
- /* Get next entry from ethertype data base file.  Open data base if
-    necessary.  */
--extern struct ethertypeent *getethertypeent(void) __THROW;
-+extern struct ethertypeent *getethertypeent(void);
- 
- /* Return entry from ethertype data base for network with NAME.  */
--extern struct ethertypeent *getethertypebyname(__const char *__name)
--    __THROW;
-+extern struct ethertypeent *getethertypebyname(__const char *__name);
- 
- /* Return entry from ethertype data base which number is PROTO.  */
--extern struct ethertypeent *getethertypebynumber(int __ethertype) __THROW;
-+extern struct ethertypeent *getethertypebynumber(int __ethertype);
- 
- 
- #endif				/* ethernetdb.h */
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch
deleted file mode 100644
index 248582c18..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From e6b367c0c2668341c47242d099f4d2048ae575ef Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Alin=20N=C4=83stac?= <alin.nastac@gmail.com>
-Date: Thu, 22 Oct 2015 16:41:03 +0200
-Subject: [PATCH 09/10] ebtables: Allow RETURN target rules in user defined
- chains
-
-During loop checking ebtables marks entries with '1 << NF_BR_NUMHOOKS' if
-they're called from a base chain rather than a user defined chain.
-
-This can be used by ebtables targets that can encode a special return
-value to bail out if e.g. RETURN is used from a base chain.
-
-Unfortunately, this is broken, since the '1 << NF_BR_NUMHOOKS' is also
-copied to called user-defined-chains (i.e., a user defined chain can no
-longer be distinguished from a base chain):
-
-root@OpenWrt:~# ebtables -N foo
-root@OpenWrt:~# ebtables -A OUTPUT -j foo
-root@OpenWrt:~# ebtables -A foo -j mark --mark-or 3 --mark-target RETURN
---mark-target RETURN not allowed on base chain.
-
-This works if -A OUTPUT -j foo is omitted, but will still appear
-if we try to call foo from OUTPUT afterwards.
-
-After this patch we still reject
-'-A OUTPUT -j mark .. --mark-target RETURN'.
-
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
- libebtc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libebtc.c b/libebtc.c
-index 17ba8f2..74830ec 100644
---- a/libebtc.c
-+++ b/libebtc.c
-@@ -1102,7 +1102,7 @@ void ebt_check_for_loops(struct ebt_u_replace *replace)
- 			/* check if we've dealt with this chain already */
- 			if (entries2->hook_mask & (1<<i))
- 				goto letscontinue;
--			entries2->hook_mask |= entries->hook_mask;
-+			entries2->hook_mask |= entries->hook_mask & ~(1 << NF_BR_NUMHOOKS);
- 			/* Jump to the chain, make sure we know how to get back */
- 			stack[sp].chain_nr = chain_nr;
- 			stack[sp].n = j;
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0010-Adjust-header-include-sequence.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0010-Adjust-header-include-sequence.patch
deleted file mode 100644
index a6ef9cd09..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0010-Adjust-header-include-sequence.patch
+++ /dev/null
@@ -1,216 +0,0 @@
-From b7cee37734007fced7a4d5ed586c3a9e5ad92878 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 26 Mar 2017 13:12:21 -0700
-Subject: [PATCH 10/10] Adjust header include sequence
-
-This fixes the build with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- extensions/ebt_among.c    |   2 +-
- extensions/ebt_arpreply.c |   2 +-
- extensions/ebt_nat.c      |   2 +-
- include/linux/if_ether.h  | 126 ----------------------------------------------
- useful_functions.c        |   4 +-
- 5 files changed, 5 insertions(+), 131 deletions(-)
- delete mode 100644 include/linux/if_ether.h
-
-diff --git a/extensions/ebt_among.c b/extensions/ebt_among.c
-index f97d07e..b096847 100644
---- a/extensions/ebt_among.c
-+++ b/extensions/ebt_among.c
-@@ -12,8 +12,8 @@
- #include <getopt.h>
- #include <ctype.h>
- #include <unistd.h>
--#include "../include/ebtables_u.h"
- #include <netinet/ether.h>
-+#include "../include/ebtables_u.h"
- #include "../include/ethernetdb.h"
- #include <linux/if_ether.h>
- #include <linux/netfilter_bridge/ebt_among.h>
-diff --git a/extensions/ebt_arpreply.c b/extensions/ebt_arpreply.c
-index c3757f3..c5102a4 100644
---- a/extensions/ebt_arpreply.c
-+++ b/extensions/ebt_arpreply.c
-@@ -11,8 +11,8 @@
- #include <stdlib.h>
- #include <string.h>
- #include <getopt.h>
--#include "../include/ebtables_u.h"
- #include <netinet/ether.h>
-+#include "../include/ebtables_u.h"
- #include <linux/netfilter_bridge/ebt_arpreply.h>
- 
- static int mac_supplied;
-diff --git a/extensions/ebt_nat.c b/extensions/ebt_nat.c
-index e6afbf8..8d318d1 100644
---- a/extensions/ebt_nat.c
-+++ b/extensions/ebt_nat.c
-@@ -10,8 +10,8 @@
- #include <stdlib.h>
- #include <string.h>
- #include <getopt.h>
--#include "../include/ebtables_u.h"
- #include <netinet/ether.h>
-+#include "../include/ebtables_u.h"
- #include <linux/netfilter_bridge/ebt_nat.h>
- 
- static int to_source_supplied, to_dest_supplied;
-diff --git a/include/linux/if_ether.h b/include/linux/if_ether.h
-deleted file mode 100644
-index 28a15ff..0000000
---- a/include/linux/if_ether.h
-+++ /dev/null
-@@ -1,126 +0,0 @@
--/*
-- * INET		An implementation of the TCP/IP protocol suite for the LINUX
-- *		operating system.  INET is implemented using the  BSD Socket
-- *		interface as the means of communication with the user level.
-- *
-- *		Global definitions for the Ethernet IEEE 802.3 interface.
-- *
-- * Version:	@(#)if_ether.h	1.0.1a	02/08/94
-- *
-- * Author:	Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
-- *		Donald Becker, <becker@super.org>
-- *		Alan Cox, <alan@lxorguk.ukuu.org.uk>
-- *		Steve Whitehouse, <gw7rrm@eeshack3.swan.ac.uk>
-- *
-- *		This program is free software; you can redistribute it and/or
-- *		modify it under the terms of the GNU General Public License
-- *		as published by the Free Software Foundation; either version
-- *		2 of the License, or (at your option) any later version.
-- */
--
--#ifndef _LINUX_IF_ETHER_H
--#define _LINUX_IF_ETHER_H
--
--#include <linux/types.h>
--
--/*
-- *	IEEE 802.3 Ethernet magic constants.  The frame sizes omit the preamble
-- *	and FCS/CRC (frame check sequence).
-- */
--
--#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
--#define ETH_HLEN	14		/* Total octets in header.	 */
--#define ETH_ZLEN	60		/* Min. octets in frame sans FCS */
--#define ETH_DATA_LEN	1500		/* Max. octets in payload	 */
--#define ETH_FRAME_LEN	1514		/* Max. octets in frame sans FCS */
--#define ETH_FCS_LEN	4		/* Octets in the FCS		 */
--
--/*
-- *	These are the defined Ethernet Protocol ID's.
-- */
--
--#define ETH_P_LOOP	0x0060		/* Ethernet Loopback packet	*/
--#define ETH_P_PUP	0x0200		/* Xerox PUP packet		*/
--#define ETH_P_PUPAT	0x0201		/* Xerox PUP Addr Trans packet	*/
--#define ETH_P_IP	0x0800		/* Internet Protocol packet	*/
--#define ETH_P_X25	0x0805		/* CCITT X.25			*/
--#define ETH_P_ARP	0x0806		/* Address Resolution packet	*/
--#define	ETH_P_BPQ	0x08FF		/* G8BPQ AX.25 Ethernet Packet	[ NOT AN OFFICIALLY REGISTERED ID ] */
--#define ETH_P_IEEEPUP	0x0a00		/* Xerox IEEE802.3 PUP packet */
--#define ETH_P_IEEEPUPAT	0x0a01		/* Xerox IEEE802.3 PUP Addr Trans packet */
--#define ETH_P_DEC       0x6000          /* DEC Assigned proto           */
--#define ETH_P_DNA_DL    0x6001          /* DEC DNA Dump/Load            */
--#define ETH_P_DNA_RC    0x6002          /* DEC DNA Remote Console       */
--#define ETH_P_DNA_RT    0x6003          /* DEC DNA Routing              */
--#define ETH_P_LAT       0x6004          /* DEC LAT                      */
--#define ETH_P_DIAG      0x6005          /* DEC Diagnostics              */
--#define ETH_P_CUST      0x6006          /* DEC Customer use             */
--#define ETH_P_SCA       0x6007          /* DEC Systems Comms Arch       */
--#define ETH_P_TEB	0x6558		/* Trans Ether Bridging		*/
--#define ETH_P_RARP      0x8035		/* Reverse Addr Res packet	*/
--#define ETH_P_ATALK	0x809B		/* Appletalk DDP		*/
--#define ETH_P_AARP	0x80F3		/* Appletalk AARP		*/
--#define ETH_P_8021Q	0x8100          /* 802.1Q VLAN Extended Header  */
--#define ETH_P_IPX	0x8137		/* IPX over DIX			*/
--#define ETH_P_IPV6	0x86DD		/* IPv6 over bluebook		*/
--#define ETH_P_PAUSE	0x8808		/* IEEE Pause frames. See 802.3 31B */
--#define ETH_P_SLOW	0x8809		/* Slow Protocol. See 802.3ad 43B */
--#define ETH_P_WCCP	0x883E		/* Web-cache coordination protocol
--					 * defined in draft-wilson-wrec-wccp-v2-00.txt */
--#define ETH_P_PPP_DISC	0x8863		/* PPPoE discovery messages     */
--#define ETH_P_PPP_SES	0x8864		/* PPPoE session messages	*/
--#define ETH_P_MPLS_UC	0x8847		/* MPLS Unicast traffic		*/
--#define ETH_P_MPLS_MC	0x8848		/* MPLS Multicast traffic	*/
--#define ETH_P_ATMMPOA	0x884c		/* MultiProtocol Over ATM	*/
--#define ETH_P_LINK_CTL	0x886c		/* HPNA, wlan link local tunnel */
--#define ETH_P_ATMFATE	0x8884		/* Frame-based ATM Transport
--					 * over Ethernet
--					 */
--#define ETH_P_PAE	0x888E		/* Port Access Entity (IEEE 802.1X) */
--#define ETH_P_AOE	0x88A2		/* ATA over Ethernet		*/
--#define ETH_P_TIPC	0x88CA		/* TIPC 			*/
--#define ETH_P_1588	0x88F7		/* IEEE 1588 Timesync */
--#define ETH_P_FCOE	0x8906		/* Fibre Channel over Ethernet  */
--#define ETH_P_FIP	0x8914		/* FCoE Initialization Protocol */
--#define ETH_P_EDSA	0xDADA		/* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
--
--/*
-- *	Non DIX types. Won't clash for 1500 types.
-- */
--
--#define ETH_P_802_3	0x0001		/* Dummy type for 802.3 frames  */
--#define ETH_P_AX25	0x0002		/* Dummy protocol id for AX.25  */
--#define ETH_P_ALL	0x0003		/* Every packet (be careful!!!) */
--#define ETH_P_802_2	0x0004		/* 802.2 frames 		*/
--#define ETH_P_SNAP	0x0005		/* Internal only		*/
--#define ETH_P_DDCMP     0x0006          /* DEC DDCMP: Internal only     */
--#define ETH_P_WAN_PPP   0x0007          /* Dummy type for WAN PPP frames*/
--#define ETH_P_PPP_MP    0x0008          /* Dummy type for PPP MP frames */
--#define ETH_P_LOCALTALK 0x0009		/* Localtalk pseudo type 	*/
--#define ETH_P_CAN	0x000C		/* Controller Area Network      */
--#define ETH_P_PPPTALK	0x0010		/* Dummy type for Atalk over PPP*/
--#define ETH_P_TR_802_2	0x0011		/* 802.2 frames 		*/
--#define ETH_P_MOBITEX	0x0015		/* Mobitex (kaz@cafe.net)	*/
--#define ETH_P_CONTROL	0x0016		/* Card specific control frames */
--#define ETH_P_IRDA	0x0017		/* Linux-IrDA			*/
--#define ETH_P_ECONET	0x0018		/* Acorn Econet			*/
--#define ETH_P_HDLC	0x0019		/* HDLC frames			*/
--#define ETH_P_ARCNET	0x001A		/* 1A for ArcNet :-)            */
--#define ETH_P_DSA	0x001B		/* Distributed Switch Arch.	*/
--#define ETH_P_TRAILER	0x001C		/* Trailer switch tagging	*/
--#define ETH_P_PHONET	0x00F5		/* Nokia Phonet frames          */
--#define ETH_P_IEEE802154 0x00F6		/* IEEE802.15.4 frame		*/
--#define ETH_P_CAIF	0x00F7		/* ST-Ericsson CAIF protocol	*/
--
--/*
-- *	This is an Ethernet frame header.
-- */
--
--struct ethhdr {
--	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
--	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
--	__be16		h_proto;		/* packet type ID field	*/
--} __attribute__((packed));
--
--
--#endif	/* _LINUX_IF_ETHER_H */
-diff --git a/useful_functions.c b/useful_functions.c
-index d14cbe9..c304f4d 100644
---- a/useful_functions.c
-+++ b/useful_functions.c
-@@ -22,8 +22,6 @@
-  * along with this program; if not, write to the Free Software
-  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-  */
--#include "include/ebtables_u.h"
--#include "include/ethernetdb.h"
- #include <stdio.h>
- #include <netinet/ether.h>
- #include <string.h>
-@@ -33,6 +31,8 @@
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <arpa/inet.h>
-+#include "include/ebtables_u.h"
-+#include "include/ethernetdb.h"
- 
- const unsigned char mac_type_unicast[ETH_ALEN] =   {0,0,0,0,0,0};
- const unsigned char msk_type_unicast[ETH_ALEN] =   {1,0,0,0,0,0};
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch
deleted file mode 100644
index c260403ea..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-#! /bin/sh /usr/share/dpatch/dpatch-run
-## debian_defaultconfig.dpatch by  <hesso@pool.math.tu-berlin.de>
-##
-## DP: Debian enhancements to the ebtables "sysconfig" default settings.
-
-@DPATCH@
-
---- ebtables-2.0.8.1.orig/ebtables-config
-+++ ebtables-2.0.8.1/ebtables-config
-@@ -1,17 +1,3 @@
--# Save (and possibly restore) in text format.
--#   Value: yes|no,  default: yes
--# Save the firewall rules in text format to __SYSCONFIG__/ebtables
--# If EBTABLES_BINARY_FORMAT="no" then restoring the firewall rules
--# is done using this text format.
--EBTABLES_TEXT_FORMAT="yes"
--
--# Save (and restore) in binary format.
--#   Value: yes|no,  default: yes
--# Save (and restore) the firewall rules in binary format to (and from)
--# __SYSCONFIG__/ebtables.<chain>. Enabling this option will make
--# firewall initialisation a lot faster.
--EBTABLES_BINARY_FORMAT="yes"
--
- # Unload modules on restart and stop
- #   Value: yes|no,  default: yes
- # This option has to be 'yes' to get to a sane state for a firewall
-@@ -19,6 +5,12 @@
- # modules.
- EBTABLES_MODULES_UNLOAD="yes"
- 
-+# Load firewall rules on system startup.
-+#   Value: yes|no,  default: no
-+# Restores the ebtables rulesets from the last saved state when the
-+# system boots up.
-+EBTABLES_LOAD_ON_START="no"
-+
- # Save current firewall rules on stop.
- #   Value: yes|no,  default: no
- # Saves all firewall rules if firewall gets stopped
-@@ -35,3 +27,9 @@
- # Save rule counters when saving a kernel table to a file. If the
- # rule counters were saved, they will be restored when restoring the table.
- EBTABLES_SAVE_COUNTER="no"
-+
-+# Backup suffix for ruleset save files.
-+#   Value: <string>,  default: "~"
-+# Keep one backup level of saved rules.
-+# Set this variable to the empty string to disable backups.
-+EBTABLES_BACKUP_SUFFIX="~"
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
deleted file mode 100644
index 1ae18fed3..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
+++ /dev/null
@@ -1,163 +0,0 @@
-#!/bin/sh
-
-[ -x /sbin/ebtables ] || exit 1
-
-EBTABLES_DUMPFILE_STEM=/etc/ebtables/dump
-
-RETVAL=0
-prog="ebtables"
-desc="Ethernet bridge filtering"
-umask 0077
-
-#default configuration
-EBTABLES_MODULES_UNLOAD="yes"
-EBTABLES_LOAD_ON_START="no"
-EBTABLES_SAVE_ON_STOP="no"
-EBTABLES_SAVE_ON_RESTART="no"
-EBTABLES_SAVE_COUNTER="no"
-EBTABLES_BACKUP_SUFFIX="~"
-
-config=/etc/default/$prog
-[ -f "$config" ] && . "$config"
-
-get_supported_tables() {
-	EBTABLES_SUPPORTED_TABLES=
-	/sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
-	if [ $? -eq 0 ]; then
-		echo "Error: insufficient privileges to access the ebtables rulesets."
-		exit 1
-	fi
-	for table in filter nat broute; do
-		/sbin/ebtables -t $table -L &> /dev/null
-		if [ $? -eq 0 ]; then
-			EBTABLES_SUPPORTED_TABLES="${EBTABLES_SUPPORTED_TABLES} $table"
-		fi
-	done
-}
-
-load() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Restoring ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
-			/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit
-			RET=$?
-			if [ $RET -ne 0 ]; then
-				echo -n "(failed) "
-				RETVAL=$RET
-			fi
-		else
-			echo -n "(no saved state) "
-		fi
-	done
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-clear_rules() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Clearing ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		/sbin/ebtables -t $table --init-table
-	done
-
-	if [ "$EBTABLES_MODULES_UNLOAD" = "yes" ]; then
-		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) ebtables; do
-			rmmod $mod 2> /dev/null
-		done
-	fi
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-save() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Saving ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		[ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$table ] && \
-		  mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX
-		/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-save
-		RET=$?
-		if [ $RET -ne 0 ]; then
-			echo -n "(failed) "
-			RETVAL=$RET
-		else
-			if [ "$EBTABLES_SAVE_COUNTER" = "no" ]; then
-				/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table -Z
-			fi
-		fi
-	done
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-case "$1" in
-  start)
-	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
-	;;
-  stop)
-	[ "$EBTABLES_SAVE_ON_STOP" = "yes" ] && save
-	clear_rules
-	;;
-  restart|reload|force-reload)
-	[ "$EBTABLES_SAVE_ON_RESTART" = "yes" ] && save
-	clear_rules
-	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
-	;;
-  load)
-	load
-	;;
-  save)
-	save
-	;;
-  status)
-	get_supported_tables
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo "No kernel support for ebtables."
-		RETVAL=1
-	else
-		echo -n "Ebtables support available, number of installed rules: "
-		for table in $EBTABLES_SUPPORTED_TABLES; do
-			COUNT=$(( $(/sbin/ebtables -t $table -L | sed -e "/^Bridge chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
-			echo -n "$table($COUNT) "
-		done
-		echo ok
-		RETVAL=0
-	fi
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|status}" >&2
-	RETVAL=1
-esac
-
-exit $RETVAL
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init
deleted file mode 100755
index c9a77a29e..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/sh
-#
-# init script for the Ethernet Bridge filter tables
-#
-# Written by Dag Wieers <dag@wieers.com>
-# Modified by Rok Papez <rok.papez@arnes.si>
-#	     Bart De Schuymer <bdschuym@pandora.be>
-# Adapted to Debian by Jan Christoph Nordholz <hesso@pool.math.tu-berlin.de>
-# Adapted to OpenEmbedded by Roman I Khimov <khimov@altell.ru>
-#
-# chkconfig: - 15 85
-# description: Ethernet Bridge filtering tables
-#
-### BEGIN INIT INFO
-# Provides:		ebtables
-# Required-Start:	
-# Required-Stop:	
-# Should-Start:		$local_fs
-# Should-Stop:		$local_fs
-# Default-Start:	S
-# Default-Stop:		0 6
-# Short-Description:	ebtables ruleset management
-# Description:		Saves and restores the state of the ebtables rulesets.
-### END INIT INFO
-
-/usr/sbin/ebtables.common $1
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/installnonroot.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/installnonroot.patch
deleted file mode 100644
index bcd9bed23..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/installnonroot.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-diff --git a/Makefile b/Makefile
-index c1106a4..7ea6b7a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -157,31 +157,31 @@ tmp3:=$(shell printf $(PIPE) | sed 's/\//\\\//g')
- scripts: ebtables-save ebtables.sysv ebtables-config
- 	cat ebtables-save | sed 's/__EXEC_PATH__/$(tmp1)/g' > ebtables-save_
- 	mkdir -p $(DESTDIR)$(BINDIR)
--	install -m 0755 -o root -g root ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-save
-+	install -m 0755 ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-save
- 	cat ebtables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed 's/__SYSCONFIG__/$(tmp2)/g' > ebtables.sysv_
- 	if [ "$(DESTDIR)" != "" ]; then mkdir -p $(DESTDIR)$(INITDIR); fi
--	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 -o root -g root ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables; fi
-+	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables; fi
- 	cat ebtables-config | sed 's/__SYSCONFIG__/$(tmp2)/g' > ebtables-config_
- 	if [ "$(DESTDIR)" != "" ]; then mkdir -p $(DESTDIR)$(SYSCONFIGDIR); fi
--	if test -d $(DESTDIR)$(SYSCONFIGDIR); then install -m 0600 -o root -g root ebtables-config_ $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config; fi
-+	if test -d $(DESTDIR)$(SYSCONFIGDIR); then install -m 0600 ebtables-config_ $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config; fi
- 	rm -f ebtables-save_ ebtables.sysv_ ebtables-config_
- 
- tmp4:=$(shell printf $(LOCKFILE) | sed 's/\//\\\//g')
- $(MANDIR)/man8/ebtables.8: ebtables.8
- 	mkdir -p $(DESTDIR)$(@D)
- 	sed -e 's/$$(VERSION)/$(PROGVERSION)/' -e 's/$$(DATE)/$(PROGDATE)/' -e 's/$$(LOCKFILE)/$(tmp4)/' ebtables.8 > ebtables.8_
--	install -m 0644 -o root -g root ebtables.8_ $(DESTDIR)$@
-+	install -m 0644 ebtables.8_ $(DESTDIR)$@
- 	rm -f ebtables.8_
- 
- $(DESTDIR)$(ETHERTYPESFILE): ethertypes
- 	mkdir -p $(@D)
--	install -m 0644 -o root -g root $< $@
-+	install -m 0644 $< $@
- 
- .PHONY: exec
- exec: ebtables ebtables-restore
- 	mkdir -p $(DESTDIR)$(BINDIR)
--	install -m 0755 -o root -g root $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
--	install -m 0755 -o root -g root ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
-+	install -m 0755 $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
-+	install -m 0755 ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
- 
- .PHONY: install
- install: $(MANDIR)/man8/ebtables.8 $(DESTDIR)$(ETHERTYPESFILE) exec scripts
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch
deleted file mode 100644
index 336119d6b..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/no-as-needed.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-link ebtables with --no-as-needed and adjust the link order to fix runtime crash
-
-Program terminated with signal 11, Segmentation fault.
-#0  0x00007ffaa837fb53 in ebt_initialize_entry () from /lib64/ebtables/libebtc.so
-(gdb) bt
-#0  0x00007ffaa837fb53 in ebt_initialize_entry () from /lib64/ebtables/libebtc.so
-#1  0x00007ffaa83824dc in do_command () from /lib64/ebtables/libebtc.so
-#2  0x000000000040065c in ?? ()
-#3  0x00007ffaa7fed755 in __libc_start_main () from /lib64/libc.so.6
-#4  0x0000000000400691 in ?? ()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: ebtables-v2.0.10-4/Makefile
-===================================================================
---- ebtables-v2.0.10-4.orig/Makefile	2011-12-15 12:02:47.000000000 -0800
-+++ ebtables-v2.0.10-4/Makefile	2012-12-17 22:09:45.065973753 -0800
-@@ -90,7 +90,7 @@
- 	$(CC) -shared $(LDFLAGS) -Wl,-soname,libebtc.so -o libebtc.so -lc $(OBJECTS2)
- 
- ebtables: $(OBJECTS) ebtables-standalone.o libebtc.so
--	$(CC) $(CFLAGS) $(CFLAGS_SH_LIB) $(LDFLAGS) -o $@ ebtables-standalone.o -I$(KERNEL_INCLUDES) -L. -Lextensions -lebtc $(EXT_LIBSI) \
-+	$(CC) $(CFLAGS) $(CFLAGS_SH_LIB) $(LDFLAGS) -o $@ ebtables-standalone.o -I$(KERNEL_INCLUDES) -L. -Lextensions -Wl,--no-as-needed $(EXT_LIBSI) -lebtc \
- 	-Wl,-rpath,$(LIBDIR)
- 
- ebtablesu: ebtablesu.c
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch
new file mode 100644
index 000000000..1f3fcfe37
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch
@@ -0,0 +1,84 @@
+From b7cee37734007fced7a4d5ed586c3a9e5ad92878 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 26 Mar 2017 13:12:21 -0700
+Subject: [PATCH 10/10] Adjust header include sequence
+
+This fixes the build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ extensions/ebt_among.c    | 2 +-
+ extensions/ebt_arpreply.c | 2 +-
+ extensions/ebt_nat.c      | 2 +-
+ useful_functions.c        | 4 ++--
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/extensions/ebt_among.c b/extensions/ebt_among.c
+index 30c098c..af73bd9 100644
+--- a/extensions/ebt_among.c
++++ b/extensions/ebt_among.c
+@@ -12,8 +12,8 @@
+ #include <getopt.h>
+ #include <ctype.h>
+ #include <unistd.h>
+-#include "../include/ebtables_u.h"
+ #include <netinet/ether.h>
++#include "../include/ebtables_u.h"
+ #include "../include/ethernetdb.h"
+ #include <linux/if_ether.h>
+ #include <linux/netfilter_bridge/ebt_among.h>
+diff --git a/extensions/ebt_arpreply.c b/extensions/ebt_arpreply.c
+index 399868b..7b6b5ae 100644
+--- a/extensions/ebt_arpreply.c
++++ b/extensions/ebt_arpreply.c
+@@ -11,8 +11,8 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <getopt.h>
+-#include "../include/ebtables_u.h"
+ #include <netinet/ether.h>
++#include "../include/ebtables_u.h"
+ #include <linux/netfilter_bridge/ebt_arpreply.h>
+
+ static int mac_supplied;
+diff --git a/extensions/ebt_nat.c b/extensions/ebt_nat.c
+index fe7e987..1899df3 100644
+--- a/extensions/ebt_nat.c
++++ b/extensions/ebt_nat.c
+@@ -10,8 +10,8 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <getopt.h>
+-#include "../include/ebtables_u.h"
+ #include <netinet/ether.h>
++#include "../include/ebtables_u.h"
+ #include <linux/netfilter_bridge/ebt_nat.h>
+
+ static int to_source_supplied, to_dest_supplied;
+diff --git a/useful_functions.c b/useful_functions.c
+index 133ae2f..c7adc66 100644
+--- a/useful_functions.c
++++ b/useful_functions.c
+@@ -22,8 +22,6 @@
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+-#include "include/ebtables_u.h"
+-#include "include/ethernetdb.h"
+ #include <errno.h>
+ #include <inttypes.h>
+ #include <limits.h>
+@@ -36,6 +34,8 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <arpa/inet.h>
++#include "include/ebtables_u.h"
++#include "include/ethernetdb.h"
+
+
+ const unsigned char mac_type_unicast[ETH_ALEN] =   {0,0,0,0,0,0};
+--
+2.25.1
+
+
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables-save b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-save
similarity index 100%
rename from meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables-save
rename to meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-save
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.service b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.service
similarity index 100%
rename from meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.service
rename to meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.service
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
deleted file mode 100644
index bf523502e..000000000
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ /dev/null
@@ -1,115 +0,0 @@
-SUMMARY = "Filtering tool for a Linux-based bridging firewall"
-HOMEPAGE = "http://sourceforge.net/projects/ebtables/"
-DESCRIPTION = "Utility for basic Ethernet frame filtering on a Linux bridge, \
-               advanced logging, MAC DNAT/SNAT and brouting."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
-SECTION = "net"
-PR = "r4"
-
-RDEPENDS_${PN} += "bash netbase"
-
-RRECOMMENDS_${PN} += "kernel-module-ebtables \
-    "
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ebtables/files/ebtables/"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
-           file://ebtables-save \
-           file://installnonroot.patch \
-           file://01debian_defaultconfig.patch \
-           file://ebtables.init \
-           file://ebtables.common \
-           file://ebtables.service \
-           file://no-as-needed.patch \
-           file://0001-add-RARP-and-update-iana-url.patch \
-           file://0002-fix-compilation-warning.patch \
-           file://0003-add-info-about-Wl-no-as-needed.patch \
-           file://0004-workaround-for-kernel-regression-bug-IPv6-source-des.patch \
-           file://0005-Add-noflush-command-line-support-for-ebtables-restor.patch \
-           file://0006-don-t-print-IPv6-mask-if-it-s-all-ones-based-on-patc.patch \
-           file://0007-extensions-Use-stdint-types.patch \
-           file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
-           file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
-           file://0001-Makefile-do-not-install-etc-ethertypes.patch \
-           "
-
-SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
-
-SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
-SRC_URI[sha256sum] = "dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d"
-
-# It is using '-' but not '.' as delimiter for the version in the releases page,
-# which causes the version comparison unmatched.
-#UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ebtables/files/ebtables/"
-#UPSTREAM_CHECK_REGEX = "ebtables-(?P<pver>\d+(\-\d+)+)"
-
-RECIPE_UPSTREAM_VERSION = "2.0.10-4"
-RECIPE_UPSTREAM_DATE = "Dec 15, 2011"
-CHECK_DATE = "May 25, 2018"
-
-S = "${WORKDIR}/ebtables-v${PV}"
-
-inherit update-rc.d systemd
-
-python __anonymous () {
-    import re
-
-    karch = d.getVar('TARGET_ARCH')
-    multilib = d.getVar('MLPREFIX')
-
-    if multilib and ( karch == 'powerpc64' or karch == 'arm' ):
-        searchstr = "lib.?32"
-        reg = re.compile(searchstr)
-        if reg.search(multilib):
-            d.appendVar('CFLAGS' ,' -DKERNEL_64_USERSPACE_32 -DEBT_MIN_ALIGN=8')
-}
-
-EXTRA_OEMAKE = " \
-        BINDIR=${base_sbindir} \
-        MANDIR=${mandir} \
-        ETHERTYPESPATH=${sysconfdir} \
-        INITDIR=${sysconfdir}/init.d \
-        SYSCONFIGDIR=${sysconfdir}/default \
-        LIBDIR=${base_libdir}/ebtables \
-        'CC=${CC}' \
-        'CFLAGS=${CFLAGS}' \
-        'LDFLAGS=${LDFLAGS} -Wl,--no-as-needed' \
-        'LD=${LD}' \
-"
-
-do_install () {
-    install -d ${D}${sbindir}
-    install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.common
-    # Fix hardcoded paths in scripts
-    sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${sbindir}/ebtables.common
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sbindir}/ebtables.common
-
-    install -d ${D}${sysconfdir}/init.d
-    install -d ${D}${sysconfdir}/default
-    install -d ${D}${sysconfdir}/ebtables
-    oe_runmake DESTDIR='${D}' install
-    install -m 0755 ${WORKDIR}/ebtables.init ${D}/${sysconfdir}/init.d/ebtables
-    mv ${D}${sysconfdir}/default/ebtables-config ${D}${sysconfdir}/default/ebtables
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ebtables
-
-    # Replace upstream ebtables-save perl script with Fedora bash based rewrite
-    # http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
-    install -m 0755 ${WORKDIR}/ebtables-save ${D}${base_sbindir}/ebtables-save
-    sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${base_sbindir}/ebtables-save
-
-    # Install systemd service files
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
-}
-
-CONFFILES_${PN} += "${sysconfdir}/default/ebtables"
-
-INITSCRIPT_NAME = "ebtables"
-INITSCRIPT_PARAMS = "start 41 S . stop 41 6 ."
-
-SYSTEMD_SERVICE_${PN} = "ebtables.service"
-
-FILES_${PN}-dbg += "${base_libdir}/ebtables/.debug"
-FILES_${PN} += "${base_libdir}/ebtables/*.so"
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
new file mode 100644
index 000000000..fc544e1b6
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Filtering tool for a Linux-based bridging firewall"
+HOMEPAGE = "http://sourceforge.net/projects/ebtables/"
+DESCRIPTION = "Utility for basic Ethernet frame filtering on a Linux bridge, \
+               advanced logging, MAC DNAT/SNAT and brouting."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
+SECTION = "net"
+
+RDEPENDS_${PN} += "bash perl"
+
+RRECOMMENDS_${PN} += "kernel-module-ebtables \
+    "
+
+SRC_URI = "http://ftp.netfilter.org/pub/ebtables/ebtables-${PV}.tar.gz \
+           file://ebtables-legacy-save \
+           file://ebtables.service \
+           "
+
+SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
+
+SRC_URI[md5sum] = "071c8b0a59241667a0044fb040d4fc72"
+SRC_URI[sha256sum] = "b71f654784a726329f88b412ef7b96b4e5d786ed2bd28193ed7b4c0d677dfd2a"
+
+inherit systemd autotools
+
+do_install_append () {
+	#This file has been provided by netbase
+	rm -f ${D}${sysconfdir}/ethertypes
+
+	install -d ${D}${base_sbindir}
+	# Replace upstream ebtables-save perl script with Fedora bash based rewrite
+	# http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
+	install -m 0755 ${WORKDIR}/ebtables-legacy-save ${D}${base_sbindir}/ebtables-legacy-save
+	sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${base_sbindir}/ebtables-legacy-save
+	# Install systemd service files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
+	sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
+}
+
+do_configure_prepend () {
+    ( cd ${S}; ./autogen.sh )
+}
+
+FILES_${PN}-dbg += "${base_libdir}/ebtables/.debug"
+FILES_${PN} += "${base_libdir}/ebtables/*.so"
+
+SYSTEMD_SERVICE_${PN} = "ebtables.service"
-- 
2.25.1



