Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6QoZ-0001L2-TI
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:38:02 +0200
Received: by mail-ew0-f47.google.com with SMTP id 1so2516009ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=EZUgTOqA4oj1F+F9APxHLg5EyA5w7CNqVdYE381JCXw=;
	b=NudLH9vjkoUUDJAgale2M7VaTRmhqTclcf2AeTbweRNeH596RglKI53qrSnR4jVmEn
	eMcVZHvz7smAhmqllOa8aWGjsNE4ugZBWet29r6mmYHaNGWxphw8Pe4wybUxsKaiIXHt
	p/rJdhgXRnE6YQwmYMxDRGOJwHvo0c3seKChs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=d8g1MvDtTlDRtcznAHhyWbP5vUUTfKO7DIKUl75F2qZvufgsNNsQLsiA9mD07RKG3+
	bjxKdw0uto994K7FVN6qh98CjwZeF0oOKkm4JeK+5tob3Q0DfU9UWc+5JqKdHTnmbm2L
	Yek6TVS/uKNoephbKcuj21RMiO7VcBtQIWLbo=
Received: by 10.213.28.205 with SMTP id n13mr352135ebc.5.1287074252297;
	Thu, 14 Oct 2010 09:37:32 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q51sm2981860eeh.10.2010.10.14.09.37.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 09:37:29 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 18:35:45 +0200
Message-Id: <1287074146-3705-6-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1287074146-3705-5-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-5-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 6/7] kaffe-gtk_1.1.5.bb: remove useless EXTRA_OECONF += ""
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
X-List-Received-Date: Thu, 14 Oct 2010 16:38:02 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/kaffe/kaffe-gtk_1.1.5.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/kaffe/kaffe-gtk_1.1.5.bb b/recipes/kaffe/kaffe-gtk_1.1.5.bb
index f4e9b93..c58aa41 100644
--- a/recipes/kaffe/kaffe-gtk_1.1.5.bb
+++ b/recipes/kaffe/kaffe-gtk_1.1.5.bb
@@ -6,7 +6,5 @@ require kaffe.inc
 
 DEPENDS += "glib-2.0 gmp gtk+ pango zlib libxtst kaffeh-native"
 
-EXTRA_OECONF += ""
-
 SRC_URI[md5sum] = "928c578d4808012fe5ba5587071d2aa2"
 SRC_URI[sha256sum] = "f4ed45720d76f5182f2dede135c1856ad01bdf9875f54459b6baa1071af67280"
-- 
1.6.4.2



