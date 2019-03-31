Return-Path: <nizovn@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D48A6B50B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2019 10:43:50 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f23so5551103ljc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2019 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qyG8eD4t3u3SihHAKWHCZPIi7rK4RSPRk0ZGw04mtSw=;
	b=XHPrcf5vSYhmPIHKfZmkTD20ebNNghZzFdN1rac7QjLAkGUO7Up5qq3BgC3ZhcEg+4
	Yj48K1h60ZzaRp0vE7IrUWeX09kzwL1pzomgnm46+HYydUO/+nQxrXYYs2ImnmWI1rAf
	srBWgeZfXoBGlMOrA8r+i22hYd0B64MRWUKfZajiM+U42w28/zvlbwtNNnG2NINNPHOO
	M/nJN6z8uVwjFSHTtXYVSW7xrI5tLiFGQLEonJPSQTTRxWVjoIjDLWW/DCu5aJyCGkdP
	djurl+WWDqJb/p7SVa8wfxI9JDeyMYm2qYP8hqeYE4Mhnxw5/RrUGhO4nikPpTLgLhZ3
	xRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qyG8eD4t3u3SihHAKWHCZPIi7rK4RSPRk0ZGw04mtSw=;
	b=EipPPs2yvwray0k48NfWAvCt1yh3kFd2gqW95dVZwWRAMjYP0r9n/2ZaJcopCiZ3ow
	axgoW0W4iQovu/imKzMCm/iNlGvhaK9yDEJ1k6HFqJBHd0u+cS8/Ll3GgRk/SB4Fvbp0
	VoQgceNbF1srjATps87EgLUxx/CMdabtdCoqk7+6EgubTEipFeIWRV9nF+R9YjVAQyZ6
	ljnJkZ8TPrKeAFfQ1kfP2OklLbGDvdVF4ZFZEfm1xgWURDndZSwjAG0wFReU3ij/iABE
	5KkPJVNYoSaWWc7H7+GHjR7bkCoBz+qQdfxHkyvRjQYtx270IdNwS28uGMfR/jpYoqO/
	71jw==
X-Gm-Message-State: APjAAAVdGEbA6cBfDeDe27Xvp2+YWdi1kYvfJserZOH8XmsEoA/nXaHP
	YUPZhI+A5yqOJTtdkQ5FJiVXNN+f
X-Google-Smtp-Source: APXvYqzeMYXIOJYp0NWFHwCtDHMiUh+vFnciv9GxwzIj4cW+7o/DvGnIESC5Qcd61yGVMef6/TcWVA==
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr27085562ljb.3.1554029031339; 
	Sun, 31 Mar 2019 03:43:51 -0700 (PDT)
Received: from localhost.localdomain ([93.183.69.182])
	by smtp.gmail.com with ESMTPSA id u3sm1414010lju.51.2019.03.31.03.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 03:43:50 -0700 (PDT)
From: Nikolay Nizov <nizovn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Mar 2019 13:43:26 +0300
Message-Id: <20190331104327.28050-1-nizovn@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Cc: Nikolay Nizov <nizovn@gmail.com>
Subject: [meta-oe][PATCH 1/2] android-tools-conf: fix typo
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
X-List-Received-Date: Sun, 31 Mar 2019 10:43:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nikolay Nizov <nizovn@gmail.com>
---
 .../android-tools/android-tools-conf/android-gadget-setup       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
index f7d997372..0e04f7dbe 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
@@ -17,7 +17,7 @@ echo $manufacturer > /sys/class/android_usb/android0/iManufacturer
 echo $model > /sys/class/android_usb/android0/iProduct
 
 echo "0" > /sys/class/android_usb/android0/enable
-echo "18d1" > /sys/class/android_usbid_usb/android0/idVendor
+echo "18d1" > /sys/class/android_usb/android0/idVendor
 echo "D002" > /sys/class/android_usb/android0/idProduct
 echo "adb" > /sys/class/android_usb/android0/functions
 echo "1" >  /sys/class/android_usb/android0/enable
-- 
2.19.2


