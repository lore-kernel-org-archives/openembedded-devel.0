Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071C7D49C61
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:06:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5535.1769756786495301682
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIwCQnco;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so18057195e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 23:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769756785; x=1770361585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RL546c0n05lKEHKuXLr9nkWI67Kv2skZLWaqFMVQOkE=;
        b=eIwCQnco720snboyFllTLeyxfWSpvFwVmoyPOKnXtAfIL2wPJxo8u3f4dzLOltRA6c
         /EInha570h7YywmgRgmsfBC9p2+mAWeM9i1kHQFN/jTmAm9IlxcTUc9PvQPV/W48BBTj
         ticFWbL/MvmoU2bfhQwbOGVyy5pqKGRtO3mGzz5O5t4ZVFKcxTa9+Yh7CV0DydK0rTl8
         kvpnBOL6sG4ZJi2CJPVz7VtxXw7hA8UgTGQ6dZDYXo5Y8sbsFx+G50DW3iMYxr4Lyn5Q
         Z4ZXLDj/1e06dbM5h5Yjp5KwDyCykfNmo9UZ8oC5RWiGiLxUM/3M1dKIct+J7ho7wEbB
         5RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756785; x=1770361585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RL546c0n05lKEHKuXLr9nkWI67Kv2skZLWaqFMVQOkE=;
        b=SqGCjZ1xmcQr2tDIsUQ53pYWcHnXgBFDf6o5klUQwYVZZvnxwkdTimxL/5esLyYdD0
         0hAtvzo7C+vT3RFCsCekrxOSl0YX/TfZhKoW7DMsVbdz8ToIT7dOqk3CZYGnUvTl0sCi
         DVsw+ox4kB3zYJXsM8yTlJ53RAcys5fY4F9XsCMuH620ay7BksF9UAIFv6qgcCFBwJQM
         s3R61vUqpyuNeArp504hFFa+zwmIQ7Q89eV0rMkq7XMsN8mSdOL/k2lEt3iXvlu8ggpw
         taAVHC4imHoA4Xz5kujZ8HkCHhxqiZpDG7kao5ZOE3izXXGKVvGXdyLijsqErb0hyiQ0
         Tdbg==
X-Gm-Message-State: AOJu0YxulOEjwqilK62Yvnt4pLHQv4eyhkgA8rX+b1LRbSijhpyepUJr
	Qs1bRhz07FALiLQMVjnCRrYHf6Dxu5oAs9BLsI5IDu5kUhBXeGHrlCGhAjCKvw==
X-Gm-Gg: AZuq6aKxWcl5mohc6HopWOqT2r+K199RbetSq4Cugkh+ALXCZk69S/oF+tVsqoLJo7F
	W8nfXXYVVLRQGTGgKsvWeHw470kDUqttLzeLhWxHKjU52rCn29WXM3BTaph3jd5SIBWcjOu4W7F
	eXe0KMQvxGWmbvWx+qN1wp9RoLXW6wdEx1ZbifbHP42/0d9S8tEzVRMiFfIN2ODiHOhltyLwpIM
	0IH9vpoSAE0/+Ya2hKferOofsXtgHiIIsWnO1BV0GCitO0jUbJiXGUjZYgnd0dq6Zbmh7S5+UZg
	JAhlb9kudBBcZSqgI587TkxVyWmMSBXNypgE0JNAPQnkseo2565jJt9vn+Wr/9r9SvdZmbeF13d
	dEPOdlPCLkX2KCIMrEP+AqpqS6LCUTM22KT7AkBsY3JE4iL87JxR2J3MbDzEDgqICEHA/3st+5t
	iJMhtTsV7b
X-Received: by 2002:a05:600c:4ec7:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-482db46b3eemr18444065e9.13.1769756784534;
        Thu, 29 Jan 2026 23:06:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm280057445e9.1.2026.01.29.23.06.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 23:06:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-ecdsa: ignore CVE-2024-23342
Date: Fri, 30 Jan 2026 08:06:19 +0100
Message-ID: <20260130070621.3171877-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130070621.3171877-1-skandigraun@gmail.com>
References: <20260130070621.3171877-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 07:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123999

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-23342

The issue won't be fixed, because it is not in the scope of the
project. See also the discussion in the relevant Github issue[1].

[1]: https://github.com/tlsfuzzer/python-ecdsa/issues/330

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
index 177019ccc2..9ce63c24b4 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
@@ -13,3 +13,6 @@ inherit pypi setuptools3 python3native
 RDEPENDS:${PN} += "python3-six python3-gmpy2 python3-pbr"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# won't fix: https://github.com/tlsfuzzer/python-ecdsa/issues/330
+CVE_CHECK_IGNORE = "CVE-2024-23342"

