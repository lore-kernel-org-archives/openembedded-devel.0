Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U22bJ-0008V0-RN
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Feb 2013 17:39:37 +0100
Received: by mail-we0-f172.google.com with SMTP id x10so4323260wey.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2013 08:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Go+Up6sag7L37TFwROzVy02wWP6DFffdR9S8ZT7wLDw=;
	b=QefuOmbFmhD5h4g9KNbCeAF5L/xZFEnGgkpQ/ifB5w3j417MirxE07Migoi/R2ptH1
	ZUaTZg3T7FgpG+2JD7N1n1ctJMJKI4qSSoRADGbFfzVDRAptEG9QuQ7dQaUY6iBMy+QG
	NShf9v9vjcO04n1bsZTRjnCxWgRDgzwS0S6Ir46Jn4qE2/Z1KhDt4xZHoBfvjL3du5t/
	bf1AJ+AV9UJzpRJR4R9Txgxx1oT7EFjZU62+L5I4NzG3yrq/2/xtsLfSGf0xVmR2q5jY
	R+SjlEx2c+iJurhoeck9WFOrmbD/MKQV5wp3SQk8QAdFVwdOnYzpqp0kTFUdXjeBpFk4
	xl6Q==
X-Received: by 10.194.76.7 with SMTP id g7mr30869064wjw.50.1359908622378;
	Sun, 03 Feb 2013 08:23:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j9sm8626439wia.5.2013.02.03.08.23.41
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 08:23:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2013 17:23:49 +0100
Message-Id: <1359908629-28218-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-oe] nodejs: export DESTDIR to fix build with dash
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
X-List-Received-Date: Sun, 03 Feb 2013 16:39:42 -0000

* when building on machine with /bin/sh -> /bin/dash
  DESTDIR is empty in install and it's trying to write to /usr/include and fails

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
index 588a704..3d034f2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
@@ -54,7 +54,8 @@ do_compile () {
 }
 
 do_install () {
-  DESTDIR=${D} oe_runmake install
+  export DESTDIR=${D} 
+  oe_runmake install
 }
 
 RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
-- 
1.8.1.2



