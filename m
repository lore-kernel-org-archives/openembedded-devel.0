Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8064.1795739690852002754
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZvGoqvkA;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so14472128eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739690; x=1796344490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXlfzmhaG29qYMnIEQhVgsXeNoEsIlCh/TyFGeEqKc8=;
        b=ZvGoqvkAjg0sXCnQxaH/dKSnjiphTTsOmg1FesEYrNMtE3rdTG+Jk4h/MhcgWxtIW/
         3XeCNNCu89ODwT3pUF0c3fS8Yq9bmICxhEMKczxu7fW662JALgl5xUzun3hHZ9eCtCI4
         ujdCLYCPPYA9q03PY7BizOhADeN9rHLFe+Wcoui1GYHI6LYT0Y3Pu/EaJJQ4sj+E1zaQ
         KHX+42LcaOHqTeslwj1iPp2Kfl5WwgT6k6wWXbS8YLkzWjuGH/UEluKE4VUvRP6Z7m0X
         Y1YJoCSqNWXjeDxJlRouxwR2gwzv1oeormG8c+vFj1aEp3Ys8JqVMEqdWYpFSxz9KxKK
         4Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739690; x=1796344490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zXlfzmhaG29qYMnIEQhVgsXeNoEsIlCh/TyFGeEqKc8=;
        b=WamZXbYfq9fDGU1Sfaiet/cG/ie0jA0zv4vPIu9SPU4WYH1nNAL8uz1QG1voHHWbpw
         2LNOsPmsYtOcAGR0c4MQrOIJyCAgoUB+XwSmqSzVB0Mq8A8Q7aNjsFtNX/XJbJ+Ig2QE
         YBTA9N+IyT6PEDSTbK9cuAXyHRzvkUfKezhRUcgET9m0r6kuymYH91K5InyHMxe9e/CT
         YdCffcegCBQq2rla7H0so3MWsMNGeBRw7X4JRqGN+JRI0LdI5xTNzKUnHtA98d6GQkEb
         snvNbY7u29X3vlcZZQ1W4Xk5UJPo7/k+kBcLFcM2OXXTwoMiNmbRY99aA5AyHhasYldn
         T9uQ==
X-Gm-Message-State: APuU4Z8wC+WiWlxd9qrSJUf6Aq4gz5M+JpclfzPQOZQ55HAcnpn37vjn
	quXqgB+Wx456bLKMDQNn2NYH+KtNKSrESMJyDvnnBuptMAcm1hxQwHu8Kkb53c0V
X-Gm-Gg: AZFdTZcWNXvsKH/8coZhULXfKHYl6YeOmN2Qei4NuYEgE6Ze5z7Y0ZjsjlFM9sWS763
	g9F67VLQrX/1S/qmFywxEw1xSvre5QFcVPHW8L4x3KAg5W+8W+CzigWMAkFzigiHI52eSi3/3C0
	PHH3sMjrMdNmrIFK2RCsguM0ArmS6DfOmAUKEJImZatTYlWYe9shb7P8UfwYV/mbktJst+/AqXg
	1XeVX8hP2x3hJTf6F2aIco44/qSgNGUFh0pROR+QrxkweJn06P3ohWKUavRpJCvjmLLEp195Cob
	AkWYAV/kfXAxdJ1rB3Nmq2H42c3aJYYi1Ps/9kGO8WWeUqNUUL5O0e6gtcCN07xEriAk5oI1Kj8
	jfntgbO0C+4E4omWqtX3AeS7d5evMkF1SoPqMz9tzEcuyuwQWx2HQMfTqCptPfyPtKyqXOA1YGI
	7CP4LnpbZIjih2WgAQWJjXMYsvsGzlSOWCi6bFOvFuX9scJylmf86xpMP2MZ3ckxGaD69LxdhLp
	Ig7UBZ57JKHzPJdnkkP3OLqP2xe9PROOEsZWOimrcMkXevI4j3cEqEquxixbG9sN8KZgNwR8Pfi
	ZCpHey2cnL5fmSNt50oRDj22V29Csv4+hDnKeaHqmShbTYhQPgXZyYJNVHinCqmYeAPYYs3ExMd
	5R+hlGPhHZP2Wn++rJRvEC9QYbHSW304bO2ybcV5HioCohkahn59jFN/ZD2yyVJtALidqsdkdhX
	NmvDH3rNhvmMDCcyiXZPNAQjyEy3rHqdEWkEICvtstP8yK+SqU58ZVTsM1V4OLgsoUrlmweuMEy
	e/b9e+XGAMEFgrEOlHNwiL/UAvz0DuKUkw16PScA+1cErq0x0sLBlZ+D/V+cffPxBAdatrFXYkJ
	KRjKamnaV+YOm+0rU7NhYFiKHA==
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr21492745eec.4.1795739690181;
        Thu, 26 Nov 2026 16:34:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 19/69] flatpak: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:35 -0800
Message-ID: <20261127003425.2166632-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133119
Content-Type: text/plain; charset="utf-8"

The check reported the 1.19.x development releases. Flatpak uses
odd minor versions for development, so only match tags with an even
minor version.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
index 74bfb89e62..3b1bf63014 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
@@ -10,6 +10,9 @@ SRC_URI = " \
 
 SRCREV = "a02d0ba48abe9aacc377de15699e5d8c024b5669"
 
+# Odd minor versions are development releases
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.\d*[02468]\.\d+)$"
+
 
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
 
