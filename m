Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A3D3676B7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:59 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id x7so60322299qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=XLyyT8s8t4OeOtGhOx0Yw2UlO7t0ZF/yWlnQDXtQwpM=;
	b=Jt2OonIbUQ6OCio71kWD08E5UgYLs/vw6PVMmCkskqd2rk9vdILR3L9LVK59U/hJR2
	o1FSSXffyq7OsTWhYPd4GmxG3mPUppVlHmENNjbnUiWg0qCss2jNkxpSVhEaVSaTNk30
	xQGqBHp1IR3Smu/LlbhFNVrtbYvjPZViG3t8jJ/FUyX1xhZX3GUazzxCNW6pm/SYtUgC
	IhX8odAWZB5e2MrZP71w9nyXQkmgpPr5EaAuWqLjDR6xIKOsEj9C8uYhzJpBWXqkP8/n
	p5bwurZYO9jX6Mj5t7elczsFglogZI01I9+Yy6UN/vM3cQRSR9j3lssaHY0jcKSXekAv
	rmdA==
X-Gm-Message-State: AOPr4FUq/mieQDZzkJfQc4lJGVxOSi5q35n7qkaoei28eS2YRGu7JdUSR1zwqk8p2nqbHw==
X-Received: by 10.55.148.130 with SMTP id w124mr21601389qkd.203.1462543380094; 
	Fri, 06 May 2016 07:03:00 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 23sm5827486qkd.8.2016.05.06.07.02.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:59 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:54 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:58 -0300
Message-Id: <1462543259-7206-21-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 21/22] rrdtool: fix do_configure failure on some hosts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2016 14:02:59 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

On some hosts, when building rrdtool, we would meet do_configure error like
below.

| *** Module name IN: /usr/lib64/perl/5.22.0/POSIX.pm
| *** p1: /usr/lib64/  p3: perl/5.22.0/  p5: POSIX.pm
| *** Module name OUT: /path/to/builddir/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.1/POSIX.pm
| POSIX object version 1.53_01 does not match $POSIX::VERSION 1.53 at /usr/lib64/perl/5.22.0/XSLoader.pm line 108.

Set PERLHOSTLIB to "" to fix the above error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 4d6318c..216aafc 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -57,6 +57,8 @@ export STAGING_INCDIR
 
 # emulate cpan_do_configure
 EXTRA_OEMAKE = ' PERL5LIB="${PERL_ARCHLIB}" '
+# Avoid do_configure error on some hosts
+export PERLHOSTLIB = ""
 
 do_configure() {
     #fix the pkglib problem with newer automake
-- 
2.8.2


