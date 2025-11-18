Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B92BCED619
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:03:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9828.1763463817589800653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OS/IdYiC;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297dd95ffe4so49062825ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463817; x=1764068617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PfinRWOhIqiAZMnk5p/PdDow2c74DrIFo0/eWFkBr8=;
        b=OS/IdYiCtKXw3YQtavOSpuvF9aS6rlumoAZjg01cEh24T0AmIDrq1XSNj1nK9Dgwgl
         zB/Ue1qLg2EBrci7Q37QCd8KfA2CN2Bshv9uTjtzmfOLAHuMOvB5iEI+Gc08qlaJvWjp
         hM3dzDYpleijHaH2HdXHPhNm51wZdRQ6AsCK1qbtluyOasnO6PSNqAjC394hG5XZWbX9
         jHVSdw/CxdkmmlL38y1/hnxPhQ1Nlg0eplzDmZCublKanKlPkr6nG0TYx28KzoQyWcDF
         VVTx8cxh41rtyAZ4nfFS5rOnZW7WQbWnck50Mmw+704RDJVJinNEDpZtGCr7ag3svyJF
         refw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463817; x=1764068617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2PfinRWOhIqiAZMnk5p/PdDow2c74DrIFo0/eWFkBr8=;
        b=JP1Ln0c00DqWDJ5n+UidEmiK0fFD4mr6uJ35spI68kv/g5eNMwT7mfiFQAlHN7FT2L
         9ME8oGXINabw6net0yA062irUsb6fGLyOXD1fjxt6RdPVGYOAomYKSEIRZnNxk7mjpwS
         WXMe3rAx/8lem2/F0lFx/pubvG+zWQp7U3mESEVtd8GfmShGw9xa6shPhU8TxpLFlBKV
         q8esPjBPSaemq0Biy48Uos5G9RFpTZjXKki0rBYIEw+Y1fq2QnPUU9jynvFKuJoRELkt
         t/naXghKVMse7ghr++8M4IrCkfgq7BonheMPROUH+ajv7gzwKmf7lA5srAfrLbET901k
         D5xQ==
X-Gm-Message-State: AOJu0YxA7X1Qn09mxPi+yTqUhEZ+eYPOiRWHQA7RgXjZ4+Y5Va6L65iq
	3QWg/gTUk+lJUB/PdNc7r1I/vU6ft8q41wX7LF9NMuD7OIRtwS1y3zFvOjfMoQ==
X-Gm-Gg: ASbGnctWNShmx576dNrMKxzg76LlmqIgTTS9WhNUkEv5yAOVS4/f1zwOIwFlqE9pE+G
	fkDYcIppqjt2Z9tHX0i/Kg1lChNhDU4UPEcSvjxjRqTT2NyAZMYPt/aJiBPF+CA5d5/T48zElWf
	kLPp2AV1lkQ7J19k1cnZMq+lxG3GoBrnKrlpYb0E7tp2G5EH28u/LbnbnzLyvivE4192Orh9p59
	qLzU6Xzs4hKMXRO8qCdeLwg0VeWxYjqRAbZVJkbqbUib3eBMvAH7kgHZ/eNzxVtcQ6Skvbept4W
	ONo9j5i6y+Hcc8tvOujAWQJ9dYJm0aChpTKl5YaCoUVDmIkA6NlxL9Rax804EtTZgHPAFkTUP+f
	nZ32h3AN4D8rnYOIdeppUBgL2xXkUTxeQOzbKnSOkLzKL7d5iZX+iLjRU57IGEvIBINSkWii4nQ
	/Fi2IfsDF3Akz1QdqxdDwau9K/Y3vC/YtCMQA9yi0j2qUDrg==
