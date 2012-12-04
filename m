Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi2h-0001w5-Ap
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:15:27 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377424eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PXRQSqpIPWs/xUzLkzP6hbg4m+YekC/4qqVPjnVWCiM=;
	b=0LG0spbtrD0tDsLl01/YdKXZm2MJoG4YQfzRXdQ/4jq2vsnQZjiI7svnsuLqHkUODw
	aEeJRcnu2N0iHRK2KjKewLg3fdT8ulFQHxWkMD/3jTKBTaQ7Uc/MK2sCVH9fGwwqEQmP
	/9Ml3pcA5AGQ7r3eBXl3gV0I37hUKZPx+pqKC7dINLaJnMTmORu26t6Pcg0+Q0wKXGML
	kwkggwvHqlN2ccdbVNuE3NCc46gW3ObUfsRV6WYQRYSp3JlPCpm6KywQU7asfaNmRISX
	vQvuhfcggN1D0fmBV6HSmJ9qsGw7T4qAyys93cu/1Jb387XS4La9akFKb4NpUTwuXpR8
	/JiA==
Received: by 10.14.194.4 with SMTP id l4mr42717967een.42.1354586467570;
	Mon, 03 Dec 2012 18:01:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm34796077eeo.8.2012.12.03.18.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:01:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:44 +0100
Message-Id: <4c7888233513178793306d6bc7cd3169486bbad8.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 11/58] libnotify3: add SRC_URI checksum
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
X-List-Received-Date: Tue, 04 Dec 2012 02:15:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
index 2ff6879..4c46ec4 100644
--- a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
@@ -9,3 +9,5 @@ BPN = "libnotify"
 
 inherit gnome lib_package
 
+SRC_URI[archive.md5sum] = "d20676bde7bd2d276508d019dc7276f1"
+SRC_URI[archive.sha256sum] = "322541fdf276eb803686df81763a5186af041b2ee3e9cc5fa1dc86c550388c88"
-- 
1.8.0



