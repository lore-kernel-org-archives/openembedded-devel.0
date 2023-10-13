Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15790CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 20:21:43 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.49130.1697228492761786136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 13:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EFBjs+5B;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-57bc2c2f13dso1430921eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697228492; x=1697833292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDgL3F2n6l/7S1gpwMiPdY3rxjQAV38hTq5f5OAuH8g=;
        b=EFBjs+5B8p29uv8TFYET+MAZlGSjkwXoST+QC1ZlmuDngITRZzB1bY4typVpLyAtBl
         IkrfwisgLLGV6PmXZ9LBPi6aGCK+HzMwJ5x7yyeGjIf7aY4/kivv4nv3HwyZ6z+mVsX0
         im3IuGS/e0nyGM+Ww+5XlalAZPu3u8I1bruLMBHH1kQ+Dl4Qkz+afUMnh0L75I9HyTys
         i6wBV0lqhb5VMGSEKl73ISN82AEZl8OEO7iHSONJZwO11QRcDsfy0ticP1zmEZ7vbguq
         xk2pQpTgXBsWfdVMT2tL3ULBiYs4Y7zeEHxeRA49AOv0hT1M/gbH8dFu+xhPa7gQiBuN
         aORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697228492; x=1697833292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDgL3F2n6l/7S1gpwMiPdY3rxjQAV38hTq5f5OAuH8g=;
        b=XWnvJow0lcgiJaOjDMqwYlYuC66yZYfOLk2e0r5cm+YPB/xi6QhsI+/uL2g9UH8BxD
         DBiLYDtjbFSVxg41s7QrhVB6V1xbGD2CFYJYZXypUUkq8JVasW2v4zlZaZ6lDC2bIpS/
         O06qFmLbKUd4H6p/ltuKGFrTCDUO3FY8KQ2ACym/aW6QtYREHdughWPj6tS/W3bUufdu
         fG6/qgWUU31ORbHAJsdS+zWvq4F/YPsDXzbDm5FBQiEZetX4YlA9rpV6TEOhUaNKVIPk
         FuVmebyMuBMeTi2SlXCexVV6iowFuWWdng2eMlU7PxJjHR2AxLjXFnmvJL40HMGKgkg9
         yKow==
X-Gm-Message-State: AOJu0Yz4YR9JmwVpz7gHmg4TBT5BmQttISaOQCEaVFKCdinScCAJGCto
	QW785FOdnUSnBV/bNfVOobpgAQto6unzsQ==
X-Google-Smtp-Source: AGHT+IHWjgu2EHuatlAM4JbvPLhLBJxwuYK+m6zxJfnnN6FJJ+TZIx9L/xRLMvxYVXOpdUQfgpU0GQ==
X-Received: by 2002:a05:6358:280e:b0:143:4909:729b with SMTP id k14-20020a056358280e00b001434909729bmr29909491rwb.32.1697228491542;
        Fri, 13 Oct 2023 13:21:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::27bb])
        by smtp.gmail.com with ESMTPSA id m15-20020a056a00080f00b00696dface1c9sm1215500pfk.7.2023.10.13.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 13:21:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] meta-perl: Add libtext-diff-perl to fast ptest list
Date: Fri, 13 Oct 2023 13:21:29 -0700
Message-ID: <20231013202129.3487798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 20:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105494

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index e27981de7e..bb6796f812 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -17,6 +17,7 @@ PTESTS_FAST_META_PERL = "\
     libstrictures-perl \
     libterm-readkey-perl \
     libtest-nowarnings-perl \
+    libtext-diff-perl \
 "
 
 PTESTS_SLOW_META_PERL = "\
-- 
2.42.0


