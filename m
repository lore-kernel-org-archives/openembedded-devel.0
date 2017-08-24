Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A4D3278249
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:21:40 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u17so1734063wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g5QaMPo9T7Z7Qd0lbzQ9GJsgavlUPwJDEg+GvoBSpsM=;
	b=k8oqyzVDUqdaLF73r8THMgaeWx5DuvtlmSIxW5aNA4r9kSAJmJFwbpYL2TUTehbmKF
	331vJghiimxhORuhgy+xqkLHlclZ0Kc0W7L9xkQ/rqCNlXRFTkUimuOd2Dm9ueYxQZuw
	BJiCS1I556u/qJ3w/f41kgO1G9RpWEpzh3jzTymHBlXAEdSOEYkAWWUq4i2SER15qHUI
	8b9nn8DbZKJHReF99/9rj45VjC0i+UfjHYzgx5hkCEi2ooWPlZZkGu3FwLUlY7fyngv9
	pwQwR6k7WKqFcFWg75meRX8y2FozTxniAqhJwZnXCTn2ARLFuhWMozfrC4+PB5VFfuCR
	6CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g5QaMPo9T7Z7Qd0lbzQ9GJsgavlUPwJDEg+GvoBSpsM=;
	b=tzERNc+dsKZWmT0qz89SPKmHrYxJ/1MHm7c0WUti7k0/HR2YDYlWq+R7o43fdnNbKV
	LyFI7Pz7SptXevehI7Ck9/aflg/T2J0EDbuSGxpJzEXJnbisQIGDAgKvbv8AVQvk99z/
	lRfC0S+12ODHo5mXMKS884bDJBVGAYIuw2k5ngqkfqZei5HgfYiIvoTeFJQD9iiYkag4
	L43MsxCdEK1JEYhYXBitcbZrcMlfMKjTVhlqyvc+rQ9rrRqFnfOtX7xeyDHcT9i/zfA7
	xfXcO/K75bMN9TfwQFzKq9N2EO4obzmmtJTFTPZYKKAdYMUYoj2YKMmZxt+eugrTjRg5
	OJig==
X-Gm-Message-State: AHYfb5jhSqP5xwEbbMGI2ZXUuonqwNsTeRMovAUqkvXA6j3XPrv9/6/+
	W069OtedMijuUSUe
X-Received: by 10.223.178.197 with SMTP id g63mr4512428wrd.26.1503584501077;
	Thu, 24 Aug 2017 07:21:41 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o6sm3492957wro.45.2017.08.24.07.21.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 07:21:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 16:23:24 +0200
Message-Id: <20170824142324.8677-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170823174520.61466-1-jason.wessel@windriver.com>
References: <20170823174520.61466-1-jason.wessel@windriver.com>
Subject: [meta-gnome][PATCHv2] gnome-keyring: Fix compatibility with gcr 3 in oe-core
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
X-List-Received-Date: Thu, 24 Aug 2017 14:21:41 -0000

From: Jason Wessel <jason.wessel@windriver.com>

The gnome-keyring is used to configure save certain wifi attributes
when using xfce or a gnome based UI.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 4ac75cbef..76c6dad80 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -42,4 +42,11 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
                     ${libdir}/${BPN}/devel/.debug/ \
                     ${base_libdir}/security/.debug/"
 
-PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+# Make compatible with gcr version 3 or newer by removing
+# org.gnome.crypto.pgp.*, which is the provider for this optional
+# functionality.
+
+do_install_append() {
+	rm ${D}${datadir}/GConf/gsettings/org.gnome.crypto.pgp.convert
+	rm ${D}${datadir}/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
+}
-- 
2.14.1


