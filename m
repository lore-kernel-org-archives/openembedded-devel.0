Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3A9C0015E
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:48:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.9669.1691052533962043339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X/iIDmMQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D45B3FF804;
	Thu,  3 Aug 2023 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691052532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bx9zS7IAInVVTiol0dQJQSmPv/rb12Jr7erPzrYdZy8=;
	b=X/iIDmMQT4x7JeSaBPUDq2f0VBDzgnCLQbLWCzihhoeT6nyAchVGcLPNPeAQI6s+KE7Ivd
	pULoarpXer+PvDOIAZaGuXYzEPoYTPXzdCCvubXvl4C60dkE9S9Dbjz+iVhn5KAfyud+ln
	NzoSToexRiBA6k3vuGeFHiGQceteCVn0CjsD+nqOKRtOvQV9tJ/aJn6XTMLtIR6DIxKSEM
	Li/UfzqTJmcx893cdY9k8gG6DMVK/AlxRANlLKpXhOfIAzhfRO1RTVmU0rchPVWiNWkVML
	meV5wi7PJ8n3Oa3XsdRoimbiZtGum7muTEYIie7NvfP5/WBmTEhLLrMhyjUskQ==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/7] [meta-perl] remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:48:36 +0200
Message-Id: <20230803084839.3012610-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
References: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 08:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104214

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb   | 1 -
 meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb          | 1 -
 meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb b/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
index ae193dbc6..8c31f29b6 100644
--- a/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Encode::Locale - Determine the locale encoding"
-AUTHOR = "Gisle Aas <gisle@activestate.com>"
 HOMEPAGE = "https://metacpan.org/module/Encode::Locale"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
index 79934e222..fd47543a7 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
@@ -8,7 +8,6 @@ DESCRIPTION = "The \"Encode\" module provides the interfaces between \
 Perl's strings and the rest of the system.  Perl strings are sequences \
 of characters."
 
-AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
 HOMEPAGE = "https://metacpan.org/release/Encode"
 SECTION = "lib"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index 6f3d5ba59..3be2e9275 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -10,7 +10,6 @@ names.\
 Optionally it instantiates those classes for you."
 SECTION = "libs"
 
-AUTHOR = "Simon Wistow <simon@thegestalt.org>"
 HOMEPAGE = "https://github.com/simonwistow/Module-Pluggable"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-- 
2.34.1


