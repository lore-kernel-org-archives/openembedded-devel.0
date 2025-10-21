Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D2FCCD1AF
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 14:53:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.14116.1761058434155349120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 07:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JHyND1Yx;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-471076f819bso45063755e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761058432; x=1761663232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkx6SuR6/6ZupSV2gAtr2zG4e1bCk05VtjoTAxZeR6M=;
        b=JHyND1Yxss0r9t3PAwwCAoOBXr6wmqN8TaszvhsTLMU9GnwwpfhUCzvg7znbTU3GVW
         I7zOOgSAxo1bD0avTyKWMcKK9tS3hWurMtkm0BzF9CWYjPhxH0nbnZWvXTmKTlCgnaRr
         wSvZBll2YR/eXghkyimLjsD6tMg7t5Np7BaDHBb+Up+2z7E4iUUuAKMWDNNSNwBzsylA
         FCdEe1XS9jCxNpWu8b8+ATgAwijSOiDtmak9ZDqltj5/J+iNCBBwfBt2n7JGw/69y3VP
         VqTh15ylvlUANyaaq2kIA7R8zZNp74RuOTov1WAY1vXCD5c1+KxHT3m8y57uAtUbXrZn
         LDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058432; x=1761663232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkx6SuR6/6ZupSV2gAtr2zG4e1bCk05VtjoTAxZeR6M=;
        b=So4IcX1fKD9nEWNSSuhFid6QQtrRjM+bdhxx+pfwOwZQQV8aGi6Tdo8Xl8yiDaEqBc
         5+YSAq0A0esiQkFa4OvP8kSKz42C2Ed+b2Lj/Z+HpYEgCOgh4hQW+el03yM9ScqWxS+z
         b8ycchGIi+FEx/BTWFwQmPFLBOeQhQon3o5ttw7ej6I6l07cfj3MAjePnngf0JUZzvmW
         nYw7RqGYl3JQL2DLJ78UJiZR1x7UF5FuvG2EzD7e2vzdDmYP+ELDZ/G/oLm0n2Lhx5AU
         JqBXjcPFSfxBzQ/UoK5jZ+2t7CzDL5NKD8JVuBsJawOpnl84xhlI0srCh5DLfbWwciok
         Adqw==
X-Gm-Message-State: AOJu0YxBVu+UTtLpoLrvuMPA7xXO9oFRLTo3rmdfpvImleIqemt6XdjP
	fLwtKYboGAnE1Yz5spOH7sjgItkH9ZkejUFZ1Hs+MdlgcCHDhdwi3DmG2NRmow==
X-Gm-Gg: ASbGncvExJKp4nhq/KfMffzlqMNNFTVuUt+2aOl20KxevTIG1+AOTXqXirR+V/tZHnn
	e2VlpmEafg9c1ZTfQmznn22dR3OMbHFIS4aEzUh8IT0lHI4oDLNUEM9URtIs1ApL+IhRaMxbnBo
	oZkGjAinMVcrZHZu4MIGzrcp039qWGhkB7pnoz0EQ1gImRgO2BJJJZGq9XoQu6qpv9urWzJSAlB
	pNMA9gxyHlizv64tr3vp44gkE4l9gNOzo6W/6+zV+qbJ69CckluCQogwB6w61BPGUXc+YbA9URQ
	RQcTG9dyXXkPq6TdovutfKw6qAizYYxUce87uTjVHh/6an0Js0dozPa6t/GIB/Gj/Z/mwGEzLYM
	4A7Okwep2OF0yRqEbtLgkx4I3joSvcYRCnZOpw+cp9KcZjTvdlYKHvdXYh6XzPt2a3u68XYZt4A
	==
X-Google-Smtp-Source: AGHT+IHPkK9hgjnnNTfo8u12Ep/dBsIW8mMVTpAq+EN6LpiFo2WJ/YpvHqlZL9spDuHmV0WyNbbSOg==
X-Received: by 2002:a05:600c:3b03:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-47117874978mr125681895e9.3.1761058432352;
        Tue, 21 Oct 2025 07:53:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm283259535e9.11.2025.10.21.07.53.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:53:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 3/4] netkit-telnet: patch CVE-2022-39028
