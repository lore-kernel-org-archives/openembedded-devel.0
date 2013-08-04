Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id AB0DF6B407
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:10 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so1270854eaj.34
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=SA1xOUlOb3jeWeZshon78smY07W4wPagXEN49vzVlxg=;
	b=HOiytgPPtS7wlIFvmu9W1tSZRYrdBv3WML+ZLlFlmNuZnl1GM3L7sEhgr7gPW+6KC7
	t2qm0WVF0e9xpriZhKYAXhcfRj503Sf9NpgFEoQXmbXcffyM/lyJSZ1XOY0xtYEm28VU
	eWN0KJq5MiwbTIr11OSW6Fp/yFwrWTPBO2/1kR2wFaGzsXfO2TYWDrsvbc74Kr+DD/cU
	t3xJuLi6Fabgii8lpci1P0Fas2gfJ2QdQCFYOMFwi9SFhUmI+jKHb3Wcak3hFyXK8laK
	X0spyXUfmlI+Fx/nc49QzaO4mTeY9hhCD//42ykxFv4ShqBzrhKfkLhhTRaH5gv8ysv1
	/hJA==
X-Received: by 10.14.119.73 with SMTP id m49mr7551573eeh.146.1375652830993;
	Sun, 04 Aug 2013 14:47:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm6596650eeb.9.2013.08.04.14.47.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:34 +0200
Message-Id: <1375652867-10498-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/15] elementary: add PACKAGECONFIG for eweather
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index 092d7c2..542e200 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -11,6 +11,9 @@ EXTRA_OECONF = "\
     --disable-web \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[eweather] = "--enable-eweather,--disable-eweather,libeweather"
+
 do_compile_append() {
     sed -i -e s:${STAGING_DIR_TARGET}::g \
            -e s:/${TARGET_SYS}::g \
-- 
1.8.3.2


