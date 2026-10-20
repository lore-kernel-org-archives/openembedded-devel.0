Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11560.1792467249250460645
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 20:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fMRqN18T;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so3432999c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 20:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792467248; x=1793072048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLofstjbdvg/eQtZKxr6eNtjO1JmgRzEnyFcnVQmXdY=;
        b=fMRqN18TPop/BIGyx8NU/xAZluxcmcS/8tt5GnG3fcIEHJmc3nCuniDpv1hssCPkR6
         S0ncT78tk5YBkd92CvZAyO54to1HwK3B+3A5G7BMKmO3Jmx/X/GkTTggkpdUP/U8vN9h
         oIpmz91e0Z11GW7zZzB+xl21BndvBU0k6niMyykeO9fSDnyrnUhXnF6Enmx68Gs8jsX8
         gj7whF4pELUBmBV2dVfC4zy5GLOCr6HO94f3du6XVIRzAJpkPLZFs4aO+Q+jLztPyEK7
         lwGLH/92zG82Fvn+liMKOcj7NDG27c4qAJGYzkResh02VMIqZmcVYBxheFS8FTQUwj3c
         s7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792467248; x=1793072048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLofstjbdvg/eQtZKxr6eNtjO1JmgRzEnyFcnVQmXdY=;
        b=K/tGdZuZu1gZAlCKDmObZ3KJWnqLCzfYRZvk0w+C1FFmJicwNxE6LQBNmpvwQdsIvE
         7dNXEPGuONLAyiP7OMM6ZaG53Xdf5oau+2OmmDq7NFxwwIuYGYwJUU9u3BbbsAbTsQ38
         g+RvRJ+o8+FnM7RmFPJh+b9JShBxS7HW+NtNvQnGWB8YYrieUV18uFVXikbms5i3CqRf
         TN0zePKURsoc+CAd/EC4QkQOlyKtWkTkm6hDG5u+sAIuFB0t3JVOTo0oGBratf+jNr2e
         xTeOJ3tAzPmV8itHljVxlNX/bVEuz+cN6FNvx7ZS2LRM8JpSZEut8B0ie8Mm89fXnoqF
         TsiQ==
X-Gm-Message-State: AFq9FYJ94z+dXMZOxbyOLSz3CKZzRsigRs0YNUIPktC+/LRDiJk29c8r
	87Hv2WMD9AF99Cr/Zf0QjbMfXcRHO6B/u5EYlGxqzU23WrXSRohtUmqPaeYFsJOwBwM=
X-Gm-Gg: AYBFou2VmFTGtyYEFQ61DmeXrCLhRF9wEIXzVgmtDWM7LYEASDibqtk4kMstQ8ft5z6
	ia7YK/gRMjsYvK/v9cyqHjZiXs9SG9ayyp8Q4ac7WMCltK9a8DecDWqUIxuppM9y04Pao10rAr6
	dhV1hVUO4hF8vIZqycf6oq2cewnVlclUoUEl0PKj4GynNDRZrOEfrH0x/GsIqx+0I7BYG7R8p09
	UsAjAvYfnVgcERnsOpjxSbP5oUK4hF9CzUzc6O/O8zmN1PyQsTxe56f0jazG4X15FHlgC/KkTXK
	WWZmLS+DoeRhFIQ88A7txzCRVemQjrazJ7VzvFVFpq41kOelH16Z0J29SyGkoKZMmKWbkGMdIor
	TpSwxM1AbbTFYA3gDrlSlW5D1uTEIZ8SJt4ocUZhyRL5VxASrLedSr0nHvrAUVO/SWM7QVGH7hW
	K+c6g23Jyg+wmFGn8GtZGd7aqTNTw53zsZHEE/VBwHNP8oeBn06m2gW6sg6W/Rzdi298Bd8rLaz
	MXyFNGmHwbZfbWGEWDbtk8LXXTnJKbbSRLqvAbsl9ZQZ4cbVCR0+GZ/CsgbQxHg0ME4DdvN1JBq
	Db/l5sKQZItS1ZJatjmXrvJOHGQGjaP087BrWnpjqmdV2xKGNlOU6krgb+TmJSchImvjK+o3aox
	bkpZ1Azttlb68Xlj8mNhuBHMqndOKnH4bVaMInVjfys5ziCevfoYQWbxOZ2lOqEZBiCiIZDbVcy
	F4+Y514svIQQHKOrUm3V8oEMTRh1Cw3iLW9VaIgUBPZwbfKr/WFv2IrE0LNycK+xir5k12WQ5Ve
	XeDhCQs1rprbv3GyzTXmGbrqwuJJu0=
X-Received: by 2002:a05:7022:fe0a:b0:169:bef5:f445 with SMTP id a92af1059eb24-1850c5f77b4mr19180933c88.4.1792467248516;
        Mon, 19 Oct 2026 20:34:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm33498887c88.9.2026.10.19.20.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:34:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 1/2] gnome-shell: Add missing build time dep on glycin
Date: Mon, 19 Oct 2026 20:34:04 -0700
Message-ID: <20261020033405.1126399-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 03:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131152
Content-Type: text/plain; charset="utf-8"

Fixes
../sources/gnome-shell-51.0/meson.build:95:13: ERROR: Dependency "glycin-2" not found (tried pkg-config)

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
index 549a3d5971..accd1c8168 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
@@ -9,6 +9,7 @@ DEPENDS = " \
     gcr \
     gdk-pixbuf \
     gjs \
+    glycin \
     gnome-autoar \
     gnome-desktop \
     gsettings-desktop-schemas \
