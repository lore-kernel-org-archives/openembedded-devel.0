Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 929627F2F7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:43:31 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u186so4794955qkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 15:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=useVLWvEHHCPsEfhQxUeXzFxviYR1MHO+r6Tk6oV5oA=;
	b=T6yWuEavEA86NhmKqsK5PhYlRByq22abXxH2xOgOsiOOp8bDrXN9FsV18TvYOtMENT
	CQM1+4GyWXi8Ulkf9AEvy5gFr8M2Vxs63TiJMZVQDjb8T7vAQKPJpUxZQb3LC3AmE7iA
	KcOFbjdOB9IJQaFBPEa02jIk9s1JIGZeZaCDaaffD5Nv44OJLdIhH6PwJZ4+CP3NrjdQ
	YzF5tcztOkHXFGxGeYaf3A9STmJEdVbwgUq4+uRwDI0HSy1ndYtcNiH9yuX9zsXXQVyW
	ZjtbAqxGvq8Sy9AqYcvg/pHw1g0uqkgU38/CwcT/PLdCSy39S+k1BJbkBiWHbke78QO4
	SdrA==
X-Gm-Message-State: APjAAAV/U06E0YxE+XkOJKhdd1Xx7f/V7Z5S3A26L64ieQ4qrpJOBGI5
	zNQvdNXsWoFjevwlNg9FYlm++oiiWn4=
X-Google-Smtp-Source: APXvYqwpMLyE5bLAYOqVD/ASiA/nboZMwm1IzIZzwCsSrSBe/KJ/I01OBljFI2pIzxSk27CPVuTjAg==
X-Received: by 2002:a37:b403:: with SMTP id d3mr11551645qkf.76.1569710612182; 
	Sat, 28 Sep 2019 15:43:32 -0700 (PDT)
Received: from localhost ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id 44sm5297145qtu.45.2019.09.28.15.43.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 15:43:31 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 28 Sep 2019 19:43:17 -0300
Message-Id: <20190928224318.4127069-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190928224318.4127069-1-otavio@ossystems.com.br>
References: <20190928224318.4127069-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 4/5] libqmi: Upgrade 1.22.2 -> 1.24.0
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
X-List-Received-Date: Sat, 28 Sep 2019 22:43:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../libqmi/{libqmi_1.22.2.bb => libqmi_1.24.0.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.22.2.bb => libqmi_1.24.0.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
index 3b2fe51bb..9b89e1dd8 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
@@ -13,8 +13,9 @@ inherit autotools pkgconfig bash-completion
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "3fd831c1b0de4a4432be628432a960ff"
-SRC_URI[sha256sum] = "f1f1e514a89b1dcba05cf7274895e7301a2da4c947b7c2f17acb84fc74038227"
+
+SRC_URI[md5sum] = "4b181c0a8b933226ce3dce09565fe8f8"
+SRC_URI[sha256sum] = "aeb69f90c273467cce246176cba0967c6413f1995a976992770a597c4fe28c79"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.23.0


