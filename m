Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E476671A92
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 11:11:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d127so10971499wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OpcuL4rqwftbzPri/sxGA5WsnVq74JJILHe8uKVPEeE=;
	b=fmghOMAOakBdED2q3zzDlAek2s8VWjeviRSdBoiKb1PTAvzYx+NYxBvIIM8VBKSFn6
	iLLMQ8nQRk2CVd07BXtSIFy04yKZQyh/gPLctkRdIQNWtEsQCWfqjjAFfju1+TkZ+YMZ
	QfWgR0IKz8HxRYs/kgyXcecQR72ucA8G2jHtiz/pzD2YaKy1CkgZ6atrcdnUYdA3lVdq
	iYlsrz7/5FCkWCswwl0dojjj4LpMrApTguDNP99TINk+P0ATbzl+2rv0HARWs7qDUVkv
	RSD12zpeyFOT5C8Vjr5q4rn4fC+o45D3r8P4BiscZIdMuFkqr5H4H+YaLAOuT3ZzijQt
	ws6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OpcuL4rqwftbzPri/sxGA5WsnVq74JJILHe8uKVPEeE=;
	b=Fon4HCPC0Hp5xTA1EvBl88eD5rD6ix6C3BLATcXDOVPe/I/duIGo1e0xsEQXHuO/xn
	jl43w74ryGDyRsThd0V1P7Scc1OVhZPHCPiLhDneYfspy1G12KH+e9K0FUMX8jFcgKuY
	JBcRIXfcoiSM3VOwFKlvPICnl4X/JQ+wqWABjxJEP+OtPNGuEoUAyxITDUkMS9XfjnJT
	tJoXAGzTSBPhRSe/LBv5PPHR5zFpTp0xXJbculEBlzn4CaP/73q+WU0OfD4xHsGL8wmL
	j1lhs1JmvQunB5420h0KG05HanWMpqBeIuHO/SFgyJLU3RRchMtC+ne1dJaVsbJSnIgz
	pemw==
X-Gm-Message-State: AODbwcBLsOZ8phaEhHHi4N0GWYTB528MDxquXVehCs5lUg36O4IImjUV
	XBDb8hBMh9CT1pSE
X-Received: by 10.80.159.3 with SMTP id b3mr8952768edf.5.1495969889262;
	Sun, 28 May 2017 04:11:29 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138])
	by smtp.gmail.com with ESMTPSA id l4sm7210385edd.69.2017.05.28.04.11.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 28 May 2017 04:11:28 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 May 2017 13:10:39 +0200
Message-Id: <20170528111040.22809-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.12.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 1/2] gpsd: don't compile with gold
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
X-List-Received-Date: Sun, 28 May 2017 11:11:41 -0000

When linking with gold libgps and libgpsd error out with:
 | ./libgpsd.so: error: undefined reference to 'atan2'
 | ./libgpsd.so: error: undefined reference to 'pow'
 | ./libgpsd.so: error: undefined reference to 'sqrt'
 | ./libgpsd.so: error: undefined reference to 'sin'
 | ./libgpsd.so: error: undefined reference to 'cos'
 | collect2: error: ld returned 1 exit status

Using the bfd linker fixes the issue.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 4d00fea6d..fb02f9598 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -36,6 +36,8 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
 PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
-- 
2.12.0


