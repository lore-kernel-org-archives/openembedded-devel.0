Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpjx-0003Mh-45
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:01 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dsK3j1/vYHBAyR/7FiJL7fjTi8STjX/jOl+WEsQ7UE4=;
	b=JblfFt4+QXNk3evANjmkUQHg83+asAFwi6LWamnoV7AihMJ/gMmV7wniIzeRUoeV8c
	ZlbXJ54UJQz0zeZdY67oUB80YBhaSDA6/14tW8g51/tuQkZBx2mc8zV8W7eUe4Q/5xvo
	XETG99qCdxnYC06I87xSPpqJ5JEJdMRQMd6WmDvdzPmWR/E2ALhVFLfHSVdQKXLoE4EZ
	Q15cNKtJdVH7zSePbxN3iAdhARjfZG4rZz/mvGu5B/yZM0SfIfW5T3qiqnOJhAQXUjgj
	S4l2BqTN8QcXH8u3CThG+gPDJm8MdXMKYw7lY9d4vwNfVQJBHm3qWENaePF7GtdQFxTM
	uftw==
Received: by 10.180.82.39 with SMTP id f7mr6308048wiy.2.1344606433743;
	Fri, 10 Aug 2012 06:47:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm7834945wib.10.2012.08.10.06.47.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:20 +0200
Message-Id: <8fb25e52e1df4d2627cd9dd85f5212e2e0ec2db9.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 25/46] edje: add unpackaged /usr/share/mime/packages/edje.xml to PN
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje_svn.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 720703e..ffc8cf7 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -9,3 +9,5 @@ SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
+
+FILES_${PN} += "${datadir}/mime/packages/edje.xml"
-- 
1.7.8.6



