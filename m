Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14642.1793092837447288946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z4/C60kJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14659135e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092836; x=1793697636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDryR1lWct9+edj0igLhpSsM4/OH0Znii148sjcAzKY=;
        b=Z4/C60kJRXhaYVgKQ+oxJpaa2YDZdRbPUAa6d9NO6yIss3CvoKq6H54HJxgMkcYQsx
         ZkmzB5Py6D3EaseDIWOE0PGgbN2sgWCj3jIMrxo3goVePrQ+hOdhlFNlzuzY5I3XLZWE
         AKBA4gC2PKDeEWhBqt0NNUvFlTvt0mhGilPp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092836; x=1793697636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDryR1lWct9+edj0igLhpSsM4/OH0Znii148sjcAzKY=;
        b=yLr5/99PkHdvniX55Oka4JoJJ4LmJNxKJWfQsZifE9udpEdH1A2DTDgJ9fLCUE5ETS
         zDo6354E3X8xwWJ9ijxhflsSFF4JLjomrd+hwnizIXJpFrur4E9/H1fcozsElAH0rrPD
         dBFyL6/SAVX4Mu4Jwh7qJwvJRTDfb9tykXt6G9kL6zcb9I/+ut7LVcj/38eikks84qN5
         BJZ8eFFRDWWexkMN19X1cQ7V3IkL9JkoiEFkVDhyXVBkuvJRTueoTA3cxNXaEzQUFsGv
         rM+Nbi+iA2NGfWGr4EmOJQ16P+fPUv1aFZwKqP4sMKWSdRlhFwO20jeVYbHHKEW7nPQp
         JtUA==
X-Gm-Message-State: AFq9FYL9LIWS6lkpKkHnzt/PPjH+f21C7QSOp3K5tONYev9ImWRt55el
	MyQT5keXOuK003DCFwnwx87nKixn9iBy/fIj9PIlxEEQ7Mxu7jatJcudG4GwBIc6KepozR1t9OU
	1HsqI
X-Gm-Gg: AYBFou1gOLnQkREBqvL7y7awGq5zTUT3FOfIFTmwL6q3pp76pEK27rL2SP24nYEi3/L
	VixTvmr4C/FqrceMM5bC/In06h4RnwbicVLNDknTtX+T038ks9bBepKwVspWfb0Z+fGiZT9SXW7
	hb9Pn/vkc+F46PIi1ZgrPy4cbgPIVqzqxpOUaE3LpC6OsOYGWJrekCnkG1mpdIEtXxTP+yx7w3N
	KNiTgGbq+Yqwy7HcIr2Y4SJX1fochdUdo56x3JxVeKuOzok1Q3GCyFkewUNKhOaQleFKTeSOP0E
	73FklEi7sTRaFumFcq8hV1CsgaB8AKijn2bb0JRmntlsP0eWZS8BwakZdgqmGVILlAV1m5/qPRL
	Cu/5UDFguJ/+bzjmefYhZZ/GAaS386rY+D4zj83MmYHH+LgaNhihYW7vW+4WNlqxyeA5a4F0Jyf
	prQukYJN16qdnxxVskO3eAAYg6K8iR+PmRXV21v1bdLZW2hWS+gUSzdtp22LKD2SMYMivQEIFCT
	XVswTJ9CTGk5JsYYY/cS9q5N4OoQKuL/qDcpicJAmB5uObhKy0j1shrcA3QXe+ZqrPU7lA7ivFp
	f0SsdimMZQecyrT+c1rdPRKPSHfG0MLrneuqUyWVJISPwfe7Z9ua/gTVIdUo69rLt8JAKDwsbAK
	aFxo9
X-Received: by 2002:a05:600c:46cd:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4a35ac388b5mr176580095e9.3.1793092835660;
        Tue, 27 Oct 2026 02:20:35 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/61] python3-cachetools: Upgrade 7.2.4 -> 7.2.5
Date: Tue, 27 Oct 2026 11:19:30 +0200
Message-ID: <20261027092028.782979-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131467
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.5:

- Fix @cachedmethod with condition for decorated methods taking a
  pending keyword argument (broken since v7.0.0).
- Fix pickling and deep-copying of instances using @cachedmethod
  (broken since v7.0.0).
- Fix calling @cachedmethod decorated methods through the class
  with the receiver (self) passed as a keyword argument (broken
  since v7.2.4).
- Various documentation improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_7.2.4.bb => python3-cachetools_7.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.2.4.bb => python3-cachetools_7.2.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.2.4.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.2.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.2.5.bb
index 8d3662103b..ec6e612e42 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.2.5.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "e0203b04b75fe13e62098eeb5b2018c4eb1a14c04e2b5b450e70db3ee7e92ec5"
+SRC_URI[sha256sum] = "a2223b80de434291ddf4c105354e533bbaf4d29382f5d1bc3e4b9332cb31061e"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

