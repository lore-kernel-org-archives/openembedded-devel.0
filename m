Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DB5E65281
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:04:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29956.1769954665385910986
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhoD5BgE;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee07570deso29929635e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769954664; x=1770559464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ctQW14w7YMAYpqlNRvRf66jery4qyOgWt6P0TZo7GA=;
        b=FhoD5BgEvhEklrOjWgeEpuwlttJPUdWpzLBHGje49fEWuc9BMGU/A0WFQn05RQeh9+
         UH1bedyaIi3ln8BFw5fsI2DVhmre73woW60/ZwL2pFbu5afGgLa9XmskPYEKUba/60WF
         0t6K532KVXRjy5xnolR+GLgYupN70vHVFikIGhkm2cwZFizKBbolwyl+TixA+nm5+09Y
         Y7vn7TmgApkTbN5KZnXWGFkwz7uN9AiXlb40d9y2IZIB9qrxisCSTUfsizvyU4sZQiyV
         QilTm+g3HqJ+1ZNwYBkw23bqdVM481T9wDguvDe7e5K8ikIxilHpnhy3EoyCtzwFrc6n
         j58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769954664; x=1770559464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ctQW14w7YMAYpqlNRvRf66jery4qyOgWt6P0TZo7GA=;
        b=Vbe4/0QDWXxUJpSkIQ+OE/M10p43USCWtyziOJbLL5LMPev8F1JIZWbLjqwh6Sw2y4
         4sUUuR90oc9LfGOVHPRAQXQhgykBkHU/HQ1fFIZUhIIyb/PKYwUurRJUo1RTlI3tOGVN
         XCE4AqAZ6d1ghxMzlBfihagHDbebdW622Im1Nk2noQL4+t1yQXQjCarA1zCU3WXfUtUp
         eZ7Q5rM0mnZEhPT3BhGOLDOy7MHaFUVasW6pwRnnO/82hP3VnWGwKgGdi00D8Rl0kuNl
         TaPAKjYviY0sds0jjsd3Bw1g+l9h4skElJoUeUd7I5UYqfxvka5qRAPbqzUjKId8xxyN
         X1xA==
X-Gm-Message-State: AOJu0YyfsbjNaKZFwyJ9DmALTcjw6W1tH2xrCGVEUz2iZV8e8I4Ptmly
	ldgsa7WtqRPmRv0InxODzw9gSgrXQ3tOTo5Qgko6Ekb6EGpmwPAOzgIbLEThKw==
X-Gm-Gg: AZuq6aLZmF+uT8Nu6oq4FWattt8NMiIA8GWee7k60Hde1mgZaUM+GC8kwLca58aR7cf
	BdhAGEvsPrjgPL/jOhYqhOGif79W0Pw2WyjuhTDhfiD1sogHXMNXyalhbcTsBzzizdFIfZgv87X
	DBoKCa+R8NUno2SYzBLapjhXRffXHPt14piAQROBlNG8ZP13qo/TYy379ja7JQHCOhURVOzT7em
	941GIewgLt6AGykpQqx9eB8QPHscB3Nxq+UpioSytAZnvZcW0ZM0Q1YOMSe2W1PUkiQLIZ8JoZJ
	Ia1SumAHNzF3dhnLGSBaxnoXY2lPyT8HqolqGMmNJFAI0su8VtquP6uNT5Do7M/PN7GmtW7xMBU
	iNHzTZ/YBeWbu5he1a/JsldWgmn2ijiUpC3C5cb2RSBiSOV/gbu/83x4qt64iUtTUR7bAo9y0GO
	V9tgWq5BE0
X-Received: by 2002:a05:600c:4e87:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-482db4655c1mr108735655e9.13.1769954663724;
        Sun, 01 Feb 2026 06:04:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm307984695e9.7.2026.02.01.06.04.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:04:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/5] tigervnc: ignore CVE-2014-8241
Date: Sun,  1 Feb 2026 15:04:18 +0100
Message-ID: <20260201140421.768419-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201140421.768419-1-skandigraun@gmail.com>
References: <20260201140421.768419-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124034

Details: https://nvd.nist.gov/vuln/detail/CVE-2014-8241

The vulnerability is about a potential null-pointer dereference, because
of a malloc result is not verified[1].

The vulnerable code has been refactored since completely[2], and the code isn't
present anymore in the codebase.

[1]: https://github.com/TigerVNC/tigervnc/issues/993#issuecomment-612874972 - attachment
[2]: https://github.com/TigerVNC/tigervnc/commit/b8a24f055f1a29886d8b18bb3f0902144dc5bd14

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ed8a1038d227ee521cf2349d9f7f8e37eec6a64a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index acaac7183e..6631995665 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -118,3 +118,5 @@ FILES:${PN} += " \
 "
 
 FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
+
+CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.11.0)"

