Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB1365CD8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 15:20:04 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so7435354pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eJBuYH8DT1kSbVuAXkxWjHc2BOc51FJkgEwGE0eyocU=;
	b=AbHjj4E/2r4zIwDFhZGc+Od14rh2UQhrCodDXH/ooPv6zWQ62Im9W184E9DmW/1iaT
	2+TKxNat4K0O6Zx3VnJeM2jOGc8C1DMCgXcE1T8VxFWELkYd+2Qp4KhIlxiirqGeYvjE
	5hDajFpdmU2n1pA8gHw7SVTEYx+aVK3kNish8UBYvix4fMmf19sXQwi/3lx9HUNUtj5p
	Za6qSRMtWTSabeJ1VwhXHDb0tFdD7iDYhDkbwX3S5zXGmLXLJcWIf3dWSXpVtE/IrWzj
	baN1IEzeOKYorxHW9ppzZ2/HLwhrlBSfzYOxiS+0oMgyKHqf8dbg2GDMIRh06vqunuPf
	PgGw==
X-Received: by 10.69.20.11 with SMTP id gy11mr24859044pbd.28.1407511205552;
	Fri, 08 Aug 2014 08:20:05 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	bl12sm26473431pac.44.2014.08.08.08.20.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 08:20:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Aug 2014 08:19:50 -0700
Message-Id: <1407511191-28246-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-perl] [PATCH 1/2] libextutils-helpers-perl: fix RDEPENDS
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
X-List-Received-Date: Fri, 08 Aug 2014 15:20:11 -0000

* Module::Load is provided by perl-module-load, NOT perl-module-module-load
* Fixes QA build-deps warning.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
index 055f571..9a0234e 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
@@ -21,7 +21,7 @@ RDEPENDS_${PN} = " perl-module-file-copy \
                    perl-module-carp \
                    perl-module-test-more \
                    perl-module-text-parsewords \
-                   perl-module-module-load \
+                   perl-module-load \
                    perl-module-file-temp \
                    perl-module-file-spec-functions \
 "
-- 
1.9.3


