Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB717F978
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 01:52:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q10so14129870wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IqjUoPeFjKGlq4gsAYKMzKj8nbIhBN3mZf6CPiDMO9I=;
	b=G2BwbTaIWkl0GyoGZwym5U1q836WTNUNUrn+DDQI265ZftIPIs0kmH+QcjdtXwRhUs
	x/dTTykR7hL/dq1TQHtNbCp3vHuHNiBC+OlAlTwXBfuCef/DU8BmWHSFXhR+pItgkIr5
	5tlumb8XGO0DHOYyaL7fRgvgVnv4JOodNlPZN+stdicBcjZEFg2sGbdkTP1FZeW5U0GJ
	5ZZYd1UBzLdrIk62vlgiX6iwomktLVOqRlAAgpahrCjGD0G/YOAOJXEJ24THKIzHdtAq
	2SxSAYPAKb8eivpZ/DQY6ZLr9WNPkVd3cKj6tz1HxYrMlBiOoF1DWQnr0n4U2GYUD0nM
	Yh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IqjUoPeFjKGlq4gsAYKMzKj8nbIhBN3mZf6CPiDMO9I=;
	b=eQO0DMNpWREVza3dwszJNzNkCdrw74OgKvZr4Ctjw0oPAzGToL7+KBkGZV/JB0QJ8w
	jz/LKfaNGf2HWAcGy0p3OOwMLeEh/b3MFhmUSE3IDYbbypxJSrjc5kB/R/mAQ/MAnAcT
	/RzI97mONRYn7BCWlx2MCFhrtO1r1gE82jFWYkhRwtn2Jm56ACEk4HNtvolRoDkCpWQ5
	sjaxexsIdJF52FJvYBy8IX5SBFptfQYD8Fud56EuzxXMDG1Oi7aYebiRSSuXpp+phT4h
	k7TsPo7LfJmXTif7ac57M9pqbfBivZ8SGJAqydaOhcqYEKQ8tbYVVeIBOgNgchDMCtgd
	j1TA==
X-Gm-Message-State: APjAAAXCQAn/R5Jy+4qF6haB6C8vkb0Ff0or1NC2D3/Nw9BR+xMUyDFu
	9DSlTKfkSlxA2s9psafGdJi4SNxj
X-Google-Smtp-Source: APXvYqz2kMqf7ANm64SoCOGPYTqxIaxdchvkflvNu6vYvAQMyhfBv6hM5WHk2mEX74ZbtA/n2/GWPw==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr24011150wru.181.1580176359904;
	Mon, 27 Jan 2020 17:52:39 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	d23sm23436265wra.30.2020.01.27.17.52.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 17:52:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 02:52:33 +0100
Message-Id: <20200128015234.13000-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200128015234.13000-1-Martin.Jansa@gmail.com>
References: <20200128015234.13000-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] ypbind-mt: search nspr header files in ${STAGING_INCDIR}/nspr
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
X-List-Received-Date: Tue, 28 Jan 2020 01:52:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/nis/ypbind-mt_2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
index 4f7f8aa3ef..03b98c9c27 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
@@ -45,7 +45,7 @@ INITSCRIPT_PARAMS = "start 44 3 5 . stop 70 0 1 2 6 ."
 
 CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
 
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/nss3"
+CFLAGS_append = " -I${STAGING_INCDIR}/nss3 -I${STAGING_INCDIR}/nspr"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/init.d
-- 
2.20.1


