Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.13608.1622643310096186184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=fr7KgSov;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id r13so1413442wmq.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gut1layMCv99kq1k1smuIdk94eLGzXQvV+lcbEFhN9M=;
        b=fr7KgSovRuh6lpOrC+AvxYbOajxuao/xOea5IkvUo37xsg9QlvGUcd7fbv/80vI7Os
         xOpeP2xF8DcQhQa+1klwDrnvMiyN+EluxJSkUweuQGgLJy14dzgVSBD47SEEn8l99ZiQ
         jG/0o+s10LiGbihHoJPSGP/Ve2Z/ame+m5E1VG8eghIFh00iWQBEk4+GfLhDrr7B+WLo
         jUOvK8sd/Vr9XfuxbbfpoEkB3zubmcflCSafOWdKfDAg59v4UD5+ASUdxIBOTsNVSN0J
         Rl5dCRstykUGhijVFN08InD60yb15QmHLkw/rk15qdwGvJ1jub3D4elNT98gjYJ08pb4
         JkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gut1layMCv99kq1k1smuIdk94eLGzXQvV+lcbEFhN9M=;
        b=Lu+mMxsrcuTO7mgW4BQZ0Cey9aok81h3sCMg1nKRjRnma724d9JvLDieb0JfDYpIbR
         OBaeyk9cudHPXXyodC3cRvhqKHZtnk4mzQeirVaJ9gil1IqA4ZmIuvF2wuGXZjI6hk5Z
         lJlGfZ/qJcVYy+F/vSTtfcQjK3sx/xAYfdPIARlCjHLftRgzV4xLgcVklEIHtMx5hmae
         i71hluBTskudUt1V1nhxCaCbIuurk4Lx2epyonGytSERwMYIueyje0vDzaqEnRn1mQW5
         7cCmGGmp61/7ukam+71ESowtNpM/WZbijkSFXlitY2noEufaXphXpoX+LfncmLrDo/ZJ
         8Baw==
X-Gm-Message-State: AOAM533VvZM8mN+hn1NPRbdeumM2GjuEsChWysgWJ8cM5ic8piGKqPjR
	Yl3My2qWAMLz8zSNI7D0XAg8C7QoNORRNw==
X-Google-Smtp-Source: ABdhPJx8Ze6/6dnDlEe8kRIhbUSKOrz/W9QZUXduRJ6Lw7NFeylYmUYEUOKxhPfEBEGZ7KobMn+gog==
X-Received: by 2002:a05:600c:19d3:: with SMTP id u19mr377600wmq.100.1622643308731;
        Wed, 02 Jun 2021 07:15:08 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:08 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 6/9] libgpiod: redirect stdout from the ptest executable to a file
Date: Wed,  2 Jun 2021 16:14:58 +0200
Message-Id: <20210602141501.6174-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most tests redirect their standard output to a file. Let's make libgpiod
consistent with this pattern.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/files/run-ptest b/meta-oe/recipes-support/libgpiod/files/run-ptest
index 4cda05d44..3ad737dfc 100644
--- a/meta-oe/recipes-support/libgpiod/files/run-ptest
+++ b/meta-oe/recipes-support/libgpiod/files/run-ptest
@@ -4,7 +4,7 @@ testbin="gpiod-test"
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd $ptestdir/tests
 
-./$testbin
+./$testbin > ./$testbin.out
 if [ $? -ne 0 ]; then
 	echo "FAIL: $testbin"
 else
-- 
2.30.1

