Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2P-0006OF-RU
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:09 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Y+kMWq6tgFAe0jSArIJv8ZS6YXD8TM6PP0CegmWvvCs=;
	b=MUEK6SLawDsUU3Z8WCvA3b6eUPkPdlAriEWxFuhVG80FJRRkQe8GH2rSJ77jJ56qCT
	0vPOF12VsFwUpNMNHU0uVH8eamxebDLL1qqlm4s4fhi4N78syPbo8hgcjoMOGlWYaX4s
	MwTJ2MkGX4h3c73gUDLQUvGdFrWTBSnGhfrZg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gd+jKoCmTswDo68chSOyLOgTaQfuJjJjGqooJ4BalDYElcgtSowWskdKRPCOz37iSZ
	Blt5RYZ88rj4nmMVtrZNHb3O8b53FnGg0VcpKo9Eqv/18AXnlXNjWkQYSyo6GOXjL1oF
	X0z7uig02xLf/bSzIEpnTklnlDLcPyBh2Za1c=
Received: by 10.210.112.1 with SMTP id k1mr77418ebc.41.1242207567267;
	Wed, 13 May 2009 02:39:27 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm1230604eyh.10.2009.05.13.02.39.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:26 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:43 +0200
Message-Id: <1242207556-15601-5-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 04/37] gpe-nmf: don't strip during install - this breaks now with new install - strip is done in packaging
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
X-List-Received-Date: Wed, 13 May 2009 09:46:10 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-nmf/gpe-nmf-0.17/fix_makefiles.patch |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gpe-nmf/gpe-nmf-0.17/fix_makefiles.patch b/recipes/gpe-nmf/gpe-nmf-0.17/fix_makefiles.patch
index 42b5c36..b6dc568 100644
--- a/recipes/gpe-nmf/gpe-nmf-0.17/fix_makefiles.patch
+++ b/recipes/gpe-nmf/gpe-nmf-0.17/fix_makefiles.patch
@@ -8,8 +8,8 @@ diff -urNd ../gpe-nmf-0.17-r0/gpe-nmf-0.17/backend/Makefile gpe-nmf-0.17/backend
 -install_program: all
 +install-program: all
  	mkdir -p $(DESTDIR)$(PREFIX)/lib
- 	install -s $(BACKEND) $(DESTDIR)$(PREFIX)/lib/$(BACKEND)
- 	for i in $(CODECS); do install -s $$i $(DESTDIR)$(PREFIX)/lib/gpe-nmf/decoders/$$i; done
+ 	install $(BACKEND) $(DESTDIR)$(PREFIX)/lib/$(BACKEND)
+ 	for i in $(CODECS); do install $$i $(DESTDIR)$(PREFIX)/lib/gpe-nmf/decoders/$$i; done
 diff -urNd ../gpe-nmf-0.17-r0/gpe-nmf-0.17/Makefile gpe-nmf-0.17/Makefile
 --- ../gpe-nmf-0.17-r0/gpe-nmf-0.17/Makefile	2004-08-03 03:31:46.000000000 +0100
 +++ gpe-nmf-0.17/Makefile	2004-08-03 12:37:33.000000000 +0100
-- 
1.6.1



