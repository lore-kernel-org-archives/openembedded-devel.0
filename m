Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6Qoe-0001L2-EY
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:38:06 +0200
Received: by mail-ew0-f47.google.com with SMTP id 1so2516009ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qr/tNbJTNmdmd+fGAxK5rCdYKc/n2D4wWyiAJifetVM=;
	b=sMUQihP5EjNd6EU6WNmPshEwyWau/j5yYU8IxkG8hWJVDzLn76utjx6Npdm95RzNun
	vzMazuunJkC2b9Ey7AYmtVS+5el6meGUpCwW5wPWJ8DhNcSyguzkABns5qk5s2+OUG4M
	sAegiQOVfCGg+CZwYR4xJZtBhfOShDlalfi0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KZCi9ToI/XGhekzJ4oRed2by9j22wHZqBM4kVyDApSAK5hpdfzWBL3L4LcOIXrKNSI
	2aykAxDzZdQWMecM1lTn4pt9NL+ma8IwABGT/Fu0zufYD4Wre5e8ZHuNmorBZsdLMHtG
	gqa+58VJKIdSYGXGxrZNsHB8iu8zwUzlH0oMQ=
Received: by 10.213.28.141 with SMTP id m13mr2127272ebc.22.1287074257544;
	Thu, 14 Oct 2010 09:37:37 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q51sm2981860eeh.10.2010.10.14.09.37.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 09:37:34 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 18:35:46 +0200
Message-Id: <1287074146-3705-7-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1287074146-3705-6-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-5-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-6-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/7] kaffe-gtk_cvs.bb: remove useless EXTRA_OECONF += ""
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
X-List-Received-Date: Thu, 14 Oct 2010 16:38:08 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/kaffe/kaffe-gtk_cvs.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/kaffe/kaffe-gtk_cvs.bb b/recipes/kaffe/kaffe-gtk_cvs.bb
index d75eb63..a96bd59 100644
--- a/recipes/kaffe/kaffe-gtk_cvs.bb
+++ b/recipes/kaffe/kaffe-gtk_cvs.bb
@@ -8,5 +8,3 @@ S = "${WORKDIR}/kaffe"
 require kaffe.inc
 
 DEPENDS += "glib-2.0 gmp gtk+ pango zlib libxtst kaffeh-native"
-
-EXTRA_OECONF += ""
-- 
1.6.4.2



