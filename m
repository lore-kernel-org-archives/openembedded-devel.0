Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A367CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:26 +0000 (UTC)
Received: from mail-pj2-f25.google.com (mail-pj2-f25.google.com [74.125.227.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47664.1790553802847247727
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YgQ3sD/K;
 spf=pass (domain: gmail.com, ip: 74.125.227.153, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f25.google.com with SMTP id d9443c01a7336-2dd4b43b20bso9726765ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553802; x=1791158602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVjKMl3q6KEzf1sxRtJ+yg0k1/sB0A6bkA5ft1aaEJY=;
        b=YgQ3sD/K7aeYeCe1SWvSQFIpxepVPLMwmNvH3ltaOCSRWqKmZXsJXHBV/cwv9MyE9S
         NHlvpIxdax55qs+QDYk1lFSyy6QspF6gKBxrfHTqNj8V4VtFEXQaKs9Vhddojue6/ffN
         zsQ2nVzTny++QHbCB+oqt5uArZc6o46Xn0Nrltrls0uFeZfsRcVwSAcUbIsjXxJNVOr1
         vZIyKUGMHavWm6Ruan+wny0d55IhrQ9eEN/5MFeq9Zjk4JrC22chUGHnkCH2n+vK3qUn
         6cCl0xD3T8fl63dV8J2Do0TDscgiS51UsFWi7VqtFH1N2vtBsKumKOho7X3VJxpa7uo1
         aDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553802; x=1791158602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVjKMl3q6KEzf1sxRtJ+yg0k1/sB0A6bkA5ft1aaEJY=;
        b=NqCxB+Kag29yZzU44/JtyBd2+YFEll9JehtRo1s6rjHIbyyPWWuy+zphdzRPimEfpd
         RRycIo7JvNTkr/VUyrjanII0Y1ofuaWENBQkxKO4GWzYBk8EE4Gy7iDkxNSyQeupmxY8
         1Q5NCjSnW7WzeuaUaLAZJu/OlBLbRFLtbFywwp7HRpO3knIbLN7SW76CTvh1WJ++kXFH
         dZMspN26pW+enYb7ETIugjA1ieF/Fmk2cpdfYwLdpTYUo66hS+fGdCshaLjtxLGflZGY
         +iEr6rBlyc1t0jwIIDsmfv9Q52tSusdFs2DmTouX0NuwPTJVPFOhoSrUU6YR2+thEGRK
         ZjFg==
X-Gm-Message-State: AFq9FYKrlJXn8dW02WsgtWKKs+7BIw374Qx26rjqEtPv6d9I9kdMrONW
	FEwJb0v8iNM8+S8qKPkewPv/d35xFEnXgE0mI+lbpQcPykaXXa9uvZMpGi3Z9w==
X-Gm-Gg: AYBFou1ZhLzEvAeU4KTE8j55oaPt/t+4vVBOKqryc2Kpnmq9H5yIVgEhJ42FyhrXTQO
	QICfxkB3EJgkvrm/orjxbdXsAO/T1Rpad95cx51U8gZZEk+MHF96ptDz+GPCq6OpfzIq0z+WfU8
	v8fNCK3uU0Wa+Q9tRnoCLhkgEBF9KY1lu72hnR0bzT+YqA688Q6meL6E0Zw1vRNQQFMk1QQX9LB
	tEs9LGUoz1dUvxUD1jQeqZfNSMBuzcOXeHNcR44xPWHjP2g4B6ZghDse8Rwn81v9vDH2IeQE0Ly
	fSUPDfQXfKPtXn0LXwbCsOWG/iqaPFTQjmA6BsvVJBtjzveQ6nxZl0GklOWbepv/zIJhyfJ77QH
	ayLSAJKFhBgH8M+bS9KU9uOl3vrnArHoTf9PF8nro+GYQ0gJfEyihnOyw6j4H+Jj6wSiKE7Rotj
	KBukQWBUWHbe57fbEQ+u6yFoDjRUFNRgNpK1Zyl5aa50eAYsITiDTNCqlQQUln9Aq+bG3SY6V3X
	QzfpFBOs5g5muorUfeyJrA=
X-Received: by 2002:a17:903:19cd:b0:2dd:c100:4249 with SMTP id d9443c01a7336-2df7e13fc47mr94758315ad.45.1790553802162;
        Sun, 27 Sep 2026 17:03:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 7/30] python3-ansi2html: upgrade 1.9.3-> 1.9.5
Date: Mon, 28 Sep 2026 13:02:39 +1300
Message-ID: <20260928000302.2528437-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130394

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pycontribs/ansi2html/releases/tag/v1.9.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-ansi2html_1.9.3.bb => python3-ansi2html_1.9.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ansi2html_1.9.3.bb => python3-ansi2html_1.9.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.3.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-ansi2html_1.9.3.bb
rename to meta-python/recipes-devtools/python/python3-ansi2html_1.9.5.bb
index 25d95905e9..554564ca2f 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3000208d539ec061b899bce1d9ce9404"
 LICENSE = "LGPL-3.0-or-later"
 
 
-SRC_URI[sha256sum] = "190b3fc65f0545fec6442527f8f55131949410fe97c15ac42a441f1e96726f57"
+SRC_URI[sha256sum] = "ae17e92f1d6cac0e67d367e07fb0ba8a23dac8f193fc5d7a8c8a50fe5ddd95a4"
 
 inherit pypi python_setuptools_build_meta
 

