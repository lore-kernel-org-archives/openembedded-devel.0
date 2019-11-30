Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id F3DA67F89B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:59 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b1so16024465pgq.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/lq+V+Jgs8EXBar+N90ugliHVg4pEnMXwM4tUfciupQ=;
	b=viIFHmF/M64wiWgT+WkwNGaDQVmacE7hPTj3P/NcKeO4bKdw21dVKOPm52Ot4SKFXj
	OHKQvcS7Ajd+I0w1fLD/OCNzyVWi0D3svKvgDYZ2Bwl7eFm43kGNgB5dLqyb5Cu11XY0
	ABlzycgL1F5VvH0f4HBDE5pb5zFSJ2BDg+/jkIVHr56wKebunVqMIYhTJ9oyxMcPQzke
	dxN7naKN0sqTr479eKlcwqJScXT3ir7qBYRzmpbtsiFbm0i6dr7kuUJP0o59AZgTQOBU
	qKd3kygjGy4rU4N3ZvdEb7K40ghWdgxFi63q/dGsA3cMkFHFSJ54HM3DvHiXzTMq3S8F
	TpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/lq+V+Jgs8EXBar+N90ugliHVg4pEnMXwM4tUfciupQ=;
	b=LM7+xnv9QRpz2Qelt7lUMKbJyMFNDTMuFXel3py2IaxdR5qIhyX83v1a5kAWfXuzkH
	c4MMW3pcZJI30YUmWhMlrz3iOp24Dn+Y0dR11VrH8ZFX5VqkvXrh05YwUrfwKoXpnmGq
	DKR8Hqq98U5R1U657jduqne4j5KAi6uUhwcbRO0rmUtyINw38qdZT4CQEQLN5o0cWOYj
	N6CHhqGpChJiwfhAmi7K2QUVQ6kb73QVwEFuRlk/uAto4+02SiZ18vYUY3YFwtUrWjkf
	iV1/A87ndedkg1dWR29/CqQw0D8uudQOCiwU1RCntYtcA8rBdOh0A8en6XBH9AtEVrCt
	3MXQ==
X-Gm-Message-State: APjAAAXE/sjyUi+W6AxZI76iSFxBA/rzXunRou+ZK9+TQJCfwHQsftoW
	PiJDFi/+oW4rLLCQyNsURNQDOsix
X-Google-Smtp-Source: APXvYqwC7k6Fx2rejZwqH/PGyDXp7ye94x4L57sCjiR+100OvbeYeKlxcHxIObd6/UIatkIvseRzEw==
X-Received: by 2002:a62:87c5:: with SMTP id i188mr15655305pfe.52.1575137460946;
	Sat, 30 Nov 2019 10:11:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.11.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:11:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:43 -0800
Message-Id: <8b00105fa1851476493141e6ed0fad6ee0e47088.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/15] quagga: fix PIDFile path for service files
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
X-List-Received-Date: Sat, 30 Nov 2019 18:11:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Multiple quagga service files are causing the following type of message to
appear during boot:

/lib/systemd/system/zebra.service:10: PIDFile= references a path below legacy
directory /var/run/, updating /var/run/quagga/zebra.pid → /run/quagga/zebra.pid;
please update the unit file accordingly.

Update the service files included as part of the recipe to use /run instead of
/var/run as the PIDFile path.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/quagga/files/bgpd.service   | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ospf6d.service | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ospfd.service  | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ripd.service   | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ripngd.service | 4 ++--
 meta-networking/recipes-protocols/quagga/files/zebra.service  | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/bgpd.service b/meta-networking/recipes-protocols/quagga/files/bgpd.service
index 76f9f61..c1021fb 100644
--- a/meta-networking/recipes-protocols/quagga/files/bgpd.service
+++ b/meta-networking/recipes-protocols/quagga/files/bgpd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/bgpd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/bgpd.pid
+PIDFile=/run/quagga/bgpd.pid
 ExecStart=@SBINDIR@/bgpd -d $bgpd_options -f @SYSCONFDIR@/quagga/bgpd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/bgpd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/bgpd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ospf6d.service b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
index a2e493b..99d0e6d 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospf6d.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ospf6d.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ospf6d.pid
+PIDFile=/run/quagga/ospf6d.pid
 ExecStart=@SBINDIR@/ospf6d -d $ospf6d_options -f @SYSCONFDIR@/quagga/ospf6d.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ospf6d.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ospf6d.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ospfd.service b/meta-networking/recipes-protocols/quagga/files/ospfd.service
index 0c62cbc..fe8343b 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospfd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospfd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ospfd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ospfd.pid
+PIDFile=/run/quagga/ospfd.pid
 ExecStart=@SBINDIR@/ospfd -d $ospfd_options -f @SYSCONFDIR@/quagga/ospfd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ospfd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ospfd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ripd.service b/meta-networking/recipes-protocols/quagga/files/ripd.service
index 1d20389..7af65ca 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ripd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ripd.pid
+PIDFile=/run/quagga/ripd.pid
 ExecStart=@SBINDIR@/ripd -d $ripd_options -f @SYSCONFDIR@/quagga/ripd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ripd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ripd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.service b/meta-networking/recipes-protocols/quagga/files/ripngd.service
index 0355ad1..9305f86 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripngd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripngd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ripngd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ripngd.pid
+PIDFile=/run/quagga/ripngd.pid
 ExecStart=@SBINDIR@/ripngd -d $ripngd_options -f @SYSCONFDIR@/quagga/ripngd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ripngd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ripngd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/zebra.service b/meta-networking/recipes-protocols/quagga/files/zebra.service
index e4fb6c8..e34af72 100644
--- a/meta-networking/recipes-protocols/quagga/files/zebra.service
+++ b/meta-networking/recipes-protocols/quagga/files/zebra.service
@@ -7,10 +7,10 @@ ConditionPathExists=@SYSCONFDIR@/quagga/zebra.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/zebra.pid
+PIDFile=/run/quagga/zebra.pid
 ExecStartPre=@BASE_SBINDIR@/ip route flush proto zebra
 ExecStart=@SBINDIR@/zebra -d $zebra_options -f @SYSCONFDIR@/quagga/zebra.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/zebra.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/zebra.pid
 Restart=on-abort
 
 [Install]
-- 
2.7.4


