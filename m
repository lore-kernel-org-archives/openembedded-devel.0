Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36223.1793161570790418982
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t/lf/Ux4;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5fb79ce82so3187365ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161570; x=1793766370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rjv6WFBMQzG1BHncFUbXUizK8biVToiSEkCYlL2AO20=;
        b=t/lf/Ux46uDkzu5tyUg2sPM+tBEKQelEumElhMsYfWXOEW9He+3IzIbly/yPzpBMUe
         PrUoXvXQTlcM+u/AVnUQ+L9aq42Blsc87+yzwVS66/E54VuupuVPkj/2SNuR3gHZDot7
         wnIxQa1NHtmdrQmmWYSAmClQgXDsMXtSG08n7oOhZELxadgMuQbcQWx0MT28K+BYCB1o
         /XyCIhTVvtiuZpngFOIIIffraQKW5BckrrJXnOpqrigfcYFRJGuzoqr7GTYcB7kCpj2B
         Wy+qlh4HIxu2cisKKP0jKsqj4o1lWOo2nj+vt3KwVJvXfyYtbVxzE3RuYgn2tUr0wVjP
         0ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161570; x=1793766370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rjv6WFBMQzG1BHncFUbXUizK8biVToiSEkCYlL2AO20=;
        b=G/w+g7F/CIOfWv3qlCd/4e5LDjLIBSkEyXeRxLzX2pfxIq2wuZ5GXMAWHgWHgScE+q
         CqCH2vL4KX8HuGwU23KXVoi+BV3ZXjx72QcPOBNvpB7F90At8aaKipUkrqLXAtKXxs3+
         wXVgm9OiUIaEVANq1BCLfnqubKD/X1D2krmLRTv7+RICMp8BeaKj8GazTSRSDI+IU4cx
         xZaeFP4zvWvW9obJQgoCkL35NQbO2CfM54i4DNSeFz/Te+uJhnjsZltNzvYn20TXpzU7
         4JPKZf4gnluUIGygkq9M4yu5ofUZ2PYLru8EoS5qwX0sdLKICY3lKuZPawgnPPydFBpD
         qyCQ==
X-Gm-Message-State: AFq9FYK06CGptPjJqED2s2hZ1YW+fLMIq4Cn4VVe9Tl1u6EuCEb1dvDl
	VO9k6wP26k7FAdUyJdDwJcnTjhqRFpOHjwl7sXhgKi8Na7LPhRd4A0Bvot1vMg==
X-Gm-Gg: AYBFou0/toXtqGhEhOcf1OSSsyKmyap4K55izoUzQbT+bpW5iabA7mLfvL9mLf6Lk+x
	Iz7w4YJFEQLKIQknyLXtHj+l52jx6hnVRTfng1Wb5N0MzHhRlQvwI31YoyPpKA/1m5RgCGu8ZKg
	piGnYDayWGh41KlTuDgavKmZQrcoFtBXmsfNxD95OL6k/hFrzQoFVNlA5ajMoS9j/sG1Fuw1wm4
	McDEc4expmAh8eoUJC+HDLOSuJ7Blav13qqTaDSIWPUDxr4tx+Xbg6p16Ov6MSEaVVMn1/KphUM
	hIgnQgLV6epk/h0nwzc9xhuYIlE6KZq/AYEw+zb92wsV7RMFRVdbWFGRGscAx+tHZNQPBEeruyc
	fJqrAu7dJ9F7LeGbKknDyLWpEu8tp7u7dFWQ4MYY4Z31zYQWAHSl6EstdRB7mYELlOrx/gAXJQl
	QyYBi3IzmJfvPkBc3lAqqzpd9X7ntfqR8cfiACpB/gLkQfgo6Sf+2XEbEEzW6aa84aOsPdjNpEx
	/+AGt8VctUuegWmY7aL8eHrxvRNJ9MpEmPJpxZx1QCwBN9uCcfdN10wNCoeuQr/29ZjTQFezg/b
	VL1Y1FrQiBR7B584G0ydubQwynKOHxIPI7WZwwj5zUu244xXHY3nQYOVdHJ3iA==
X-Received: by 2002:a17:90b:280b:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3ae580df8d5mr873483a91.42.1793161570148;
        Tue, 27 Oct 2026 21:26:10 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 49/60] unbound: upgrade 1.26.1 -> 1.26.2
Date: Wed, 28 Oct 2026 17:23:47 +1300
Message-ID: <03be564adc156776cf0a3c2780de7fd7b6ee9770.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131601
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.26.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/{unbound_1.26.1.bb => unbound_1.26.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.26.1.bb => unbound_1.26.2.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.26.1.bb b/meta-networking/recipes-support/unbound/unbound_1.26.2.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.26.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.26.2.bb
index f426ce351e..8894a59d07 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.26.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.26.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "13b6717f1716810523ffb60f971a6c9c5e8ce127"
+SRCREV = "f0cd7067d950921427c91ade4ecf060e944f88eb"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
