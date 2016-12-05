Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id E8A09719AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 23:09:02 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so41423352wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 15:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SJ30VTXMwSIe422sYrdklmx/1t4m0VuaFF7sno133fk=;
	b=WucBrMHuQV4qcz4SPvHE59ZEYFHHrJcQesm8ewe05sbeBK4uM7Su7/khN+/EB6iXTG
	5OW2G/i7GbQt+AJf0E25E4nK+exRjFqr7lRp8w4qNBfWlK6xiCB2FIi1eF8CU8yL/Tmv
	IojucuaoTqp/+R/eYghmFWhu+x0PgJuyhrg5EUMhaLnbE28oFx2vs3UfygrCdk517y2D
	RTkkrHMrkQ/NC6cM6yXuOLR/Sd4VM/hWoZmCxHAjR8R24bhFmc9ZpVqTq3XZuAWOpcDs
	E9swDesmWxsUphGe+C1myBucT7voCtjKNlMhKShOcPX9dLDg2JBqBs3zcpdcuUZfweTJ
	9HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SJ30VTXMwSIe422sYrdklmx/1t4m0VuaFF7sno133fk=;
	b=NYugRWK3Eqo2FUdyTnzsfaNyKDgPl8fDFHEAPO3MV95W59muJttGa/WfZDLkFGttM3
	nmsM7F4sh52jcvKf+nUG1uRHje2Ryg6DqguPB3mCm9zmELvLmww1kXHGObwqjo5HCSsZ
	TWR18jwFf4fqodljQLtGmBP7uSGBidkYV2TEzqh4IE2nm/QpqoLAXeClFk8mdN2UWg5j
	EWuCmjYqioaCrf3NT7vATyj81Lfjn+HgWHvBQBz8Y25QDm8zkCm99a+OMCcuP4caHfTx
	XeqF/dyrLu2SyD8Pvz7YrDBd1bvCoeseXuLpdGLdEep4vQmw8tsyG6icg0SVAy8vzDwU
	VM5Q==
X-Gm-Message-State: AKaTC025iaqvKIpBW/V58QKa6lEniGKrSDYCAHU4vpijAumds4Zfj/2IFtRIJIGWdyuNWA==
X-Received: by 10.194.113.129 with SMTP id iy1mr53842010wjb.127.1480979343518; 
	Mon, 05 Dec 2016 15:09:03 -0800 (PST)
Received: from localhost.localdomain (p579F7D52.dip0.t-ipconnect.de.
	[87.159.125.82]) by smtp.googlemail.com with ESMTPSA id
	f76sm903749wmd.15.2016.12.05.15.09.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 15:09:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 00:08:25 +0100
Message-Id: <1480979306-21331-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 1/2] exo: fix build after perl update
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
X-List-Received-Date: Mon, 05 Dec 2016 23:09:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:

| checking for perl5... no
| checking for perl... perl
| checking for perl module URI::Escape... no
| checking for perl module URI::file... no
| checking for perl module URI::URL... no
| configure: error: Atleast one of the required Perl modules (URI::Escape, URI::file and URI::URL) was not found on your system

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
index c145ce0..733ba24 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
@@ -24,6 +24,8 @@ SRC_URI_append_class-native = " \
 SRC_URI[md5sum] = "866292556586facb034191aa66431697"
 SRC_URI[sha256sum] = "c70c47f690284a5cb4f507dd89088efbdd8123506f924e33a5f97aab74eb97d4"
 
+export PERL = "${bindir}/perl"
+
 PACKAGES =+ "exo-csource"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
-- 
2.5.5


