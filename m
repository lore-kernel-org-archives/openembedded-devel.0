Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E0E4C6BD90
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:23 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so340698eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=7ruHF3SZW3cv34pcfNjxiobdCdKMCIDNGdkTKQMFATw=;
	b=TweOwmRiLMMs7rBzhlfzTszRHaBomrECWIo+e0GJ7jOUvgVxYyEf8z+VQ24a2xaHqQ
	ThMpZbXS1z/8sQlnhn4AQ7kMAZEfOKx9xuYiZxx7zZ4DGSMz4xUzVNRh5MQgGYSRmZid
	KBVADEpEKL/irfSaMTCKc0OnKBDVNpjob6y/RKh7I+rAtSHcsuCGCqWuKryTy8ahI9+w
	QuM2K2IuwZkgNVgK6FFj2Q+k88rzViPXOt/+1Ow3peJxotBZ4kjxYIW/ZlafHBS1TaOb
	O0X9YnbxF7IlgidRYjfci+kchCaP5b4QjT+FR/ZKHXpEv4Lb8ROipd+evBFVJAWzPmBF
	MjDQ==
X-Received: by 10.15.77.199 with SMTP id p47mr5362840eey.50.1377791484370;
	Thu, 29 Aug 2013 08:51:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm47156702eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:19 +0200
Message-Id: <7196b4f737b3f268c55a03d1591649ff2e24c7b2.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 26/66] xchat: Add PACKAGECONFIG for dbus and openssl
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index d0a868e..4e8fe71 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -14,6 +14,10 @@ SRC_URI = "http://xchat.org/files/source/2.8/xchat-${PV}.tar.bz2 \
 
 inherit autotools gettext
 
+PACKAGECONFIG ??= "dbus"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+
 EXTRA_OECONF = "\
     --disable-perl \
     --disable-python \
-- 
1.8.3.2


