Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E920ACAC5BB
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:34 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.23899.1759715305151287535
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mWjWcWK3;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6051aeafso45667537b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715304; x=1760320104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHI3DFPzP8z6Zpnv1vY4vO0g6oekyMDuPCp2VnFctX4=;
        b=mWjWcWK3wBJU5AzOkuigO6UYgSBYVZCxex1zBki8uP6n0/m8yrD7NVYeeGs3RtZ0q4
         tIPj+OEC6nLoTqmuy5bxW157Ai6lmd1OPXhr9/IQflpYUNpGi4+vHVnGuWDfZB0qZtD8
         RkOb2rajf2zkZe1FLECAVMmO9KIYza3HBphFi7nouwsAiGq0nF7wUdvfV8zJ7LJGRPhl
         kLjbErgqBWP6nXEgPjAv08eEj9ApMtUew0XzXLU+8m460VV00QeyO9ZYmAi0X52RQdSJ
         fF/03PM2lkgN7N7Yy4/l1+vNdPRvZWBIxI17LcDhGEZze9N3yuLSxjEHPdhSacFNZMrN
         vQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715304; x=1760320104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHI3DFPzP8z6Zpnv1vY4vO0g6oekyMDuPCp2VnFctX4=;
        b=I9t8qmQEoKTS8b0Fl9z5Q2P64ZTdV2gg7iQERcOz+jyx4YYD6yqpR3OZ1i8+Vk8u53
         rf7YjiERFgD/JqqxMklYZI1ljMXDHKOpVM9Ho93bmHkaVLhTM4ij7Kbn6e7ufvuAOpim
         6a334GyvVymYOgDgSM16LKTh5rA1HObNIAjecd6dKMIqldpvwH3wRS/OuiSTwfTgjWL4
         iltwIlZKnbaR9HofOupvbYTtgSIOeAr5iZYxfJ9g3zznOwJs+5cIktd+Wr/Yw7whiNg4
         k0/9O+P6oVwabLFUNl2ScsbJpl5RESSJHq7EA+Gh2TBGRQ8aOOBC+f09uYsG3+kXoW42
         QqZA==
X-Gm-Message-State: AOJu0YxLHEUFzplFdJvqUjlYGGAU5FGmgt4rqy6uEcByZb5xG3/9tqVc
	qkyPC3kMlVmxZXHL9IOVC6njpNnocCqjFgi9i8jEG2NyPKuOpAROoBT5kgW9FyK+
X-Gm-Gg: ASbGncu7DIfHE7Zj1I3LnYk54+yUqnqik/cWjUkYQ3sINrf/iAZVjfWYZy3GVZNNUk4
	dcL6KAQuERncrC95TIW7ikFdq3Cp6mSYKrL9KozdkZ4IVAE+2Xq7HUikonG45K07oQ36J6lSZJv
	sjBA2aQIxDuLCFlm5THCkzfkavzKFRHf0MG9rrWltHD22oNB5SSTPDtheqP1VRYmfFUztv+5G3u
	9T99ophUEzezqWUUacOYIzLwBBkOwiwRLGTu9g6OKf4Hcu7OospUL0MiQmqjklwewSiw34p3pvy
	APnxeFo2DEHQ8w1NT13j1N0vOv+jlUFDD+mV+lxmENc2ru0ICgc+QXCEWbZo7XGjUmmyzjkWyo0
	U8mR6ilTGjBNXkITd4enlEPdDRc2tQKtTS5NLWUCAW/hMY6meDwW2
X-Google-Smtp-Source: AGHT+IHonBKTIldFgWWNLp3Er1KuXZbhEjyNwrzx/t3LHiTIyIgKBnsWi4+njKviiT/r5nTHy4aM5A==
X-Received: by 2002:a0d:d3c2:0:b0:71e:715b:a988 with SMTP id 00721157ae682-77f946e57f5mr97868507b3.42.1759715303793;
        Sun, 05 Oct 2025 18:48:23 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:23 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 06/10] xfce4-eyes-plugin: upgrade 4.6.1 -> 4.7.0
Date: Sun,  5 Oct 2025 21:47:23 -0400
Message-ID: <20251006014727.58960-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120263

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-eyes-plugin/-/tags/xfce4-eyes-plugin-4.7.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-eyes-plugin/-/tags/xfce4-eyes-plugin-4.6.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...{xfce4-eyes-plugin_4.6.1.bb => xfce4-eyes-plugin_4.7.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.6.1.bb => xfce4-eyes-plugin_4.7.0.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.1.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.7.0.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.1.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.7.0.bb
index 61de603756..7df5396653 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.1.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.7.0.bb
@@ -3,8 +3,10 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-eyes-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "5219b2ec0f203ab65990671a95b1607f539201e09e8910b854aea848d478cb53"
+SRC_URI[sha256sum] = "87f9b978ca75abb3aa5edb1315eb65ef98654a662c14621847ddffe8aa6574ad"
 
 FILES:${PN} += "${datadir}/xfce4/eyes"
-- 
2.43.0


