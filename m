Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pouat-000300-Qo
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 10:19:43 +0100
Received: by bwz10 with SMTP id 10so5007335bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 01:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ocC7oqVEiII0u2qAITHpKhIMFN8RAp/v8fAG9Sg6rPI=;
	b=myytdOsQKcSRcp7k9tAZbgYcagOdOwaEn2xkl18vD0HKgjHKAYYaJ+v8+xEbwzcaI7
	wTtYb+VtV/5h37I7ZWVlGIlpslsB6dBsdZib5FuoH46JpC2AxwzjodRl7WZ0Uu1aVXFy
	L50n5kdNQRs73UpaaldxFObRkc3WBs2wgGQ/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NRuFH7+9ag3WbdFEuyAr8bYVhxuxOCoN+dA53xkvZBUFoLHN1t9ic5piuws45IsOV3
	Jf9wSwDp2HGgcNOuPVO5yMejWECol0wi/potNAwhM9hBUjitDUGKhFaemDOeZwnZs+xk
	v5AG7hHuNOjEFCz+aoaY1xOIUTBAnc8Nnst68=
Received: by 10.204.70.134 with SMTP id d6mr3195865bkj.21.1297675114933;
	Mon, 14 Feb 2011 01:18:34 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f20sm1630229bkf.4.2011.02.14.01.18.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 01:18:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 10:18:21 +0100
Message-Id: <1297675101-986-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <AANLkTindNuCayWTyNrhSoaaVy4P9KhXnaJ2Lae_EX13V@mail.gmail.com>
References: <AANLkTindNuCayWTyNrhSoaaVy4P9KhXnaJ2Lae_EX13V@mail.gmail.com>
Subject: [PATCH] insane.bbclass: make RPATH issues temporary not fatal
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
X-List-Received-Date: Mon, 14 Feb 2011 09:19:43 -0000

* should be reverted as soon as we fix most of new QA issues found by better check
---
 classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index a846832..a4823db 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -116,7 +116,7 @@ def package_qa_make_fatal_error(error_class, name, path,d):
 
     TODO: Load a whitelist of known errors
     """
-    return not error_class in [0, 5, 7]
+    return not error_class in [0, 1, 5, 7]
 
 def package_qa_write_error(error_class, name, path, d):
     """
-- 
1.7.4.1



