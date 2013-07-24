Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 27B766B3A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:31 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so218368eae.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cmUswwXaZ9yEeSDwM7GMIBY920EmDXoZcUk4xG48bR4=;
	b=f1mg5+nfiRn/9Au5c4+Aehsa4cTIR2eMnOMgCcVt6HPWFnHIw85f1nwuxPtGG8IAb8
	At3SUwaNYysoOtIUKUnhzgEw9uzYOEFLrm/2bA+7ORGV5qvcClFVSOwTnJLRM+h08QJo
	4zzLku5XTgw00TyEAHt4P2wsiNhKd8N+JXGI8jQoh4QuqPwB6Fkom1+1C/nATF7xovCl
	dn5c4jCpZbu/oa/ZP0cw+yFa8ADrLggtqTiaqmYXHBUmkBVTWjcV9tQFKUDb7mc7p8Uf
	pGoSdIhbhhRhMtUJ9LtYky7uS6VMYrr2q6pKKULltbls4sakUy+N0SMfgM12/ZNcOn2r
	TmFQ==
X-Received: by 10.14.246.77 with SMTP id p53mr36966236eer.11.1374669691491;
	Wed, 24 Jul 2013 05:41:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm65898081eeu.4.2013.07.24.05.41.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:10 +0200
Message-Id: <7f0b07f301c4d815c76f498c6e34044836ac1bd4.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 26/29] samba: add packageconfig for fam
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:31 -0000

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


