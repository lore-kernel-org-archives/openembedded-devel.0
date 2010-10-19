Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eG-0001Ww-14
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:21 +0200
Received: by fxm6 with SMTP id 6so1460528fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=/QaZ5qStz3jWaPUSprV3nvM5SPhNpyKKzn1ULre0I4c=;
	b=WyKiGbfxkfxbkPO7PGcfLvZyq/j/Xgww4+sdKZxmkzGwGx51+1FGkOitt6sr1XArNj
	IX6odge+aVq8w333jXdh3RhLX06EN0d6YLPQjAYEzJFf0VdckCQwlrSVOxcl89T8J8qB
	1fN9wfDbuncYypCUECrSnECLj+LrIury87XrQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uw3OxpFGD/i7WKEEFgJxPpiOwOuHKUg6hxfemRe6Hhet/p+MibKD98cgignLFAaUNN
	SIwWuh7bWFgXAaNPgX7pnJUT90byY96lxOTjHJKstQNzwqMtpckxfF4Sa9S6BX/VoE7D
	SZnYAdDIE7Z7SLcI2huoWvSaG3Kn9X6ji/zKg=
Received: by 10.103.11.11 with SMTP id o11mr3943000mui.66.1287477226134;
	Tue, 19 Oct 2010 01:33:46 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u8sm4724567fah.36.2010.10.19.01.33.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:15 +0200
Message-Id: <1287477207-27752-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/13] fso-image: remove obsoleted openmoko stuff
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/images/fso-image.inc |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/recipes/images/fso-image.inc b/recipes/images/fso-image.inc
index 4b1c8b2..5311f84 100644
--- a/recipes/images/fso-image.inc
+++ b/recipes/images/fso-image.inc
@@ -43,7 +43,6 @@ AUDIO_INSTALL = "\
 GTK_INSTALL = "\
   hicolor-icon-theme \
   tango-icon-theme \
-  openmoko-calculator2 \
   vala-terminal \
   gpe-scap \
   tangogps \
@@ -53,15 +52,6 @@ GAMES_INSTALL = "\
   numptyphysics \
 "
 
-# FIXME these should rather be part of alsa-state,
-# once Om stabilizes them...
-AUDIO_INSTALL_append_om-gta01 = "\
-  openmoko-alsa-scenarios \
-"
-AUDIO_INSTALL_append_om-gta02 = "\
-  openmoko-alsa-scenarios \
-"
-
 # python
 PYTHON_INSTALL = "\
   task-python-efl \
-- 
1.7.3.1



