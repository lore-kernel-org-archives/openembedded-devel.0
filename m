Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C34CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:21:56 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.17947.1757686909465816708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Sep 2025 07:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tggkzy9q;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ea00ea11152so1211569276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686908; x=1758291708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpNJr6FZruveqtdoKI5MTsKUTucEuy6qijcOWpOk5l0=;
        b=Tggkzy9qhxtYO343ZhH9JD7Kyaoy1TDoxtH1lUONxdzmL5kTi4YLyPqMAR9LRN7u6c
         rCpMMs+m3OEf8KSpxLIZnMImw1SO+ffg4hl2ZzzDLfSkGW6Hj1oObMgxnEZD4k3W+abs
         eIVp4t7hBNPFlQE2/JJoiBV5ZwOG0p6ME0jHHEaka2MGe4cM040TC9/idqDN7rjq0FGu
         IrttJxYl/MVLeerfae6xU/ym3UjklRZz9cl5pjbuqCDlFIVFEm5nIAxsLQMXutH3JAXN
         hSRq0fjZ6hsZfxVA5bFqvXVjAY9/WB7yOFTlqHB2KyJXl+f2oFzood1ZilcAeqk8blch
         owlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686908; x=1758291708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpNJr6FZruveqtdoKI5MTsKUTucEuy6qijcOWpOk5l0=;
        b=NfAj39INDuCg31K8EO6Cbepku0EZMXuLjson72a8JNe9xf1QaVGbWq5jCDgIf3iWf+
         yqlCJRtYSnz/junEYsVgGuQJGpQ9DkhcZG2k/F+Lwmg/fTuP7rUdJIHsYhOARoJBDwE+
         4I/kkbpBT0dr1u5QZjiCt47ehkaqA7dFy2bV234+qKJn5Q4WI2ShZKzFhPY+Hgg45d8B
         zPSc1U/MOyn/2NqnywqTMK06nMJM/fb+MxLHBD6toY+0ZdEQaozyklriY3i3Ci1qfNua
         JaxBFHfMA8ssByIlcdKW9utRWQTcsJpHZhs/FHe+E82YpKEsPfNvjs4wghJXDCgsi6FP
         S9pg==
X-Gm-Message-State: AOJu0Ywv7zT/IogWecgY1R8oZF+RT6uVVJobYTx1FqfJbHFYsJzOtttL
	JsB7JE0t1M1mByZKrIjSiAogGk8o7S0iB8F/hXajywmDsAihi7OaSM6USF5grg==
X-Gm-Gg: ASbGncvg09mhwbXnkM7FeM50fh3PrvJqWllG2E5J5nt5XX3CznqubpnQGT7bKBLqQpE
	umj6QQkSSfb9pY+3yJ+eh7Us1/Ku4EecV6Qjyj8taKSMBuiTtPWV+SD93AKgs81JL94Ueb7vyRW
	UCauIh9S6UvZ/XLBOXML3YCntli+Iy7i5gErBjJS8nKYNPLwFgqqBf6n9KTVAT+c30n5Y/dKzBj
	BP8mKC8ID3WI92ER70KxxlOw0JiqjehBXZAOna038nZbh5q0G/rIEVAbCEDi4T6nuTz7ziNQ868
	RHovryyVX3k5vMA2p4vDx+roZc+DJNK5KdtG6RMJVvk/+TPt4yYQT12e2zQMXI6LQY0eZXSNUkw
	/HttSHycgboWmMpPQVsyfteDtB2of
X-Google-Smtp-Source: AGHT+IHUEOLIQh0sNQnMRnSk9ZMkssmmwDQ5GyYotCDV4wc7mpax7NGBBQQbNa4ID22of5PSVQA6jQ==
X-Received: by 2002:a05:6902:4412:b0:e94:e3c3:5d89 with SMTP id 3f1490d57ef6-ea3d9c7b392mr2313297276.43.1757686907732;
        Fri, 12 Sep 2025 07:21:47 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea3ced61ccfsm1434726276.0.2025.09.12.07.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:21:46 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libhtml-parser-perl: upgrade 3.73 -> 3.75
Date: Fri, 12 Sep 2025 10:21:38 -0400
Message-ID: <20250912142138.250444-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 14:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119380

License-Update: Still distributed under the same license as Perl itself.

 Changes for version 3.75 - 2020-08-30

    Cleanup the prereqs a bit
    Mark HTML::Filter as deprecated as the docs point out
    Move Parser.pm into the lib directory with the others. This will help with everything from auto version bumps after releases, to scanning for prerequisites and spelling errors.
    Fix a few spelling errors in the POD for HTML::Parser
    Clean up the spacing on many examples in HTML::Parser

 Changes for version 3.74 - 2020-08-30

    Fix the order of date and version in this change log. (Thanks, haarg)
    Convert to Dist::Zilla
    Build all prereqs from our cpanfile
    Go through all test files and:
        perltidy
        Use strict/warnings
        Get rid of two-arg open
        Get rid of BAREWORD filehandles
        Fix the eval pattern used
        Only use -w where we catch $SIG{__WARN__}
        Fix encoding problems
        use utf8 where we have unicode in the source
    Fix a typo here and there
    perltidy all of the example apps in eg/
    Add comments explaining the apps in eg/ (GH#13 Thanks, Salvatore Bonaccorso)
    Print out UTF-8 encoded data where sensible in eg/

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...html-parser-perl_3.73.bb => libhtml-parser-perl_3.75.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.73.bb => libhtml-parser-perl_3.75.bb} (83%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.73.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.75.bb
similarity index 83%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.73.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.75.bb
index a03ec31e29..bae4ebaa86 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.73.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.75.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "This package contains the Parser.pm module with friends."
-HOMEPAGE = "https://metacpan.org/release/CAPOEIRAB/HTML-Parser-3.73"
+HOMEPAGE = "https://metacpan.org/release/CAPOEIRAB/HTML-Parser-3.75"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;md5=b0459e4426b94753b9a9b8a15f1223b8"
+LIC_FILES_CHKSUM = "file://README;beginline=992;endline=996;md5=cab05784294bb47dc319aeced156e96a"
 
 DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CA/CAPOEIRAB/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "85f05d944e166b8c5913db54779802eb38f4bbefb89a1730401ef06eb9ad8e69"
+SRC_URI[sha256sum] = "ac6b5e25a8df7af54885201e91c45fb9ab6744c08cedc1a38fcc7d95d21193a9"
 
 S = "${UNPACKDIR}/HTML-Parser-${PV}"
 
-- 
2.43.0


