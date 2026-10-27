Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14652.1793092847263770770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NwWSS3MH;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so31757135e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092845; x=1793697645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/tyPwNzieP7lJBnz2h7DZdki103p3uR4gf/GKoBIao=;
        b=NwWSS3MHr7cZyB3RnZQCQAf+CmnEtFwygXyLVe4ggIEuZHHW7ytkcnm9IKgK7DjH0P
         oNeNOzgczFPFSTNr2VddxrAZKi77EUkBFgbN6pOuy3KLCGLHFTdgo9GOdtG+6tuqyJt9
         ayjHZMmzPKMmzpsTYV20wbvG8KL6LKkEaIfkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092845; x=1793697645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/tyPwNzieP7lJBnz2h7DZdki103p3uR4gf/GKoBIao=;
        b=m5b6DDRMdtP3HGTySD00a5DdPjtUvZ8EXr2OZqcOXrCSY3pUXJR8Hd1SFWe8TF3uiI
         tkYDZbzNjcs4/082NNVNb1rQwEx1RQ9ObkL9Hwap58IvRaKRRSaY1xkqGk8kcVF0HNU8
         ivB3PG9coAYTPvbhUWVM/BNwl66J5Uljpe//+JlkmctafPtsZydDW0L8FgLuTC/lWxlM
         AX2Z05Hu43ooVheDrEjTpfv+QBG3YtbI9Ee9stL2mgqOdNgGYrdhm+qXuV2TlN3tv0Ge
         FMznzMF+jTNb/Iv95+BpmiKoqv3qwRjoXhSMtc0tDLw/SOzEokFQELgkljk/ZvXJF2TP
         C23Q==
X-Gm-Message-State: AFq9FYIv3S/HyvUB1tl47hNIG0lSSojijVlack3SFK0tCoPDFOjE15bs
	eIZMy0CEfdFbAWF1HJcpf5GDtMB3iJ4nfhQpdLgu/i2vmCUrLyar9g6h8Md9XAd4v6PhSSbfWL/
	DjP//
X-Gm-Gg: AYBFou1RSLLm470vgQ7p3CJXpzAYe+794X3sSGydh//M1SWHYOmTrCE4mYapL1DO/jI
	YOP3tI0kiwG77oGEdTiFj0xmIgxFkMFs1hY6Z0vP5wJJgxVcynkqMvPPQhQnWN/UByVnL+oetdp
	fmn4Seq7nY4sTAFnFrjQn8vs06o2AWV3OZtTmrmO5OQUuunKRm/PtNB2/Rmu89lsswG2XMw9Q+8
	FcUeI/pQ4jTn3AeJtNDZIaa/bBUuh5FwTmtyrEHcRgAW624sxDbwmGf4w1i84/dB8IojQ9+acq7
	OwKyRskdevPlbzUYQqkpbrmJ9Pdt1Jpy9VwhJSQEHFX5rGw1Myed2OkzbwgbzNDgBZKOnGTrtd/
	/b3zjTwugW+In5uYfEYhvMLmUNeUUz3fKPuRNERJwtiKIWgzL/4QnJxgx0gvqDXkpZVh541rMTU
	LzNPXi/5GxPO2wfFPvcPfyXAxT/L57ToT0dxsWaKLRYbCYi5vkoJgttvLywdbnCNIYtDL0kAxnP
	3ixZtWOy2gIfA/QR5yPVJu+DdIsT07FOyGwS7b1D90cFnsACdz4jofxkDJZ1engHqrD1rOk0bKo
	H6Lgh9VdAOKKufRJMsMw99C+WNPcdy8fCKRZ2bJ8Z1xRGiUMwg/rfBDAMkdiRjNeNkmcLbQJ3MC
	oh8lj
X-Received: by 2002:a05:600c:1c22:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4a790440cfdmr63415185e9.27.1793092845454;
        Tue, 27 Oct 2026 02:20:45 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/61] python3-portion: Upgrade 2.6.2 -> 2.6.3
Date: Tue, 27 Oct 2026 11:19:40 +0200
Message-ID: <20261027092028.782979-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131477
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.6.3:

- IntervalDict.update and __init__ behave like dict.update when the
  provided intervals overlap (the last provided value wins).
- IntervalDict.pop accepts None as default value.
- Fix from_string accepting prefix (re.match) instead of full value
  (re.fullmatch) for infinities.
- Documentation of iterate explicitly states that base should be
  side-effect-free.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-portion_2.6.2.bb => python3-portion_2.6.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.6.2.bb => python3-portion_2.6.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb b/meta-python/recipes-devtools/python/python3-portion_2.6.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.6.3.bb
index ecd524ed33..7ebc349e11 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.6.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "fbf334143dbac5d07ffa411784e2b29e4e1f21203385019a93e2c1a8f443da16"
+SRC_URI[sha256sum] = "4dd6a68bb1cd7a553d9b1f556818708b973c4a8855244e0af79e2586bba5794e"
 
 RDEPENDS:${PN} += "\
 	python3-sortedcontainers \
-- 
2.47.3

