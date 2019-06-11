Return-Path: <yann.dirson@blade-group.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E06C77D24A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:32:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u8so3426718wmm.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ed0k8o6UMCoAuXfWBtKKdU2k3uQAukIoKkGrv7TTV8A=;
	b=pxi0yzQo4u6oaUPBZhynodksT6UZiWzsw4X1Y6+S8DxAIoT2AR6xrWR9xTYHyf+yLa
	ztubrgLpsgUVxgn+7NjbIO04FT0le7qNK4wVUIg4hmZ9rjI5zBmrTEUPIRJq4wgt3QZd
	dMNWiFk+pA89TP3QK8+dogSgrxa3JNIlmRgCgkiJKmEKhWUyJ8Uxg1c9J9wbV96WIRr/
	jtxoJhnxFvhHCTEjCWiadu1K9uhfbttPLZBJ4l5CfyUJa49BCrkUY7K6tRimGQwatWbO
	fVcEd2Bay/t6Pt7YJ8B3gI50E03NFksr2jQ+86K+jJKKE2q8E+frQd5HOYBKc+qDlvyc
	6C5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ed0k8o6UMCoAuXfWBtKKdU2k3uQAukIoKkGrv7TTV8A=;
	b=NRa/waroC5w7tH01T7D7AdYKHK8MwgYWVe0kCHZZh/2LrOgw6RnD467ZqX0ZTzp/Mh
	Pp16j43+50ZyjSGy89pFY35+PRc9LEOEqcBWUN/QkTpqAI58stJa4lx0vvgnIjmcZUVG
	4uk08vJBNYSZ0sqlTHDLnTHekUYiSioNXnZMfS7pKv4DSObGO0UOnvJQZHDPk4TTQ5+j
	QjNu9oDlWGtJVQbSnEZy93GDtWDGGPV1rlHV8XTzLQssw8QjvIIxp+fvf2thW8Px2H+F
	D16jQvDvt4f186v1/iWodCE7NvRFPOvHPpiBA4OwHGLWwYuQ1OBxoevFxRyAxHXA/3PF
	NNoQ==
X-Gm-Message-State: APjAAAWuIVUwBjopZ+cBBNoxFflMxv63ha9x14E1eXIuRARlTgqceqcD
	XvfnexVLaWlapwN387eOYE0HFyPi4bGTHw==
X-Google-Smtp-Source: APXvYqwHUY15GMSoOEA+HO5P7WDuvm88SpHusqsSDUuXf0EbLVsXZr74nInBiGikztY4HWQ1BT4rHQ==
X-Received: by 2002:a1c:a00f:: with SMTP id j15mr19513330wme.167.1560267139445;
	Tue, 11 Jun 2019 08:32:19 -0700 (PDT)
Received: from yantop.local ([85.118.38.73])
	by smtp.gmail.com with ESMTPSA id s7sm10745146wmc.2.2019.06.11.08.32.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 08:32:18 -0700 (PDT)
From: yann.dirson@blade-group.com
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 17:32:10 +0200
Message-Id: <20190611153210.20013-1-yann@blade-group.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Yann Dirson <yann@blade-group.com>
Subject: [yocto-docs][PATCH] doc: discourage users from looking in directly
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
X-List-Received-Date: Tue, 11 Jun 2019 15:32:19 -0000
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 documentation/ref-manual/ref-classes.xml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index 5cd25e8c29..0f8c89703b 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -3236,6 +3236,14 @@ This check was removed for YP 2.3 release
                     <link linkend='var-SYSROOT_PREPROCESS_FUNCS'><filename>SYSROOT_PREPROCESS_FUNCS</filename></link>
                     variable.
                 </note>
+                <note>
+                    The paths under
+                    <filename>${SYSROOT_DESTDIR}</filename> have (for
+                    historical reasons) a complicated structure, you
+                    should instead look in <link
+                    linkend='structure-build-tmp-sysroots-components'><filename>tmp/sysroots-components/</filename>
+                    when debugging a recipe.</link>
+                </note>
                 </para>
 
                 <para>
-- 
2.20.1


