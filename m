Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15159.1794913091173315183
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mO1ijaom;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31803725e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 02:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794913089; x=1795517889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfKhYyz7W8F/wTnqSJPnKwv8DyEfBgjhM1lyNO2+kRw=;
        b=mO1ijaomNFFCZdJ8sYtI3e7v7RKiNlXuqLK6xdekLJulYRXeKfa+WMCpZJreHs4J3T
         Hwi9XDhUSxKW+V7n7h+t/o7FPmpCPhqjKqfceHWTqInUrbF9SfqY/lOmgE9Ikl3ckuxT
         +57jC7MnBKntNd+pMZTu+5p3W74VwVMnkhFx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913089; x=1795517889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfKhYyz7W8F/wTnqSJPnKwv8DyEfBgjhM1lyNO2+kRw=;
        b=h0gSZLgxq1Q6eqrXsrz0oSyaDHky9sHdX+y7HuILQx6WN6hYuadW6jxa7LSUS2Os4G
         mQx5ivceYvdeFNGyfYeAts/01zaDh4qRPFncfqndBUyhNf1/jfHOh9AcwYY+IkpR1b78
         nU/6HcnWU31/FgWrYMrvrNyrZ1bkrHDL9UgaM4fL7j9sQ1B7Lin4loYxZSuowmchjvmW
         GdL+SgxYD0DOaUWMgZm7fvgzFQ08hM7qywGgdUa2EZKs247nj91qj6QdGfGRjEFTPABG
         bHr7kW+Vqt4DtQcHXKpPH0XhOMFXW4ar4MnMyVR3jqDbWrQ/90YkVsxVBeoLtGswC0bk
         0aLg==
X-Gm-Message-State: APuU4Z/iz2Eie8V7RpuG4qMtCDzOHAQkqQeswWTRw8yMQcDKjLlrqbdW
	s8uJp776neOLk+nR+x+nf1AuLIFtRaTh3hHy0HNCPl0Dbb1wW6OFkUcruzX/bJnhB48RuQwx1ew
	+Iwgi
X-Gm-Gg: AYBFou1Zo1SkWl/kKXZ4RW07p+d/Vi99osUMV0bkR4nf00q5+oh3j20Ep/qlpRqw6Im
	bm/qIbvgYk1eD4p5CSIh0oa/NhSnEMEREXlYIDMRWRRPnBPgg9juUKBXICVuoqRvlA6zeBuSx9s
	xN3Rff8fq9HqmHlsq2ullfr6XU8R7A0lbriK592fx2P3vdX4ed0oc4K3qfFKqScI1k5q4LyllVT
	7sfcZQ0Z7OFsmUSEZopEfu1lUK3huBu3ooVOULxvtHzbS7zSgJGMtPfaXT4ehqe6OrQNyN15+1G
	uK3CB9tZaICyp7s5YNnZaG1gm7t15PUpAHpaQi20r9+wyUNduKOsBbSuNl8ByPYPkPeKOcYOUAm
	K1xjr6triUIxsw8MK7029PpsLHdxTIOfRNZE63KSZjQNlzKyOZ5pMYKpbA6tNr+Vx/p81U+n+zd
	Lvy0anpUOzOuycBAaCzqcZWLXGIzFaFhdmFvXQLL4kbGMajCxUEGWxSkML3PWJtxHeJHWjZrgBX
	4E2myat9eEUvIo4NXroO0ECLKAl/nkw/wsKGddOQ3ZNtTCxAFplDa5NtQyx1hERC/qCi2RThCxO
	1ka074XUvJhUXPTpikMjiVAxoi9aV6ohUqK4VTKKZj6uFCTfn97OqK5z6gwOVFl4Btp6q1+nP1+
	XAN6SOLwQ6H7mv+4y07EWz+2le82SDoyLG0ZveqmJojs0hUS0mKwfcg==
X-Received: by 2002:a05:600c:6219:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb55a23b41mr248118755e9.3.1794913089541;
        Tue, 17 Nov 2026 02:58:09 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm20454455e9.4.2026.11.17.02.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:58:09 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-configargparse: Upgrade 1.9.0 -> 1.10.1
Date: Tue, 17 Nov 2026 12:58:03 +0200
Message-ID: <20261117105804.3937460-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117105804.3937460-1-leon.anavi@konsulko.com>
References: <20261117105804.3937460-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 10:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132581
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.10.1 which fixes two regressions in 1.10.0:

- Lists before a subcommand work again when the option that ends
  them comes from another source. For a nargs='+' or nargs='*'
  option, 1.10.0 stops with an error when a config file or env var
  list would swallow a subcommand, unless an option after the list
  ends it. When the list and that option came from different
  sources, 1.10.0 could miss the option and stop with the error
  anyway: with FILES="[a, b]" set and name = x in a config file,
  prog run failed. It now gives files=['a', 'b'] and name='x' and
  treats run as a subcommand, as 1.9.0 did.
- Count options accept values like +2 again. 1.10.0 accepted only
  digits as the number for a count option in a config file or env
  var, so values that 1.9.0 accepted, such as +2, 1_000 or an env
  var value that ends in a newline, became errors. They work again.
  A negative number such as -1 is still an error (1.9.0 ignored
  it).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...configargparse_1.9.0.bb => python3-configargparse_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.9.0.bb => python3-configargparse_1.10.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.9.0.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.10.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.10.1.bb
index 3d9b635f8a..8631ebc7ab 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "48d9c22affe4ac419b4dd0691fa929d759e1f99574be41826785f2dbf3da63a5"
+SRC_URI[sha256sum] = "8ee7c4429e6402b881c9a85569eb9484db2f63260718b45c67c59625284371c8"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

