Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48505.1795411816239473343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K8D01C67;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385d8a00598so3933768eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411816; x=1796016616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGEe0C/HaOCr4a3v9VG8vyEsX+6ldApZaS293uW0HFY=;
        b=K8D01C67OrydoQvD3uRCcFcwgVIOJcJimWgVmUEVECbSGkFnzG73bqkvQnfd+nqKG5
         2HsvX3zYQMp1heH2w5DEQhqMSCKr5o2Vbs6kNNkVp0oxD3QMMN0/iNzmj5tQuGLMDUky
         o/UDZF5wUvB+jTlGeH2fWtJQwnxjZXDnxf2ID4tXDkV6fObkVGzxmuTAhdFkvAP+4sSf
         pkaDGOuvnUQq9X30sEJYmzi5sPZK2wUejmj7hQ8K8EoK2KTAMDIusbxYzQlI6neo1zJj
         8xpMZjPt+ygwJYth2cEwJdtLUTxaID4VO01+9JswxsmslpXcknxQeH5CY1WKRYyf2I/h
         8VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411816; x=1796016616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGEe0C/HaOCr4a3v9VG8vyEsX+6ldApZaS293uW0HFY=;
        b=P7o3CB5yIpImeczdcTEfegxOrcL8Am2VJZb1T3h/JWEg/1yVvTD4SDPbGkcbwi9h1f
         d5RrGKJ6G48pX/sWZjevo7bokKZSeruXSj23kUL2dUdo8ZB19xuU2ylJfWBXyasrCQNw
         zVr8ipt5VY43j5SDRLTaIbDhBtSs6V2GN9LNxXK/dNT7q3l2fD26QhjoYJv1iCbBczWz
         wHi2GEDOFgS0Q/+/eTiAlmuBQh7ArqJLD1BiIlG+76eIEZawaWieXz3IASBFjn1ew0Pb
         G3INSQPQgP8m/092Xg0eti57b4XJjDgRV4AaLkVMmUg024QOLSkOddDdAjTRJez9R+WF
         2xTw==
X-Gm-Message-State: APuU4Z+Qi8MxwF/jdr54dtlAzuY5vBeOMEXGgFpIGWOchzqfQ/zoqFJ7
	yvdaxBXq/k0mrePMCusTlsJoNaunrDzQbotJQu8yIVwYbpF7bksQ4UdG6ntJHfGxn7g=
X-Gm-Gg: AZFdTZcXuKZTYos8ARn1ekpsxHo8WNuR1SXYTX8gYCa9v8Lcc1InCoHvFUSsZNuzCCu
	opsQ0v6y5zVMGG0NUynoXW8vKn9JNzBGfpPB7RKb6hj23tG2agemt3FvymLrWjNUnLm5mZrBbah
	QcPNU33pA5jtRD+xLiSZeDF//iQZDp/K0OILMJkM9HQvo2izyVTL+auyrctMBc25OOvvU2jGs83
	bTqqTJN6QI5+FAlYdEY53SNL7pK+S+G4E2CLrkX9Sl+PdJX0Sp69q5O4Y2jPpQXj9eU7/haFPxP
	PKggJom+3vmOPV1o1cIxMVsvOKDHTf/34WYltcx51Fan9Vk3AOwP2fXtx5g1bnK17VFiZ+Wf76G
	jKw8ljMsg5sZJPUTzo4ND6TsZdrK/tnfpiRdz2TYu9u+WvEGRWIvkPKfx00wVPi2yp/R5NSzXPP
	dOvgg4ht5nH+bpzWd6zs6e9dzaqVkjkHYa59Vmt27SKkOQGl4WoYfXNeVz9Ky9tzXyyD4ngIhBw
	nFKP+73hZbUJ1aHbognwSc5scN9hky2X0zAYL5Luaqw9Vxi3x9By9T+0RqAKWoHGl4Jt5SyKkCv
	F4uHohz43qaRUQx/v9wmXShickNGJ67Q9ZMSL63UG/jB85Scx1s02lM/v4L99SJATM2TuUydGUA
	CesGAhcGeKLx6ZR5PLIAK9rvIasTwqnhT0zGpDcUG2xQv9TYdAKJ2ajhfJqQzy3FLjkjKn2iXMx
	HDOZIdfBVmzdTd6SUWEeygN72OS+WZaWLWCnjG7vko593AAC8ivaAkpfdLrDPJvmBkNRDhd5RTK
	SGZUpzkg784Kq91sEH0rVvi5zy+0Ro0tjTUF6hZQv7Q7bl0mJS3vUnAR3BdPLfCGcquUi9W2gx3
	5/cbbSEnAizBzg7nIjVNUoLsHQ==
X-Received: by 2002:a05:693c:87d6:20b0:386:b05f:2192 with SMTP id 5a478bee46e88-386b05f23e6mr2063610eec.21.1795411815660;
        Sun, 22 Nov 2026 21:30:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 4/6] mpd: upgrade 0.24.19 -> 0.24.20
Date: Sun, 22 Nov 2026 21:28:31 -0800
Message-ID: <20261123052953.3658549-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132802
Content-Type: text/plain; charset="utf-8"

Bug fix release:
- protocol: max_command_list_size limits real memory use
- input: nfs buffer overflow fix; disable Gopher in curl/ffmpeg; fix
  seek hangs and ffmpeg/mms data corruption
- decoder: fix crashes in mikmod, mad, opus and vorbis
- database: proxy and upnp reject malformed song URIs
- id3: fix excessive CPU use with many frames of the same type
- alsa mixer: fix crash after the mixer control was removed

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../musicpd/{mpd_0.24.19.bb => mpd_0.24.20.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.19.bb => mpd_0.24.20.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.19.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.20.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.19.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.20.bb
index 663a1781cb..30bdd0577c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.19.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.20.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "fe4de7969f9d3c5f1a7eb9ceff2ce6a696e3d52a"
+SRCREV = "a4743b29471ce6624100dad5a76929ffa1cb18e9"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \
