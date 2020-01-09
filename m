Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 487CB7FDDF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m24so4524894wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5mcyybu/NKyhyokAkS48FocFX6q+hu5a0UW/nupot3o=;
	b=hAGDJBi6SbEzjwyyyhz/Uo1zFYT0NaLrLYz3CH2wXq7oxzoEqwXqn5wedSb5yOyETh
	CWhnxqeLrvlPzPSxeL59p0Xv0ZQhKX5zTMiWtK424C4vYLdkWj0OzIYsl7rITB6ZtBaW
	OlulSATggFL7oD3ojR0/EuCZPxYSDS9gLH0WcwydSBoPqebFU02C9c/byce+pOT/7sOm
	3pGbGWZ8SXWGcZiejFJ7jNYuStKzQaa3gO0yKS9o3rbhBOTO1fZ6soMadYQ+gei+7X1I
	4RClpVaX1Uo20lx9z9ScFcBQCTbF01NaAij8fn7CusYe8j+tFd10mSfj2cimQznZ+gpz
	p9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5mcyybu/NKyhyokAkS48FocFX6q+hu5a0UW/nupot3o=;
	b=W7FScYlzfHSNwA3+46oTxEvr1QS7Bk5j4Itg3oVAFqpdxH4WSFyZCpcQdDO0gFAm0C
	GYXSboq7N20dIsUHGJ3blwhKfaUANDcYw3rElCFtTeAhUWay2UMxFQNOoms6Q+n1cVkb
	flpFdymhPWc9iqYjuZ1kbjBR6ElLgJ2axRfu4MEIeSjdL3/FwDEUyT59lKX4QXpBbD48
	O/nZnQQz3HtgbaelgI7qkmX4AUHzYj/BPqhI1qpuGnS7sAUbd2bwx4R2mTlSjgQ9b7Ia
	rMDbDmXUM4Z55wSLTSKRfyXA/HgUQQvChMVp/zoLom804VTA+Vdun1OgUYwpoOt0vuLV
	zs2Q==
X-Gm-Message-State: APjAAAW8JsK4f7mJjfdRKzkDm/o52mRJjZW/3E1mqpSuVKKw8mci06tK
	eY14GsSxrF5xJvagz0a7Lx8OaOCi7U4=
X-Google-Smtp-Source: APXvYqzrJ6YXtmZoUHZdgteh8qGJB6QRVQa865DL+QcEA/qAv7D8XcOa9OCemb4Kr6yGVbAGAfc49Q==
X-Received: by 2002:a7b:c946:: with SMTP id i6mr6784229wml.28.1578603929840;
	Thu, 09 Jan 2020 13:05:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:14 +0100
Message-Id: <20200109210518.22451-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] evolution-data-server: upgrade 3.34.2 -> 3.34.3
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Evolution-Data-Server 3.34.3 2020-01-03
---------------------------------------

Bug Fixes:
	I#177 - DAV: Ignore 404 responses on content refresh (Milan Crha)

Translations:
	Yi-Jyun Pan (zh_TW)

[1] http://ftp.gnome.org/pub/gnome/sources/evolution-data-server/3.34/evolution-data-server-3.34.3.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 0e58b0cc2..1eae3df35 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "7a0571ac358664c6e96accd3ac4cd245"
-SRC_URI[archive.sha256sum] = "3eb89f82eee042884a8d65737564fe48829c3ae187f067cbcdec2b088d2fe89b"
-PV = "3.34.2"
+SRC_URI[archive.md5sum] = "687d6d7242d60a8a3a3322eee6a45dca"
+SRC_URI[archive.sha256sum] = "d2dfac5ca76e05e872fbb06a57cae0dace64818c4dce1e906b0396888270c3a9"
+PV = "3.34.3"
 
-- 
2.21.0


