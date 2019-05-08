Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id DFB817D716
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 00:15:18 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z5so10783927lji.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 17:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=SM6OmZFpUDC+bKsijYEj4JKCky2IDyDj6nGcZ/oQYMg=;
	b=Ap6nQA3FVZuqmzHcebiemdcwQtkxMn0RaMUfnXR17w/tZbP6Jj7YLk2nIDBxLW5GFd
	mkpW31KhvXQJKdxT0wTIqKPI9sgPBt2c4GNM2bqdRQZcujY+VxnIP3YY0ORrQlXh284h
	8bJHa7Aks/PwGQwiF2gkCYbrka2ckuab0+HcZtd5r+cX3au9SxGOiyTBqcmej2FJf7Cf
	+BWJiaxog4iX6B0UATxC6zgMxdVTBombBbWGfgjKvLbYlPnWsd25DGReW0Io6EjfyCgH
	o6GqcCr1jZMkT4n+dfMhPG/ugl186reiyRfQLOCLfc2IpW8z1wND2ACfXk39wcDITJ6k
	8nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SM6OmZFpUDC+bKsijYEj4JKCky2IDyDj6nGcZ/oQYMg=;
	b=gY395SOVbn+RJNezZdO3Ifqcg0zsmn1pheZ2xLySqtRHpr+Jns0kQRXjdv4MViRcjI
	5mhmIFyMdHZkfzVXdGVAK2fWiClKlfzwqBI5qKoxIKAAFwdhIQl0EnoEjK+xl1qSv0dw
	Gje/Po4WIJATmBnhIAv/v7PZxUPOBdDj7KZKiYTS61gWsYRlujnjzXCTYW9ylrVUt9IP
	5v2MtsvlHjiOb1O7SFacrQFgJlkiGFgVJy5YOWPDn9W/20NAsKnSGpBgbwVzla9RwT4t
	MbEcbVZgx6D4O4WA1sM+twzkTMi1HbagczosNsXQqByhwddWrIbpWCVQ6/sBfXfAgMqu
	5pyQ==
X-Gm-Message-State: APjAAAWKCPBE9pYMAWra4CAzHX2ys7VkVHBX4nRT8GCIJLEPWYvJMWJT
	XiNvHFEB85akxa1XlF80/vXq0KHAGHo=
X-Google-Smtp-Source: APXvYqznhGJqcmHcChYQb2A2JILFEsDeHjysQHAZLhe52vgKiGuTbM5foH6qzg9DSqKizi+JtGH2iQ==
X-Received: by 2002:a2e:88cc:: with SMTP id a12mr5320715ljk.55.1557274519163; 
	Tue, 07 May 2019 17:15:19 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j19sm3605991lfj.52.2019.05.07.17.15.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 17:15:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 02:15:16 +0200
Message-Id: <20190508001516.27852-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] opensaf: update to 5.19.01
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
X-List-Received-Date: Wed, 08 May 2019 00:15:21 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../opensaf/{opensaf_5.18.09.bb => opensaf_5.19.01.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.18.09.bb => opensaf_5.19.01.bb} (95%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.09.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.01.bb
similarity index 95%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.18.09.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.19.01.bb
index f1aedc4de..3e4d33e00 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.09.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.01.bb
@@ -29,8 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Fix-string-overflow-in-snprintf.patch \
            file://0008-check-for-size-before-using-strncpy.patch \
            "
-SRC_URI[md5sum] = "45044fde0b35eac057a5fa05c27b8040"
-SRC_URI[sha256sum] = "230a0ea628ba278170a913746c39b2c8cd529d7dc25326b2e17b5c095cf94025"
+SRC_URI[md5sum] = "d9f44f778e23cf739085f74c5ff793b1"
+SRC_URI[sha256sum] = "5713fbe21c557c9a992af6805bc44521f2cf6cf950ae873036d9a81c73364b60"
 
 inherit autotools useradd systemd pkgconfig
 
-- 
2.17.1


