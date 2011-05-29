Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXw-0007YZ-Of
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:08 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=cBLeOcRkXmaedIX4bHn7yeAZjWrb8QV//sHp+uHuBWU=;
	b=EU8Q//Rfa38MzeS5WR94lb6Qv6pzLQf3ZSH02+ZfHPWUzi0uL6QBhnQGhb21goEt0W
	DoWfu0wxbYeH9A/p21QtPm9HTLHitSZGPMtxzwdylCmvww0lBl6fNnNdvd6NUpSvqVG+
	HbV9OJ66SUib3dT7pqInGbQlk4DJXbB7HQKXI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jHObX13FdfNNcfbgL9mvEvsWlkQcXsdL3XbTE4DCCb4/gLsTjeWAbX8vb/jB5sTEIQ
	bbMrz/52v6PC7s7dpmpxMYoToEVLTSmKQ1zpeArHo3JjkpiRtwSBIyRnDqyl5KqtX6pC
	PL1LKWiLHUveWabmXAWtYBbzOAvTO0bnXYqeg=
Received: by 10.223.17.140 with SMTP id s12mr4780059faa.49.1306696683497;
	Sun, 29 May 2011 12:18:03 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id e16sm496257fak.41.2011.05.29.12.18.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:18 +0200
Message-Id: <fe62e20ac11e24b44b80eda1fd03a4ec55ac3737.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/16] tiff: add bbappned with native BBCLASSEXTEND
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 19:21:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/libtiff/tiff_3.8.2.bbappend |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend

diff --git a/meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend b/meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
-- 
1.7.5.rc3



