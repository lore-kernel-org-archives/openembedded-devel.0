Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 357ED6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 13:59:49 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id r184so60346671qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 06:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Nor0S/6OrU7QhN/ZVqVgBfLpCspJ5zwqDrdLj97I0JA=;
	b=eg9MvbMMQpoVHHpR03IqcmVY41xMvTH1uoa3L7BdR5dSSn1YjXEKXJN7KlNKlGHJdZ
	mTdBYiDZHbxw6BtfzpEQd/ncIwSN5ua4de6rwhJ1qb6yTU4jWrzQiO3Kq0UsjSA7ZKif
	XgSRyZcJRcDDcl+Dl+DgRjeoOJK4bRJHJVhHZUp17qLIJpzgZMSQHV0QZQfPadmSF3KD
	B9486onJjQshUUU1dF9UinX9j88vqLZJ4Jt30bNRCBgRo91DrkVR6TLriol3kZ+I27t4
	fuEXLDS5ASKAScWPTltIGEY+GbYOiS7Tar1VeruOBBc7I00vsmX5cd/7nCMx0UQ+2KEq
	WjgQ==
X-Gm-Message-State: AOPr4FXJcUGBgjf/jommiTYpITY54Qo/7RVQs1fmrtD3s1RZyb9wlhUsCOxWjFXQ7pG1WA==
X-Received: by 10.55.76.15 with SMTP id z15mr20377739qka.32.1462543190488;
	Fri, 06 May 2016 06:59:50 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	q128sm3530569qhq.9.2016.05.06.06.59.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 06:59:48 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 10:59:43 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 10:59:22 -0300
Message-Id: <1462543183-7080-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe backport krogoth PATCH 01/22] net-snmp: enable ipv6 support
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
X-List-Received-Date: Fri, 06 May 2016 13:59:52 -0000

From: Zhu Yanjun <yanjun.zhu@windriver.com>

Add packageconfig for ipv6 and enable it when it's defined in distro_features.

Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 1a50932..ee8878f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -39,6 +39,9 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
 PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
+
 EXTRA_OECONF = "--disable-embedded-perl \
                 --with-perl-modules=no \
                 --disable-manuals \
-- 
2.8.2


