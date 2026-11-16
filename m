Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17945.1794787857760885870
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FMdz3zLp;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2133697c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787857; x=1795392657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ1/PKRwsrn9mRLOIwAohXfJ+OULNqKXm4s3In6it2M=;
        b=FMdz3zLpDeNGODHx9gtdt0BqFmHj/ZVHjuvglw55Hg4aSd/uw2tFMyXYKUcU2wKonI
         u9XTdoRthFm8oA90yKbd9XtQxZ71ueSu+syo6wYB4w9DzkOcwOXoZ575J3FKtd8meAa5
         i3JHeeOsRdsjw2vmuI6HIa39Va65+3m29BxZ5NJKk763VZu8nvNDfAVSiWzT1G3PxUZW
         9yePHeyLnD+zvp1OdBqGCAqjj4PP9fiFFG9j4NEOmLMV/s7kXzHhPXjYXQCIhaMzaUZ/
         2HRJ/LXwfbRNrurvAdAw00xiahFhzfM+2d1RWshYJ+bQJb/ECDGv9bShPxBLyEMPCDbd
         hoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787857; x=1795392657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJ1/PKRwsrn9mRLOIwAohXfJ+OULNqKXm4s3In6it2M=;
        b=BqEDpGsgkpSZ2BoVu6vTnfpyZKLx3mNSVapOhS4lRvl9k+JLMTkIKlhsmIZwhIGjjA
         t0msGn9mpqnp5551gacQIZzXRHKI4D367lHU/witgkWwYVmy9O8KOFD/YK083PAQEXVo
         by45RPZOJcK3OdDh1bNIWjsSwkIAxLGNQUTbFNglEMwDqaxA8J7UHl7S7Awh2decdzQq
         pqOvNCYt0yb/25cG43KRx964pEuBycXC+BduSpOSnOYL6rCiAmYcUfzV5IPHD2yWQsnE
         1+tN/Mt4Gijs5bZ/x8Xtu2nfTQkzzuVn6YZTYvCPdWzPw0bguH06ftJ4FSoN2wgDkaOG
         OA7A==
X-Gm-Message-State: APuU4Z8LY9m4M76RwxZOQ33y2s/UNNIe6nFlkPXanx+bX1y6qAP9kceF
	trX931mOd73wtUkzwsL/BfUN7bgC1xo8SHc8uITmJxFtBa19ZvlHy1GpmZbZpn/k
X-Gm-Gg: AYBFou3WS5rDvNwjhRzkdLXZvTDsdVTaM0ZFOwWJVkxXHlXtcmym9kQcHhyIt5rRtXt
	jkela4CBRYZUCeCdF0Z7Vri4RgZ9iJWTQVfpPD3WWWpQU0CPATEgVljurN+0sJdP6MTsQkiBll6
	bsq4UajXmvSrQDqbM717ZmBX/yUY6+MMHmd0CAJyajSOA9ibJEG3k1VRXJ5qH7LEy6FN26MrA+E
	aIrQF1eGiBN24ZjkUvuhsf8X9XZTQpKEpB//nCVBrcgWsMGSDNNuEtBJzgmdMMDilUhjyXpncoW
	iqOkP4rZ/t++ellpTY8eAeHlthd4ED5YuwN6uMUTguA2h+CqGdd0/j5GEQ32M9fuhB2JltXZEaU
	uiG3Tdg68rkHGC3/kK7h3dGKsLd5W3wBSWEGZgySgQpgRXgmrFvU4W1o1Yb3f+n2G6QbyzwPBcN
	mm6yaU2B70N5a51ymEYcYqvUuVW1wgBbI5DnXgX3GmP/i4ILUymkOS19b7IDqrD44pB+l4csa3+
	BJ37EZI7p2iqg//AAwIpk1TwTwd0z4ncaP8yauHZmuu06tg6b/SB5Y7j6gotx9c/ndiRXEc7sz7
	xf36BHivEWcdoR09425PN8Kn+VNs5qrzEHoZVF4GB8ST1ZV+niF66TFIgDaqlqBOoMdNGHTfQTu
	c+1AKcif3OLFRizFJwqLKeAi3baUwYSCfsVLlrVCTMuGqH/YVdAMetQP3r9Sw2mSimYhE8fMuPp
	ZzR1Z4uCXHfKXq2qmpcHj/A+WmBMKDe03C6LrGmjOmliSpn98PYxDbrvUTvlToLPvi396IfIv4U
	vBEfI0SRDYcI55+WX/FXsflg7nCB3lKLptqjIab7U4Kf+bzCL88QIYzPPDIghVPZYuoHtvM7NiA
	DRkL
X-Received: by 2002:a05:701b:4301:b0:181:8948:f022 with SMTP id a92af1059eb24-1b5030cf278mr7344913c88.21.1794787856970;
        Sun, 15 Nov 2026 16:10:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 15/16] owfs: Register systemd services on the server packages
Date: Sun, 15 Nov 2026 16:10:37 -0800
Message-ID: <20261116001038.440763-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132396
Content-Type: text/plain; charset="utf-8"

The services were set on ${PN}-owftpd, ${PN}-owhttpd and ${PN}-owserver,
but the packages are named owftpd, owhttpd and owserver, and they were
not in SYSTEMD_PACKAGES either, so only owfs.service was enabled.

Use the real package names and add them to SYSTEMD_PACKAGES. Keep the
anonymous FTP server owftpd disabled by default, matching the initscripts
which are only installed for owhttpd and owserver.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
index 7351b54f8b..f0b7a233b0 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
@@ -74,7 +74,9 @@ INITSCRIPT_NAME:owhttpd = "owhttpd"
 INITSCRIPT_PARAMS:owserver = "defaults 20"
 INITSCRIPT_PARAMS:owhttpd = "defaults 21"

+SYSTEMD_PACKAGES = "${PN} owftpd owhttpd owserver"
 SYSTEMD_SERVICE:${PN} = "owfs.service"
-SYSTEMD_SERVICE:${PN}-owftpd = "owftpd.service"
-SYSTEMD_SERVICE:${PN}-owhttpd = "owhttpd.service"
-SYSTEMD_SERVICE:${PN}-owserver = "owserver.service owserver.socket"
+SYSTEMD_SERVICE:owftpd = "owftpd.service"
+SYSTEMD_AUTO_ENABLE:owftpd = "disable"
+SYSTEMD_SERVICE:owhttpd = "owhttpd.service"
+SYSTEMD_SERVICE:owserver = "owserver.service owserver.socket"
