Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B11D3E1A0
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.29945.1729278793246198710
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uvc+IHrZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e35fb3792eso25389077b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278792; x=1729883592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUhjMPZCZGtQwLHil0JHvgYe3A+W3jtU5JwGybk8OVI=;
        b=Uvc+IHrZUkLwhNOm9TET7tdaL/fOY7s8jtL3PevU3C0xiFdfM9JnpqFepPshUazyBC
         28OmSL4rqQYM8G0e4uKjmk2nhGkGoggkeL3DtCrWftTS72cDgLnLysop4HlwSAEnzMbH
         Q+eY7ROHc+hxH+NceAz3+TXiyTHdHc9FZkvhea/AnakvuTV7kA/Xiyt+Cd8CvVkAbx18
         paanJteFyp1cQeSwL2E20D0AE5XCp+97Nk6vT+kJ3PUkq6+cvR1DrAS3odRJ4wFIDS+k
         iDB3/BvuZuzqzz3OAZucT+eVpnTX9Y/Uq+3Aieieogdtl0puHyv8dP7Ykbq8fGQjvuic
         vANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278792; x=1729883592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUhjMPZCZGtQwLHil0JHvgYe3A+W3jtU5JwGybk8OVI=;
        b=kBiryUGOce3eadfnjzUBlLyRbvj1ggnQ1iSbcOyLcTvOlkfMNg7c2xma20vKoaAbdo
         y1qPKlFSLdO6/OmSV6ngDGnsX7niU0gOAy49gIkI2KifMMABAqPgKaljb+8LaFs9MTVl
         +i4vtSeKlay44H8xUndpdHy1MAmgrb9qMvE7qfEeAw9pAcBaqUt0ftmUPUmhnd1FzWs+
         mptk3Nj5UYBwibO8lUeuEOqR9bVKqbFLVNOk6nsiJsVj3FjH0V+/lyNOLSUgG6Q3LYsg
         WMsKGuQtku4RTUxHv8lRmYWKwv8OyyEb/wGhqmlhDGpjW9VV+vC/0dqoa7UxE/QsLKeV
         Di6A==
X-Gm-Message-State: AOJu0YyFTNsWJJVN5JTDeZNAYwzpOQKZfMvDOI1XBl3K5bGCBTVt8YlX
	ZtByOc//C9QFK7l5rzXW+MeS0OHVf3/ZAdBTypbEjIohr3OoVJiB52s5hg==
X-Google-Smtp-Source: AGHT+IEgSLNjf+ws+hTZgv3mTKz+/N5UxAjp4gBhSmUbMCHIvR53/4Z9OGuzKDGCsV47YCkYxJWEgA==
X-Received: by 2002:a05:690c:2a86:b0:6e3:fb4:9333 with SMTP id 00721157ae682-6e5bfcf44famr32765937b3.28.1729278791864;
        Fri, 18 Oct 2024 12:13:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:11 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 02/68] python3-hpack: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:49 -0400
Message-ID: <20241018191101.25184-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112989

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
index 0297cb8c2..9fc1d6c0d 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[md5sum] = "27e01514ef06dc9fa0798d3dcb7de47c"
 SRC_URI[sha256sum] = "fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095"
 
 inherit pypi setuptools3
-- 
2.43.0


