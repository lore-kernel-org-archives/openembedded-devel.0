Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id D803C6B86B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:09 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so178106eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=cmUswwXaZ9yEeSDwM7GMIBY920EmDXoZcUk4xG48bR4=;
	b=EvViQUmVaLzFZhaBJ+dP/6dVJKm4xyTm5t8JB4L88AtBODNWHy6Ef2rrwsFDQbUWxH
	xlO+Cfl0p7cRiaU0JZ7N4lYmnSnIroAXNwg98cWU9XOehCRpAn5mqEdeQ9oJckVY2pue
	goIi5Y/iUoHFR7WCmPxshj5KmcieK0BTTYlVNpqKh2XT2YC7f9rFfDgDSRiZZ9+eXQOf
	UfkcS7HNiGLCqxv4FnUgxeMOK/19tXqeQULKAEgLHEKZaveZlj1rLB9EB8pXjzjJRTJG
	vyqD8+GKhQ5yK/4oRjNBk83FlHEUeZIslujgEasPjx/2axVVAc8BNx3NyX+LATo64KYk
	74EQ==
X-Received: by 10.14.209.133 with SMTP id s5mr123498eeo.89.1376551210317;
	Thu, 15 Aug 2013 00:20:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm68749653eeh.8.2013.08.15.00.20.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:38 +0200
Message-Id: <ebd5160ddc0b9d5f2935077a9514121d4ca0c008.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 58/60] samba: add packageconfig for fam
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index df8ed68..7391bbf 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -43,6 +43,7 @@ EXTRA_OECONF='--disable-cups \
 
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[fam] = "--enable-fam,--disable-fam,gamin"
 
 INITSCRIPT_PACKAGES = "samba winbind"
 INITSCRIPT_NAME_samba = "samba"
-- 
1.8.3.2


