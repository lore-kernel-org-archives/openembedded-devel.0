Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id A0A6360E22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 21:52:39 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id eo20so109001lab.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ezuRgizzO/sf0FRZvSXyDls0KvOJbOlMMMlsrXvJ7aI=;
	b=sun3GmTYuN9MRIGpYILkc/RIB069XMHwks0UwYmJnp4PgG5Z+ohzEaadQ2LUEC1+UO
	TxwEs6z/xAij5S4rgvNgpQlNBqAZdEubrsNqcz9BDwGzS5OAJaqyXElXegGcT+o2xFYo
	HRZYmFAsHBjHqTrjgiT96VBGJp5kDASlGMNJ+ODwE9SfOxl3dbhmiJWQgZ3mpXrxwgUK
	D4L85GYOG45u0bscbNumNOYn1f/QJ9NaXU2YIEc+zz3+1INmXoN+fZlsIZ54hdbTBvZd
	k0fDiDiTQEYs8PcCSInzw+V/9jIjCAtkKYYz2SKhncq8pxyV5+4PXw1aj9IghvTpJgRX
	VQIA==
X-Received: by 10.112.137.229 with SMTP id ql5mr12032lbb.76.1387403559595;
	Wed, 18 Dec 2013 13:52:39 -0800 (PST)
Received: from nysan (c-5eeaaa31-74736162.cust.telenor.se. [94.234.170.49])
	by mx.google.com with ESMTPSA id e6sm893376lbs.3.2013.12.18.13.52.37
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 13:52:38 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 000D71C1391; Wed, 18 Dec 2013 22:52:35 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2013 22:52:34 +0100
Message-Id: <1387403555-26615-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-oe][PATCH 1/2] ccid: Fixed broken URL
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2013 21:52:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta-oe/recipes-support/ccid/ccid_1.4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
index 5524f9e..e70ec39 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/3768/ccid-${PV}.tar.bz2"
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/3768/ccid-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b6c37110f50b059a8ba94f118cfd679a"
 SRC_URI[sha256sum] = "7aca09fa4b9099e423402fd5df424adbafa502888710d1fda6015b6c1ff637ef"
 
-- 
1.8.3.2


