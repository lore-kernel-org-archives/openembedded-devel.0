Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2LSM-0003KK-PL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 13:47:31 +0100
Received: by mail-pa0-f44.google.com with SMTP id kp1so558831pab.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 04:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=yIuzN6OROoB9eDzNnHLpus7bDN5QSg5eQFRGZafYXnU=;
	b=Vj83xqybpWfbNm5IzvDooh2I9ZoLeuqg2X90TzrdoomeuBIS9xZT4+IyBSAdASC/A0
	tkvjKJRbyd66oQckCzDPG+HmbTCsSt3SfWoMBdqK6LAsFFsU6zdGbMi2jG9WWb8mnzdt
	NR5wx/SqJESzGSFJfJTtSiuWmSHfIP/q8VT4ULbEp8ZCHBa9OZk6WHcPG0hUtFBxCAJP
	+9j2HxOq9t1NyZir9g5YzsBjVKI2cUfah5yAkb/UKRmhyTq96t+/Gfn6k7+Ni8bcEwUG
	56JZlpkGDqfFTeErO7w8uIvDKpGmxgUc+tJOzj4tRVDqQk3Nsht1Y9tbsaiGH9WSgifV
	nk2g==
X-Received: by 10.66.79.195 with SMTP id l3mr52170138pax.82.1359981101964;
	Mon, 04 Feb 2013 04:31:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bi2sm21036972pab.18.2013.02.04.04.31.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 04:31:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 12:31:04 +0100
Message-Id: <1359977464-19529-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1359977464-19529-1-git-send-email-Martin.Jansa@gmail.com>
References: <keem7q@ger.gmane.org>
	<1359977464-19529-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] nodejs-0.8.18: use gcc/g++/ld wrappers also for native build
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
X-List-Received-Date: Mon, 04 Feb 2013 12:47:32 -0000

* it was calling ld with g++ arguments

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index 63c9660..6c79973 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -52,10 +52,6 @@ do_configure () {
   ./configure --prefix=${prefix} --without-snapshot ${ARCHFLAGS}
 }
 
-do_compile_virtclass-native () {
-  make BUILDTYPE=Release
-}
-
 do_compile () {
   export PATH=${WORKDIR}:${PATH}
   export CC=gcc
-- 
1.8.1.2



