Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7619DC35295
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.21284.1649623232540579057
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=BnGObvKh;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id j9so15292026lfe.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzJNczjfj7lNl0k1rmj9lIs9EWUiO5sVdo3Ln95nr+o=;
        b=BnGObvKhcFkEpu4XqVGpylgUOxPR8llyx/l3bFXfb/JRn31TYfHRuk6h8CdrcMXr9S
         qQdWnTWQgUcX7czpxmap1ucZQBwbQD+vFnUzTsI1B7CSTTHaxuw7f/KcibQV+LbMr0gO
         V8eizQFikQM45+iBwdXUvRwZaEE79jpWb+NZ3OkjW3RYPElZ7yXx0A/kZ537bmUjiat4
         AluDMtn2M2h3nMEs03AE7QCvOq9jtfPCop9aNJP/ygdX2ZiGwt8mkPldcSCfJbB4c5/H
         RgRZAuSXGtq/XJ9BB1lSTt2iqhhmLEHS6YLs6LqlQIO4gf4qUs+zvwfEoeRLH8PU0zUI
         4ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzJNczjfj7lNl0k1rmj9lIs9EWUiO5sVdo3Ln95nr+o=;
        b=STwGyRMlqTDByCDe8y4gs2LDlTmPCKQlX6df3C6EoL8HbNDLFqR55c4X77ORGuFJsV
         HOBppZnlhTNeFDemMEStl+OeCWIwpkd6lld9drbkCYI3Bfgy6a4J1VBiQ9O1mKoNYekM
         IoKGGggj2MVaqL5UVjfgWp4mtfg3yd8rgXebaQcs+v3p4/887mIqobpwSCMYdFU71nml
         PE80UOA0ebfKJ+1ZN7LimF1to+yAsrtpB7UcvwH6rApSAhFwmCXGi02Ih533KgWbFi/a
         vkU41EYo+c5HKeKk4ofUTwFwgfAAcCZCEVMnu5O/HU6+JM0morsAkHa4TxCDBNxfBZu9
         AQKg==
X-Gm-Message-State: AOAM533zPWt3pU98E1wypcTnXSfuKqoN+BeGlblDaXTmaYLw0wPCZYFQ
	sUbKf8rCbtyktcdUxxgoKU/Pm+uA6IyBXwUz
X-Google-Smtp-Source: 
 ABdhPJyizGZK7Wyz6QHVPsFu6KMYofv7yrDvZGQyRphHE8e0qnqfwbACC6F3z7zjujEq86ZQziekyg==
X-Received: by 2002:a05:6512:3fa0:b0:44a:f66c:8365 with SMTP id
 x32-20020a0565123fa000b0044af66c8365mr19795246lfa.152.1649623230589;
        Sun, 10 Apr 2022 13:40:30 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 o18-20020a2e9b52000000b0024af0b04d04sm2969016ljj.1.2022.04.10.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-zeroconf: update to 0.38.4
Date: Sun, 10 Apr 2022 22:40:28 +0200
Message-Id: <20220410204028.4043330-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96509

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-zeroconf_0.38.1.bb => python3-zeroconf_0.38.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.38.1.bb => python3-zeroconf_0.38.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.38.4.bb
index bc06618c1..d305f2b83 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "10c501b25d8881b656e56c34674d98fe6bc752240a572e74f918bc849c93ba9c"
+SRC_URI[sha256sum] = "080c540ea4b8b9defa9f3ac05823c1725ea2c8aacda917bfc0193f6758b95aeb"
 
 inherit pypi setuptools3
 
-- 
2.25.1


