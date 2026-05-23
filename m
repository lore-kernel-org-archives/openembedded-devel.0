Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8160CD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:52 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3095.1779512511868937171
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nTz1D2U6;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c801912c903so3653023a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512511; x=1780117311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEaxPFUGbqs8exj73uhdgx5yYAsYgBi6GLXqqNNkjN8=;
        b=nTz1D2U6HGZbIAFFpFYxy2jKHJ9wVobVQ9wTUIf+Oh9zMRUZyE+zSygb9NTdtxtSwN
         Ko9GcVf66Ojdj8XywBqzVqWyjqIQm9NWk4qpn7yfP/0hXOk9VjcERlXGLIwdBTIHIySm
         dhjtsf2mV2B5D80LtOQLgzFec0TL3NcVe+Ra9n1fUletW4bTRXV1R7p/dLV9D+bGhWwy
         6Sm/IcOeOxGGYrT5Ynvqxl+xvHhfmgmLxyImmvXQF46Sd6SmrRhhmCCXV9mi38xgsH9c
         Rv+K0TY7PaThSCHKzi94s9eFp6bXJzYLaJAV4mAdd8yz9LXHGHea3qZlF6goCWS2ZR/r
         BUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512511; x=1780117311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NEaxPFUGbqs8exj73uhdgx5yYAsYgBi6GLXqqNNkjN8=;
        b=ZscHcgcz1AbV32JizvxPxITYcdhS1eK/0pL3ojapJqsxzX2eGYbYyE8vW2lF1onx2e
         1XzUao1FbsPVojQreBcTTLB6A0y2tK3aJqMhdAS+Jl+5E50HpeUyrx4npQM/jDGVuIVq
         mfNJL91HJpUP4Jb2XAmo70v3Kcu18P8ZudpW1FoMntFfiKFY9dpwOs8CT5MEslRxGZTQ
         IUQ/Stu9Mf1eYRL8afLWESK2Nbt6LTOb+TgsRj0A9Q42O1KXbkz5teVaq74sndDPaaIg
         a0xC85XlXwj3DvPfoNUVCNfVqfoNjHTFgP+68I25LcehuiXGSdfIurM936sjheVpT7F8
         DKyg==
X-Gm-Message-State: AOJu0YxRB/8vraFUc6tEGYQNxk1Q28NleOLW9UpSFTFcM4Waj8xIXF6B
	EZUfy7o4QSzGET+skTcQ2+7HwWeXm1TmhQVi5G2l24QqfxKUF0ZbHEFcb55IrXNG
X-Gm-Gg: Acq92OHNrTiFUeNGf+jZTzYimSyDvMKIFTLbMQrzXEHwhu34EPeUSfVWgE2M1kQeELx
	ogPJV3IIwUHD2Wg9ZSbHAO4mxI51X6CLbZRnfgKlBiOGH079zeR14mbQvSo8zaDsErf0WLt5Bfy
	+K/uIUuGR6I0iqXOaULjybAo59chZl1ntzbs/IWsmcafscNxUK2AyffyiExK4LpEQMPqGxX2wmj
	B0zYdbkduJS2PlL6D+5tATCjLIisP0UURNKPREomFgCBDEa4sE01MkZLfyZ0r/kDyAkKBcH/u8r
	xJhtvIPKUtpdzVDNgz0KOg5r1uEsU3kXH94Wu2HF6Oa4pg82eIBgjVc1wfVfc8GDOKme0m3lF5O
	iCb3KjAUDPzeabI54jTEu2hXj5kfwbvdUo4RNMyDzIBzS8hW1LUvo5McrNhXflvF9r1wkRDN8xd
	4XFL1/qGgrbJNShhPjO0paTm9iKLsz/e4d0riv
X-Received: by 2002:a05:6300:6d89:20b0:3b3:326e:a46e with SMTP id adf61e73a8af0-3b3326eaa98mr3519508637.15.1779512511166;
        Fri, 22 May 2026 22:01:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 24/25] imagemagick: upgrade 7.1.2-22 -> 7.1.2-23
Date: Sat, 23 May 2026 17:00:26 +1200
Message-ID: <20260523050028.848327-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127174

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug and security fixes
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-22...7.1.2-23

PTEST passed:

root@qemuarm64:~# ptest-runner imagemagick
START: ptest-runner
2026-05-23T03:43
BEGIN: /usr/lib/imagemagick/ptest
...
...
DURATION: 1
END: /usr/lib/imagemagick/ptest
2026-05-23T03:43
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-22.bb => imagemagick_7.1.2-23.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-22.bb => imagemagick_7.1.2-23.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
index dababfbfac..480f9d9a06 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "ccf56fb3edd41389a02e4fe7a1a11a18f2b13389"
+SRCREV = "6a10c829fb645e0de1408030e6e0f67e820b0c98"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

