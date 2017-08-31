Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 59D3F78400
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 14:48:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t3so603864pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WwgMsbOpo7q3RmQadLX3sUzUGpy5dprp84s/l1NxKAg=;
	b=GUh376COhl+JUmXvG8PE3nrkHv1pVEbM2BIoF+UPg9a0wCXUNdNto4QslAM18FAHM2
	Hmg1KgAhxNWbabsB9TYXNuDKybT+KuETkGxrTOf3wQg/03i4TqRnMzFq3zFz91q0dmx/
	2taZ7kjmdV7leSjL4VtchOAP0b2r5jeDRS/uXfnPe+bfpVG6i5zXgwT6Nc57gmg9f0vz
	xHCWBY76v1rwE4zsYLvVxKjuaYwr0eFNNTuADYrA1jllz3zjsUGE1d+KxKDz9TqXQwKi
	OepR5HtmW8wolG3kXFbKXLd35/aEhzX+2WHH3MocGUDCZeUhsZFC68yvrLBdMkVOKQvt
	zpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WwgMsbOpo7q3RmQadLX3sUzUGpy5dprp84s/l1NxKAg=;
	b=nim7GY1aVcT+ukoJXx117FO873p06F2UMthtXlnjZkFUaXuUEl9BRw0GG6H/iz2gj3
	oYJffSHlKBltdJlqwUOzwllPLgfTtxxD8Wes+90CoOlBQhN+saw7eOfaSbC3bCVl/M3j
	tm3vWvtHBufcvuVVHLiGiWZ4rBv5dNRNOg+DwAvfcJbtc3LtK48U95Y8ufQwPJ4R8yru
	BzPyfClTMUxsgq11bDKzelheU7sUu9NG8ssZ66ynyqrVVK3k+t7JBhw+63x30NsHQKRV
	mQp6EczNVXC31iHKrUCKWxXs7G17sIFUNFu7ajz1+DUQ+O1M2cQAHJFih5R5I2/FtvG5
	ygIQ==
X-Gm-Message-State: AHYfb5hNM2hIgCXJyhofSRVxbno/1OQaJEvyjjDZ/jSQTQWJExzeqnTl
	ui5PR8lawORWB9Zj
X-Google-Smtp-Source: ADKCNb7VpsOM+9QJjA0YPjMzc1Zz8r9qD7aIUuyg6CkVFRtxC9dNG3ynHw7zWvCHatj+Q9MOnLjNiA==
X-Received: by 10.99.161.26 with SMTP id b26mr2601108pgf.168.1504190914383;
	Thu, 31 Aug 2017 07:48:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	e190sm13470751pfa.41.2017.08.31.07.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 07:48:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 07:48:25 -0700
Message-Id: <20170831144826.6048-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH V2 1/2] lxdm: Copy Makefile.in.in from gettext-native
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
X-List-Received-Date: Thu, 31 Aug 2017 14:48:33 -0000

virtual/gettext is not including virtual/gettext anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index c98c3a132..8e7efcdad 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb
 "
 
 do_configure_prepend() {
-    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+    cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
 }
 
 do_compile_append() {
-- 
2.14.1


