Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48496.1795411803544610895
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T68ibmiC;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so8132133eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411803; x=1796016603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vlyIKR9sayWRFBGEN+MZQm0peM8mmT6DmR2iJW3LBg=;
        b=T68ibmiCncWttv6RbGSS1G7Uly1cWXtfuRC0axn09HvmBFvB3CYxBgGMrG1ZVaQVY2
         elaMPz1LD+oaOQU1e7VPiLaOpWb05Ko0PNCcgBNW9gMfxJHdrpS7s71jX4XaXVQ89r9I
         XzHCC9uB8G0vOZG6z5xE8tKg+Nr0ep1rrrveQvpY9ArM9gXk/BzNrNX+zXmcN4gmsqUD
         KuhfIFxCgYoCVSCKUupsAXyH3AeqBujpRZ/3XDx1XacTnuJGvYWNYHObjlFgsrl0wjno
         7ENLLyrVc7tOmHAZ+fWF+zpovI33TFCQuqEc3dMSCU1HyM7xCA1LCjl4yTvfxBS7hIxY
         ho0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411803; x=1796016603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vlyIKR9sayWRFBGEN+MZQm0peM8mmT6DmR2iJW3LBg=;
        b=SW3vqOh6R9BgUJ1sTqiDEbVOO4b2YqWgnuUZFUxPgHe8TYTPsG/gv7+rJtmFsgyQQU
         Fo5+f+llXjazJUFogW2sZiHGmWNIyG11ET3q9JP4tkU7XMo/dzlHIL1xUNQyTmdgCZie
         O6nJXX9qoIB8LgFqtlyDA9lf9RfxhvukZMVZzgi9Ql63SL/qclOSeD/re+cG2P/6GfyQ
         Q2InOFCeTQEOWVPkrwTkAiQ7K1exOWt95ylWt+xsPWoAoE0P0vdjEaLy07UsgKJOSaiy
         BnGAbBEc/Ve3pYliyT5uq3bFrJvUziEzqH9QkFfToYro1q18i9XKjb5uDbo9XkH2ujQm
         GYWg==
X-Gm-Message-State: APuU4Z9cEVzipvPo+cMjXKfJUfeLzr8+KTHCIUWOdaSqlcNa8YV1hhga
	AzWbqlJV0O1swalkkd6p4KeFBjy41p7XZhMox0Bga2EBWF3V+0gjnwbbVmY2Po4PmyA=
X-Gm-Gg: AZFdTZfaJf1eixJlJh2JF7qvqKK+h/49RV0o8B7VS380ktimkS0m8xS7/m3Kx2yGS6x
	KU3V/uKny8/+xF6H7Jqo+Vtz0M0509UuhJXJvqtNYJPBK7ORTLbuXD+sNMGu0CcH3lKRnm8sWVn
	BC8yjL/CXhiN9ZCKheodtGIFPV6xVtMdOGuzVFLRWTtIJCsmHhsndQteAJ3MLcIlbYHMnXXHcXo
	BOsbh0joiFN06pozUMEdNutj6RyZ7F1jibteRJborVF9SDLVXUhKKq6jyr5XN4vQtW1B5ecv/H/
	LLzc/rV7kgrLIqEKFYClu6Oq/6VrVBi7AcdhFdc5qEhJcvQ6h8Cp3FXTO0FNtugNSjasD1YiT5k
	cysM1p1tMsvSrZoJFv+4rJdoTRwcvFGuEQ4LU9WV0S70f3cbvnz8azxBTTu7H635Fz4kYQSX4JV
	h77+Ci75RbxXxKBbWYTC6Yd6GR7cwAPsavEaakzjKKjFM2Fx1/hduxiIM+ZjQ97mGgSeFadx+N6
	SIi+Era76yfp6WI08zg8H9VUy/KrYz/cZ97WcHkRPMlkR+zEuzq94oa+kjAX9eurk5FAnM3N9/8
	+3wag+3WQe7lh4YB3r5IGycaQ1Q6WUIhpaY9GQcGYJAZ26f3aiKaAWJvQh3vTRHxuyr7tFIWnkg
	A+V7T4IRVAgM5bm3q5CAsWXsStvlHIdvgC6sSh8Pb0zU9I4xhe7QoBdfPCfkd/Oq9kecu8WvNzn
	vdFNDZralhmyHNTV/r2nIxZ6/MoKMcf65ht7E7g0U82HVgSPsWeG8xqx9889Uf+skt0JyjQVwOt
	boC0aEchThMua9aKcspAVd+I770l8l0gbufe653eEzKrBassDsA9TUJFC2pdgEp9QIyAlryfZZU
	3lYj
X-Received: by 2002:a05:7301:4209:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-3857054b988mr11884850eec.39.1795411802896;
        Sun, 22 Nov 2026 21:30:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 2/5] evince: upgrade 48.4 -> 48.5
Date: Sun, 22 Nov 2026 21:28:22 -0800
Message-ID: <20261123052953.3658549-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132793
Content-Type: text/plain; charset="utf-8"

Security fix release:
- Fix use-after-free in the synctex parser (CVE-2026-63729)
- DVI backend: fix heap/stack overflows and out-of-bounds reads and
  writes in the PK, TFM, OFM, GF and VF font loaders and in DVI color
  specials; detect short reads; fix an endless font search
- Escape field codes in arguments passed to ev_spawn and escape
  annotation text in the annotations sidebar
- Fix bounds checks of accessible children in the view

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/evince/{evince_48.4.bb => evince_48.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_48.4.bb => evince_48.5.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_48.4.bb b/meta-gnome/recipes-gnome/evince/evince_48.5.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/evince/evince_48.4.bb
rename to meta-gnome/recipes-gnome/evince/evince_48.5.bb
index 5756fa5fcb..8883ff80e5 100644
--- a/meta-gnome/recipes-gnome/evince/evince_48.4.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_48.5.bb
@@ -33,7 +33,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "f296c5c662886635d4cd597e8ac0afcde7982be4486533c2b7f095b268be8668"
+SRC_URI[archive.sha256sum] = "0c7aba9485d0b6fb9f3e0ee75be916544744dc2ed9d58a2f9936a2e0434ac4a6"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
