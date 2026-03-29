Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B626FC97F6
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:05 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37394.1774820341920057515
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QO+W+Ys2;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66b957dd76dso1398063a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820340; x=1775425140; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs/QQjCM6HwKNwYkCA9TXIb4DENZlDtJuZGy7ok0ovk=;
        b=QO+W+Ys2aZlBrzwMNNLNCTz/340b+IKOFkVxFOSDeMjXDWK3OXpBqMkytDzBZVxTA/
         DsOXPbylLI399GybJ864tLwM+CIhL6Q/05SWlLeY4+ihYY484Z0ffnMHYCO8JRj1hQ9U
         SvujOGdBCBSYS6VlYAQ8mW/fGoNtFxEUIZ1dhYREOv6eEFTOsyMsRgVN+xS4uID0M6Q0
         kpqqjWU6I3ceBVfXTi4XNV6VwpmkbGJPOfKDPpbbQXQzTZRmhIWk8cbBzPwdVOg/h1qI
         gO2nhm+bM8MUN4kSAKnwpch7cLFOQWY1ZP39lieBslDrzd2x9YOKuGIthY+Cb/50W3D0
         qtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820340; x=1775425140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xs/QQjCM6HwKNwYkCA9TXIb4DENZlDtJuZGy7ok0ovk=;
        b=gczyyYtrI1CKP2XSCRTTBzn9AsovLjnPK4uMDQ464mBj1+PDXgQaGUQ9PY3pejB4u7
         iaLlLtg/4t8nYW0ABpGdTnLGoOycspJD0AGeVTVW1XXQi41zQcCa9z2Pr12Onitg3EIH
         CaCGxqUXa0w7vUxNXyxJ3D7NT5RKxYZet7A+aa71nkaRJFyf5bWrLbqZPju56p8ikK40
         1/r3JsdINkQh8ZcH0zopwI1lnYsmMMmR8fJN9iBtZIJJnNc8mcMAP9JRdLymt0IDJsbg
         kCbYk4CjvlLb1qPhoncgKsrj3xPx2J/6p4GWoMgSQP0OZuQeShgKEhSdSW0piB7Ga0zS
         lc0A==
X-Gm-Message-State: AOJu0YwQQifuyqSnmdMN8LeYmY+U8rFjsvG4TtL8auI9jNkyqIDaP4jD
	/m/HcPsUIFgoXD0ZRxwkfTYPJLHelkruRJPZgSGkfAzqcpj1mQnS250wA1aHWA==
X-Gm-Gg: ATEYQzzWm7jAFRkraihng7LHa/EKyJRvqjPWn5To+plPYHbRSxiuPSLrI+uFK9H3/6z
	7y2qTDwhhj0SGEYDDwItCThr8b8s5y1+hmzP87KujPyQX+L+btImBWvIu1HG21nGsZQzX5qQAvY
	cLSNfZm0msFCT6I0mqMi/KBwnyDXDlnH1qJLsfuvsIr8pAgua2X58iGLKOYvm+fvp8XQorYxDob
	UHWnD9Wqn/Q+imd6HAfzk8k7yD+vNxt3p+Z5BVHywcDt4sNXfk4FhVb494zgJSshd7jDuCvO9Wq
	7uqiyMZD/9RGhhvBClP9vD/diVOYns/vb9Nvv+Nl9gaPIFhDSban4ekxJDJqj5mmGLjPIs1FGol
	7e4/goDriNIDOND8mQ1HOcSZbi7AxWtm+tpUUgcxyM+tktc5R/447+nsM5yNL6mHpb21E+Xmrvx
	GfyegwrWIPwgnR1mBFuDPZqX7CQhBSFKQwhXf6sC8i91rnmonRcCPWecP7pgJe
X-Received: by 2002:a17:907:7b06:b0:b98:443:6f33 with SMTP id a640c23a62f3a-b9b509a1d23mr614822966b.51.1774820340191;
        Sun, 29 Mar 2026 14:39:00 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:59 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:14 +0200
Subject: [PATCH 13/13] flatbuffers: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-13-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125822

While in this case `SYSROOT_PREPROCESS_FUNCS:class-target +=` wouldn't
result in any unwanted override, there is no guarantee there won't be a
change, which would be hidden by this override. To avoid any surprises
in the future let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
index c51a49ba01..289330ee04 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -25,7 +25,7 @@ inherit cmake python3native
 rm_flatc_cmaketarget_for_target() {
     rm -f "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
 }
-SYSROOT_PREPROCESS_FUNCS:class-target += "rm_flatc_cmaketarget_for_target"
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " rm_flatc_cmaketarget_for_target"
 
 FILES:${PN}-compiler = "${bindir}"
 

-- 
2.53.0


