Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82867EE0AF3
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3907.1770467013096461315
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QO419ZAv;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-482f2599980so35833425e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467011; x=1771071811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT7gD75X3UlHLwEFbzC6AyQZbifpFdZNNL4NvECOhyU=;
        b=QO419ZAv8kbGJFpCZJSfzP8apo3ZWh80VGy3xmBSi5BvdBAAMGfjVxmyW3Z5CEC/e+
         8EbG9lreGSZkPJo2PM2aiBzJ36FjIxglz56Glex6GJBL9bEZnK/W0ZB58LUPGhRl/LFf
         y7HSvxZMZm9ckJddRvnaTa5uXoPA+tpkbdQeFQO4yM15armpdzFvXQtU2SLVUCqyblvP
         FoLaKN9UnbF9DFg/7BtgFMWByolI5WFtDcVsvixM02TkATtbd/y+j8KYTYzjHXdU32C4
         RZG13xPTtUNf695MnI6voZvpKbnGCVu8zzUItTzH0ZRgpY8wTnvm8Kb8UkYJo5moZODM
         vHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467011; x=1771071811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eT7gD75X3UlHLwEFbzC6AyQZbifpFdZNNL4NvECOhyU=;
        b=Gd557KB23JZAC8LoDlMM6wjzLnGbkiaPbDTQW7+M6DN5hWWGjvDzpW2pZEXk+d/LdI
         InMcV4qdEIjjwmMqonF8Fs2JQVD9u7SgyftviM2SduxnPBlvk2aIqT3KS388y0CFHoa/
         hJJV6W/clmWxRxjI+O0202C/8/scW4RvZdPoIYcAbm2qyc2f1Tntcc4opVUL97vMbyGy
         4CMMncpgsYxa9d1d5XrZouiGvMLVKdgjjug7DoXaGBBD/IJCagohZzjN1JaVeJqLQhBy
         3l+0irffN1NrMFoDpK6iLQENWU0QIEVQo/Sf7ueBVTByJ14kpOxBbMcVJMd6tcCcXIE3
         vdNg==
X-Gm-Message-State: AOJu0YyLgDtMSQLH7jV0lQ7tPTC47a/unl8tI5jgtdPa67l7WmJUHilt
	vXrz11FaUVJkZjt/2A4RDCxUFOHoeY8mI3nSH05hG5AG3BF+B1w9Rg0DR7geDQ==
X-Gm-Gg: AZuq6aLBdvFCGR784kF1gOUBIGWWKnMuVMjCsejhKnPub2Lq3JFZ0wepjVsA6Ja5KHw
	1ZHxFh+DfbBCZHAKWNicmkgOzrNda3xyz0u+ZGkkFV7ecwPAYJ5RCo+eaByYZYIWzHy3PYh6th2
	6U2lP56RRdiOkONlOqR2lYbaXY9LBKJq2jfyMGtuatYYgwrOEmZtDi/xBMd1EKBdditeurU5ZL1
	ZadLwyxxeYVMRWzVjYGK/y7KpFSdDZ1DaM7ro8mKwE/Otk8+eDup49tqitFgrfoti19GMBSp0dX
	CSi6T/yKlG+fkH+CY81yZX+Wxbq38fnZcyNUV+HfpJgNL1BO75dziN7cJt47+QTa3o6yBq4p3/L
	pRYz6+MmCTsl2+w8cT4Vxp27Rm9zHJB3Kios30uL/5V9kAENLUvquv+TH7c/4Ol2ARpupKlHpj2
	byAODhyWs5
X-Received: by 2002:a05:600c:a43:b0:480:7385:110f with SMTP id 5b1f17b1804b1-483201e714cmr80400425e9.12.1770467011308;
        Sat, 07 Feb 2026 04:23:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 05/12] gdm: upgrade 46.0 -> 46.2
Date: Sat,  7 Feb 2026 13:23:20 +0100
Message-ID: <20260207122327.664604-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124261

Changes (note that there was no 46.1 release):
46.2:
- Block suspend when remote displays are active
- Support S0ix suspend when deciding if nvidia should use wayland
- Misc fixes
- Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_46.0.bb => gdm_46.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_46.0.bb => gdm_46.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_46.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_46.2.bb
index 469281624c..97afd37304 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_46.2.bb
@@ -20,7 +20,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "8d6cb52176eca48b6bbf1cfe2fdae08d9677b5a0f2bca600dee4604de0dd1efc"
+SRC_URI[archive.sha256sum] = "4ee345422a16537150cd842450cda52b2ca86984bc51ee20cdc025dcf4bd268b"
 
 EXTRA_OEMESON = " \
     -Dplymouth=disabled \

