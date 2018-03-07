Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7563478A87
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:41 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h19so1300315pfd.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=K6iMHC0pmlIxDHcsJJUdIJdW4NmRJNcrFyFuUd5hD80=;
	b=N6MfvfVitGT4sYeucuVtF85x6z8Ic5mhFYBjq07vCkq7EL9l4jkKDYtoXL3XpTCZ4p
	scPA9IuFut8W3u8VVAHoFkGYWoxtxWZd6ttrRzuAIaq5N5b528ap4FrwM6/K+iTV8e5O
	sRmJUxr1d6b3yiMauEYlLRatanXmo4af+aLLJEt7h2j4UvqJNiunj4kwPbNKplxekTa9
	us2NOl1YyiYVCST0KOZGtRAPwuYdbsTMBKMk6ugceoo8jM3DJv5JcRvU6fz5b4xKAmrL
	GoAO/YkTwZ/UfF2ibaurOhBushPYn1A7if643Q+YsxVKeHZ6Omt+mmObRPDYJQG/Kt14
	tH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K6iMHC0pmlIxDHcsJJUdIJdW4NmRJNcrFyFuUd5hD80=;
	b=V14fQmWnx59gPhAtwZjravcNHkotT6iI/us4cfksWIzEWTA4MBNeUwvDN+q4nRJeYg
	WXjbnPbhJdSKERORTLVeMYlPkqPA8AVayZIp6WT1ePIW+4ArsCvx0MfJfwG7z3MbuJIO
	4cyfvNk2oIkcfjKc8nTjNY/d20AasPPlOKLfF2cU0msdmJPQGCjiz/eB6u0mxOIMWbz4
	/4dGUOWxNP/P1d585COtQwhdW/5bN807KsTsTggbeBY4eHW07bPEtxvV8pF5d2nvaz5f
	/VdJHj/K8bOPRYQ6cqYMJsUsdySOMb++IWufzReqWzVAu39Kl1rf6jWce2Q1ntEih5j6
	ne2g==
X-Gm-Message-State: APf1xPDqXE4ApUpcQN2Kys5UDS/OqWxqBvMaxNdo57+vKfmrrEZLtQRH
	bUjhS416Y2hN5ONnIx+PkzTZ0Q==
X-Google-Smtp-Source: AG47ELsPKA2avjUt5jHOVR8rMQwIxO/4m0oufB3i0rHo6vEcWuZ270OgfFl3mQP6Lo2ASapcen/eEA==
X-Received: by 10.99.114.77 with SMTP id c13mr18809427pgn.286.1520449302923;
	Wed, 07 Mar 2018 11:01:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:13 -0800
Message-Id: <1520449275-29492-21-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 21/23] libbonoboui: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:41 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index b3ca0a4..8e3169e 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -3,7 +3,9 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-inherit gnomebase pkgconfig gtk-doc
+inherit distro_features_check gnomebase pkgconfig gtk-doc
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://gcc5.patch \
             file://0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch \
-- 
2.7.4


