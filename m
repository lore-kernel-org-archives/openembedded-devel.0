Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC4496FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 02:37:44 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id l125so2257790ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 19:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rx3Q2P+qzJ9cW76656ww/rEDorXoe9N3GyqS2dd/4ws=;
	b=Lx4AEOFxe98LpfnWluz7OpxLj7Iv0R+aMi2azmh6lVAl+05QpfmExVgb28hrfhWcTU
	RDeZH8Mbfg5Zx0X31ZjluLlj3M3+L5dQhvp/e4Mp9gW+/pb18k3uB1mkOdOTuk264838
	pFoENOhFFbdIUZ9Q7+AUigugakTYghUHhd3knEjxtt/6ig/SB0CVnDiawoHMyrHnRuAo
	1aq9+mORzTLL3k3iCmKIb/ZT3UTxjn/OdxpsnDrimsv7fQ5xnrL93PI56hIlvreFvklf
	jlO0EQp5puhWZ8lEDGEGsieHhT35hv9lKc5OFEZ2uAfYdsybIfCyNJK5HT3lC0Hw0A3l
	IVAg==
X-Gm-Message-State: ALyK8tI35iezQOo+63sg/5zEXMS9b1PftHlBIpKkgLnDXYOoCdUzAlyBk4glf0cd93hJgQ==
X-Received: by 10.13.241.199 with SMTP id a190mr4078371ywf.54.1468377465657;
	Tue, 12 Jul 2016 19:37:45 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id
	h62sm6738582ywd.46.2016.07.12.19.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 19:37:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2016 22:37:36 -0400
Message-Id: <1468377456-5886-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468377456-5886-1-git-send-email-derek@asterius.io>
References: <1468377456-5886-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cffi: add package RDEPENDS
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
X-List-Received-Date: Wed, 13 Jul 2016 02:37:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
index 6f4d77a..155b085 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] = "6ed5dd6afd8361f34819c68aaebf9e8fc12b5a5893f91f50c9e50c8886
 
 inherit pypi setuptools
 
+RDEPENDS_${PN} += "${PYTHON_PN}-io"
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


