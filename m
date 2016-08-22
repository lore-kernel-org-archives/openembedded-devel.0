Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF4F773259
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:02:53 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r128so8982988qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qztwydaS+BwMRUZexE7YhwE9blQBJErbnPaejPfRy90=;
	b=lvwkMY7WAWwSZHeHTYBRWFTgOTMYo0gPt6FBcRPvxJTbyVjIt2Pk6YEdo/koQkPYlk
	dSVmuhhjibZv5GSxvxuCorES5rKiKR+s92Lr63ZEecMXuqgK6f3A/oQrTryluhMMFm0c
	PKwR2pYgdHmi7mul0EtN0/8I74rX2pq7gB7DBcJVOCVNGWY1sfuiUewb3ibzYCS7XBIL
	sfPdMpbkfpapDx5ANIPjOq0x2Qy8aurL+goY/oazis266E8W124A83CjzJA0we+ePFOF
	0To4reXVF2iUwDAvjJ6nWRgQhdvODGayEPRjcYRUIfressWyTGzoKAg9FN+OHZ1Yl2H0
	Qd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qztwydaS+BwMRUZexE7YhwE9blQBJErbnPaejPfRy90=;
	b=M818udLtFV8imacWbjO1RrNXu4dzHKtCI9OyNc+3nb5Q8GRGIxPAmaIrlUcUc/LvKx
	6PlQsZDNipOvQLFJbYI68jFpTNp8FRBnIUA+zOwqLqgvZu5+Ip3hJedHNDChZM3wa4ri
	BYfdqwohMM7TcI3qSn57Gsp5sOJFSO2wlcbtmsCmzT/HdlzB97J1Z6h4hvdP0L/JVGBn
	n0MePFwBdPhOtOsVQyypTOgFIW4PL2lTSGsAc3PGJYvINF5Wr/LAxEUrNVJ7pyy9uam8
	vEorGa6I7kfzKNh0JEL7WFU+NfqgbbM9W6H29CuJ+rg3forEBdV677UOvDhq5nfA/H2a
	pwdQ==
X-Gm-Message-State: AEkoouurmT9/91lwiH2IQx6/2sDCDkFNvvQ/eptBhL+t0vApDXrNo4RJHcvHb42Qk928yg==
X-Received: by 10.55.126.194 with SMTP id z185mr25800370qkc.140.1471892574085; 
	Mon, 22 Aug 2016 12:02:54 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:02:53 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:17 -0300
Message-Id: <1471892491-6177-3-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 03/17] python-idna: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:02:54 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-idna.inc     |  9 +++++++++
 meta-python/recipes-devtools/python/python-idna_2.1.bb  | 11 +----------
 meta-python/recipes-devtools/python/python3-idna_2.1.bb |  2 ++
 3 files changed, 12 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-idna.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-idna_2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
new file mode 100644
index 0000000..8e1fcb4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Internationalised Domain Names in Applications"
+HOMEPAGE = "https://github.com/kjd/idna"
+LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=134bdad79491c37bdae32811572b4bc6"
+
+SRC_URI[md5sum] = "f6473caa9c5e0cc1ad3fd5d04c3c114b"
+SRC_URI[sha256sum] = "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-idna_2.1.bb b/meta-python/recipes-devtools/python/python-idna_2.1.bb
index 90f47ae..2dcf72a 100644
--- a/meta-python/recipes-devtools/python/python-idna_2.1.bb
+++ b/meta-python/recipes-devtools/python/python-idna_2.1.bb
@@ -1,11 +1,2 @@
-SUMMARY = "Internationalised Domain Names in Applications"
-HOMEPAGE = "https://github.com/kjd/idna"
-LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=134bdad79491c37bdae32811572b4bc6"
-
-DEPENDS += "python-pip"
-
-SRC_URI[md5sum] = "f6473caa9c5e0cc1ad3fd5d04c3c114b"
-SRC_URI[sha256sum] = "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676"
-
 inherit pypi setuptools
+require python-idna.inc
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.1.bb b/meta-python/recipes-devtools/python/python3-idna_2.1.bb
new file mode 100644
index 0000000..a08ca71
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-idna_2.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-idna.inc
-- 
2.1.4


