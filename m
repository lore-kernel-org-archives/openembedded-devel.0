Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14.1794324466183126803
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HZ1zcRsP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso16827655e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324464; x=1794929264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QovQpH9DWGDUfZGansbQzrMKSDLmsy2tUstlF/y2HPs=;
        b=HZ1zcRsPA3+Yoo9qyoLEZkPc/MRGbc8A/UYQOzURMA+YwQux0rBAnjG3G51Pl7zvc6
         25NsgxQeII/vzANx/Rn+lqZflH75KFcHP+rzpbt9vky7BcpMc7xbGsAZgf9wgWxJ+v4u
         E1naHqEYKB/96VHLoHWLyYjqkcxpx7OfUoyPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324464; x=1794929264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QovQpH9DWGDUfZGansbQzrMKSDLmsy2tUstlF/y2HPs=;
        b=XUITaxVYj5xnuCg9S04gJF59FfE4t9VepRkCuFdU6csg0FeoZ+YXCs8ku0r0bpSvh/
         62Y9u45JaHJadyxG2wu29V6cgQuP76i+YDsxynviWN82886hqwgyj4QO21lS19xTc41T
         OOb8uTHxePMaY2EK9l+HWKMmdBZpc2k6rqUJ18P8nTHkvcdeiLScgJQVUqOF4VwG0qR9
         /B9hsFd6uLbqZv+HACviI5pBwbuDfpHh1TK2ZC0PWZl+wVDxDITEQU5vVDdiXUQD3cfn
         0otoW2WUfObz0R4j/izDnsk7pVdopa8Oh5ecXPPn/5DPwWT6cC/wKzejCmhf9x1zFxso
         zhuw==
X-Gm-Message-State: APuU4Z879NlJpsziNACVetDUHjAWH/tXJs346gJ1Ld2FVleyw3PFTHwF
	MewvwVZiy/6Qd4VvJGAt6BBjmvrPwR3FdWpB2KzNQ25VMoBJQiPMlEO79azMiuGHeFw2oeeHhV+
	mviQg
X-Gm-Gg: AYBFou020LirCARr2Wx8PLoNb6Z936hL6wAI5O00cH2PgrLKyKt1EUDT6a8Xh6ZAaFC
	ZISkWgTl3YLO6urjWdGxg8A+aDB3mJN9MvN7BHDIQKThoCXZb1p+JwzMltJ265zajEboCuk+rcd
	LgH6HsFLVAunLL/x/Dh8o5SitNa+bQCCqPqja+2n/xa1ofnLRoAxcyxE8Nclbtd/xHge+Cmgqlh
	E9M9qGT1cX/MDOS0qo0Kbnz3sHThRsWZjX3s4r2JEUjbww/I6aVz0EUx+aqbUy6S+qvdzBnZK64
	wJEDW/EA2O/aOljFnlvBU5IY6DtaNZFtoDqiLfukffInVkFfZ+KMgFV9OdmdfPyP+z4M22+FwR7
	WXixv8eS02Q42OUvhnFJ4UKjiTU0h4LCtjOCPSVwfDz3u3Zl/A2aSPB0TnsDFMF8X+a51ChlPhX
	icAZ3EL6TDS7dvopJbFGdnQQlgIhQh2wKIKANQvY4br+jgf3XsqVkTA0BuVOprjWDV9MbMKYCJA
	eObzad3Isimwcqdl3OUhti/g4PRHU9Txa25nPQqtp3BTos/VTz0W4cRbdXR/Sixq67GQNzvAlqF
	XRQJoHf0KnlaDUJjl1mXud1eJKEDr7guGcmeBaV9rCX31nyqqaSRmOS0nIpXe0X7u6Lno2Erwtz
	P96i/sfyE3CTRWeHHJfEh0W7f03SSIvHYiILX+xd7nTiPpm2XQ/YlXA==
X-Received: by 2002:a05:600c:34d3:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ba0233e7f5mr50504405e9.10.1794324464364;
        Tue, 10 Nov 2026 07:27:44 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/19] python3-sentry-sdk: Upgrade 2.73.0 -> 2.74.0
Date: Tue, 10 Nov 2026 17:27:23 +0200
Message-ID: <20261110152729.1065911-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132087
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.74.0:

New Features:

Anthropic:

- Record reasoning parts in streaming output
- Record reasoning parts in nonstreaming output

Other:

- (typesafe) Handle inline images

Bug Fixes:

Anthropic:

- Preserve cached _iterator property
- Stop unpacking output arrays

Other:

- (aiohttp) Leave existing baggage header alone if it has existing
  sentry- entries
- (boto3) Adapt to botocore no longer signing baggage
- (ci) Restrict pytest because of incompatibilities
- (falcon) Handle integer HTTP statuses and @sentrivana in #8139
- (sampling) Respect incoming sample rate if not explicitly
  overridden
- (tracing) Drop trailing comma when serializing baggage without
  third-party items and @pabloDeputter
- (wsgi) Stop overwriting server.address

Internal Changes:

Deps:

- Lock file maintenance
- Bump grpcio to 1.84.1 with @sentry-junior in #8136
- Bump uv to 0.13.5 with @sentry-junior in #8135
- Bump brotli to 1.2.1 with @sentry-junior in #8122

Other:

- (mcp) Remove unused select_mcp_transactions fixture with
  @sentry-junior in #8150
- (release) Bump craft to 3.9.0 and update config with
  @sentry-junior in #8181
- (sessions) Remove unused TERMINAL_SESSION_STATES constant with
  @sentry-junior in #8151
- (starlette) Remove unused \_serialize_request_body_data helper
- (toxgen) Remove unused get_file_hash() and get_last_updated()
  helpers
- (tracing) Remove unused base64_stripped regex
- (utils) Remove unused to_timestamp helper and epoch constant
- Upgrade sphinx and remove packaging upper bound
- Update test matrix with new releases (27/10)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-sentry-sdk_2.73.0.bb => python3-sentry-sdk_2.74.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.73.0.bb => python3-sentry-sdk_2.74.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.73.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.74.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.73.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.74.0.bb
index b946bafaac..eb551273b6 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.73.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.74.0.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
     python3-certifi \
 "
 
-SRC_URI[sha256sum] = "4a2ab97b16e4693c325ab361c7bbbb346dbc7d0bc0150922d795a25bac8d5280"
+SRC_URI[sha256sum] = "dd91d75aacaef636006b579ac3ddb2fdbc9dce35f00f4b353b6b1b110c6b256a"
 
 inherit pypi setuptools3
-- 
2.47.3

