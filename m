Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A5A60719A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 12:51:09 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id k184so112874861wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 04:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eIg1U/a3QFIYlPs99E6Nd43h35PanKSnAT2ECpFEJBo=;
	b=LU+Ex2j18cqr3ZmEsYhpFI9tVdfow1/6xPRYiMFS1DYhp2w0Lb1eNtBCTgJgSBo4dZ
	R+Sx2SPbKFhh/Vu1ff+xG19CbkPctuwSauFfcf8XHvu0n2cAXz8Wl5Q3bWzY81+3kwPL
	ArXsfcfUdBge9ZKpFmkn9W77D7IqRjBsE98u4bdhIRlNvKjFz4Mfhh6YG2L+0MRkSj8+
	sSuxOOfofZMtpfTo6rXf3CMzmcVfWFbHgjNqjXhdjqj0pLmyWj41gHBmUxkEDnk0VJAF
	8LHHD6aL7oLGaEwaHNALurq9GN1TALMsL6wvc1DV4iL7BXvfU3FU+kMp1RJMy8qvY1Vu
	gQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eIg1U/a3QFIYlPs99E6Nd43h35PanKSnAT2ECpFEJBo=;
	b=fkDIIMqRE4HhbNZlhThiPMXh5wlC9DT8mL3g1JNR9fFxwqN9dCtV7zBnUb39xXixkv
	iAK7Mncx7gUnD7ASYG1Pm1UI4Fg9fhrjZh/C+KBJyoksagftwKL11m9rvYk1ei25K235
	7irpKUUl1bD4oUWAeisSeQlwGvHgarrTIV9sUQ9d+lMsMLhlw5yguNq6u1eiU2oROGQt
	hdid9nFDN5uPPpA46juh954VCEzXFnB1iYI8zkZaTqwOZ1AQMmeVKKJ5ZHG9Hf6qyTQp
	YAVoM6QUsBHF0TqAZy1CmUsQmpqI/k72JXoGTTe/0zf/RcjTh1smj9+bgDpWj38yfW88
	GMYg==
X-Gm-Message-State: AIkVDXI32KaHtBgfIx0bvmbaYCvBrr1E9VuXgnPQa9Bj6asqhRq4/VYqtBzw9Vru6RoswY0L
X-Received: by 10.28.176.200 with SMTP id z191mr33492318wme.17.1482929471067; 
	Wed, 28 Dec 2016 04:51:11 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	g184sm60521081wme.23.2016.12.28.04.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Dec 2016 04:51:10 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 13:50:50 +0100
Message-Id: <1482929450-19842-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] nano: update SRC_URI
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
X-List-Received-Date: Wed, 28 Dec 2016 12:51:10 -0000

Nano editor's FTP server is not accesible anymore. Use HTTPS instead.
---
 meta-oe/recipes-support/nano/nano.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index 3fad029..0f31c6c 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -12,7 +12,7 @@ INC_PR = "r3"
 
 PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "ftp://nano-editor.org/pub/nano/v${PV_MAJOR}/nano-${PV}.tar.gz"
+SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
 
 inherit autotools gettext
 
-- 
2.7.4


