Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22795.1794814551581564145
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qarMABEM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16685895e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814550; x=1795419350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gc1FOS6cIKEKQ7BrLuPvmZHf0BiZckzODrehIFEeSUg=;
        b=qarMABEMVScSY7xYRaYSH7e7LsjC+YmJoZpCIpJl9rGws4gXe6FrXDNbRvPNffip8U
         0lARQnD+7AMFZ0+xnIDrJBzOfswqex6KjLvT/uZIH0XuKg+nIxap/5/JmyfaQ7uyvDXr
         GdLL9JZ1AJM6o9eoaQ5jL2v2slSU/1kMMy8k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814550; x=1795419350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gc1FOS6cIKEKQ7BrLuPvmZHf0BiZckzODrehIFEeSUg=;
        b=tpW2EwTuDLU2bpj4aCSPsqRZuRfOrODWFQkfYU68ZMxKrZSG0tdRxznVv2Q+iGyySj
         yzyxQnI0aFJBE37I7btDyv1i8IbSef7k+bE0I/WmYVhyAwHwTVPC424rznAnTiucNvYr
         WhfmZEAQPH+wR9ylMemCepZsvIzHPa2a24RzemrIxTE7Gfc1dooRd10/KJTAdWdaA9Ag
         5Rs0D2IQ+HiB5bt+powunpi+hjCgqwQkXNnkbvMkTUkXoLzgy1azlSwZeHlLJd5StLKU
         Ic8rp62kkSbg6vJZHDD2fScYMvGCPY2iF2TCl+01yVdnQCMh6ItdKbss1mEIkdJKStts
         VCfQ==
X-Gm-Message-State: APuU4Z/FNttDnJ6YFkMwOBGPQno/EmWRepN00Y1OeMM5vmSwC4MRiAyN
	fM9BcvPbsIChKsqgucr4kIJw726uzSlGf3hXeRTMHOwCdybTVUr9FAUgyQxGhZoGJtlgp9wxS9o
	hhZOz
X-Gm-Gg: AYBFou2pcRuJvPFOKU14Ifg4grhbZMklHkcS9RSWZx0xsM7oMmiDqzXgnzdRCBraqVk
	3W/nf8T54EYe8yVT4/veMyargNYEj8NFFj3WUgPfxr3tVQyjvvJpqkTi6q+FGtASlUyBBVK9DEm
	SMtbxYcpGZbbUlY4ChryhHvvFLHblT/5BHaon8Mvvagj4BoxCWfHopPbNMMOoUWoRockju1YsrI
	xAoXyQPxHNbGggnQtU96QXhgbpPsFwKEgkBgjNDECobfj3DlLnklBBupSdr25MiRx3WsAHBwgM1
	GS5jobCsq9luhwSdS79z3yfWHarbHGTGaR+fwRq8CBam3EKkEJd96Aqy6GHqhFNpfzEZKAWkLfN
	KWEeL71lbAlEj3ngzFC1hEkxImQ+/w3/5tmjU9Oercl5mAPHbK/sjH7UeUZgvJtw2X0ThFznIQl
	IAXobOVsdgZHwKH+7PZJfFyup30xkBq2VRjfFSJbQzv8T3kcApkycX52bme9Yh04snUAzfHA7Gw
	ej/1nw3X8SwY6ocBsxb36LFBrYKwUD26SgwVKUrlBIrx5wI+9aCfpNBV9OTQ9V9FrvD/p/sj9Ub
	FIO9tKc4Np7BPfahiYjx6CK/si08J7GsuOb4OlY3HiZN4c4hAxpsQHU97k13MYTKr68Xc83V5YA
	31tTRCAc7mE1XEtuii6tx5/nBHNKaxIO3J6zlQBhnrW29bPZRCipgav9lU13zyLxol6ZcetKjDq
	I=
X-Received: by 2002:a05:600c:6383:b0:4bb:6687:5394 with SMTP id 5b1f17b1804b1-4bb66875577mr102372115e9.9.1794814549932;
        Sun, 15 Nov 2026 23:35:49 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 18/24] python3-soupsieve: Upgrade 4.0.1 -> 4.1
Date: Mon, 16 Nov 2026 09:35:25 +0200
Message-ID: <20261116073532.880420-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132446
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.1:

- NEW: Soup Sieve is now thread safe, and this is now tested,
  including on free-threaded Python. This is assuming read only
  operations on a document. Check out our documentation for more
  details.
- FIX: Fix a race where compiling selectors in multiple threads at
  the same time could fail with a bogus syntax error or silently
  parse a selector incorrectly.
- FIX: Fix issue where trailing whitespace and comments can
  sometimes fail to be consumed properly.
- FIX: Fix a selector that starts with a comment followed by
  whitespace, such as /* comment */ div, failing with a syntax
  error.
- FIX: Custom selector names should be checked with ASCII only
  lowercase.
- FIX: Fix [attr=value], [attr$=value], [attr|=value], and
  [attr!=value] ignoring a trailing newline in the attribute value,
  so [type=hidden] no longer matches type="hidden&#10;".
- FIX: Cache the language, the contenteditable state, the select of
  an option, and the tree that an element is in, as found from its
  ancestors, when matching :lang(), :read-write, :read-only,
  :checked, :default, and :indeterminate to avoid quadratic time on
  deeply nested documents.
- FIX: Fix :lang('') not matching every element without any
  language information, which per the HTML spec has an empty
  language tag. It missed the first such element checked, or all of
  them when there was no head.
- FIX: :lang() no longer matches an element whose language tag is
  not well-formed BCP 47 syntax, such as -, en-, en_US, or a subtag
  longer than 8 characters, and a language range that is not
  well-formed matches nothing. Previously, lang="-" matched
  :lang(''), and ill-formed tags matched :lang('*').
- FIX: Fix :lang() ranges that end in a wildcard, such as en-* or
  *-*, never matching. As RFC 4647 extended filtering specifies,
  wildcards after the first subtag are ignored, so en-* matches the
  same as en.
- FIX: Fix [attr*=value] and [attr$=value] taking time quadratic in
  the length of the value when it nearly matches a long attribute
  value, including when matching case insensitive.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_4.0.1.bb => python3-soupsieve_4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_4.0.1.bb => python3-soupsieve_4.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_4.0.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
index bd7d6abce8..bd35cf8e41 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "7621e3c5f6b371ed2c5eabaac5de300ac3d66d05e6d7f34783e31b63c4f90c75"
+SRC_URI[sha256sum] = "ca9abf7126667010d8f6e9b39bfc1bc3b23c8aed9bcb0f54a754dde969bb8aab"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

