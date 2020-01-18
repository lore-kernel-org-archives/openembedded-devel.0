Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id B560D7FCA4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q10so25040355wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Q2fANiA2nje+HFziWx2uTz/sAq2LY+0yDZ7c0D0Yg6w=;
	b=Eb+5uNhFmwDRNNXur2SBiSqGM/EPWypTQ3Ue9Yk1xoMeMe0tNTbKxuyVs1YF4FTvbC
	JCtjFuyB+Mqy50wOUJZ2zmn8RQsMb/8LZPvSLw6MkMSzcNryQUR9VNZzRYuJrPfFZsRU
	AdnZUuy7K/7YzCgdsFPIiUFhGDtxhEwnDMs92l1m+PC+5TAEmbmbWy/M+e9qsG3WhoOW
	5UKkSEJCU/2P89NnWnABZpfypukuKkkV9k/hIaec3u8oKyiUSH1PqhWENlXXPSVM7BGr
	linZSIDYKt4cqg1ePaANVWp/I4D7hzZR4ZpWqoEBeBbg1qVZ9fP4GEWfPdHmSnfRDXMK
	dw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q2fANiA2nje+HFziWx2uTz/sAq2LY+0yDZ7c0D0Yg6w=;
	b=Jy6qplt3dicRebg6e5CpJ19IILailrEzGa55VkSeuZ+ZsjTr17GSVpVIJDeLROk33m
	0PujDyV2r+MXRLjBTXTJo/8JnNYg6lJ0Xp5NQMDpEd1TOl1IFDUUCPrLrnSDL0JTnyR2
	0mFPOQakbW6TtdCD1XzDj0c3nTHdst80TlQYKzkHngJ/JiveL4u2o873Jlnvfgmw8RJW
	6bO4MaMoVDH8Y7zaccvE+4xKK+Uk7CND3omq2uCIsvUqbDc2k76ANZk/B32rTfVTQnRW
	srM00wQZxPLQPVUPRt3ogBHMRkPF5O6kEYL+7qKdM+JUN/SuO6u/BhuI6/F2AByRbhTc
	CkaQ==
X-Gm-Message-State: APjAAAWJ5gmHyPSzthzPF/q8W90L8XEVHkqu2ZW/JyXHpGiItYmFYgFb
	tDEMgJfD1RVrw8uSt2gjji3GetpBCuc=
X-Google-Smtp-Source: APXvYqxlmDnpzsujcX6MD2P7M7/h6jSGPMTnjl8J1IJOEvs0YlvO1AV17jH4Kf09DUX26yR2ENxJ8g==
X-Received: by 2002:adf:d846:: with SMTP id k6mr7651724wrl.337.1579346901345; 
	Sat, 18 Jan 2020 03:28:21 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:51 +0100
Message-Id: <20200118112757.5287-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/23] nautilus: add mime-xdg to inherit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2020 11:28:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
index bacc967a3..10dea944e 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
@@ -15,7 +15,7 @@ DEPENDS = " \
     tracker \
 "
 
-inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even
+inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even mime-xdg
 
 SRC_URI[archive.md5sum] = "88573061544040c0ff960f934aa83719"
 SRC_URI[archive.sha256sum] = "bb06e226b965f479a0b8668c19c8e1762b9d8f039af6817961cc7a8f09e6f8a7"
-- 
2.21.0


