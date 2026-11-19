Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.499.1795102828956224949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qiBgquWI;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so17906385e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102827; x=1795707627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jnlzf1IBR1Fs5/0v4lSJPwRVgcX987PcTTEoILoFcrM=;
        b=qiBgquWIi8l+AJCIq8LLOAIrAN/cDFvErIG58pViYYC04FCoAilRVdL+P4UIkXTHph
         mWnAMVnYS4Kzt9UClytwnzsdKVplPvZSjSjOCWjCqi4/ULZG1xfXYNL/Y+zkXYy+zmij
         2gz03JkJ1WzB8EZRAGuE7ostUYLtc8UnTyLP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102827; x=1795707627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jnlzf1IBR1Fs5/0v4lSJPwRVgcX987PcTTEoILoFcrM=;
        b=yLsUuPnBGR49mhU3KLrCa7OHKgglpXVjS0vgRWVUtf2bu1f192+AV6AbcelLSFdxNY
         o0Vl+lKcnh+yYLSrpZsRUClnmwBEE47Ub+gxXz7jaamBvDdNxVi/4uZ5BZOCd4jf8tfI
         XirjeCMweSRjVNJ8c/0Lr2+/OtaaaCz3F/hMmlYMoXrEViNH+i0JHtXnLLbJHqsKItzx
         TBen+T7aYIQ/9J+YnwFjNQbJiPAf7kssOnVWOnlwPYFbesH1BTHAATl4BHezL9T8LGcW
         qR8KG3Z/CDNM8ohMvWXXGPPQ1GdX94MTj2UnW3l8cLjbyR3qvtf53dIHZVKn85G8Nkuj
         iBfA==
X-Gm-Message-State: APuU4Z/v2AQEV4nW6WmbbeQbDgf40HBkK7qJ7skcSA6tiA4RuRwC3WsV
	Vmh0j8cHSmKcFhOfSl1p820EDsZMIlZ0Md67BK6oS8IbFnwOVCs6s1Cw+hcxpb4W+t1xdM2xP3l
	t7c/c
X-Gm-Gg: AYBFou3OQLgKPw0BbS5jUfCexLQ4NNKNeG55tJUCe9B7N2cfqafomRrYZH09nzL4XwD
	czBRlw2t4/BZcHkqa3rJ27PMQWniERUAoPKL1m44QRyAyn4LXScb34QBpP7qLfvA1+XW9Y2Ekyq
	Bhj3lTucUzBpArQT+QqjyqIktoJnfZF2tjWxd4J1aV1J2UAt2zVDRlYKAQVC4GIy6as/o4YL7o7
	kdgEgC4MQk6rcXg+slQBlKfA8G57iBSTM5aJgFKlIl/SbMhQyrZM+cPhjysPGCYGV5L6LhYf5gh
	Mw/Yrh5h+26vpgPVrgUK3y+3dQtFXE2tif6Z5zf/Qg9cuXHImXjyqDnDCpOHGPPWi3++3fuy+mj
	eT4Kneqf7n5/fbm23lf5jKGlFXgaXdOs+LiqoJLpum6Rb5Sfw/EOKIwT8oStp5dqBqUWIQ9nmTe
	egxsyLsYz8Sy+qyTMdjZAAG2RTiBBEuUEYCHplIydKoEUWvemJw7tM2DHT41HPkj9WxBYd5+Bhf
	v4iSXNCto+VTPpo1NDwhZoormX7RmkVmc0NZ4/ojPwgj44bZAGTk88bE5tbpBcjnvvpnCcLpM/1
	5CUEdIoBt1P3oUHGMh+cENyCHzEeOT3SUhCDlJ8ZfrgNITd02h/70DkUJtpMMk0uNV5+jSjCesq
	4L+L5fArmfHBEZZR+t6pu13BYtXEFLqGpAMDfV+W4jTHXL/2JmvBcVOc=
X-Received: by 2002:a05:600c:b99:b0:4ba:6d8:dfad with SMTP id 5b1f17b1804b1-4bb7da1aa22mr123956725e9.14.1795102827133;
        Thu, 19 Nov 2026 07:40:27 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/11] python3-soupsieve: Upgrade 4.1.1 -> 4.1.2
Date: Thu, 19 Nov 2026 17:40:12 +0200
Message-ID: <20261119154014.1039002-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132687
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.1.2:

- FIX: Fix :lang() taking time quadratic in the number of top level
  elements of a fragment that have an html or head child, such as
  many documents concatenated and parsed with html.parser, as the
  content language found in the header of each one was cached in a
  list that was searched for every new top level element.
- FIX: Fix :lang() taking time quadratic in the size of the
  document when many elements share a long language tag, such as
  one inherited from <html lang>, as the tag was checked and
  matched again for every element.
- FIX: Fix :-soup-contains() taking time quadratic in the depth of
  the document, such as a long list of unclosed <li> parsed with
  html.parser, as the text of every element, which includes that of
  all its descendants, was gathered and searched again for every
  element.
- FIX: NOCACHE now turns off the caches of the content language in
  a document's header, of the forms of a document, and of the
  selected options of a select, so :lang(), :default,
  :indeterminate and :checked see changes made to the tree during a
  lazy iteration such as iselect().
- FIX: Slimmed relation caches so they now take roughly half the
  memory.
- FIX: Fix nth selectors with very large An+B values raising an
  OverflowError when matching, and matching the wrong elements when
  a value is larger than 2^53, as the position of an element was
  checked with a float division. A value with more digits than
  Python will convert to an integer now raises a
  SelectorSyntaxError instead of a ValueError.
- FIX: filter() given a list of tags now matches the tags under the
  same top level element together, sharing the caches that keep
  matching linear, instead of matching each tag separately, which
  took time quadratic in the depth of a nested document for any
  selector. A selector that uses :scope or & still matches each tag
  separately, as each tag is its own scope.
- FIX: The ignore option now disallows a pseudo-class however its
  name is written, as names were compared without resolving CSS
  escapes, so a name written with an escape, such as :h\61 s(), was
  not disallowed. Document that each alias of a pseudo-class, such
  as :contains() for :-soup-contains(), must be listed as well.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_4.1.1.bb => python3-soupsieve_4.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_4.1.1.bb => python3-soupsieve_4.1.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_4.1.2.bb
index c366bf2aec..2ee6e98a68 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "b296bd2d2f65b1a78149f3d7bf6736a147d2c9e2dfbde0e4404639d748a02e03"
+SRC_URI[sha256sum] = "c6539a2638f26991463527337e39d630e3cbb86d024f52282a510535b8a7e09f"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