Date: Tue, 21 Oct 2025 16:53:47 +0200
Message-ID: <20251021145349.33878-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021145349.33878-1-skandigraun@gmail.com>
References: <20251021145349.33878-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 14:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120837

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-39028

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../netkit-telnet/files/CVE-2022-39028.patch  | 72 +++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
new file mode 100644
index 0000000000..7ce4766426
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
@@ -0,0 +1,72 @@
+From 1949388e52acd343bb3e366d816b33912e38db39 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sun, 28 Aug 2022 15:07:29 +0200
+Subject: [PATCH] Fix remote DoS vulnerability in inetutils-telnetd
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is caused by a crash by a NULL pointer dereference when sending
+the byte sequences «0xff 0xf7» or «0xff 0xf8».
+
+Found-by: Pierre Kim and Alexandre Torres
+Patch-adapted-by: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
+
+CVE: CVE-2022-39028
+Upstream-Status: Backport [https://git.hadrons.org/cgit/debian/pkgs/inetutils.git/commit/?id=113da8021710d871c7dd72d2a4d5615d42d64289]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ .../inetutils-telnetd-EC_EL_null_deref.patch  | 43 +++++++++++++++++++
+ 1 file changed, 43 insertions(+)
+ create mode 100644 debian/patches/inetutils-telnetd-EC_EL_null_deref.patch
+
+diff --git a/debian/patches/inetutils-telnetd-EC_EL_null_deref.patch b/debian/patches/inetutils-telnetd-EC_EL_null_deref.patch
+new file mode 100644
+index 0000000..fac5e3f
+--- /dev/null
++++ b/debian/patches/inetutils-telnetd-EC_EL_null_deref.patch
+@@ -0,0 +1,43 @@
++Description: Fix remote DoS vulnerability in inetutils-telnetd
++ This is caused by a crash by a NULL pointer dereference when sending the
++ byte sequences «0xff 0xf7» or «0xff 0xf8».
++Authors:
++ Pierre Kim (original patch),
++ Alexandre Torres (original patch),
++ Erik Auerswald <auerswal@unix-ag.uni-kl.de> (adapted patch),
++Reviewed-by: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
++Origin: upstream
++Ref: https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html
++Forwarded: https://lists.gnu.org/archive/html/bug-inetutils/2022-08/msg00002.html
++Last-Update: 2022-08-28
++
++
++diff --git a/telnetd/state.c b/telnetd/state.c
++index ffc6cbaf..c2d760f8 100644
++--- a/telnetd/state.c
+++++ b/telnetd/state.c
++@@ -312,15 +312,21 @@ telrcv (void)
++ 	    case EC:
++ 	    case EL:
++ 	      {
++-		cc_t ch;
+++		cc_t ch = (cc_t) (_POSIX_VDISABLE);
++ 
++ 		DEBUG (debug_options, 1, printoption ("td: recv IAC", c));
++ 		ptyflush ();	/* half-hearted */
++ 		init_termbuf ();
++ 		if (c == EC)
++-		  ch = *slctab[SLC_EC].sptr;
+++		  {
+++		    if (slctab[SLC_EC].sptr)
+++		      ch = *slctab[SLC_EC].sptr;
+++		  }
++ 		else
++-		  ch = *slctab[SLC_EL].sptr;
+++		  {
+++		    if (slctab[SLC_EL].sptr)
+++		      ch = *slctab[SLC_EL].sptr;
+++		  }
++ 		if (ch != (cc_t) (_POSIX_VDISABLE))
++ 		  pty_output_byte ((unsigned char) ch);
++ 		break;
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 56860ea098..6cfc886350 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/netkit-telnet_${PV}.orig.tar.gz
            file://0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch \
            file://CVE-2020-10188.patch \
            file://0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch \
+           file://CVE-2022-39028.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"

