Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A16CD37B2
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6235.1762976156503011578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=igyLHzLo;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3108f41fso23146f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976155; x=1763580955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEuAeDhkU9kVVZ8KCsYeorTiRdNu4pRXptvOZ2akqvY=;
        b=igyLHzLoYfwHLU1/VvtIyXDAh76Nctcd3x47gbjwbf81+Y7qxZ4zExctVauZ4QeTq9
         Bcw4h+TqhRLLk5ppA10E1OpcJ7F8xKUMXMTb0H4lEiOnhKK9mlnc7Uar0/sT0q37BLp9
         yzrUSQbe+DUx3Lswo2dv94ozNIoknjCmFAsPtY3/sQxwW6VFeDBjYAy6uraulO5lrpte
         BHhSl5DiBG0KEQ2MFgh4IVQlB36Sey1eHLXcjcQEnkFdvku376gANHwhnscrca9bHAV8
         uoKKPaEkJ/X78LwpnvkhPcNxs+YeU6CFjI6eYtthheVhN9Dmpu4WC0SwF/KhVqvh7RDE
         w/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976155; x=1763580955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEuAeDhkU9kVVZ8KCsYeorTiRdNu4pRXptvOZ2akqvY=;
        b=MU2qXA7zBD5dvfGgzwd/b0pJxWGwVtwgvc8vrMR9pF9SkgVZlMo4RxuMX0xg27r1P6
         LqVk7Yb0y5jXmJ5zI6bSr5w+XE6p9NkP1XifYEZ0nIjIZp/Nd2Zmc8E5GZx6TYQ4Lr5l
         vCzOcMzfxz6AXquIRFyoa4b2FybKk9stizAvEundfek9bEh1UVVrsmhOZk30hj4+CcFz
         g3wdAbFd8yGYXiIJtHmhKdlYxRD2MQZYnP0j3wdqsQREjXAY5wgGckr27fKB86dlXOEa
         BAiNKRcB3tyK6VQBUJ1IPt4xl0fHLh/G9wWyDDkLa0y88M4i9NxXOxbeYZnI/EaOoLtN
         5C9g==
X-Gm-Message-State: AOJu0YxdFYeotwwcKp6ILsGYqVJFVZQFMq4WT5Ad6vZWGsohd56hU474
	4oNILrPtUJd6Bkc0/VrK9Yu0gYd742qmT1ZvG9KcP6ARxsxhlUGIANbrZhS9i33Q
X-Gm-Gg: ASbGncvG39CFkIdNRwp9O4VAg9X7XK/0fBccH7ZZ5TmmJQcABGYoqBMyR48qNO0dpaX
	IkwujZ894mHjCQIC9KMi3KL+rkShfczAf2w3inq1Ic2k75UHclEYgDIGcDObjIlAPmm7clFmhZg
	cosbKxL8WY8B65tspiugU0PrLjEdiPzFeUh4188Yuv4OjBpS4tvh0vr5+UEyHTpWT73Wd03drvA
	aHUEcYrNVec4JPOCQEbyAtD0l1I6sEmM8ttCEWfrCxp+KpZzFc0b66DuU09sNehNaeKolSJJLIi
	e9vye5QeqS+Y+TY6hpYTbkg32p5imBw/fPua9j1LjfTSswA0z+44WGOc0K2ijtDF6SZi0X/D3zR
	97iw+pvUXEM/HJSsbAyVNtweK3lDCrSPVPfRrY7xpg9P3mrvaUjIy659IxP0v/UCv13LXH+ScCK
	ojii32dUWrk2A+gxy6QTc=
X-Google-Smtp-Source: AGHT+IExeFr15I6cty5wpxAZrKvud0AEGiA1nt6iPlvt5rF2crUne61jiSeSQlzA04iHSgjmQNkR2A==
X-Received: by 2002:a05:6000:430e:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42b4bb8f0d9mr4281050f8f.3.1762976154794;
        Wed, 12 Nov 2025 11:35:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 16/21] nng: Rename default branch of github.com:nanomsg/nng.git
Date: Wed, 12 Nov 2025 20:35:36 +0100
Message-ID: <20251112193542.1589821-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121577

From: Jeroen Knoops <jeroen.knoops@philips.com>

Default branch is renamed from `master` to `main`. Commitshas are the
same.

Signed-off-by: Jeroen Knoops <jeroen.knoops@philips.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 58679b6a515b51d28c480836ad598fca6f0cc655)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
index ab2907110d..438998693d 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
@@ -5,7 +5,7 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https"
 SRCREV = "169221da8d53b2ca4fda76f894bee8505887a7c6"
 
 S = "${WORKDIR}/git"

