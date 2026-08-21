Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04256C5DF9D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:36 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.749.1787335347058449612
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NACRl22N;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ced3386430so12149485ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335346; x=1787940146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUP834J7wtssllaCd3Vcn6o7xuzhDUIV/scHTNdCoCw=;
        b=NACRl22NUPOEdSli9MR1tz7jHhWcP3aOZi6CDUB4/t+vdRnEX1qM+aT9+UlwoSyCv/
         iLQqE7E+GlzKCDK7DAIe09DonjcqX8MjNT/h0Ar1weO7y7qSEkY7GzlCbbKo8jglIxCj
         iWdPJJnK+QsVV8MLFYQACSczaUOOsqHw1clYPpKvJfocTJG/fiz4LKe/cqcVuabjzoTq
         yIabLq4R9mxcyAH5Fwr6ZzIvEWcEmm51FlO9RRy4T2h9dRXl439/jZW/hZSo6cVGFW2t
         pf4ZPYessWbRIKkjLhVidSDRwZxktES1JiLmzDiA1qP6oDtwTZtUFSEs48T6ZnYv6TPI
         pWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335346; x=1787940146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUP834J7wtssllaCd3Vcn6o7xuzhDUIV/scHTNdCoCw=;
        b=eLis20FCX6FeXv2CXEHSjR4zI9poHmTQ9+vXUnZ7fc4jKgy7cAMg/bhRIZdwHz0flv
         T3qQEy3q36Fq7ZEXlz01nB7TL0dMnF67nK/VVPJkiayOL5715Te3IElUM1xBd+8BLmfQ
         qvszyLWPj6b1nIdIKQE86m7lA38iPt8/w9r/K6RpoHwSpJhlq1PMvlu+gbWCqVFJF7kj
         oN6sNZa1UBZZGBQt4QmvOoFzV89BVYsLf6AGj6zn2y7FNp5ihuov9XXZxQTvIv1ebdky
         eL1s+SnvN5keGHew8KvwT/usNWLJ/hyel1hxsJBBlIS/YLeiq64wh/SMjFTF0368Pbln
         1dmA==
X-Gm-Message-State: AFuF++npCR4E2UiRX12GSH/8XO3IXkQ9LbyQAhfnl6fdkd0CJWOgqiLM
	wdtQOL7rayv+h5mRdPvWd89nA1CDZjBJ/x2RACc15H2L6GPqXwLfOXl7AkrjhaEB
X-Gm-Gg: AR+sD111FSl7GsUBRWqENx1HemHkQwWG250UDCpO0po/aU3OSQdwUNG5FfvIdV7DMzM
	Je7eefV65y12i0W0oWUzTc+auWtNdLaivqrbBvqJCm2oRKTDWWnWTluvvQ1OIPC/WNa9ij4CDet
	nen3uG24E9NFhnVUi+DVAIImauUMUCf2mYfugrPOIoTygR+89RMeqC33/KLhwwO/Rz7dEJxyQE4
	+pcBMH74JVt5aZPLHwcHXx1lJ+gmxxdQjydxAy81FBvBvi0r3jjjWjoOmzvpxZD38FoDzNdSGh5
	fv0Og8nlnkFg13Ak8kY2YCm8omluDTrAVVWC86vIDhYmNMZMfQX3G25mP6zu4lUNuQv4iDmpSxb
	ocdRLumAHctm3HzACvy6t5yGkXkJs0ChOHWIg9CPs7ewjRLV0I2pKj68jm/LC0taAgDAMBXF3V3
	PJ0yiFBwjjKawok3848hyxbj8LQxh0ZhgnS8QMxP7bkTWWHY8rm+Vl7STNl+T9QsyloMu3ChydB
	SqaA+5Vg9tbTaeK7HuZEpLGa03aQrdARCFpqQyMKVScZwZ9vPvePI34FsPgF/M7+Dlr+S2KmUvt
	ltPqmKt/1NWkrnR7hXBIw38VED7XtWsUAsbtywPic5aOVh3Na0uHUlMTScIQy/PhD2GL8vE+isX
	rNh0u+XrrdnWmAaaeL3nxIQl3KwySv9PjFcoIa+fs0wId7Kr1ccvFBseZlQ==
X-Received: by 2002:a17:90b:2687:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-395c383cae0mr16046078a91.9.1787335346344;
        Fri, 21 Aug 2026 11:02:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/9] libdbi-perl: add missing perl module ptest RDEPENDS
Date: Fri, 21 Aug 2026 11:02:07 -0700
Message-ID: <20260821180211.423633-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129429

From: Khem Raj <raj.khem@gmail.com>

All 6 ptest failures (t/31methcache, t/35thrclone, t/40profile,
t/41prof_dump, t/42prof_data, t/43prof_env) are missing runtime perl
modules, in two groups:

Module::Load, required by DBI/Profile.pm line 682:

  Can't locate Module/Load.pm in @INC ... at
  /usr/lib/perl5/vendor_perl/5.44.0/aarch64-linux/DBI/Profile.pm line 682.

This breaks t/40profile and t/43prof_env directly, and cascades into
t/41prof_dump and t/42prof_data: once DBI/Profile.pm fails to compile,
%INC is poisoned, so those two report "Attempt to reload DBI/Profile.pm
aborted" and a missing DBI::Profile->flush_to_disk method rather than
the underlying cause. Provided by perl-module-load.

Test2::Util::Sig, required by Test2/IPC/Driver/Files.pm line 18, which
Test::Builder pulls in when a test enables Test2 IPC (threads/forking):

  Can't locate Test2/Util/Sig.pm in @INC ... at
  /usr/lib/perl5/5.44.0/Test2/IPC/Driver/Files.pm line 18.

This makes Test::More unusable in t/31methcache and t/35thrclone, which
is why only those two of the many Test::More-based tests fail. Provided
by perl-module-test2-util-sig.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
index e641ac3167..436ee47165 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
@@ -53,6 +53,7 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-file-copy \
     perl-module-file-path \
     perl-module-lib \
+    perl-module-load \
     perl-module-perlio \
     perl-module-perlio-encoding \
     perl-module-perlio-scalar \
@@ -61,6 +62,7 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-storable \
     perl-module-test-more \
     perl-module-test2-ipc-driver \
+    perl-module-test2-util-sig \
     perl-module-threads \
     perl-module-utf8 \
     "

