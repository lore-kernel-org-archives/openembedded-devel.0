Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B320D3E18A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.29944.1729278792612481221
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RXu+sal6;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so16385977b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278792; x=1729883592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxDF8YnuN9Mi6Fe4nAkx4jj8SnHiUvtB07Q7xiXCW+0=;
        b=RXu+sal66kOvQfPlQDTKewLkK7OPVRxvR810DLnmzjXZdITtHBqHVoAeOC48eCnMep
         M0A/lkQzTRCQe+bnPNYhrE/kzgAjxYj8kNnRggpmzyKSlrDxeTnysJbcR+sbXWsTiias
         ceEJfbb6hanHybeJU1HOD8VzeYgOoZWVPQmb8hVINTx/uhMKR49q04eCcjf4aCe3w1ke
         p2tZHIYEUdVhuU1xyTzCTDAPaaj0HItPINc7jjD3Wr1gPliiV6y64oGbUjhQzIHZ8QCX
         h0dyXfWWpleIEfB2SzJE1bjHxqbA7gY8e0nG2Ul6y6/SSf8628CX4cM15OVWGz35TLb3
         XNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278792; x=1729883592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxDF8YnuN9Mi6Fe4nAkx4jj8SnHiUvtB07Q7xiXCW+0=;
        b=sy+fZB7Yb1sasxvogSOmH/xe7Z6gG/KIcai+lFitZjKu2XYQtTdLzSXGiNdObSaJm0
         bEBmXtlywyV0QwHIXKphwan62mbgJCKnfIBOdyA1NrSMPNxNLCPBNq+k8GZdICyMnIA4
         SM475Nl//LvltC8/vOunwwfZ3Jo/jVdGr5cMrivgvkearwm/FWFNBPOeyfWc6Ft6Dyj0
         E+UM+xzYhjcw6j4q23jgb4VwigS040pnHd+catlCij5LCpjVBLS3PIVTQmlEdBMMmbr2
         NcZiWgYYzi9O3OcaxfkOAm6LHOf9vUFlPp/bsBVh9uVk0t9Kcrhw7bQwPc/5T40Lb7tU
         VgMw==
X-Gm-Message-State: AOJu0Yy3xmp1pIr25vpC3YOwFbhS7bK1lwz3R7ycS5MZ71zp1sXFMNbB
	2TfJ2k1tcWV1uHICnEndPiiYGyp9UdYnJVQIXvWOyPTG2tuoXpxIOYxhYQ==
X-Google-Smtp-Source: AGHT+IFPs8pzOqwrn3SoUiTPCSO4J9jmsbr4WAl4eZ+DKBfGj4eL3xDW0KoEJm9q00jEMQuIrkfUjg==
X-Received: by 2002:a05:690c:f8f:b0:6d3:f9a6:e29c with SMTP id 00721157ae682-6e5bf9a0846mr37885457b3.12.1729278791208;
        Fri, 18 Oct 2024 12:13:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:11 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 01/68] python3-gsocketpool: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:48 -0400
Message-ID: <20241018191101.25184-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112988

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb              | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index 60ac18155..4bd8fed68 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -9,7 +9,6 @@ RDEPENDS:${PN} += " \
     python3-logging \
 "
 
-SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
 
 inherit pypi setuptools3
-- 
2.43.0


