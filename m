Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697F2D10361
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.6068.1729801140441474752
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kOJPp3Qh;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e377e4aea3so11913097b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801139; x=1730405939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPwlcVvGflPmBuMDv04tj9ZdWpbt9Dp1US16zXks+7E=;
        b=kOJPp3QhYTjC+OxfUBwoBWTyCLrhty/W8k0LKuQTB8X+3ApcKd3jN0TIf7PeS3K5QM
         vq4P+LpCM8lxXQPicY/2sc22eaTSGc+Mhl1Oy4RawPX7HuoZ5A5I+PbK9CYYE5toFpp0
         ySo0dEram+DFpJydSkWUgXsZLcXZaJxdQiMjha0wxO5dqNPGr3wXVjFChgRysothYZDF
         0i8LnspY9HxA2b1APieroNWlpA47vI/fjshCCLZ6ZQ/ZVo6zaF1qHOWr3ESGEkD9ygt6
         9jQL9gQO2KDOm0Ft7F5mtGI6v/V25InfkFWv0SYEFO/p9TXggW6NdU2qKNqU02/sId5t
         SE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801139; x=1730405939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPwlcVvGflPmBuMDv04tj9ZdWpbt9Dp1US16zXks+7E=;
        b=MwrTdQs6OQ2FS3qY7jYbMouluodmJRqItof5Oa/djEjEVmLkgyGNCw/wrz2+nCo8gs
         cIQlfpdeQAiU+yueDnLLrUkACSdPbJKS4xF8uShguhHJZRZE3fx/3/fL/ATITSILrJd5
         GSVoz7AU7reMjQUL+6wcD4jufxVJHnfMS63GGtHJlEeEJ49XwP4AO69Tjxhraq76/B2X
         /gFUchkJPbt6J5hOVFQZhbhUnnXhryvMvxup7560bDE5h9CwQoY7ipejzeigcaSOakZi
         W5ySrvotr1Qv7XOPS95GdOR7BSEpYZED7KRb/aIaJPnFXuPDgwzTEpVTH7fcB8yI50wo
         usbg==
X-Gm-Message-State: AOJu0YwQM4sl5LG4kGu/iwBp5YOQgPEl2OpyTEKNojjMWWfCnpYy4zrQ
	wQabYi/bKjFYc9STK4c/fgT0wNtipuwEfoaSz2oFQw2BgffTKXY/Chu8rQ==
X-Google-Smtp-Source: AGHT+IESQuLZLo3XC3QGE9ZP1VVmDwJnOb90Ab4szsshppsszkKSJdXDf8OaF3d9KyAnAftpMF74+g==
X-Received: by 2002:a05:690c:10d:b0:6e2:1336:55dd with SMTP id 00721157ae682-6e7f1001c9dmr58473307b3.46.1729801138303;
        Thu, 24 Oct 2024 13:18:58 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:58 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 09/42] libdata-hexdump-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:28 -0400
Message-ID: <20241024201806.440273-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113187

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index 66369df64..25483bf35 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -7,7 +7,7 @@ of each line shows the printable characters \
 (all others are shown as single dots).\
 "
 
-HOMEPAGE = "http://search.cpan.org/~ftassin/Data-HexDump-0.02/lib/Data/HexDump.pm"
+HOMEPAGE = "https://metacpan.org/pod/Data::HexDump"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0"
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://lib/Data/HexDump.pm;beginline=215;endline=217;md5=bf1
 
 DEPENDS = "perl"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
+SRC_URI = "https://cpan.metacpan.org/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
            file://run-ptest \
 "
 SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
-- 
2.43.0


