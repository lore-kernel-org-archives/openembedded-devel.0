Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpu-0006mZ-13
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ea0-f169.google.com with SMTP id m14so1161164eaj.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=rBBrYnF9fV/dtiKXcfJh7wSpWTZ59QuUfoHgkg9PF2A=;
	b=Hwnj5CbXxVVIRt4C2vlgVaAfw3NYfJKsdei11cjN5vaQ0j4SZZB9CIlu2HTaWbDdA+
	tESIRx6Gpmpsb7PAQbgbqkQRBBNfGI4SrPVZQPwAp7NuNGAtdTOxbBDC9+g/Yx/lFWNw
	aRJwjdueJ0ihSjC+jiSrE30rEs0i2j53lyl/R8xlgOGDRrSZPvqJEcQUzsNEkQarur4w
	/0wHrv6sB6TS4BIBR4t5NhHaoAnYb43HEktncV1mOtSsEE+cKvjyzZND7wEFY7aQM6q3
	CqcxOI9r4jtgXOB6QS/3Mzlz4VGVtNTydCCGle8Rum4ysGlLDWn1m3pUAc67v6pay86X
	lydQ==
X-Received: by 10.15.33.195 with SMTP id c43mr64917420eev.2.1368631417383;
	Wed, 15 May 2013 08:23:37 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:52 +0200
Message-Id: <1368631259-13401-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 07/14] xfwm4: update to 4.10.1
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfwm4/{xfwm4_4.10.0.bb => xfwm4_4.10.1.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.10.0.bb => xfwm4_4.10.1.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
index 5801c51..687339b 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbu
 
 inherit xfce update-alternatives
 
-SRC_URI[md5sum] = "333e5e25a85411c304e9b4474bf00537"
-SRC_URI[sha256sum] = "492357bf48121ebffabf2bf0d3b84213d19bf81087321175d687c8a68efe1f9c"
+SRC_URI[md5sum] = "10de50c79ed944cbb9c87741062c2a76"
+SRC_URI[sha256sum] = "380c44fba6eb779e34be0fe94f3726cfa131803014d6073c45aec8a1257fa740"
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
1.7.6.5