X-Google-Smtp-Source: AGHT+IHAkGhi7fDG4P/QbcFUPPXPph44M31CztuNA+hnWzOaxA5pMxEGdpWEeX+yCCk106DRovD41g==
X-Received: by 2002:a17:903:987:b0:268:cc5:5e4e with SMTP id d9443c01a7336-2986a6b5571mr208027015ad.1.1763463816746;
        Tue, 18 Nov 2025 03:03:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e46sm167431675ad.25.2025.11.18.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 03:03:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/5] iptraf-ng: patch CVE-2024-52949
Date: Wed, 19 Nov 2025 00:03:20 +1300
Message-ID: <20251118110320.1635988-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
References: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121856

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-52949

Pick the commit that mentions the CVE in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 16071ef98f7cfd1501e9c399ac27afe2e061b22a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../iptraf/iptraf-ng/CVE-2024-52949.patch     | 218 ++++++++++++++++++
 .../iptraf/iptraf-ng_1.2.1.bb                 |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch b/meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch
new file mode 100644
index 0000000000..be6624dcdb
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch
@@ -0,0 +1,218 @@
+From 6a35a7f68c2dd946c5092376d71bbf0b925e2c4e Mon Sep 17 00:00:00 2001
+From: Vitezslav Samel <vitezslav@samel.cz>
+Date: Thu, 21 Nov 2024 08:43:57 +0100
+Subject: [PATCH] interface names: limit length to IFNAMSIZ
+
+This fixes CVE-2024-52949 (stack based buffer overflow)
+when copying user supplied interface name without any
+check.
+
+Problem was reported by Massimiliano Ferraresi and Massimiliano Brolli
+from TIM Red team (https://www.gruppotim.it/it/footer/red-team.html)
+
+CVE: CVE-2024-52949
+Upstream-Status: Backport [https://github.com/iptraf-ng/iptraf-ng/commit/2b623e991115358a57275af8a53feb5ae707b3ae]
+
+Reported-by: Massimiliano Ferraresi, Massimiliano Brolli
+Signed-off-by: Vitezslav Samel <vitezslav@samel.cz>
+---
+ src/ifaces.c           | 16 ++++++++--------
+ src/ifstats.c          |  6 +++---
+ src/iptraf-ng-compat.h |  1 +
+ src/iptraf.c           |  9 +++++++++
+ src/othptab.c          |  2 +-
+ src/promisc.c          |  2 +-
+ src/tcptable.c         |  4 ++--
+ src/wrapper.c          |  8 ++++++++
+ 8 files changed, 33 insertions(+), 15 deletions(-)
+
+diff --git a/src/ifaces.c b/src/ifaces.c
+index aeb1614..4c5a545 100644
+--- a/src/ifaces.c
++++ b/src/ifaces.c
+@@ -67,7 +67,7 @@ int dev_up(char *iface)
+ 
+ 	fd = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
+ 
+-	strcpy(ifr.ifr_name, iface);
++	ifname_copy(ifr.ifr_name, iface);
+ 	ir = ioctl(fd, SIOCGIFFLAGS, &ifr);
+ 
+ 	close(fd);
+@@ -90,7 +90,7 @@ int dev_get_ifindex(const char *iface)
+ 		return fd;
+ 
+ 	struct ifreq ifr;
+-	strcpy(ifr.ifr_name, iface);
++	ifname_copy(ifr.ifr_name, iface);
+ 	int ir = ioctl(fd, SIOCGIFINDEX, &ifr);
+ 
+ 	/* need to preserve errno across call to close() */
+@@ -114,7 +114,7 @@ int dev_get_mtu(const char *iface)
+ 		return fd;
+ 
+ 	struct ifreq ifr;
+-	strcpy(ifr.ifr_name, iface);
++	ifname_copy(ifr.ifr_name, iface);
+ 	int ir = ioctl(fd, SIOCGIFMTU, &ifr);
+ 
+ 	/* need to preserve errno across call to close() */
+@@ -138,7 +138,7 @@ int dev_get_flags(const char *iface)
+ 		return fd;
+ 
+ 	struct ifreq ifr;
+-	strcpy(ifr.ifr_name, iface);
++	ifname_copy(ifr.ifr_name, iface);
+ 	int ir = ioctl(fd, SIOCGIFFLAGS, &ifr);
+ 
+ 	/* need to preserve errno across call to close() */
+@@ -162,7 +162,7 @@ int dev_set_flags(const char *iface, int flags)
+ 		return fd;
+ 
+ 	struct ifreq ifr;
+-	strcpy(ifr.ifr_name, iface);
++	ifname_copy(ifr.ifr_name, iface);
+ 	int ir = ioctl(fd, SIOCGIFFLAGS, &ifr);
+ 	if (ir == -1)
+ 		goto err;
+@@ -190,7 +190,7 @@ int dev_clear_flags(const char *iface, int flags)
+ 		return fd;
+ 
+ 	struct ifreq ifr;
+-	strcpy(ifr.ifr_name, iface);
++	ifname_copy(ifr.ifr_name, iface);
+ 	int ir = ioctl(fd, SIOCGIFFLAGS, &ifr);
+ 	if (ir == -1)
+ 		goto err;
+@@ -233,7 +233,7 @@ int dev_get_ifname(int ifindex, char *ifname)
+ 		return ir;
+ 	}
+ 
+-	strncpy(ifname, ifr.ifr_name, IFNAMSIZ);
++	ifname_copy(ifname, ifr.ifr_name);
+ 	return ir;
+ }
+ 
+@@ -256,7 +256,7 @@ int dev_bind_ifname(int fd, const char * const ifname)
+ 		int ir;
+ 		struct ifreq ifr;
+ 
+-		strcpy(ifr.ifr_name, ifname);
++		ifname_copy(ifr.ifr_name, ifname);
+ 		ir = ioctl(fd, SIOCGIFINDEX, &ifr);
+ 		if (ir)
+ 			return ir;
+diff --git a/src/ifstats.c b/src/ifstats.c
+index 00a2a3f..1b687b6 100644
+--- a/src/ifstats.c
++++ b/src/ifstats.c
+@@ -194,7 +194,7 @@ static void initiflist(struct iflist **list)
+ 
+ 		struct iflist *itmp = alloc_iflist_entry();
+ 		itmp->ifindex = ifindex;
+-		strcpy(itmp->ifname, ifname);
++		ifname_copy(itmp->ifname, ifname);
+ 
+ 		/* make the linked list sorted by ifindex */
+ 		struct iflist *cur = *list, *last = NULL;
+@@ -714,9 +714,9 @@ void selectiface(char *ifname, int withall, int *aborted)
+ 	if (!(*aborted) && (list != NULL)) {
+ 		ptmp = (struct iflist *) scrolllist.textptr->nodeptr;
+ 		if ((withall) && (ptmp->prev_entry == NULL))	/* All Interfaces */
+-			strcpy(ifname, "");
++			ifname_copy(ifname, "");
+ 		else
+-			strcpy(ifname, ptmp->ifname);
++			ifname_copy(ifname, ptmp->ifname);
+ 	}
+ 
+ 	tx_destroy_list(&scrolllist);
+diff --git a/src/iptraf-ng-compat.h b/src/iptraf-ng-compat.h
+index 5aec185..845f18b 100644
+--- a/src/iptraf-ng-compat.h
++++ b/src/iptraf-ng-compat.h
+@@ -112,6 +112,7 @@ extern void *xmallocz(size_t size);
+ extern char *xstrdup(const char *s);
+ extern int strtoul_ui(char const *s, int base, unsigned int *result);
+ extern int strtol_i(char const *s, int base, int *result);
++extern void ifname_copy(char *dst, const char *src);
+ 
+ extern void die(const char *err, ...) __noreturn __printf(1,2);
+ extern void die_errno(const char *fmt, ...) __noreturn __printf(1,2);
+diff --git a/src/iptraf.c b/src/iptraf.c
+index 95f8e53..e5dcb64 100644
+--- a/src/iptraf.c
++++ b/src/iptraf.c
+@@ -388,6 +388,15 @@ int main(int argc, char **argv)
+ 	if (__builtin_popcount(command) > 1)
+ 		die("only one of -i|-d|-s|-z|-l|-g options must be used");
+ 
++	/* sanity check of passed arguments */
++	if ((i_opt && strlen(i_opt) >= IFNAMSIZ) ||
++	    (d_opt && strlen(d_opt) >= IFNAMSIZ) ||
++	    (s_opt && strlen(s_opt) >= IFNAMSIZ) ||
++	    (z_opt && strlen(z_opt) >= IFNAMSIZ) ||
++	    (l_opt && strlen(l_opt) >= IFNAMSIZ)) {
++		die("interface name is too long");
++	}
++
+ 	strcpy(current_logfile, "");
+ 
+ 	if (f_opt) {
+diff --git a/src/othptab.c b/src/othptab.c
+index d1d9658..80f3dc8 100644
+--- a/src/othptab.c
++++ b/src/othptab.c
+@@ -271,7 +271,7 @@ struct othptabent *add_othp_entry(struct othptable *table, struct pkt_hdr *pkt,
+ 	}
+ 
+ 	new_entry->protocol = protocol;
+-	strcpy(new_entry->iface, ifname);
++	ifname_copy(new_entry->iface, ifname);
+ 
+ 	new_entry->pkt_length = pkt->pkt_len;
+ 
+diff --git a/src/promisc.c b/src/promisc.c
+index d94e8bb..4737962 100644
+--- a/src/promisc.c
++++ b/src/promisc.c
+@@ -70,7 +70,7 @@ static void promisc_enable_dev(struct list_head *promisc, int sock, const char *
+ 	struct promisc_list *new = xmallocz(sizeof(*new));
+ 
+ 	new->ifindex = ifindex;
+-	strcpy(new->ifname, dev);
++	ifname_copy(new->ifname, dev);
+ 	list_add_tail(&new->list, promisc);
+ }
+ 
+diff --git a/src/tcptable.c b/src/tcptable.c
+index 159d628..2c4efc1 100644
+--- a/src/tcptable.c
++++ b/src/tcptable.c
+@@ -365,8 +365,8 @@ struct tcptableent *addentry(struct tcptable *table,
+ 	 * Store interface name
+ 	 */
+ 
+-	strcpy(new_entry->ifname, ifname);
+-	strcpy(new_entry->oth_connection->ifname, ifname);
++	ifname_copy(new_entry->ifname, ifname);
++	ifname_copy(new_entry->oth_connection->ifname, ifname);
+ 
+ 	/*
+ 	 * Zero out MAC address fields
+diff --git a/src/wrapper.c b/src/wrapper.c
+index 2eb3b59..1d2dc6f 100644
+--- a/src/wrapper.c
++++ b/src/wrapper.c
+@@ -78,3 +78,11 @@ int strtol_i(char const *s, int base, int *result)
+ 	*result = ul;
+ 	return 0;
+ }
++
++/* it's up to the caller to ensure there is room for */
++/* at least IFNAMSIZ bytes in dst */
++void ifname_copy(char *dst, const char *src)
++{
++	strncpy(dst, src, IFNAMSIZ - 1);
++	dst[IFNAMSIZ - 1] = '\0';
++}
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
index 0f6bbb4d54..a622621990 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://src.fedoraproject.org/repo/pkgs/iptraf-ng/v${PV}.tar.gz/sha51
            file://iptraf-ng-tmpfiles.conf \
            file://ncurses-config.patch \
            file://0001-make-Make-CC-weak-assignment.patch \
+           file://CVE-2024-52949.patch \
            "
 SRC_URI[sha256sum] = "9f5cef584065420dea1ba32c86126aede1fa9bd25b0f8362b0f9fd9754f00870"
 

