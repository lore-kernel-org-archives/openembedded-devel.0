Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6938.1794458693140419802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ATiN1vwO;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3063386a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458692; x=1795063492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QP6oPwa70E5kCFOZjGla0Yl4/YlmeEjF3j013wiu/k0=;
        b=ATiN1vwODvprFJ6S1lkgBTua76KOwZslfFE7C6sQgwk+ZV/hgiN4Cgqa2SsCqkhBsX
         4HZR4y3uVrQiEU3AjGVZfhW+Do/kGO3IyDNhq6fHvGzjsPeQEdS6o26RnxPgdzgFeFEa
         kw59wF+xdmM+N7h3U2ou9tlaZG6ry07+fgTjDbogcuNUlF6G/IPdtzQ4r7uukCerLvc6
         dwZXTCaQSdRW+dNA7bRgzMidO0MbUUdCc6oAEQsHMpnOH9m+0UViWys5d80JbanP5m4g
         L1nsWpKcQYQQe5PJn3oAnEr2p6IjTWK9HhGPTCqaCdNQnaeCd7+hRHLOaXo7MpxCdHDN
         KChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458692; x=1795063492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QP6oPwa70E5kCFOZjGla0Yl4/YlmeEjF3j013wiu/k0=;
        b=0VTlzAuYXhOlNH4M8ALeh3mP/EB8nrSJJG7flbmLHv8QcOnUEVJulGvFTgU4awpCHU
         1ocVAnOLaqEyLkmBfsO/8jjEbZ71T0kxPkArV/l4aG9eBO/KfAzRJto8etbOG4nbaghV
         rEH+BFXu+ckQqPraaEQIDn6uJuBMYile7DsW5hoFdO69ojN2LxxtWHWpFgGfcuLtsbKo
         SYwNkkUenAX4yvr2kA7ih+7V52/ux2KhDIU6NpLnPN+JXljXQsT313OKC5hYDLP1hsiR
         PsRM/2km81B4WR5MvKL0vROkAyNLBdoqPt/dBCFvtys/BLSuN5T/PS27eDIfyzGBIPYY
         42mg==
X-Gm-Message-State: APuU4Z/6mWRf9CiTaTUlzIYV83MBn6f8aJLhxTznvIBlcJFtSIgpqWeE
	OWjJXL99W82jghqTlbtEVWber+a7K9JgW3rxfWOH2dVlEbDkpdHrT9uR4KVh9w==
X-Gm-Gg: AYBFou2RfHIMDnfAE4l0itmKG7hslpy/Gy6vQkvtbLYI+KBbJU+pO0ABPRZ5Wycekd/
	9NaQgHXrcetguks6Wd06GIqDVzp/tCWn1g1T9CmBvBbY86REdNa/vZumTQl3RHPShgH539pvZAA
	H+9aTpFpnTzNRKIofZ4k2pxrHBojsI9o1EIA+RcM80FdDUaoR8L/ik/tEWlSOX4SRpNVGMHvQnG
	aoKwBd13bOpn0zJANYKdqLz8rlj5JGRpfRfAbI9ld0uPbpXo++HGv4BpkQCFF458xrHocoWEBa9
	dB+emAvzPBpWPCHGiWpFyl+sLZ9qcoyJkTpWfpS5DGJBw1LUPpXAY6ERISCVdyfYN7ToMPcZQ1B
	hJKKSSWLAPtSqKYcvRpl3bBW6HkoPtCOA/TL3HWM+eI9pIl39aDlV+wPiQDzx6+Bglohymq0ucz
	VTbACgHY+8Pn5xXI2N+0k86/sc6EfVNZhodGM1HyG1D+UYftLGkPNe4q9whKCgWLqV8Sh1Uvbvx
	7ImI0Df0vJEaVzsEL8rUKXJl2orXBjGtj/9N8GiKJWFBK5gp1tcJBlafIxJMOT9fkXS89MEMygp
	kEU6SWQB0imRbjmPvdF9Jsi5AQ8ff1azSXRF8OqcgqJz07xI/N1ekY6xgzLUE+xm0NmvNB5lQmV
	68ii5mGk=
X-Received: by 2002:a17:90b:37c3:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3b182ebe741mr4813302a91.32.1794458692429;
        Wed, 11 Nov 2026 20:44:52 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][blacksail][PATCH 8/16] webmin: patch CVE-2026-125391
Date: Thu, 12 Nov 2026 17:44:18 +1300
Message-ID: <20261112044426.3933391-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132159
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-125391

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webmin/files/CVE-2026-125391.patch        | 37 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_2.653.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch
new file mode 100644
index 0000000000..077adc95d5
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch
@@ -0,0 +1,37 @@
+From 86791cd2bd1848b3967dc86ae0909493e768db7e Mon Sep 17 00:00:00 2001
+From: Ilia Ross <ilia@ross.gdn>
+Date: Sun, 8 Nov 2026 17:38:12 +0100
+Subject: [PATCH] Fix Samba account option command injection
+
+(cherry picked from commit 18cab89b1fc74ab7e8b1b8b90bbccbe5aba99154)
+CVE: CVE-2026-125391
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/18cab89b1fc74ab7e8b1b8b90bbccbe5aba99154]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ samba/samba-lib.pl | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/samba/samba-lib.pl b/samba/samba-lib.pl
+index bafd03b8b..2bd90ba26 100755
+--- a/samba/samba-lib.pl
++++ b/samba/samba-lib.pl
+@@ -656,7 +656,8 @@ if ($has_pdbedit) {
+ 		"cd / && $config{'pdbedit'} -a -s $config{'smb_conf'} -t -u ".
+ 		quotemeta($user->{'name'}).
+ 		($config{'sync_gid'} ? " -g $config{'sync_gid'}" : "").
+-		" -c '[".join("", @opts)."]' $ws <$temp 2>&1");
++		" -c ".quotemeta("[".join("", @opts)."]").
++		" $ws <$temp 2>&1");
+ 	$? && &error("$config{'pdbedit'} failed : <pre>$out</pre>");
+ 	}
+ else {
+@@ -700,7 +701,8 @@ if ($has_pdbedit) {
+ 		$out = &backquote_logged(
+ 			"cd / && $config{'pdbedit'} -r -s $config{'smb_conf'} -u ".
+ 			quotemeta($_[0]->{'name'}).
+-			" -c '[".join("", @opts)."]' 2>&1");
++			" -c ".quotemeta("[".join("", @opts)."]").
++			" 2>&1");
+ 		$? && &error("$config{'pdbedit'} failed : <pre>$out</pre>");
+ 		}
+ 	}
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
index a46c3aad16..e4380e16a0 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://media-tomb.patch \
            file://mysql-config-fix.patch \
            file://webmin.service \
+           file://CVE-2026-125391.patch \
             "
 SRC_URI[sha256sum] = "9acc680d3d45cee876f36fc8810ce68bb6e44a0365e245a4298a180e0d016696"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
