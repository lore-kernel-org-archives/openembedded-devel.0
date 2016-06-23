Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 736FB6FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 16:03:44 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l81so16607585qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 09:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1YnkNV7qYlnbLqKwdC8fX6Gben6SjlyYJ4mev+9qT+0=;
	b=IuoH1ZnVmm0IA7hKfaVE/6bD0pFSlKGbxW7fh5FHgw1FZ7piN8I5f9hMtkREuSiria
	3EhMklOYtLnzdT5Q3RlSldjX68K9AfwApiPZoU1O3lL6ZClG4a37cC7gBiOU0KMI2Jeh
	hWzlvXC+Uyz/tVCOqLcEdP3hWI6izctAayCE1RIMsrJEKLZXR89aWDuT6xvgJd6mXwhq
	nWzohXMj7xA71oxrpBAoUnHnDas/9990Z9US38VqoKb3NF/pWF7wKi2EZhbTGAYox32P
	56WuVMxXkIgDYNEyqKNyz1p3QpbSOm1tXNPnwdUPUXEnwqmMtafl2gMuQrgQdRPhKBjE
	gf0A==
X-Gm-Message-State: ALyK8tKwEcLf3Girs88B5VC6DUiJPQXx5yMKtehDZWup50Z3d+FgHPwYbCbxmK4qu5iE3Q==
X-Received: by 10.55.207.74 with SMTP id e71mr45396381qkj.64.1466697825108;
	Thu, 23 Jun 2016 09:03:45 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id l37sm304795qte.41.2016.06.23.09.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 09:03:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 12:03:38 -0400
Message-Id: <1466697818-10178-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyephem: update recipe to use the pypi class
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
X-List-Received-Date: Thu, 23 Jun 2016 16:03:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
index b7af687..2e97013 100644
--- a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
+++ b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
@@ -4,11 +4,10 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
 
-SRC_URI = "https://pypi.python.org/packages/source/e/ephem/ephem-${PV}.tar.gz"
 SRC_URI[md5sum] = "405a109f3017251ecd8c2890d850f649"
 SRC_URI[sha256sum] = "7a4c82b1def2893e02aec0394f108d24adb17bd7b0ca6f4bc78eb7120c0212ac"
 
-S = "${WORKDIR}/ephem-${PV}"
+PYPI_PACKAGE = "ephem"
 
-inherit setuptools
+inherit pypi setuptools
 
-- 
1.9.1


