Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B755EDE997
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 08:48:46 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.7306.1694681325167571177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 01:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PLZanAaM;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9a645e54806so92196166b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694681323; x=1695286123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yR6MTggiao6ujYCssIvIb9B4FcmuJn76OVihpKB58NA=;
        b=PLZanAaMk/IdPHEPHDfGQyjhkCH3JrtHFXjxhZHYcUQuOCVtndw/O6YWIWG+SmnFxD
         I9j5OK0mIjqWcUnWeybQwi7NPhsWzbXnXEe8I9TRiCErSQmhIDY0eAmtvzK+ehtVHOoh
         pb9eoCUiBlEbUat9WRYOX0w/5VCVq5jGbyPXsMT+h1C3lla0mqnxaTxFxr7nM6RGaCH7
         0v6IUn4B3OOAnWNRk0kR47qziWLa7+/dzqoAHyYcPzOfHQGegEqqW8WNlNzJokHknt/3
         Jaqz6vm3QABOix+uWF7mQ2ukzUq7jAky7E8BxId/Cv6FuuuKGNgF7ueHQ5KAbp+cBjLx
         9GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694681323; x=1695286123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yR6MTggiao6ujYCssIvIb9B4FcmuJn76OVihpKB58NA=;
        b=If4EdckYQDSTtnUA1Kxq19AfS/7Zbxn0oWiqnwL7x33PnfApObVaju7u/9uOBClvfC
         Or+wv7gS+GiBUbq16iI5FWf8LIUTXCsPNaH+bfiBLQN9xBUivvYZNrU44bRQ2roqlQnA
         LOcDe3S76/drzvqJnAHt6RwwGM+fahncTQ+mE75EUVG+WcZ7G2WhhlokxeaonC3PDdZ8
         ueBYBupYLKtoptk9sAoI+CSzirNhe0UrEZnKapGWXWBM4KUF5QKn1tJ/yMyD/x4rkoLq
         VLySIZRGplBnWBPWz6xNu3NPR5MrGxJDzO4S098Zys2W2BjCcOPE6RMrGQ7+Zmc9vIT8
         6fEQ==
X-Gm-Message-State: AOJu0YyRCb1/g3nw39csJreeNfma8h06gYu8sJH6YWups0P/uR0qgFi9
	8pGGi6s0p2zMMZhOL2nIIGok3OdAQL+0
X-Google-Smtp-Source: AGHT+IF4NQmRjfApQYvxxk9DYv3bfNwAhE8f/wwAXyIDIYAbdT8WqktuEQoQbVapd8uIUArl8UlJSQ==
X-Received: by 2002:a17:906:23ea:b0:9a2:86a:f9b7 with SMTP id j10-20020a17090623ea00b009a2086af9b7mr3678013ejg.59.1694681322965;
        Thu, 14 Sep 2023 01:48:42 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id y15-20020a1709060a8f00b0099cb1a2cab0sm693974ejf.28.2023.09.14.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:48:42 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH] python3-flask-jwt-extended: add recipe
Date: Thu, 14 Sep 2023 10:48:25 +0200
Message-Id: <20230914084826.3553-1-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 08:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104866

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../python/python3-flask-jwt-extended_4.5.2.bb   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
new file mode 100644
index 000000000..f55d77174
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Extended JWT integration with Flask"
+HOMEPAGE = "https://github.com/vimalloc/flask-jwt-extended"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9166295d7c482b9440bbb2b5c0fa43ac"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "Flask-JWT-Extended"
+
+SRC_URI[sha256sum] = "ba56245ba43b71c8ae936784b867625dce8b9956faeedec2953222e57942fb0b"
+
+RDEPENDS:${PN} += "\
+    python3-werkzeug \
+    python3-flask \
+    python3-pyjwt \
+    "
-- 
2.34.1


