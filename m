Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22053.1794808965919631941
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RUNAvPY6;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5807709eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808965; x=1795413765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjjKj0gEYbQMcVRjbhCyOyqQpj9RV3ITXq8R2QUY0OI=;
        b=RUNAvPY6FYedyO5oWQxWmDycSbXU1I9FVr0upPlzFA6OF0jDZvRo2e0DPqgloZumVW
         c8opB8UkYzB17GzzjgRz+8Mt+eXeHP8ZI42Y7PNmu3/VenaAv0l9W0PyQ5nzQx2f0fCq
         2Yvqf29XBtM+W1OAduqxvAePP+6Zd3TGQO1XA/u6Tkoj3jiDGqty7jn9lIxT79SE/6/N
         DCPe9Hhw0MIdw4FqCMEgM5GVIvmceAHrcRdiif+oA/v5k8vPxIUgaF9J/Z8uRqQjgTw+
         q2sGVMxRPjfh4gaaT6JWb8bbeDRODU1PHiwImSRWQ57stmt9OiDaLO/X7t8cgMgoyXyt
         ZVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808965; x=1795413765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjjKj0gEYbQMcVRjbhCyOyqQpj9RV3ITXq8R2QUY0OI=;
        b=YOKKNvOZHva5F0WYXd5W62PT1l/u0LS1hFSM9cRhiNvvaXCw5i4nNUVoLIJWGgSUuC
         kyCV1cqhwOnjbI0ByJnxFfMpMAU1HhzE5JKKkPBbOZUoP3hrJGefs2MkP5R3baYQG7oR
         kO5mbycKG5YYv1R2rvt7G6lpg21xTQ3cgCtoZ3W+nutXP7yfrDlFzkuG1tyy7yoHJ8uu
         LSfR9OW2vPtpHlmQwKjFLaiy78sTPJRICSta+/i/hXEKG/5V+nbxk7G4ngoHnXIT/0Mo
         s+twNM6DXgZnOZ9lo3W0SUJnML5ZMd59ZZ9KeXR+HeU7kP1kJcEg0r8t0eNW2+z5sV4W
         SNcQ==
X-Gm-Message-State: APuU4Z9AWjFYEts5XHbEnAAtckiQ2fFyrHzQrEvGs6icaDVB786b0t/n
	UnPD1VvsDL8FV9Boehu3httSGylwIdfOAe+lHPQ3ojrC1bBC7VQV/34zgqzMR4Ry
X-Gm-Gg: AYBFou09BiUXGBjwav9T1Mo5+1ktKy16UcsEgnZITWDu0u5mC47NXtt96NyOruR0Tdx
	e8FOVl79w2wFg3p3Cp76eOrxYdXEoHmYDb/7/d/CL7NhaobSlHCey9g9Pvtq+cHUjy7mqQeDR/O
	Tq9znO/7Z2zMzWF5eHvc3URaeQHMPLvjUUWeAFlnzs+83ckWShC3v7uuWskkv92q9Hviu0unX4u
	BR/HBtxNkhpB9G3CRIzPiHenUEW9ILn3fAZ+4Gtay+1qPil5LztBYoBN/kWeqGa8EaD+ps67sy6
	unpNfICC9E0E0I7UOsF9qdZAjkx7pRAdKW9VgWoSo1QvJE+fUDF6HQBQ05WaFmSaYDdQsnwAirX
	T3jiYJp8JGFJDap119QiWe6YJ47Xm4hyzsgbb4qmLZREmP3ENQE2Th8ypHYdAmCG1j0MQKgChej
	Z7Ns8/iMw53V391J1y/ekp7m5N+G4YHsPsuWs5lknYsWyGMqtXk+Z9RsT0Tb9uyjxnnHoPzMXJx
	7gYXQtGmYKhnF4WYZqLDsmHYfHNo0sFS64J2zfIFkczXPLxhIahXoBiiht/DnGKTmLU/grcXGO5
	Knq2K7z/IHgtNYIgCUlPH8l+hWpPWFLJAf5K10dGb0Bv/3WEgBz4OS9OHfXXdqQ5/J7OB98cWcx
	3OYpfn+rLUxD31huuwSpob3Eub4NoP0cH/EDNOSHGgcj3lRXYqXhXVoDBfuF7AWA4xRq3vo7kpt
	A4MHV5cCgGzNmjEypHEB60Y/u3LG+t89h1uZPTFBJWHntyZrWe9vcVJaeBO1YKOcmsLHk5JtgpA
	QyGdzh1rGvREOj27jseGWeuFrrAITSdUKg0L6yJEz9MsXQ5ZzHEA43Du5pZvrOONDTaB+LyLA6W
	SNV9
X-Received: by 2002:a05:7300:f58d:b0:370:d7fe:6585 with SMTP id 5a478bee46e88-37965ca807fmr10550347eec.11.1794808965157;
        Sun, 15 Nov 2026 22:02:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 29/30] thunar: upgrade 4.21.6 -> 4.21.7
Date: Sun, 15 Nov 2026 22:02:07 -0800
Message-ID: <20261116060209.2916444-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132427
Content-Type: text/plain; charset="utf-8"

Session management now uses libxfce4session-client from xfce4-session
instead of libSM, update the x11 PACKAGECONFIG dependencies.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../thunar/{thunar_4.21.6.bb => thunar_4.21.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.21.6.bb => thunar_4.21.7.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.21.7.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.21.7.bb
index 3ccab0ad69..4e663a692d 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.21.7.bb
@@ -11,11 +11,11 @@ GTKDOC_MESON_OPTION = "gtk-doc"

 inherit xfce gobject-introspection mime-xdg perlnative gtk-doc

-SRC_URI[sha256sum] = "5412d3feb14b4c47ccea8b00e9a9e3dcc1ea0e86e305abcee344f2fe82518bf8"
+SRC_URI[sha256sum] = "fcb196b2f89cbcb8a3f5130fa9a1a11bc49d66a6403bc91aff7676648d95d51f"

 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "-Dpcre2=enabled,-Dpcre2=disabled,libpcre2"
-PACKAGECONFIG[x11] = "-Dx11=enabled -Dsession-management=enabled,-Dx11=disabled,libsm startup-notification virtual/libx11"
+PACKAGECONFIG[x11] = "-Dx11=enabled -Dsession-management=enabled,-Dx11=disabled,startup-notification virtual/libx11 xfce4-session"

 FILES:${PN} += " \
     ${libdir}/thunarx-3/* \
