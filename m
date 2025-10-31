Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8537DCCFA02
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 18:28:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.2413.1761935313019101811
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 11:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l2IrITao;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c4c65485so672764f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 11:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761935311; x=1762540111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VGo+uC64w8mq+U9UQLsyGXptoA9OVK/2zFNyzx73Y8=;
        b=l2IrITaothVLDOd2fUa9JX/kjdCT54+F0dGIOqx0bXjDNYQbuaaIV6286NvzsohT1+
         3gXMn/fO25Tq+u50McakevoOfCEuLORZkW8XtsHU2XxvTtICLJwjP9f799iTMbq/qNyc
         Ijx1P7kk9kMCnHIPrbZQl5dZxiZWt9+JlWYOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761935311; x=1762540111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VGo+uC64w8mq+U9UQLsyGXptoA9OVK/2zFNyzx73Y8=;
        b=BmH/vx4MuNo+tz7SsxMw4O4ClzIn2uNpAnXQPIxHD9ad39AJsgfwyaLUpiGQS3n919
         2zUQRdWt0yhVyHkLkyaGtn09XbEZ6rHYsU7/IPFkktSWOGYSPtXRNC/nfl0bAPJg4NQ/
         T978R4B5oZyUPvcZtPPvMTUCE8FR0PHia8D8sCieyznILHfiXo6f7wjtinP5zHDb2esT
         JKuyh3g9elI8VnWG+nTAhQ9STRaTLdi+7m2xOc3YiH0ORKG97qJ5x4DgLnMQGnAKMKpv
         REbTa6yu5SYHheTEpv2AJZLHO5qDCnWsdgKaGu59Aw4AcbfI7aYSrzjtPbhMqeOxi4uX
         k3Ww==
X-Gm-Message-State: AOJu0Yx0b24srpv4Ur3TE8hyVfCVJd/uLbID7QxZXp7q6qRKNVN+ienW
	eIepUE+/1zm6g/25SqiPMogtOFx0JToyJYTlgk7UhJcVgkqjxHpcUPs5NLjOYGnJZfHm0ca/Riz
	dfh3rm5wCgQ==
X-Gm-Gg: ASbGnctejMjFRc0SZ7qWfMXG6dl1hX3HbZ+W62xjzFhmm+4kqIeTBRMRnQpwclbUb7k
	4DqWnOvicogGCyJbXF7+poOMYwKfUuYAK4qw1bbcta+ZOXRjeYdyaMVE9Gh2U6jzPQHNl4N5ZSe
	igcUdcOcIRK1DfnIMhOAN09f84GgG1A31ROzzOt1lC5FMMmisqRHuqXPKbJsIAi8twOuhy6QUMZ
	wbGlki5YVMZ277rCQfilrf6Pl4rbFmyxb93B+4lHvCAgkRdqVvZIV9aDZrDBu1o8dxtUZB9jOGV
	3hkA8yJiSl4Mm2W4Pzdv8gWxI/249mnJ0Yg3vxwgTwfZnJB4KQTTrqKuY0VO2rCoupm3nok4LEO
	13WcjozL+QsbaTzMNh8Oyzh66C1LYHtWNUniSloxK2WF8a5eX3Th5NVWV88oMht27hLq3UZ9y+z
	skB1TOLGqHufs2NZoRAlHJR6pOH1SWc11oPk0Hlv9EnLE50qS86Z5gkJaNRyDOKOqVDmrShFsZA
	7BDFm0Tj3isPZ5lF8lDoQ==
X-Google-Smtp-Source: AGHT+IHMPZNVt7bD6LN5J2HCnI8wn+wAwr2IIbsekPT4QU3fqiB4lfHSkYs0+Y5EpRSrSeq4tjpTeg==
X-Received: by 2002:a05:6000:184e:b0:429:8cb7:4e29 with SMTP id ffacd0b85a97d-429bd689834mr4237331f8f.25.1761935311150;
        Fri, 31 Oct 2025 11:28:31 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e1d47sm4763659f8f.23.2025.10.31.11.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 11:28:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-perl][PATCH] ptest-packagelists-meta-perl: remove libxml-libxml-perl
Date: Fri, 31 Oct 2025 19:28:07 +0100
Message-Id: <20251031182807.1721857-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 18:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121244

From: Yoann Congal <yoann.congal@smile.fr>

libxml-libxml-perl recipe is currently skipped. Remove it from the ptest
lists as well.

This should fix these warnings from AB[0]:
  WARNING: Nothing RPROVIDES 'libxml-libxml-perl-ptest' (but virtual:mcextend:libxml-libxml-perl:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-perl/recipes-core/images/meta-perl-image-ptest.bb RDEPENDS on or otherwise requires it)
  libxml-libxml-perl RPROVIDES libxml-libxml-perl-ptest but was skipped: Recipe will be skipped because: Not compatible with latest libxml
  NOTE: Runtime target 'libxml-libxml-perl-ptest' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['libxml-libxml-perl-ptest']
  WARNING: Nothing RPROVIDES 'meta-perl-image-ptest-libxml-libxml-perl'
  No eligible RPROVIDERs exist for 'meta-perl-image-ptest-libxml-libxml-perl'
  NOTE: Runtime target 'meta-perl-image-ptest-libxml-libxml-perl' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['meta-perl-image-ptest-libxml-libxml-perl']

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494/steps/13/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index ef0c59dc2f..8a97fb2a4a 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -50,5 +50,4 @@ PTESTS_SLOW_META_PERL = "\
 PTESTS_PROBLEMS_META_PERL = "\
     libhtml-parser-perl \
     libunix-statgrab \
-    libxml-libxml-perl \
 "

