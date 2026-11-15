Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3894.1794729079155592722
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Nf0ez/xn;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3acec6677so3177463c88.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729078; x=1795333878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpymEVQVaGxVejgUNs2KGhiDvGx2ttWOKNX8Ac5Ko8c=;
        b=Nf0ez/xnTR4+Ft8WWW72vVzgIrD+13vBhMm00IwkR7YwOBko2XCD6Q2rwp7CQ6iilx
         1Zesc+wjJS3y38rT5xcYDVXqFrSYepCetFrsxY7XatlTnymOnswgyXv++JgKnN/otrq3
         LdWtkcgjbtvaklmCfje1lmQrh66uo97KdlXVCTCWMA/BISs7KnL1m/S+NHHcNjCwf0w+
         XMibn/eTOI+6HqnUq1UDdaoybyp3cn96o/O66QNzFkSiBidNiA38KWbSe5H+0G+tiSqq
         sLiSR9lsoT7xr8hrYfTK2fQ0vf52FQ2Xerx2FV4tcLVADNDF1Nvr9+6uhXuNSzFqNe5C
         hMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729078; x=1795333878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpymEVQVaGxVejgUNs2KGhiDvGx2ttWOKNX8Ac5Ko8c=;
        b=N7gmwEOI1iUetFw6v09jtWm0am8hFgEMj20et2+NtHiiM/+F7ZPJXLTlgR+NVzfcQJ
         Jp6SbnrMlVRYk8odbKlHM1GSPolHKX0lHVbCc8DuFdM9AeJtZo57Jy+OWdocSDruQPGL
         uS0HPqKvH14Q/WNU4V8Eh00+oxsM0MZiBCI6C3xxzwp+e51O8AlGmHdm+18prbTJ+WWO
         Spv+9DZ3af2vh8OUA/17Trmj+L3up2XUU4vCMygNCkrTUHTbdKbdCoFHAg3nMIJZp2AN
         utDA9D+JI9PJBBsL3GNJTMlLImhmv72oIXEls3PVxmFaZdnERJO798rfcBk3SwdNX+6D
         vnjQ==
X-Gm-Message-State: APuU4Z94K0Q7wFQBR6IifeqwiYQl0Jw0XDiqz3OjjuJL+uj89J6/IfrF
	gmH1ThK5Mj1EC8nHF0uej68GFGb5H5mimWO8Yh8cUCXjS2JbLFc2zFpc/mWUjhSA
X-Gm-Gg: AYBFou1u0MLeLMAo/Miv+3KXIuGofMLXJkxnwQYhdEM5bhH0V5CyKzEUl1zH2GLwcYq
	RKhFSHCJWt1LO6MaR62nhXxWL4n3FTLu768/uefwzGHsbgCeqduXm0Hry+vVhNBk6QGI8EoywoP
	kigTSpnk5DVscJd3Oxg2PSc767f+7maCvqBCU88/5VVwHUooZS2ZvFNAQJc/7ZUOxyD22efhRyn
	p+9VDQWNrftyhDrTNmAtwBhv9FbF6rWYhaf7nuKdw70+dzx2/5ERE8UgRiLpvs8QzGMH4Ao+ztj
	rySZ642GMUtuaWZZku+wdVpgS4hqjESX/iGOTU7oLfnSxbcY8XfsfuIFBhitWMt+dV4E+xqnigE
	kJAQ3piydRwhCZrV9D8Bqn6LJ02qYN5+canJQot2JUSFABB3J0OD5HzpZkrgr3baLvqsE7pcHAn
	eMrGZnT9vPu8ToQ6y9UFt8DU61cTvkdouCEG5HUVDt7fFQC9n1AnnsPP4M4AfMdYH3f594f30b2
	0uHD07Ury8bgQzEksuLjGsHgLjWYG5EC4+ODk+MF/KzxzRY2DhntXo/CusUvCnqhTYVENGX+gGd
	nLmlpbqJ63fKxQBpw7tphJmUU46g07YS6lrpZEdaBa4dJ2IR0pUlu7197kjLRPXqBWifXK+A98H
	pI9w0BLvBy6+6cOmcjqkIRxS1ac1D+i9o3DMNYGQeai0uTs0UPDIsMuUZnwZ0pgESgjiG+00hMR
	tJsLIIA2WAcUD7nzOB8VidHeyxCnRqrmsKu7p/hDcz1jDhfuaKW0Hq4Go6jIXdhQ3H+7JQt9E6L
	H9XPwyJnOynunHMU9Hv/B674heAIFlxkDFuWBOYADvdgfcENzPGE7JeEA0kavbFdj9JBohxUDoS
	rS8ArOrYLD+WeVhYHFfdpLyHhA==
X-Received: by 2002:a05:7300:fd05:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37968b848d9mr10341168eec.33.1794729078417;
        Sat, 14 Nov 2026 23:51:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 72/96] minicoredumper: upgrade 2.0.8 -> 2.1.0
Date: Sat, 14 Nov 2026 23:48:50 -0800
Message-ID: <20261115074918.2932593-72-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132342
Content-Type: text/plain; charset="utf-8"

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{minicoredumper_2.0.8.bb => minicoredumper_2.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.8.bb => minicoredumper_2.1.0.bb} (97%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.1.0.bb
similarity index 97%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.1.0.bb
index c3a8c4b768..088909b9a2 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.1.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig ptest systemd update-rc.d
 
-SRCREV = "dd1d6044ab6e255b7aadbe7a80eebd6a4eaa0469"
+SRCREV = "fd2c4d40783f5f87a654e8b5685b69e1d60afe4b"
 
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.service \
