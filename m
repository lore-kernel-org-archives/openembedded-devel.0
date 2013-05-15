Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdq0-0006n9-9r
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:42:10 +0200
Received: by mail-ea0-f176.google.com with SMTP id k11so1021079eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=wmSrd/zpi/f51islkyIS4Fdeqj5oKyPI3bp8n/0TOwk=;
	b=GzZoNLSTpa9fdVXjfRNqLYOPgEwaHSrQ3ocoOMxdMVhTHQGmME0X6Md51gx7pokzNp
	PoTY+Q/np0+I0TjnEDQkaxxKsogBWWgSFcetiI5iVuVNIUOfSYDVdFHWFf/ykoOFnqPu
	DhHOuEVo1iq4/fWlIIVHUi0Dwk8I70Q8TJEAgBqKNbW7oUdA5X6TuH904Hi3XzYGfau/
	C9LobZtzEEh6I7UBwxFEbDYKiygZzjYYxZ0hLUBXf8hUiVB7FHsfx93gp49U5FPyet0f
	ZR0aiXQdm+hkoDoU/d9bR/T4JSr16N5hb2HnmvjYdcWtUA3bs9GPmrCyYFwhNg5MjN8F
	8WxA==
X-Received: by 10.14.3.4 with SMTP id 4mr45482142eeg.8.1368631423750;
	Wed, 15 May 2013 08:23:43 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:59 +0200
Message-Id: <1368631259-13401-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 14/14] xfce4-appfinder: update to 4.10.1
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
X-List-Received-Date: Wed, 15 May 2013 15:42:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...pfinder_4.10.0.bb => xfce4-appfinder_4.10.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.10.0.bb => xfce4-appfinder_4.10.1.bb} (62%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.1.bb
similarity index 62%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.1.bb
index 25c2515..f2d688f 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.1.bb
@@ -6,5 +6,5 @@ DEPENDS="glib-2.0 gtk+ libxfce4util libxfce4ui garcon dbus-glib xfconf"
 
 inherit xfce
 
-SRC_URI[md5sum] = "799f70a9ad67b450da67810a5107e623"
-SRC_URI[sha256sum] = "042aae7e366428a6a92b6353b3f2727d64823076a7752b8e0a15f1f8f3645439"
+SRC_URI[md5sum] = "bea253956638e2df2dd950343b3b1b7b"
+SRC_URI[sha256sum] = "65ee74ffa76334d273e4c9ae501ec7f81f7de028813849f7d1441cbf7788eb77"
-- 
1.7.6.5



