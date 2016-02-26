Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9DC77471
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:01:48 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b205so81780288wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 10:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=98mxUqR6XSLlBIlWCUUMlResvTcE8OmmPxmDxkPpZCg=;
	b=XQ8AWw3UOq1zF/7n0HoWxfhJqqAWj+ZhopRtwvshLu5FBPh8iDrejJ94afqkGxzavV
	9VR+75TpVh/JGEmvBKM7smlzlrDDj4glEnlunPDRYR08BCQ89alZA4GZbwgKye7aUAo0
	JeR3bptzaH5hRENvNQRZ1I09D0J3INHcvVuRtWwz7WiM/haSBAJCZlNU4MoxAGY46/DG
	sbnrsysoAiUzp1CXXD6QPJwuTj6XCRNgIjmti8RZDU57MvtIYdH3j6Z4gv6ZxB6oZwZi
	80j0YlHuLCjEiuBI6oVn9fxcwGfnkJ7X69K9SiNByVcAaTIeF1IojtVWOv6FK0DdUZJz
	B40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=98mxUqR6XSLlBIlWCUUMlResvTcE8OmmPxmDxkPpZCg=;
	b=Q/1+n51GvTIGnECTL6PugFTnRJX0R7aoo9Mey05W7dc93pQ9JO1PmKDZrvbpj3qVDD
	D7jg7n25/YmTbHH06DzjfLw8bBCIEI8AKmNss5nBWJgBvMjQn2IpNAs9C6m79ge00uy/
	XW+LIxLSeU5JUClUywP8KIYaQ3xY0AI8i7lSVbsxPZJn5UA2hTHGuWjKDWFGQxEHhzQV
	kRnSaxy/7b82ujDhK90k8qbxjLWpQaXG7c58O07CJQgGgx9tNSKqD9GOiX/fckXpDHeH
	4x1kN8Buks3SvLZiKKioLEVcjlKLXAW1ouIbSS+VLJX79ASQ9ULXxVHSowa24porRaZ1
	sOqQ==
X-Gm-Message-State: AD7BkJIZ5YYe8iF8Go/keldHL52in6d7OfI2HkuSu2FrzrMZLR4VOVyzxnRLYx28LyPzYQ==
X-Received: by 10.28.45.73 with SMTP id t70mr4181574wmt.31.1456509708617;
	Fri, 26 Feb 2016 10:01:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h132sm3826989wmf.9.2016.02.26.10.01.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 10:01:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2016 19:03:10 +0100
Message-Id: <1456509790-23305-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456509790-23305-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456509790-23305-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2][meta-browser 2/2] recipes: Replace "mv" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Fri, 26 Feb 2016 18:01:48 -0000

* Using "cp -a" leaks UID of user running the builds, causing
  many QA warnings.
* See this thread for details:
  http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112904.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox-addon/firefox-addon.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-mozilla/firefox-addon/firefox-addon.inc b/recipes-mozilla/firefox-addon/firefox-addon.inc
index a886201..88dd5aa 100644
--- a/recipes-mozilla/firefox-addon/firefox-addon.inc
+++ b/recipes-mozilla/firefox-addon/firefox-addon.inc
@@ -30,7 +30,7 @@ do_install() {
         [ -z "$EXTENSION" ] && exit 1
 
         mkdir -p ${D}${libdir}/firefox/extensions/
-        mv $e ${D}${libdir}/firefox/extensions/${EXTENSION}
+        cp -R --no-dereference --preserve=mode,links -v $e ${D}${libdir}/firefox/extensions/${EXTENSION}
     done
 }
 
-- 
2.7.1


