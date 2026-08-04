Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B120CC56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:41 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24975.1785872432987428061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VuE76/dc;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e041ea211so244039a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872432; x=1786477232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBoPaPwi278OEUHhYSTW71YZY5mJci9BDSiHsqkmOro=;
        b=VuE76/dcXPQfoGZLwjY/mjp2pwr6IzZ/+UwR/CyPVfPxyuYXbv1AVCPT9Fw/OLCxcQ
         tpWKAgcl2FKIzv9nI5qVigVv7UCI4oC5Gjh6LwZmGHl03fnb9/zqwOGp4hGEBXbTund7
         nImYXJIf+wvo7XQm9kz4d585REQFkdmXeBVribS0hnBKcW6xP6iAEABLzaoNZW7XDyUb
         N6nIQ5DWjYTmPtlTCPapR+N1DO6+PWLesJQDD7YBLgPcJLPgXD3jQ222sxtOjbWnWPIQ
         HmFyPrViowRZATJMTSnDQL4oYsmlNKoIi/Uob35ISwU3KL0MuqiDzDxuS76cOWrxUWqk
         1j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872432; x=1786477232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fBoPaPwi278OEUHhYSTW71YZY5mJci9BDSiHsqkmOro=;
        b=M5JGUCOKmez0c5pc6VD8zsZB2WsXIPsgfvTT6yT+42lKJnUAY0R7eAgm5lk0ZgfDhQ
         jUz8kE/j/cHOOfczPuNJUtCNr0oXl55vAUuIf5bnTHxnujXXWQ6Dn3Ui7uJB6rSwNYHX
         +xWLP/7nD1j78ZFs+pp+O41NTyaO6nk6hdfRo1xb8+5Ds7V/P3+h1UaQdjtvCeH7uvtg
         i1kVONnuAVduMc+0PEqV/pRjIxylKUSIzkT3fMFM2Xz4jTirjUiDBPo0meRi7Hy7jg+q
         tXsbLkVjlVYJHI5oVk4knxpA9sWOzblUXpxBzpH6eTRTqSVXD3+xrIhHDxGU3yGjXdTb
         KJdA==
X-Gm-Message-State: AOJu0YzobjAXDFGIJXEPtEuw9NQcN53ZwRA/Ofu+TTfne98oqrwPHqwA
	klN+Dj26eWqm4roCYTKQKVFzMeh/Myrj1km3GbEihVQsGPtNzLuikBJGnuhP05jh
X-Gm-Gg: AR+sD11pJ5aQxT8HO6Zamkr+Z6rZHIoRFHSLVrMTyXKgFS7kv/A8N4GwwTVm2qTUi7Y
	9ExIvGv2lgIuiz5qAaDJvwER4UCmr2tf55bcW3u9BuN3krulli8ouYJPkzDA/E20j9em+RPxj5r
	wDVuQV8v3mizVSvgRxMuQNE5fAi2uN4UrylYURh2UbHH3x239cnp64M7rFFEASU0F8LIDaoxZrL
	vIpsz8x45Gd/ePgBlj3ERcT3dm7nZTNRcidg1Sh3Ed5H0Xj9gx9GoOfZBF0EbnYE4/p5l5A6wpb
	nIxPkxZjXqgGZdNrhn73zWyK3WxgFYTSSz7v6hDYEzUh7zBhz1kTIDO3q/1uUqZT/erqcTcVxwc
	RuGQ1jGWXpQwdaU5KGGU3pkMtQP69AR5XcOfvMkA3l6/WbkZB7bTr+FDOFGXKbFPrqWyzDwJYBV
	IuDyLh/Zzet9dLAG9s9f0uAcJAEKVGRI8CRILbgAXiCx5Cg+2uA9yZ3Uuhge78yoknRJE6ZBkGm
	w==
X-Received: by 2002:a05:6a21:998c:b0:3c8:e397:cf77 with SMTP id adf61e73a8af0-3cb85df18ffmr1233614637.2.1785872432302;
        Tue, 04 Aug 2026 12:40:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH 9/36] cryptsetup: upgrade 2.8.6 -> 2.8.7
Date: Wed,  5 Aug 2026 07:39:36 +1200
Message-ID: <20260804194003.3158916-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128756

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.7/docs/v2.8.7-ReleaseNotes?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0192e9313069e1e2f450191c42c255fec00fb8cd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.8.6.bb => cryptsetup_2.8.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.6.bb => cryptsetup_2.8.7.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
index c754131e3f..8618cd2442 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a"
+SRC_URI[sha256sum] = "e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da"
 
 inherit autotools gettext pkgconfig
 

