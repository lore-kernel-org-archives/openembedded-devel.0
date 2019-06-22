Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id B715660685
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2019 14:55:27 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id m23so8508168lje.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2019 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pbMrzCL+1HslfgCF0QAFbnQBqCdv0fA+ieCCDg+j/2g=;
	b=LesRAj2fEMjtTTDxfD8fZ5t1Z/f9G6bxwKocDY/7IKai7meCcFLdFejK2/ad83LIQZ
	KMn7EWvA+avorIuE8YYxM5GCg75ww/tvTXLfJtitmsiXcPMXeUqjwTl3HJQLH5ddfB+1
	nQHPIIgnQzxW/0cflc4kAYdqBFZ0Z3xh3E4Sn+R+x8xJYNvZ7xsSc65qPmESFjxzvsjw
	XYQlkPvxa8TjdRdtUJE3dL7CjZ2N1l/Pk6YocDTZlfhGnUDdFFGxbcqqoHz328lJPQ+1
	B7B40YBKhrZ/bCSkRsZs5Zk/7pdX1xuscdUhzzYmpSMgkrKKtZHfvxhlLzsmkUj9PiIl
	SEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pbMrzCL+1HslfgCF0QAFbnQBqCdv0fA+ieCCDg+j/2g=;
	b=QfWxuQtUZl0LOs/tDNoiohQ/aTbpoUn5oLZ0xvk4Q8nkzcFmQHXOem7m15C3C0+8Qf
	sAIAxSDk8ja7fAh+GnrPzTX6TalJqNSx5yjnMpU6dphHhnvlYkzr4hza81+/6BnxivUU
	OoYHw66yMYRvlw1KEX0J0TUyFttzGplkJuDLZSZcCYnr72OjW1irLCafcbvB9lwKD9kY
	x/qMKYEgS7u/HDeX3klt5xqN42VGowaUjiXedE9XTBXyPMa14+U4qN+vWiFdJc2RfE3O
	IkFkxU4BnMdlUHe0sAHtmKehjLAe2nbvafa+P0dsyNRIXq1gz+3ZDEzf838EyHcvdozR
	1h3A==
X-Gm-Message-State: APjAAAVr/fmBBrjHIkS49KKNN/iHrRRfr/W1D+LL9PTVQgxkW97sBaTz
	Zkj93kepEimG+xDf4k5Y/WcG3ZilpJk=
X-Google-Smtp-Source: APXvYqx9YK6S9ROrt0qKKXvyc4CteKkvStT37L8BnW2nVDr/7cGWmfCWH8w+w8G7U2UTTiYUjxTFpg==
X-Received: by 2002:a2e:29c4:: with SMTP id p65mr47838553ljp.141.1561215327541;
	Sat, 22 Jun 2019 07:55:27 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id s14sm865556ljd.88.2019.06.22.07.55.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 22 Jun 2019 07:55:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2019 16:55:25 +0200
Message-Id: <20190622145525.10102-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] nano: update to 4.3
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
X-List-Received-Date: Sat, 22 Jun 2019 14:55:34 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_4.2.bb => nano_4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.2.bb => nano_4.3.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_4.2.bb b/meta-oe/recipes-support/nano/nano_4.3.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_4.2.bb
rename to meta-oe/recipes-support/nano/nano_4.3.bb
index 19a8b4782..aa773bf75 100644
--- a/meta-oe/recipes-support/nano/nano_4.2.bb
+++ b/meta-oe/recipes-support/nano/nano_4.3.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "9ef42650960fa71671dc5318841a27a9"
-SRC_URI[sha256sum] = "1143defce62e391b241252ffdb6e5c1ded56cfe26d46ee81b796abe0ccc45df9"
+SRC_URI[md5sum] = "23f4f7b5c0d1f04ad555960dc294f2b8"
+SRC_URI[sha256sum] = "00d3ad1a287a85b4bf83e5f06cedd0a9f880413682bebd52b4b1e2af8cfc0d81"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


