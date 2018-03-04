Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id C6EDA78972
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:41:39 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id d9-v6so1037650plo.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+SHzjPpUO2rKJRkHnf8epXcTRmwZ7XaRUAbH5zil1BA=;
	b=bS9NNoDlWpB6B0VFhusOkU+pnYI2OPJgghYny8YvZJkxN0LSqxi41cyqd6bigUc4X4
	NckerMiottFIW9ruOjDflU+GQ2OC2tLf69AZTEj92zlG1kBzT/ZlXJPlQXMyFUBdHNTd
	CSsslPEUSmWKzAFN+egM6ECsCrScDenGi6DsC1wxP1EyhLa/galEtLl1yOFn8YtbWzMf
	iloJjunAGsQ6kEfZvIFjp1BDyWuEMSapbGj5hBbuv00h/T43uReuT/0drnd1mWkMZSTx
	CUxHKQOODU5Fvxou89l4uXYg+tAXnt61xsuD9jctaYYM1JF3LM5g0VrEixlT9Gc0vXxm
	Scaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+SHzjPpUO2rKJRkHnf8epXcTRmwZ7XaRUAbH5zil1BA=;
	b=Qa/sYehLl33NooKRSEc7qlUsXAYjcGUlBS3wtqhlfcIlYdSN/DkGsLPdwFfq+dYcYH
	KvzAjFcTR05cd5uSU7OJFE64EWh1Km4hbo6BnssXdcub44XOOh2JnnLPsR9PJNpzJX5J
	X/IWMh+KkzGiPZxfal4qHFpksdNDIidTbyhGml5LBjC3lIVz9IAMU1OY41YL2JOUTXCC
	a+S1LvwqxMMjITvvOBXIRF3aqaAmn0/vSSRVHdhN+ecuVHxTGmfY73ZyT8ZGGf+4aUrs
	YUkleTMyXhZR9xGKCmGe8lY7Lm3ZJwJBsvJECzQMLkWOhB4PoF79hfUGjTxRLg4mUTOm
	UdAw==
X-Gm-Message-State: APf1xPC9L3rivP7O/MTczHVb/TJuIPKQuJXg3gYwzXn4nQ0v3wXDXXJp
	xdoo0zPf3PUUSH3MEcpreDJ/fw==
X-Google-Smtp-Source: AG47ELu6SbURnH1Pk6JFoWhaTzqzVVT0thaxgOUMw2FkqdB+mYOGyxUXpn/jSWlKSLwE9Pm8qFNpIg==
X-Received: by 2002:a17:902:b10b:: with SMTP id
	q11-v6mr11084738plr.275.1520196100696; 
	Sun, 04 Mar 2018 12:41:40 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u28sm22943090pfl.19.2018.03.04.12.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:41:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 12:41:24 -0800
Message-Id: <20180304204130.23962-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-networking][PATCH 1/7] ebtables: Fix duplicate definition errors due to netinet/ether.h
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
X-List-Received-Date: Sun, 04 Mar 2018 20:41:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-re-order-including-netinet-ether.h.patch  | 89 ++++++++++++++++++++++
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-re-order-including-netinet-ether.h.patch

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-re-order-including-netinet-ether.h.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-re-order-including-netinet-ether.h.patch
new file mode 100644
index 000000000..997c8c5d1
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-re-order-including-netinet-ether.h.patch
@@ -0,0 +1,89 @@
+From 65e6ce454751b0d38d29836fcf78a31b612e59c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Mar 2018 16:38:17 -0800
+Subject: [PATCH] re-order including netinet/ether.h
+
+Fixed duplicate definitions errors seen with glibc 2.27
+
+e.g.
+
+error: redefinition of 'struct sockaddr_in6'
+|  struct sockaddr_in6 {
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ extensions/ebt_among.c    | 3 +--
+ extensions/ebt_arpreply.c | 2 +-
+ extensions/ebt_nat.c      | 2 +-
+ useful_functions.c        | 2 +-
+ 4 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/extensions/ebt_among.c b/extensions/ebt_among.c
+index b096847..e03a4e2 100644
+--- a/extensions/ebt_among.c
++++ b/extensions/ebt_among.c
+@@ -12,10 +12,9 @@
+ #include <getopt.h>
+ #include <ctype.h>
+ #include <unistd.h>
+-#include <netinet/ether.h>
+ #include "../include/ebtables_u.h"
+ #include "../include/ethernetdb.h"
+-#include <linux/if_ether.h>
++#include <netinet/ether.h>
+ #include <linux/netfilter_bridge/ebt_among.h>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
+diff --git a/extensions/ebt_arpreply.c b/extensions/ebt_arpreply.c
+index c5102a4..c3757f3 100644
+--- a/extensions/ebt_arpreply.c
++++ b/extensions/ebt_arpreply.c
+@@ -11,8 +11,8 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <getopt.h>
+-#include <netinet/ether.h>
+ #include "../include/ebtables_u.h"
++#include <netinet/ether.h>
+ #include <linux/netfilter_bridge/ebt_arpreply.h>
+ 
+ static int mac_supplied;
+diff --git a/extensions/ebt_nat.c b/extensions/ebt_nat.c
+index 8d318d1..e6afbf8 100644
+--- a/extensions/ebt_nat.c
++++ b/extensions/ebt_nat.c
+@@ -10,8 +10,8 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <getopt.h>
+-#include <netinet/ether.h>
+ #include "../include/ebtables_u.h"
++#include <netinet/ether.h>
+ #include <linux/netfilter_bridge/ebt_nat.h>
+ 
+ static int to_source_supplied, to_dest_supplied;
+diff --git a/useful_functions.c b/useful_functions.c
+index c304f4d..a447db5 100644
+--- a/useful_functions.c
++++ b/useful_functions.c
+@@ -23,7 +23,6 @@
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ #include <stdio.h>
+-#include <netinet/ether.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <getopt.h>
+@@ -33,6 +32,7 @@
+ #include <arpa/inet.h>
+ #include "include/ebtables_u.h"
+ #include "include/ethernetdb.h"
++#include <netinet/ether.h>
+ 
+ const unsigned char mac_type_unicast[ETH_ALEN] =   {0,0,0,0,0,0};
+ const unsigned char msk_type_unicast[ETH_ALEN] =   {1,0,0,0,0,0};
+-- 
+2.16.2
+
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index d5e7341a0..7c89cffa9 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
            file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
            file://0010-Adjust-header-include-sequence.patch \
+           file://0001-re-order-including-netinet-ether.h.patch \
            "
 
 SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
-- 
2.16.2


