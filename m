Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 78FE379057
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:35:16 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id k19-v6so9495178pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8cmD7z6hux3/JweTqdP43H02JMCGBY/m4kEQz1hZjsM=;
	b=IaSjRcn7FTsxyDj1UobiZ6DzXQ3QEORhMN5geGdg3rsBW4OjJbNT4NihOhjFe6vD3j
	c8VnV1gcWjNMfNxguFMJ1dRtB7wlwAsnJbgwyQwxQKDQs+2A9yniGPviMjDwSvTeZNIg
	nZff6UBkPq9j5t6pMAeJ/rgEJy8DkN8zny3mohcac/YF+03tdvhxBciXJjdsDqLq3xf0
	6Cd2TCc3lsa8EPd2JO1Q7evHQUwebOgAzhDo94giWTZi7noktorFotBWfyV5m4sQw2OH
	V4f4uiESS90wYQV3tnpD7hSb6x+pdhQ4VEwS0m4Hn88j5ZnI0JA/j5Q6xJNJYkHZ/Ays
	+dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8cmD7z6hux3/JweTqdP43H02JMCGBY/m4kEQz1hZjsM=;
	b=Zhtymx1xKZBUH6PclUqMmCnGUs3NaHw7SttrPm9OzOp2oMQjoQPHvMtJm6VoDAy8ay
	Ol4ZC0EZljHBoQ81A1zSl3GxI4dKyjIN4/+ZmCgMmdgdt8QRKoxHjmqgJHx92K2ntBSZ
	vQo3Y12cT37D2PVJ6URvOf6L86rnuiAjZ2tDyXS358Gvm19TWgYDr4SufmqalU1mpTBL
	jWaNmM+JkLRVjRYEgNKd6z+p3WGWSIrjFDnBucRejCydLcJsOg6VaNGY7aIyyuLCrucx
	xcAFLGmog3DDhHHwhIXqKhL5YtlVnkY+VamuhSC1dJr+S8QuvuwoZIVxzgKsSdefAork
	5aEA==
X-Gm-Message-State: AOUpUlH0lS47s+Pq7LJ4XDmQ66YYxryMRm/gUYgiJxHJoyL4Y8Hqce5+
	Nkrbj2lI/bxUMcbzn6B7Vv9BvzOI
X-Google-Smtp-Source: AA+uWPybqZuxz8wXHVDT31rv/EmsD7n1TaSYwcmR7Xh59MEykXZyebnstnEZcqY7Dok7PrWQwqCVYw==
X-Received: by 2002:a63:8dca:: with SMTP id
	z193-v6mr22009142pgd.228.1534264517290; 
	Tue, 14 Aug 2018 09:35:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm35564388pfo.164.2018.08.14.09.35.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 09:35:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 09:34:45 -0700
Message-Id: <20180814163445.24736-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814163445.24736-1-raj.khem@gmail.com>
References: <20180814163445.24736-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] ckermit: Pass -DNOARROWKEYS by default
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
X-List-Received-Date: Tue, 14 Aug 2018 16:35:16 -0000

glibc 2.28+ has caught up with rest of libraries
and now build complains in same manner as musl

ckucmd.c: In function 'cmdconchk':
ckucmd.c:7386:14: error: 'FILE' {aka 'struct _IO_FILE'} has no member named '_cnt'
     x = stdin->_cnt;
              ^~

therefore add -DNOARROWKEYS even for glibc as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index 61c08ee276..abeeeccd1d 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -20,12 +20,6 @@ export INFODIR = "${infodir}"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-# Additional flags. For uclibc we add -DNOARROWKEYS which stops ckermit
-# trying to look inside the stdio headers.
-CKERMIT_ADDITIONAL = ""
-CKERMIT_ADDITIONAL_libc-uclibc = "-DNOARROWKEYS"
-CKERMIT_ADDITIONAL_libc-musl = "-DNOARROWKEYS"
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile () {
@@ -49,7 +43,7 @@ do_compile () {
         -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
         -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
         -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
-        ${CKERMIT_ADDITIONAL}"
+        -DNOARROWKEYS"
 }
 
 do_install () {
-- 
2.18.0


