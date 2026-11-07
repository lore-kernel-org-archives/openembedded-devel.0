Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6373.1794046324415502790
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eV8XJRjC;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so2033848c88.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046324; x=1794651124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U48Kyz0UtYIZkxm8yCV1kEYYJ6hFMFHT946FOuKhSHQ=;
        b=eV8XJRjC2YxaqVuhLzYgQe4qFyyCYEU99lJ6txqRybxVKVpMvOdPSGHZCRYYa2RxHj
         hgFJLNfq1q+h3sI6C1eKg6Sw8NggtxW7yTrviA9TfgLEPL0C1EryIYwvPlrd/4KcwfU1
         TV9j3HuVTuu72GfgeDk6U39sVaY7nJotjOSlnTp/OPzkhBYfQk0axIeA6qIsj781G33R
         R0BJrg54ndl/BcFVVrfm3qhYoaw0C6xC1vnEccU3oa+IFKf93M0Ont+gtMm5MeTL49h3
         WxJkhWYxPsnhIXjAwvWyQeBYcb6PHxxyUUKBULHH2x7J0VADm099x2NtGTOozpZSx0sl
         DhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046324; x=1794651124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U48Kyz0UtYIZkxm8yCV1kEYYJ6hFMFHT946FOuKhSHQ=;
        b=FSPM+ioNredyf3Iyf7oUWc5vKTPaF9/5T6cD2+lA0sjSHhIhvy3Js4U7/ZVoi2ti8n
         ZZkEnIEK0ikOP32pkYaJsyKKSZpN66y7/JlzOGHb30tf3J7CMXuNotttuVbqVZNugh5V
         8PfNbuT1Jle/J2L4ruJ+iOVI/vkNVcQlOOinhVwG7XMewVm9E0V125CXKY5G78CKkxDI
         NNc6dyve9XAUkt7AaZXGAJVv+OVGDKWplMLHc2aMzsPBuhj+fLRV0nrftvaxK7MJXkTg
         jCD0bH7puWQ7XRFiuI+iNUMi1SR5Xy+f3ot8L9BKmeDRdu2ShnbwbfVzfsBJGDV9NP2H
         Qjhg==
X-Gm-Message-State: APuU4Z+U0dRB7WjolrasHsnUmiajfDQbv997mFaR/Y8+024Jh1alA1un
	GVQ17AAVcQxs/cDHc/Jq/g7jtFLBNisRltM8O+XxscH5QZL0NNXr+nu8eAVS+w==
X-Gm-Gg: AYBFou1B5S0ozLqp+AbN3vdFqeLkicv7Pk5kTDsq1TDob0GptSLH0sDAHAjOhHsmkdM
	LZoNUFWY+vFDzdQa7mV1Ge2HgyLhUJ8kC+XfcKO1sleZEJtKsxMaXUGKVE231GnqPrAO1hby24G
	4fc2dw46NHrg0Ce5qa3K89PVF+3SQbeeY+AlvULPHCaVCR5qhL2158UeOEFhe8b5epfKoSEy/gr
	v+CS+xO9fF/6HCCBoNNY1y6xgEjR+Z5tbd4nPlO6watf+WDvIU4WsU03ZvgfBDgz2gQK0aK8Zu7
	NL+DOWsPs5qZnMPUx0+ThaYfNCGbCaxCo3aPS+lZfjm3p3Edj0IK08+dGaN0eMHPIQyHpFHH+mg
	5neqAiDDJf6K4gl9jBST6TJvQxQzaFj9hd9zKw+m0n3VS10DAvj0Fa9yoOHqZGRrcYu3mvgHaL3
	c6lbputT+j6bMo6hhTrzyssKLOx7sm2zoy7+pE5O1pnb5uY3OJc1FdpR/aO1fvj1naumqSfDJ/p
	LV6SOLb3rTuFzQvy+kzDNgnOaNRtyoDJQfPSVC/GYs6f1Mo4ryAbA0/OR0a0FFhOu0EpYc7IZpA
	9ytipCe5+emXvnAlmF22FTfr/9nft2pSv7RTRgAF9JuzhHG9ZoEubcD6HAnPYw==
X-Received: by 2002:a05:7022:1701:b0:15d:fb47:4268 with SMTP id a92af1059eb24-1b25d30f4edmr5854690c88.21.1794046323474;
        Sat, 07 Nov 2026 02:12:03 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 2/11] gdm: upgrade 51.1 -> 51.1.1
Date: Sat,  7 Nov 2026 23:11:45 +1300
Message-ID: <20261107101154.2992152-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131976
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gdm/-/blob/51.1.1/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_51.1.bb => gdm_51.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_51.1.bb => gdm_51.1.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_51.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_51.1.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_51.1.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_51.1.1.bb
index 7ee327bff2..4f83fb90f4 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_51.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_51.1.1.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "27970ad4f58eb0a48fb01bffb89a8f472503641c3573eb6d788ad4042de01120"
+SRC_URI[archive.sha256sum] = "390ae9e7540f71db28a3dc64319a8f687f4d88bd4d5f1ff816b7a9f2249ab4aa"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"
