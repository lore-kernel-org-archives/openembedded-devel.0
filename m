Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 99FF46FF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:08:36 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c200so170309492wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p6tLyLY2TE7kvB1ndwhojloiVbE8qv1Vn/IM6kWYvwY=;
	b=HzjK3xR3EaTZ4gmwG6ZJGtA5jf6OGkn6k4OBwZM3dP3bfaOTokWWun8fBCLboe8Vh3
	UJ9IOtpTJnV9q82Vs9tkxrRUGoEBKfKi+QFGs0ciWe25qTcvUWY222VUEX5G55nMrImh
	eluX5jE+Me8fGUoD4mtCtnjabJH8+CWNbXS1eNIe7EnI9w0+D44p7wfHzgqKvj1KdA8i
	MCemNJght0vFwKQX7akIcXfv74AkcRQjKMrI3X8IFNRV+njw4gUOdZElKtBOlC+jRVss
	PDIyT6pSNN8vTOZawe8NPM53FaW0iQtLsaIq00SIq9plNZShuTNx0kmj6+IbSyVOZmzu
	bC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p6tLyLY2TE7kvB1ndwhojloiVbE8qv1Vn/IM6kWYvwY=;
	b=OPlOflPNomFddSiDD3S+VqkQVTM0HuU5TBh/9/rLzhe9MOe9I4EfArMplhtadRKRi7
	PzkFaxcLmDV2H25ykbaUuYSkCFnZ5bpQ/Gsz6Cz60Q2IEK2eMNs3+Odw2sPKN5zqTaSU
	zjCou2vxcQ9NzMLjblxBtAaKzNLKkKyCoSUpXmm9PyzlYd9ZjzxZ2RzeyMC2lhwuOJUr
	ezRyA0UYybKy26DwpYcKAvo9TFrRznpof68peJ1l+DeVQYcB0nWgPiqErS17htp06Eu5
	wZ+TCWejWPh5u7iBcoJDt2gH3tC6F7cKC4uOzVwvL/7kKxHPSwJdZZZKxmvOLbzxHMtm
	OnMQ==
X-Gm-Message-State: AG10YOQPR6uBjg20nFNLsga9vP1aGANMLSHTsIVkQVZqavI9KyPtrABJ2kurJokqOpkZzQ==
X-Received: by 10.28.136.19 with SMTP id k19mr11694784wmd.11.1456146516766;
	Mon, 22 Feb 2016 05:08:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ll9sm24601340wjc.29.2016.02.22.05.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:08:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:25 +0100
Message-Id: <1456146565-3369-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146565-3369-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146565-3369-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-gnome 2/2] gnome-themes: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:08:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index e9e1b50..fec29e6 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -31,3 +31,6 @@ SRC_URI += "file://iconpath-option.patch \
 SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
 GNOME_COMPRESS_TYPE="bz2"
+
+# http://errors.yoctoproject.org/Errors/Details/35130/
+PNBLACKLIST[gnome-themes] ?= "BROKEN: x86_64-linux/usr/lib/icon-naming-utils/icon-name-mapping: No such file or directory"
-- 
2.7.1


