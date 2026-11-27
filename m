Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8218.1795739724110546992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HHJxAojt;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so4103925eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739723; x=1796344523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBIs0oV87bOegnB5EAdIEENKuTLYe5dQVMYfBpEBmVU=;
        b=HHJxAojt7n46q87HzIz8SCa4Ikhnwyzlb7ULZP0fOLYQoRfvGPjtuf1ntnt00ARBYT
         4xaWl3C35BN8gJUugwauM8kZzMMJ3ifkVhhmoPnwpwveeDjbmzFJI/dg6wzHGNH0hfpw
         FHXW8m5LMtZoJgF2m0/qEp1GMCalSZYZsFraqYEMA2uSTbZC3B/NdGbiqrvNgvke8dOr
         0Jbk4hg/61xrPJimjvanK/5xIPwmGyU57BSRsg9/7UHOV/qt4t6ErEpBCTdz0CZ7itiH
         Gp0Y4PakTZP5TQOPW0YkJfZpdBjLrNwg7kpu4hz6qHVS6FpiZ8xG/50PqF6xamFBGbCA
         pvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739723; x=1796344523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBIs0oV87bOegnB5EAdIEENKuTLYe5dQVMYfBpEBmVU=;
        b=aU5xY2Iesyja8jprt2YUpRT2zi01Y/Udwqf2tqJiC5mmTGLOav5tSV0Wv/NXIorncJ
         Fe3R/UdSmNpf2Kplg4TQPNy8Gm46TpEZltPbXPMBgZjDlfv8n+tMRKtPlgWGi9aBK4qt
         IAav3u3td4pYLotHTrgGUrfWEd8QhatyRuNWJ2slJkMWyGs0hQ7rmhLp5XAcMyYCKhux
         FV5USXzxf5wXMcpN6hPgVHtES6OlrbFM1q3BOqn+fnsY0oIAJPswILLP9YB+qg7dxekP
         6Hw1mR7W/fbDoLgdrOAVL+Vtgv6m6d8L0F0WjY944f7KmlHey0akQhGrZJX3vTq9hb+V
         zwNg==
X-Gm-Message-State: APuU4Z8fn0QUtdUUoCjwLm0T8DloltFKy1uCeL2ufQKRqft/SBt+yKUj
	5qajVsO4hFoWS8Xp7By3bkk1MJCIlvCdKSbETcJTs8M/8zBnokl0NPWhkw3FlAHn
X-Gm-Gg: AZFdTZfc3HOdB0ysz/lwcX9zB2wXIHS/tVKfnydajjcsdJT3wM+xml1hyj+VECUZcQx
	tPeJtmwNuDO86NguhvOuYsvyFI8heGWkUN0wXmw//ME5Ve8azR0axMFW+bWUkDnTtwz7on2bVcb
	H0PMwxAiyiSoNzWC6VSBo2nP++a/zJ0tWW7QnJBc8TqQiV44WzA8GBy+Ba+OHjn9RkNSbM0vO6f
	nItxtw1Bc/X83183It7neKLjhMUFdp1b0yGwBElqfEOez5gZARhS/3XnnH5FzOQp6C7KYJILLwn
	T+d5r3CSvVwfoBPCsQOLMe2cEz5LAX4ThPbouq+4h0y9AkxpxFmXfUrazLxu14mpClWdPYNdbS4
	oYUDr6tYlXG1qg0wUUpG7+WrZZy1ZaVlLi0aChRGivI+kTtqiDFJ1YX+NYIC1vxehg/h0FY0yt6
	mIkR7uvRS+9BlXOfNyNY4qYVcahKXbCEe8wF1uei1BVEZFFZ9fGXpTmgejM91BsGrQ3r8j+wEI1
	SgpkK/J7QyHsJSpzt/16zUBjVGgwdwxf6/9VA9kTjlD8so7k0JpfJxw/omoMy/C2U3gjNs8WK//
	jtxiv1LZO3xzjaceomAJ98bn4ODsQVFjN48H3DyK5g85yNdgc9mSEnYYLZTekjXlAaeOqFk+O7S
	5ngiYGr/uNhYMUJlIzYFa909nFjxhdo9/OYvh4mQdJ4+GUissdONtcbx/qLkRQ3J4X4RKEwniIj
	bbtlAzTYCA+UMzIiTAr0c1vWNGHVcsapUW0V5zx3y4eq8ysWzpKSFbdNOEVhQkrmqI+1oKsY4IG
	YVcbzpvx0mV2g0o7FtUCG9J4+a8kzAkA3+WrwLGOa0AYZPZfH0DOmW3uWWqD7gqNT5e3j5NBTac
	+i7H
X-Received: by 2002:a05:7301:240a:b0:386:cd71:b714 with SMTP id 5a478bee46e88-386cd71ce89mr7753857eec.35.1795739723410;
        Thu, 26 Nov 2026 16:35:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 51/69] hdf5: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:07 -0800
Message-ID: <20261127003425.2166632-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133151
Content-Type: text/plain; charset="utf-8"

support.hdfgroup.org/releases/hdf5/ lags behind and still listed 2.1.1,
below PV. Check the GitHub releases page that SRC_URI downloads from,
skipping -rc pre-releases.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
index c3aa1d2fcc..eee039e8c7 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/HDFGroup/hdf5/releases/download/${PV}/${BPN}-${PV}
            "
 SRC_URI[sha256sum] = "1a1ab8209b35586fbc1aa279ba76d102130b95badcb20ca329587219112d8c16"
 
-UPSTREAM_CHECK_URI = "https://support.hdfgroup.org/releases/hdf5/"
-UPSTREAM_CHECK_REGEX = "\./(?P<pver>\d+(\.\d+)+)/index\.html"
+UPSTREAM_CHECK_URI = "https://github.com/HDFGroup/hdf5/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 
