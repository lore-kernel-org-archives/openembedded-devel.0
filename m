Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11809.1795762980632554287
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C3TnNSXA;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so3202009a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762980; x=1796367780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPU1jXNImE/4eviAVdN0bApVB3F3ibu5bLFVIT+4Y6k=;
        b=C3TnNSXAo08zjLjc2n4y/lflmP2kkrnBPCyJjArIfYjpvbx+JBtOs7eWrifZm0IR5B
         HoqPTRhdYFVQ/WW1AGu9WYe1yWhe/TADmlhp1RRDLoANUfthFdogpOSromgZSJ5SoCiA
         Xa5xwCHbxVBo0NYU3bfhTJpTP65xGMkuw0N1/78cbvWkQBa/JjSu0gwsDC2xTwqUQYfX
         sSnHFri4aBPGmTwQKBLhoiqWOlf5TGr8ybFqA8rBf8uP85z6Zl+ZGTY2/orUhnxm++bm
         yNSYBuU6CxgeDz7RPFhdjR++oSDrW+eWMwZTGtZSFDVCwm3u//j2zKp8KFwtvRcaCbF/
         p5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762980; x=1796367780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPU1jXNImE/4eviAVdN0bApVB3F3ibu5bLFVIT+4Y6k=;
        b=OjJGPBZM7B/TCYQ9QZKNuZewYbb/jZu9ZWmA3Ibg8QiZCUV7B5lQY0tkQkGnFhluS7
         wURvHhTg/iNInKopfvxbYarUrM9hqGypKni34+gBkPFVKpBOUVZwWHyj+b7dCA2CZAyH
         Dodgu3Js4g2CNk8f9rzJXbcUb69dP6859XIz7OF3eu280P5MAn4r8P60dwCyNQqGSGBt
         FrpuzuK/vUtBGDRGyXzO0sUWvIjsluLH+2Vgm96R+5wMHVHxRcYuSa0p8wgj+Bv2ErMK
         V75ut70tWxof0PCKTy8a71UlJUrp+dKg+Et1AimAaNKXOb1MGofQa2xRD4806WChb0AW
         HY9A==
X-Gm-Message-State: APuU4Z+6dch4o5GOwwQ3WzVLUumzYPO/GbmJ4scsbRxGo1pWyO0d6/gF
	cf+gebsDctNnEjy1BQ2P3/w0FxF5Hib27kfi+uSgSSuD9WFyA8flgZZvKbpVhw==
X-Gm-Gg: AZFdTZekC8YCFhlPxk0dJsey0NDqjVMVQDMY/NdcGTgDUU12q6wC2omvnpkJaMq6JV+
	cZzXmztP347dBta2vn5n9JV/vDW/U2GFMH28HkNmtOrG/5pF755sV5RsMTd/77lNLYvSTeDlXQx
	sNerfVDXpKgHX4lof/p8/FJXhhcJ0HnAgybC96V3VAAWDbHH9IuCdSAMziJ6yZ8C78tmJXimaob
	5JJ1EKfrFBN9kd5ZVoP/my00kY+MuOwwAYiOvRa8SGyXIWPRicwpezMBJT8R8gl3rz4ip+KR5BB
	Ppc0ldIvqf0mUOh0yEwNlxCNNA1ebG+TColbHGfBUJj5roooxJIKSBsWsZhbs5GIeX7Jr44qzD9
	BbscoQKzJVPXcPkkmHgQPTbS5MSpflfW22B04jNeLjZA7AZIE3k4Q9693ermv1bs16LbwLTUYoL
	kB6jVFECnnSC/USq0lIlbayw18Vu6JKRoM/cEbqYI31MwRy4MyjWn2IrgsbX/kxhJxPg0D61gDI
	vv+Ky+OKprXa7FtXLMy1uCpGHtIhH8nalnL0ch8GLCwvV3WvgeqZZVtolt2t5Ll/A8ZI+hhLnRU
	es+cDHsvfQXs8IsH4inTaI4CJk1YPmWdBAPwIUayNtb8dLZFLCgRdXFwZWaBzOpG0djZVxQAX5L
	p2xBS46jWcaqQj20Q8j1uMkuRYYdn6hkAgEUx8gOhBPlBRNRWVaDe+D8xReiQnEShGz0SX6M32c
	pNve/OgMaDNIpIGcdxtr5ogyxhH5Tj8OpKB4tNBIL32roswGzlIy6IFx3dBoElJulSfVztMMAUn
	+6aoNZYDulawkv4Unb5u9c+/zHo2V0ilRSzuSd3lPe62fGPAHHGJySB+T9CbQ1vHykCfma6C2ul
	ZbGi
X-Received: by 2002:a17:90a:e70c:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3b41cafcc05mr23555524a91.37.1795762979949;
        Thu, 26 Nov 2026 23:02:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36464914a91.15.2026.11.26.23.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 4/5] zfs: Fix upstream version check
Date: Thu, 26 Nov 2026 23:02:51 -0800
Message-ID: <20261127070252.2364951-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
References: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133353
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up zfs-2.4.99, a development marker tag,
rather than a release. Match zfs-X.Y.Z tags and skip the X.Y.99 markers.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb
index a92efec541..4942e93140 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.4-release;ta
            file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \
 "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^zfs-(?P<pver>\d+\.\d+\.(?!99$)\d+)$"
+
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
 # That's why we opt for module-base, also this prevents module splitting.
