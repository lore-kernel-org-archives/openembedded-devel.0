Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 02D4F71D99
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:26:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x35so4293551qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BKCjNCycTtZ4DIuWrNs23tbAXZuYKuxDZoCqxg+Y5Sc=;
	b=iZgrbsl1eE0GpzBWRFnrZqVmLVu+SwOc6bggUUZ3wXuUf9+0AiiMlMNtMSOYoyVPzx
	MGeDOEexKK2oSiHnP+aaiyM84H05bLJqBA5Zkt/bgieKWaLMySiS2Y+1/C9lgFA5wWTE
	6eE5jlDof4jD0cl+NuaambhYNxrFgZ3XQ5S4vMtJ3auJanzZwgXUurrP2PywNFEmyYYN
	hu+I5SWHVafal2Fmc4QBU+gT2imwmLTKjqhI3KcfOl0YJU0ilKMYoAptRLXHmwyD00Mo
	eHsEOYag4xqRC7+XMEUCY22jXWkycPqt5RQySOgqs00rys4+DGZpgHIyMqhr2zWVk09M
	dNLg==
X-Gm-Message-State: AMke39kNsA96ge2c4QOO0DcUaQjgZoux3YMsxBVVtXKnp9I73RzTxPY9QESr1Ox4wAT2Ow==
X-Received: by 10.200.34.206 with SMTP id g14mr9451348qta.43.1487615181942;
	Mon, 20 Feb 2017 10:26:21 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 45sm7165735qts.40.2017.02.20.10.26.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 10:26:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 13:26:08 -0500
Message-Id: <1487615168-3295-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] python-simplejson: update to version 3.10.0
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
X-List-Received-Date: Mon, 20 Feb 2017 18:26:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-simplejson_3.8.2.bb => python-simplejson_3.10.0.bb}    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-simplejson_3.8.2.bb => python-simplejson_3.10.0.bb} (64%)

diff --git a/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb b/meta-oe/recipes-devtools/python/python-simplejson_3.10.0.bb
similarity index 64%
rename from meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
rename to meta-oe/recipes-devtools/python/python-simplejson_3.10.0.bb
index 0c9112e..75ec2dc 100644
--- a/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
+++ b/meta-oe/recipes-devtools/python/python-simplejson_3.10.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
-PR = "r1"
 
 SRCNAME = "simplejson"
 
-SRC_URI = "http://cheeseshop.python.org/packages/source/s/simplejson/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "53b1371bbf883b129a12d594a97e9a18"
-SRC_URI[sha256sum] = "d58439c548433adcda98e695be53e526ba940a4b9c44fb9a05d92cd495cdd47f"
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "426a9631d22851a7a970b1a677368b15"
+SRC_URI[sha256sum] = "953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


