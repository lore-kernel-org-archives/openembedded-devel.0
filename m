Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.974.1602637596138914709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nc7rXyQB;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id p13so1374880edi.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wOvMfIfkfLEIiYWbJF1FwTHLd6Ov20M0jzda4KbGwHI=;
        b=Nc7rXyQB+dMrHhi2Gr01YTasZODSdszKjUh9zEdZ5JgIs5Iq5IyEc4zI9M93rUIyes
         ZQSpSDPj8Hywmky/KBi1urb8eHdEZCqtaEYE2fNXT2YXUPgHjouaTN9/8KoRTtThPBd6
         Eh7qBgm28QZV0jpbYDz9pWK0EqGntKMxqZj1l0Jb0Or7dkRUyj6rRQ1m6bZNnqZwL35j
         YD+gnDuSJASTerNxWUaT3ha7LAkHbDbY6h4YMGXbmKTyep+SkwiSesWaLyk+5VUjvcM8
         ogfuET8XiV8ZvgV8IyQIOr9vSDReo1yBnLA98PCrHKEclwvTI0x+aQ7ssIvrdOLGDOS9
         8aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wOvMfIfkfLEIiYWbJF1FwTHLd6Ov20M0jzda4KbGwHI=;
        b=qIVcBCTfj/PlkgCugzsLXDgVcmJ6EHfreacfeChtC6CcngEM0U0RiwuPuZ5w7bLZp3
         5VfUXT+Od8P4y1TV1RfPPJV+tcoNogrDPHXa3K3UYIb3h6chbx3Yyx4YpFavjI2zus1H
         MS3rc1gWhbwU2HQqd9KuYmYVS0/LWt8d0s8nSJvNFG3C4KvNzWwYJTDvJ5h/um/u2zfM
         DTd2b0j19CF53kYxE4p6Dzj0oALwNEgvRkuGSl2pyEDLdBW6GvijmX5qsyixtTT3uEwc
         Je/gljGH+Pt+qwmGpU8bzIDYfoxWQoaeuktQ4dCmdv1qL7KCsMreuPyRmL2AAddI7o0d
         cS9Q==
X-Gm-Message-State: AOAM530Z34fyxI8yZWcTVIgtDq9Ea36npIhpn9MMZmIhIiLZ9QCcz82u
	9/78rF6TcnQMsQ39/j2t0pLdUN4jI7c=
X-Google-Smtp-Source: ABdhPJzYeWu2mDsWbmNsK8ZiyPfp+i4zfXJHI9/oGHB++nqF3GPB3bhFiJRPq15Arvxz+oHvUPQPSA==
X-Received: by 2002:aa7:cf93:: with SMTP id z19mr2627991edx.26.1602637594363;
        Tue, 13 Oct 2020 18:06:34 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:33 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/8] wxwidgets: upgrade 3.1.3 -> 3.1.4
Date: Wed, 14 Oct 2020 03:06:14 +0200
Message-Id: <20201014010617.1086948-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014010617.1086948-1-schnitzeltony@gmail.com>
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
index 555399f74..26a9004fb 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -25,8 +25,8 @@ SRC_URI = " \
     git://github.com/wxWidgets/wxWidgets.git \
     file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
 "
-PV = "3.1.3"
-SRCREV= "8a40d23b27ed1c80b5a2ca9f7e8461df4fbc1a31"
+PV = "3.1.4"
+SRCREV= "6cdaedd42ba59331b3dc4ead50e0bac76ae14c19"
 S = "${WORKDIR}/git"
 
 # These can be either 'builtin' or 'sys' and builtin means cloned soures are
-- 
2.26.2

