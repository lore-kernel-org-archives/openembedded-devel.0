Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91616FA373D
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 01:44:47 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.4719.1667180682413278645
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 18:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VbOPZbVn;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 20so9492350pgc.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 18:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+sRrCPD9YSviF+SSkPJYcwDz2/YK5CRiv8HiCDqGS8=;
        b=VbOPZbVnee0rwEadTrPm0b4Y7CGXjC9G7fjd5LeN15nvPWRAJenrXlogw7aBJlKZJQ
         rYFcMqueLaz3tEP4kzDI+IDSk/Klyfxb/GjXuuzQ7wTCgQi6LysuVPN+BoZSB7eLLxUe
         KM+MmGK1DuYsU1K5Drg0y/B2oLViaEANGrd5qCB2ZFtYJyN0DHFGfP+/+BTyL8OjjttY
         v5bYAapTiM2A553WCAbJ8Hyv6S6Z6RnqVUxUQg5FuMa7pxUxo5poEoq3U+pRCyxFlpol
         udz0u5VniZd1Ye+rVFnemmKKbOgkW3ddJd8UYE4NOmcetIe6XjJpxyQIPawp/weynQRS
         DtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+sRrCPD9YSviF+SSkPJYcwDz2/YK5CRiv8HiCDqGS8=;
        b=kx3q9UkeN3+IcMr+xq3kwtHspWjhfCTV8Fu8piPKbmJnUCH/GaRVTReI/YHMwAEIap
         blXrKWp8xTynFc7BQfWr5V9eMRF/fpUPZq7Tsl9InvKmezcCserQ2nKsk1ANjRsikxJw
         tv6GepkToZv3FLRPUpzH+s0bfY56KyXTioNxkffjS3jg37cv6LOKnf+BOeuwa7g1PIWG
         zuxmbQ3/GT1tDWgKuJKED8B474yhm+12CBrsVkkkpaGYmL8EjM8s3tvH33ozbSIdNrL3
         92VesmIzuq6AVqp+odn2p6GDlktiREuZ4W8kWyMm7nXFBVa8Va1gup3F2XAeYomGhoS9
         Wszw==
X-Gm-Message-State: ACrzQf3p4UXX2ElrO1hbsvA1vL2FRETQqSOTJta8+8if1liXm1lSKgRS
	7BFheU2dlETLSxKw7/19v2GZTBl3HAy0eA==
X-Google-Smtp-Source: AMsMyM7F0aRrOu/c9KCfUCnphns5JwXVf1gRkB8S3zRdoHNeKlSC36/isi6ApgbDjRcAwrBQ9JCxGw==
X-Received: by 2002:a63:1b4a:0:b0:46e:c7be:b4db with SMTP id b10-20020a631b4a000000b0046ec7beb4dbmr10788337pgm.55.1667180681495;
        Sun, 30 Oct 2022 18:44:41 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f504:8040:1a2:6bab])
        by smtp.gmail.com with ESMTPSA id a19-20020aa79713000000b0056b3c863950sm3267428pfg.8.2022.10.30.18.44.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 18:44:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 0/3] libio-compress/libcompress fixes
Date: Sun, 30 Oct 2022 18:44:31 -0700
Message-Id: <cover.1667179899.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 01:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99356

There are a number of issues with these recipes that have been lingering
for a long time: 

* The compress-raw-*-perl recipes should never have been merged as is,
  they break Debian naming (should be libcompress-raw-*-perl).
* There are issues with the HOMEPAGE fields in all the
  compress-raw-*-perl and libio-compress-*-perl recipes.
* The SRC_URI for all these recipes was hardcoded to PV, which breaks
  the auto-upgrade-helper (AUH).
* A number of RDEPENDS were missing (this is a systemic problem with our
  perl rdeps--see https://bugzilla.yoctoproject.org/show_bug.cgi?id=13376)

There are probably more changes to come with the upgrades, including
enabling ptest, but for now these patches improve the situation.

(Based on current master-next)

The following changes since commit fc176683e6f0efaa789c30b5a6cdc4b5ed1570f5:

  libmime-types-perl: upgrade 2.17 -> 2.22 (2022-10-30 17:49:08 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/libcompress_libio-compress_fixes
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/libcompress_libio-compress_fixes

Tim Orling (3):
  libcompress-raw*-perl: move from libio/compress-*
  libio-compress*-perl: cleanup; fixes
  libcompress-raw-*-perl: cleanup; fixes

 .../libcompress-raw-bzip2-perl_2.096.bb}      | 11 ++----
 .../libcompress-raw-lzma-perl_2.096.bb}       | 19 ++++-----
 .../libcompress-raw-zlib-perl_2.096.bb}       | 16 ++++----
 .../libio/libio-compress-lzma-perl_2.096.bb   | 23 +++++------
 .../libio/libio-compress-perl_2.096.bb        | 39 +++++++++++++------
 5 files changed, 61 insertions(+), 47 deletions(-)
 rename meta-perl/recipes-perl/{libio/compress-raw-bzip2-perl_2.096.bb => libcompress/libcompress-raw-bzip2-perl_2.096.bb} (63%)
 rename meta-perl/recipes-perl/{libio/compress-raw-lzma-perl_2.096.bb => libcompress/libcompress-raw-lzma-perl_2.096.bb} (50%)
 rename meta-perl/recipes-perl/{libio/compress-raw-zlib-perl_2.096.bb => libcompress/libcompress-raw-zlib-perl_2.096.bb} (45%)

-- 
2.34.1


