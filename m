Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A61C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:09:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.11670.1663679383476700411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eTXGKEhy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso1632473wmq.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hNu07U4XVjxhIKuxTlqsd0L3LJSU3v6g985pBbSZUSE=;
        b=eTXGKEhymbpCelhGOI9AKhRf9Ankm4PCH9GIGoCBE5kyInxCtrfKPuG4jGI5NOE4xu
         pnuIjp2PpKVOtNDk++LzA5w73Wk5AR8W7W/MMzHbJ/qtrnEEyIOsQjEt2bGx2zbMwRl7
         QdfsDYsupcM974fgA66xl6vvBIRraRcIdyC18LTEHzOBvZpttnmaGVpWNHs5164ZkDFy
         TT+NN+gapOylGvyW9CuL7z4l+ENTbSTznZU2TOnR6tZLnPhuiEh+7Xrit8MLDJO1wUuY
         5JPtwAjv1MJ3FJY4lQ1v2jukRj1o8zQrccZDHSK996Q4qyr7OEw2GL2wDz+htt6n4O+F
         OcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hNu07U4XVjxhIKuxTlqsd0L3LJSU3v6g985pBbSZUSE=;
        b=W3R/Rs/0RyPbtTiVlVIJ6sEXnz75rCW+m8zM2MCc6dAAagv+BEgUFFwJETNhLYdO+B
         QIVsa+P/BAZzsD6YphsxhpQa5SUpH9BfucEIz73ZKrAv49bZ2EDX8I2f9LLO4+bOx7Kf
         quTTkEfeKq/p01HB7HkdIwXYcRhy2V0hulqrOr8lJUuWqhw1WyZhttlvRejeSYaBcVVX
         ivS+naLLsUqw+aas+Kynf2XT50QGaZyPFrWYtmlxB6FKwa4Dsh39zfm5ItCmkxEwS1Gj
         hoFtPgqhCXIqTkJRdXyE6W44oh9/pLP9UUTEgK71qEk07iBP1w5Olkvx5wr79i1upWrg
         vb8A==
X-Gm-Message-State: ACrzQf34PT0G/6LjOxBUrlXr38LvZ+39bLlZbRYB8YPJdCFo1e4hFlEO
	EHmAmKfRWFo/4mct/FT3TTOwEF9qkTw=
X-Google-Smtp-Source: 
 AMsMyM7xc8tXLLAYykh8TozeKxHubgdeH1WnPOj8UwdShviKW4lNqDaeR+AIFP9Iy2hoGa37GmUYLg==
X-Received: by 2002:a05:600c:2646:b0:3b4:7640:3c1a with SMTP id
 6-20020a05600c264600b003b476403c1amr2457512wmy.2.1663679381708;
        Tue, 20 Sep 2022 06:09:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003b477532e66sm182611wmq.2.2022.09.20.06.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 06:09:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] libcec: fix runtime dependencies for ${PN}-examples
Date: Tue, 20 Sep 2022 15:09:37 +0200
Message-Id: <20220920130937.1551747-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 13:09:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98906

* cec-client doesn't link with libcec, but uses LibCecInitialise to
  dlopen libcec, so do_package cannot add the runtime dependency
  automatically

* fixes:
  root@rpi4:# cec-client -l
  libcec.so.6: cannot open shared object file: No such file or directory
  root@rpi4:# cecc-client -l
  libcec.so.6: cannot open shared object file: No such file or directory
  libcec.so.6: cannot open shared object file: No such file or directory

  libcec/6.0.2-r0 $ objdump -p ./build/src/cec-client/cec-client-6.0.2 | grep NEEDED
    NEEDED               libncurses.so.5
    NEEDED               libtinfo.so.5
    NEEDED               libstdc++.so.6
    NEEDED               libgcc_s.so.1
    NEEDED               libc.so.6

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index cd586897a4..599416cb2a 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -29,6 +29,9 @@ EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
 PACKAGE_BEFORE_PN += "${PN}-examples-python ${PN}-examples"
 FILES:${PN}-examples-python = "${bindir}/py*"
 FILES:${PN}-examples = "${bindir}"
+# cec-client doesn't link with libcec, but uses LibCecInitialise to dlopen libcec, so do_package
+# cannot add the runtime dependency automatically
+RDEPENDS:${PN}-examples = "${PN}"
 RDEPENDS:${PN}-examples-python = "python3-${BPN} python3-core"
 
 # Create the wrapper for python3
-- 
2.37.3


