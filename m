Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4F76F7D1F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 00:29:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id k11so14309728wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8rGvDcSIuTdv12Jk5N/NEWgqU1Nss/Gp7bPAn7n9PZo=;
	b=W78VCxKYXJfl30gGKsinzmxtwWbuq+NleINIeaFbYSy5FArrcPPeWGIqElKXHMwqKo
	yHmAw5F8wfAz7fluqYNEO+3xaEuUz+g+N93qYv+E7wu31qfVjt3KTf2LE7aUR6tpYiwd
	l5uzq+IzX+uBO9AqmLMJkcnqs4pGLXBW81fDApPhSh8BciESg1E45V7iz7ReCXbiaCP2
	V3BJh915lEs879fcURehJVRvsktWIuAfk1CBU+a5jk3eS48/XpSjxR8adrH2beFvZdzA
	dfRU75lYwKdEyj6CZQT8WAJWMfy5+aYvsUHkecbW8rj3I78V2Bv35Z7Sn2JRpyzLAjYo
	QQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8rGvDcSIuTdv12Jk5N/NEWgqU1Nss/Gp7bPAn7n9PZo=;
	b=SkxRDgGniXRxsPojPD+DZgZAz9bPdNYuuyA918SFvNEz5f3F5KojoXKPF6fAARwOah
	zlfayI3X5gZdavyUW8f5lpu85zWXXSDjl03GKdN7lTj527YJUrCBHEqZ4+6pPQKxK4aI
	7ZHxl9d2El8f5eYbQ48EbI+jGIuv+XUCoD6Cf0fhboVTXOJGfKwZRGSCYAlw1epzPKYt
	9t+oo3pRDu+K+m34fTmD/mvlOiFkKyZA7dYnMyaEE7sxePwUSeG+u3/q0YcdEkm+5gnf
	WIip98LXqYysLrozgLjgguEMK1W/MiJsF7L0gfbR40pgwxanSn2CZUzAuz11wPsliz+Z
	xh5Q==
X-Gm-Message-State: APjAAAWOf0IVaFRjCRpykFGg6zpdCZ5BkpajpKyIyE9nYWTtIj85OLKs
	qe9+dLsPlfiIHolVVCRJOQt+7xjv
X-Google-Smtp-Source: APXvYqx18iSNdfJqiC2uF0M3rQwPd+h2mGaK07ntjgr59B1xiZk0xoDSl9R0OQ29UcBrVgsqeVA64A==
X-Received: by 2002:adf:df0f:: with SMTP id y15mr14357818wrl.175.1554164989788;
	Mon, 01 Apr 2019 17:29:49 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2CB726864FD5BA05684929.dip0.t-ipconnect.de.
	[2003:f0:7f2c:b726:864f:d5ba:568:4929])
	by smtp.gmail.com with ESMTPSA id
	d6sm18305452wrx.62.2019.04.01.17.29.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 17:29:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2019 02:29:36 +0200
Message-Id: <20190402002937.10839-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190402002937.10839-1-schnitzeltony@gmail.com>
References: <20190402002937.10839-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] networkmanager: Fix upstream regex for 1.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 00:29:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../networkmanager/networkmanager_1.16.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
index bdf60ee7c..4a432be77 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
@@ -38,7 +38,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "10abacaafb162a67d2942adf03e7e9e4"
 SRC_URI[sha256sum] = "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef098d05f2324c5d2c"
 
-UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.10/"
+UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
-- 
2.20.1


