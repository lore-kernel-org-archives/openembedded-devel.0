Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9246CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:34 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.23901.1759715313031575083
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGZvmA9L;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-72e565bf2f0so48784047b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715312; x=1760320112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxSircv12ziL17ycGed2BC7biFpB7JjSSq1QMvomy/A=;
        b=YGZvmA9L0k7OQI1OjEyBAqSGy4qd4Lm6mGFUOKerIevOgQiYGNQGqJwoBQ6J4s3Vwv
         gFnFQWNh/Fj7GRszR85tGSo/HVM61Q9Vk126V+eFnIX9nYbYnop6Yq2MGCrrjD97hG9M
         owNs9AFglwYCKELFsA9bZ7TCOLNvo2FXrxfX0jchnxnK6DLdYe+taCmiML6+Fj+8RkiS
         jeX8pxFEVvqDLcInzEIvjCQRmoTAzPKBIQ2bu5KOLMjS4vHzQm0WPocgBz65/i4X5B80
         9qtpF7V/IvDqqrV/yjRKQN8iLqQ/KHnXliN2UBTQ+q/aN2A/+oURN90qGnx3SYzNDSpX
         g8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715312; x=1760320112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxSircv12ziL17ycGed2BC7biFpB7JjSSq1QMvomy/A=;
        b=n/Ue3DsQtuqqtQxZ2RIxhEj8ZuWnb1jB4rTEF9/JIAeFwrOD/QRKCx374FzTiZPA8K
         sTNIYmAwSW71FEpg9Pd70+kP46a+ujp/7VHDECjH53PeH+fGg/+lIa806wD5JFUFsyG3
         dDIpBsQ4Pv0PD7qQulcEvsTANebizxtcXm4hQiL1VYj0hhpm2a/58kHL+k17h1ktxxs3
         X/dA9W3rtqT5zwBfNHVJ467A9j8VIy/IupwynVKwpt9aJ0YqIRYZn56XuIw8yW05eJ4Z
         Ef6BaCSy3Ok04mT7fc7JrQMnQKb/adjhYsU+SktGzTd+QM/KhIFkEPSNjKpHrwDOHgP/
         +VCQ==
X-Gm-Message-State: AOJu0Yyr9Wgh3TxkKnbvQMDuxGRthtbQqXo82OanYO9VQ/JEVasO5brM
	TDK4ifFx6CSRSNDFPMJE45PwD33X4mTMBxsSs1jXFOzp8kDYT3G9tOIMl8pa4tY7
X-Gm-Gg: ASbGncsPfWF5JpY9Xwx4f1rC0aeRe5WdBdyHlQcqPuZ/mKRVN2LLZZncEZPyY9gZ6G3
	9LV9TRdoWegsPWCYJq9jmtfEpJko1qgElI1D8VOuXJhyvCyd49/B0SWmKRdGnjrFmHifNreCoG7
	+3kYOUF21kcCr2Gt0K8FCK0kiygPZ4HaPVUVjC7djqfjK2G1lFsbmvQUyIYNCGIi+lrwOAFYqHL
	ERkE4HawyEmh9mDwUVNBbYEJVvVxo03w4pzSMO4m1w4sRrU39FAjNCjleOzvdKorPY6/vSFs2kN
	oKX161/Xlajk9+21QM4HCcUnD9tFsH0kGyZ2WmH6nov4JG9CSnqbP9dJeP8DJe17CNsHcgJSgC6
	rEdrU2Hz3NlMQULtBOQ3h2VXYbbTj+YVPWf/Irr47OIZwAI9VUFSw
X-Google-Smtp-Source: AGHT+IHiO2sy8jKvdopVhQ9M7CEeSo2XNTrAnDV0ior/XidXTsJmJ6oZX/ddJYAVHL44itN5Rgo6ow==
X-Received: by 2002:a05:690c:83:b0:75e:a8a9:8e7 with SMTP id 00721157ae682-77f9470af45mr137431797b3.47.1759715311673;
        Sun, 05 Oct 2025 18:48:31 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:31 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 09/10] xfce4-mailwatch-plugin: upgrade 1.3.2 -> 1.4.0
Date: Sun,  5 Oct 2025 21:47:26 -0400
Message-ID: <20251006014727.58960-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120266

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mailwatch-plugin/-/tags/xfce4-mailwatch-plugin-1.4.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...lwatch-plugin_1.3.2.bb => xfce4-mailwatch-plugin_1.4.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/mailwatch/{xfce4-mailwatch-plugin_1.3.2.bb => xfce4-mailwatch-plugin_1.4.0.bb} (78%)

diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.4.0.bb
similarity index 78%
rename from meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.2.bb
rename to meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.4.0.bb
index 9ac375999f..b30b359f79 100644
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.4.0.bb
@@ -3,11 +3,13 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-mailwatch-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
 DEPENDS += "gnutls"
 
-SRC_URI[sha256sum] = "c4783f1533891cd2e0c34066da859864dce45a23caa6015b58cb9fa9d65a7e44"
+SRC_URI[sha256sum] = "5c211025db1096663fa6b8cc41213464a6d71f24e76326499d857ff81ea3861f"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.43.0


