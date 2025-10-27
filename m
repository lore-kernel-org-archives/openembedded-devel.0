Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DDCCCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.33915.1761574571114715700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgEZBmzu;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4270491e9easo3885340f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574569; x=1762179369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKF1erBhVfA9h8fFJqzljTKnGGhm5I0MHdrwphWnCNE=;
        b=FgEZBmzu1uiS+FXY08a+bswQVUplQlwdT/Hcq1d71iHRKBg/3PC6jyuapeZdKT26eh
         rQJL0l5LDrnhq/TYvae1MjCDGwSF6jHtS2xsjQTK48MklEe/AUkF/XKtzLl+VHeuzJIz
         3MiBSOcC8VhTCB3iKqkZ7pHk7zpGDgm+d74uxCPP3Bpz2t8+S9X/k4tLgMVKXhJyIMSP
         JSzX6/yBR7djIur3xj/FbnTewZJshao14oEvH+Qo6zlU7k0q/zZQmybz4L4UoIqHhF5L
         Hm3N3bRzKx2DJ+RPQ+EyqsQKJcfyOFzBTNFAUpPDu0FeaIADagpRJqSvDUvX8OMOnCXR
         R/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574569; x=1762179369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKF1erBhVfA9h8fFJqzljTKnGGhm5I0MHdrwphWnCNE=;
        b=IffU9haq6NIN67izAJH+ewRT/EIJDaoFnrWRXdvQNTQaeV4LyiC7BsgkQmyQVNdTf4
         tqCrJKqi1IjNgZN14jlnR3Nu+rXlazc47eYNsOV+648Yzj6wExnioAUKktimxm5moHRY
         iJDBHtSHcChLByf2US7RLD6zVh8gBRLT0yEt7i16F/LKjjZqnzWw3OYet/dzdAnVGHPz
         7PAAmshcH91KIF7wFfSBbl0oGdgC5N3jFZs1/Qc4oIfZdxOOVHXOSLxAG0MhYGwaGYOB
         lvl4ZekWCrKRNjh/r3OEtcyQ0KDGkSkqAA6Ot/ysSf67qEv/xCeVp4BIuA1lUhEdXW+t
         uCuA==
X-Gm-Message-State: AOJu0Yz8OOhyhAtvO9oCn8vxoKkbolRlBBU+fWokX+Jw3bZriQXA7v3l
	fsKE6mO24NjCjPDx77MoArPmL/V09Iyw6Gt9TU6h++dFM0pBlT9paSbOPlGYgQ==
X-Gm-Gg: ASbGncteHS2GjpIqGVh6L/px8xp5nB+4IInFJ+wgTPmyoAI/bg2sJw3+GewoKl8BKGS
	lk+BK3Nehqte8zv5HjpxBDQI9FF0B+CuJPo+gdZdq/Lx/RNPQgwaedITOqJS2LqGL5OUPDkd5Nz
	RCYvGs3PplKy+uqMYtC8eAOl2hHhmoNET8zuTVLBcJdJ2DrJTMdDlJl5WAerrWDjS1MakUc++/J
	IN3DSCvHZv6AO9Mgg1+yYS8j8p133vGCqNTtwxSTu7TaJ1bjhJjlmkaxniLjvwv1yCRrFGVUUfU
	MumGAZKlE8Q6KrR6ZBypX8Eq4rJsF60StTzK+yONYLkD3nKYSa3JoxusWqtDMPdoFbjS1qm7FOy
	DKwBVd5MOsCo1l5V9KizQ9MYF2+RIPthk1Ob6jpxh5y/i+W3x3zhNgQJ2IVy6BO/tU/0HnHf7Rc
	GTi+/pNm7R
X-Google-Smtp-Source: AGHT+IHfmIQEE0WxhgY9lE65OORw/A5Xgsk/qt/fdcIkdnrSpDT6RLV7m9fy8Oio+5CEcrOX1Oft7g==
X-Received: by 2002:a05:6000:41f4:b0:427:614:83da with SMTP id ffacd0b85a97d-4270614850bmr25213865f8f.48.1761574569324;
        Mon, 27 Oct 2025 07:16:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/10] iptraf-ng: patch CVE-2024-52949
Date: Mon, 27 Oct 2025 15:15:56 +0100
Message-ID: <20251027141557.1893563-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121049

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-52949

Pick the commit that mentions the CVE in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
 

