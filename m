Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D808E9B25A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18537.1771933481017367939
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ng6VRzUU;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-436e87589e8so5164282f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933479; x=1772538279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrywPp5BhyalhcY1rdRalIeGGq32RXR2+w75Y26yP2c=;
        b=Ng6VRzUU3xIGj6IqoZ69lP/028PR9EEE1TuS7agXxA8kOFWymiVwutsK9cl6ISNJDs
         Z2bEExcGOo6szaFqu2tS20Xn6HqiNkCC4gDPrl5dSA1imSwjd7oXU5rX4/aL4ANCuMy9
         WseHnZHaUksM967ccjxoOhL+82nlDTYdI+JGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933479; x=1772538279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrywPp5BhyalhcY1rdRalIeGGq32RXR2+w75Y26yP2c=;
        b=dSHNVr1gfNRVZdQ/+f+K8BN9T47lqvyfZDpDbyoW2I2FLnfQ+lPKzGpVaVH2gMb7i6
         h7sjykat/TuVVbJac8+GECHq3E/djbIw6bqIjV8O0ZKR7BjR1mIELeQc9ctTUp+zTAUP
         8aY/3SU+KzU16O1FWKlneiImLDIGQ7/+Fw7tXECTJlMj7CSr09eF8KC7/X+yCIpl+fPs
         0tYtjGbnP+P3NfPXb99efRdMRpdjUn5MgLLEXLt//aPGaVSh5dxKPR1wUL1UBa9MTsHB
         hS0DwlO/Kp9ece9jaPaSk1hjEr6j5OpJL+3Xf8Vi2uy0AFzmF82oew7XxBLS8pLl6a4R
         UZmg==
X-Gm-Message-State: AOJu0YwZCDejy7li6bxckGDlt9HMzxp++Xe84AORrzUolvfRaN4HaboV
	9znWTSsJ3CRVrHSJv8rA0DqbShIbkKIunz+B723/QyVsRjoR2LfeKHkh9qdj/kk5Fy6WyGkUuBE
	h69N4
X-Gm-Gg: ATEYQzyWFFX7H94V5pXOJm4rBy+r6S4+bOJOY3hvBDPyooIuvGRN4K/IilrvkHOyu+Y
	WD+BH2jkT2tKFm2JsAYby1Gn9ty70h7nCEpFe3S83YLyJimLvtugnEqmasH9RpRrbw45VTdQi3o
	zErQzQRTlXBemb1bpYeZIUxy++CNQkyXN9cAVevxFrvPBoraEkC+YCcYpY5Ps+fDLCSKI0a2qs9
	Q1vATFyds1sUV6c0Sjtz5Koq99tPDXqOI5JKvutJPdDVV2EAa9PC6BCVSX1slU0NyINzrojX53e
	dTKS9N0znvxNKNSzWEiNnLBbBOpcCrcW0UXQvb1HnqmTKEHgmS1/qj9X+8vNIouhE69AjG7j9R9
	QSREQue4iO9Jguk9U2qQipE38LGme3QGmPVXVzUvz5DQ33tSE5CyV22h9tpJvcLNhzhkYnyeM4E
	Xxdt4nrrQPPvmP2AsH1aK8oQVng/VT8d6udqlY
X-Received: by 2002:a05:6000:310b:b0:437:66bf:a9d4 with SMTP id ffacd0b85a97d-4396f17cc72mr20425144f8f.37.1771933478986;
        Tue, 24 Feb 2026 03:44:38 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/8] python3-flask-socketio: Upgrade 5.6.0 -> 5.6.1
Date: Tue, 24 Feb 2026 13:43:46 +0200
Message-ID: <20260224114407.1760757-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224114407.1760757-1-leon.anavi@konsulko.com>
References: <20260224114407.1760757-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124579

Upgrade to release 5.6.1:

- Session fixes for Flask >= 3.1.3
- Update SocketIO constructor documentation
- Switch to the Furo documentation template

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-socketio_5.6.0.bb => python3-flask-socketio_5.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.6.0.bb => python3-flask-socketio_5.6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.0.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.6.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
index 8358489089..9e94d20748 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "flask_socketio"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "42a7bc552013633875ad320e39462323b4f7334594f1658d72b6ffed99940d4c"
+SRC_URI[sha256sum] = "fe5bd995c3ed4da9a98f335d0d830fa1a19d84a64789f6265642a671fdacaeac"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.47.3


