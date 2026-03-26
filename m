Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132DB10A88D6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50117.1774538528852762589
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IXLXsD5O;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fe655187so12735545e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538526; x=1775143326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct1KQJfqArphrN1fQfB/z0fgLR7py7h06g7JLzjPnYI=;
        b=IXLXsD5OMNCYdq1O0DcbbitfUSica9C59gUOINnN0r4ywElT/MRATkdnhmTd2WtL8r
         F+1oDQww9rLYDVvuwfIAKcztuQwVX7w6EM/nna6zCa6ODgp82EiAXxuhtwJZamFGXNm8
         GMu6u1KsMWyzCQpuHGiwrn03oMYqmoy1wtQ4LCXVzLLRXTM+ODrfLgqGRBdyiFDuB8AJ
         asdeZNESRf11V2owf8fCp0xUxI3j/1kJ0FhcME8Fdcl82oAMjO9HE+mTszePtmz8mlfO
         Q0MFqRJMXygDQR+UyTK46y+HTtIZDU5bG7IXJqnzjA3Fzt36CI3zG98HXfZkLPtfTSi6
         nTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538526; x=1775143326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ct1KQJfqArphrN1fQfB/z0fgLR7py7h06g7JLzjPnYI=;
        b=VM0m7G/7ciLpCCVh1+mzDCO0VDWCGf95DAs/jGj5YW9uiM1BmSN/E3HHwHjL5AfuQn
         3K0XPQghNsIYL7NtzlwstUgzUVxiiKrKeQPI4833jSj09DH+5oKHMaMejEJegrLUaFPN
         8xt4NImoknugqynyg95KNaDW++AXucLkpe9W+cUYGNw0cV/90rzi5mUf67o49fqkqgDx
         b6Uvhhun4xSxAayJi79M0b/UZ0hk8Bsm09P1pI+X0eFkh//PS29Za1fh6mnNXJn8gk6O
         QpRiiqsRmmqBn0GJcPrKIpx76GnifTpDL6BC9qZF9s+740y7Y1R4rCOVtNktUqVjjYks
         pbUQ==
X-Gm-Message-State: AOJu0YyIICbPsXuMIIjwQkF97uNHbn2l5dokwnWMGb3fSokbPw3MbP2N
	60fyMMHRdF+NjylVeZ/ODJbT5yvF9pAjlzIUhtmJBw7PlnxuAZKlv6/3rI1q6Q==
X-Gm-Gg: ATEYQzzHHoTdnM3xldmn8R2jELtBRy2zmXPyBu9A2kyWptuGM6dYNFhtPkF1eZqMugw
	6lup03wffaYOXM5CCyxV8JvTgwUSrK3CSQcYZL+j0IvrSAJWD6oZFArDnjPZenEIXyVSD80d0q7
	+SWAxPgnnIUN/7eg47DlAQGE2tGYo/IjettLIvBhSI8p5HMZr7Z09HAhX8VQUCArss0COowUFT2
	X70AwA2fouhvQMDJhdSzveQfxBkBDZBBr4p+tSQqapQK1v8/g3VUZ6A0RY3NsCa7vx1wWhz7UC5
	ES8kDTu760M30Ov6ZXnH13fSjutBS5yWaE4CKPZ/dceSdMxXx5KFGabgl8nYId+f0zGS86q2qeV
	phRIubRrqZ2vVsk2RuU6MC7hAnSabvAkdV+B24d0we4JmWVTCXxIBY5sDpn0m64Y/7w2HCeak6p
	tx+xiKGK3NGoRU7XelRQob0zrh
X-Received: by 2002:a05:600c:1913:b0:487:1fc:14f9 with SMTP id 5b1f17b1804b1-48715fffe21mr117980635e9.15.1774538524890;
        Thu, 26 Mar 2026 08:22:04 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:02 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 07/13] mraa: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 16:14:32 +0100
Message-ID: <20260326152143.2224099-8-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125746

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index f9b4122439..549f7a643d 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -24,9 +24,9 @@ inherit cmake setuptools3-base
 DEPENDS += "json-c"
 
 EXTRA_OECMAKE:append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=ON -DPYTHON2_LIBRARY=OFF \
-                         -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/python${PYTHON_BASEVERSION}/site-packages \
-                         -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
-                         -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+                         -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/${PYTHON_DIR}/site-packages \
+                         -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so \
+                         -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR} \
                        "
 
 # Prepend mraa-utils to make sure bindir ends up in there
-- 
2.53.0


