Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id CCF926B5CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:57 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so1922239eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cRXfdNeI7k9RAEaF3y0bAhBrO1XNKo5Z46xUj4e0AC0=;
	b=LmXZjJJ9XpoowuElYJf6lk0+cJOwKfYqLFwIROy8xwJE9ZnGqGUe8QiSjXKwrAnGAO
	o3KGCdulTXKhTcmOMl9xEXNPbUlSsSisRXWwnIUoxQFq7rsAUF6Qyp9GpWxToNVA51u4
	9nEMp5WM+AzYDQ/MMGQSpVdV46FplZ0MmpCp+EFyxOtPURdiqwbntTaMJuWRVEtExlin
	9SX0v/LLmM5CJVDGrMMiF65kVn8Xe7glC5duOyb3f/cRObpgU/0gzZ/nhPz92gqXSzMG
	ePnhCbyVXTj6bu4wuQUpXHc4Ggo8eLGcIcqaNGBGsRb5LfZij/xa0Z5voAimTmLrrMlh
	WBNQ==
X-Received: by 10.14.214.136 with SMTP id c8mr12122966eep.6.1376038438078;
	Fri, 09 Aug 2013 01:53:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm14829637eei.10.2013.08.09.01.53.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:28 +0200
Message-Id: <1376038471-32202-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/12] tumbler: add dependency on xfce4-dev-tools
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:58 -0000

* tumbler configure needs XDT_I18N macro provided by xfce4-dev-tools
  | tumbler-0.1.29/configure: line 13752: syntax error near unexpected token `$linguas'
  | tumbler-0.1.29/configure: line 13752: `XDT_I18N($linguas)'
  | Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
index fd28e84..286dad2 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus speci
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl"
+DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools"
 
 inherit xfce
 
-- 
1.8.3.2


