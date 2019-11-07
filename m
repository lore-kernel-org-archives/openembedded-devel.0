Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED527F7C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:15:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c17so2038049wmk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WCNjsAezh3UkUpqO0NBmxCs99b4PEfMImXu1hIK09gc=;
	b=W8ZTGbNgNj49mo+AYk48QgUfvPLaeCtxs4fQWlvGxJDzfPJuPlQ5srbNhC7CPDiDEM
	ALCMggza4xgq2Kk/5MGOTkmd6TY8wjypdheglxOFqjxQLg1ydt/gYSSXpg1azcjX8l8u
	nHGWJ8abS0hvfXBWTOMANdBmvPpFEzZAeQrkfwnJiAN0agk0dLMKNS2OYU17UnnRgtv+
	m4s8oxveKJRewx4iWsDWijuUMFbMrdMgJmSBo4wNGt0oTZuz39hVnNoPrQoHHeTWl31U
	2NVc6kXAXCc0PLL/fpOszXlExVEFVmK2R5G6Cn/axA1WlaVJH4Z62Q0TnqvrUZeSbYgQ
	EU1Q==
X-Gm-Message-State: APjAAAUoQxnUqP+Evsj+pn1EYzQuAkm3bb/ofXEVlYYUqq87ETaxJgnv
	XbtOIhLxrh1cpEwnjYAXUWkB8B5u
X-Google-Smtp-Source: APXvYqz5IQPbdiDtDmq6A4mGkIIS+YVhobs0uHur8zup5Oo7jpdjZIRJIYsHlOK5pxhIXN89cUvLmQ==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr2153212wmd.171.1573125338685;
	Thu, 07 Nov 2019 03:15:38 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id d4sm428610wrw.83.2019.11.07.03.15.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:15:37 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:15:35 +0000
Message-Id: <20191107111535.40523-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191107111535.40523-1-git@andred.net>
References: <20191107111535.40523-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] libev: allow to build a -native package
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
X-List-Received-Date: Thu, 07 Nov 2019 11:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will e.g. enable us to use it from nghttp2-native

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-connectivity/libev/libev_4.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.27.bb b/meta-oe/recipes-connectivity/libev/libev_4.27.bb
index b72b7af4f..be4536b9c 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.27.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.27.bb
@@ -17,3 +17,5 @@ do_install_append() {
     # still basic so drop it for now.
     rm ${D}${includedir}/event.h
 }
+
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


