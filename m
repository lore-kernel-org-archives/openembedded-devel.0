Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id BC7427E6EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 17:31:49 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id j29so12806712lfk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 10:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lHoJfl62NR3g6/L7uNs08wN+amufIK1AcglRx5MHu2k=;
	b=f6wz7KLddRXnUH24E4nSfjwNxweigPn8dYxhOWMFIFRkkLZ7gSeMuaGs7jYBHxh6yG
	q6OJ3Ge5WkYwmNnehwvYkZO5jgqHT7z4R/8AJXOPWItbrHx+H2avKZbSiuEImFjWVsAF
	DuS4stU9tU48fXOnQXp5mkaHnfd4yWxzBA+qzcT1nG1OJnOaahmoNAXOs4+SKFJYM7Yu
	qRg3pM6Mmpl8XXy7VpB32ZD5CNi1oQ9UU8qldzPhyWv8tC247YZvdiTAZY7md6YuDwNN
	mR+HC1T7NIe/03XEKse2k2fr6Me/WgLDVFFVEARu9DpvPjWRfldZDc3JeZfqqove55Bv
	Gd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lHoJfl62NR3g6/L7uNs08wN+amufIK1AcglRx5MHu2k=;
	b=j6J2VN66y77HrfzvWRouLab9INa7xTMP04rvoORTeqSYKc+NMU51s7lLPu31i0cgK5
	PdLBfnz8LdLWzBSPDh6WtZ+1VbPo2gfZtbcqa0/SR6LaL6T5/791b9/tPrUe0ap/Vm6G
	RA4QAfS6uLzB/bv4QeGdUfqNnpbAK2ydyy/wQKvfp3RBF0ruiSFwlpwP2T1lJ33nOCD1
	2I6roM49f0HvlWyZAbtfz/mXbgv5niUYQzwTlp375H/M5HhZE/zPqwPSxP+IcO3ACzMZ
	f+LmOwptXFNA6gCOx74kob1iXNc/0UNWkKhtdOg+XkJGw8eZ4kJOzC72q69tJlPUtSvB
	N4NQ==
X-Gm-Message-State: APjAAAWEFAspKvgPthneN0buwRxGM/9b0lExSg7BIz76R4yaUSqWHTpO
	iyskxXsVTl3VTFuxTAqFL6ovGbDOQaE=
X-Google-Smtp-Source: APXvYqybgUbdWviX5UBXgSY7iUJpltoJTi4I56Nr5hd+7GveaQ05owkkVVHp+RagVreyHzrsFE0eIw==
X-Received: by 2002:ac2:5601:: with SMTP id v1mr28228075lfd.106.1560360710017; 
	Wed, 12 Jun 2019 10:31:50 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id u18sm79091ljj.32.2019.06.12.10.31.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 10:31:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jun 2019 19:31:28 +0200
Message-Id: <20190612173128.9582-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] nano: update to 4.2
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
X-List-Received-Date: Wed, 12 Jun 2019 17:31:51 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_4.1.bb => nano_4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.1.bb => nano_4.2.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_4.1.bb b/meta-oe/recipes-support/nano/nano_4.2.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_4.1.bb
rename to meta-oe/recipes-support/nano/nano_4.2.bb
index 1fe36cdb0..19a8b4782 100644
--- a/meta-oe/recipes-support/nano/nano_4.1.bb
+++ b/meta-oe/recipes-support/nano/nano_4.2.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "235eaf7d27db3c3679b2054361ff6181"
-SRC_URI[sha256sum] = "86bde596a038d6fde619b49d785c0ebf0b3eaa7001a39dbe9316bd5392d221d0"
+SRC_URI[md5sum] = "9ef42650960fa71671dc5318841a27a9"
+SRC_URI[sha256sum] = "1143defce62e391b241252ffdb6e5c1ded56cfe26d46ee81b796abe0ccc45df9"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


