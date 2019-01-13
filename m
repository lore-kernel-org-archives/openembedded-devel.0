Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6762371B99
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 10:54:37 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g22so16420002edr.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 02:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9uO1FEUdpTrJaGwN4IzL3i9U85Q6Tvd3kK/UnczOp8w=;
	b=t4pWen+6irxXaeP2tU7lskbo0zeyM18F+7g7BvXPt9GRqvujJMS/rl0SnPV3EYOT+O
	y5aZwEa5VvnDebxtcv/lqQRbIihYKpcXdTzC2vUPAg3gIb/vSauPB5P40owYBzI4CIQw
	Vxi/Bk7UgqEaK1siasCoYC/S+dn8SauoSGl1h0Vn4pzO7Oq8L1gW426t48W1qUVH8x5/
	1ANVP4NtoIJx2ldNiN28XrVDmwSnLqg8y092fNfDBW5i4nXvl6ejglEslgeJAp/LDLWD
	o0XePA7bXHmOYvh5Y7GvS4iBOK5UAjVwaXGqhPNL1gY/dX1257oExVyKfDaN3bD+V+3m
	hCVA==
X-Gm-Message-State: AJcUukebPbAxFPCiPR9o2zJaSUwZT8v++SxqZ7nUqTk+VB1UNUTRttpK
	C1DACImDWQyf0lBTlpDyiRtqab5U
X-Google-Smtp-Source: ALg8bN4jlgnaXMYduONXTZDZ4UGj+lviEnIjULAhtIkRseHSO9A/DFPu2tWJLY1n7JklgI9oYgUcRA==
X-Received: by 2002:a50:d311:: with SMTP id g17mr18973820edh.187.1547376877675;
	Sun, 13 Jan 2019 02:54:37 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	r18-v6sm2083865eja.19.2019.01.13.02.54.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 02:54:36 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2019 10:54:35 +0000
Message-Id: <20190113105435.11670-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] meta-initramfs: remove True option to getVar calls (again)
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
X-List-Received-Date: Sun, 13 Jan 2019 10:54:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

A couple have still been missed in the past despite multiple
attempts at doing so (or simply have re-appeared?).

Search & replace made using the following command:
    sed -e 's|\(d\.getVar \?\)( \?\([^,()]*\), \?True)|\1(\2)|g' \
        -i $(git grep -E 'getVar ?\( ?([^,()]*), ?True\)' \
             | cut -d':' -f1 \
             | sort -u)

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
index b285b2e8b..ab2afb7f8 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
@@ -25,8 +25,8 @@ do_install() {
     # magic by removing all the crazy escaping.
     sed -i -e "2i \$TARGETSYSROOT = '${STAGING_DIR_TARGET}';" \
            -e "2i \$NATIVESYSROOT = '${STAGING_DIR_NATIVE}';" \
-           -e 's#${@d.getVar("STAGING_DIR_NATIVE", True).replace("/", "\\\\/").replace("-", "\\\\-").replace(".", "\\\\.")}#${NATIVESYSROOT}#g;' \
-           -e 's#${@d.getVar("STAGING_DIR_TARGET", True).replace("/", "\\\\/").replace("-", "\\\\-").replace(".", "\\\\.")}#${TARGETSYSROOT}#g' \
+           -e 's#${@d.getVar("STAGING_DIR_NATIVE").replace("/", "\\\\/").replace("-", "\\\\-").replace(".", "\\\\.")}#${NATIVESYSROOT}#g;' \
+           -e 's#${@d.getVar("STAGING_DIR_TARGET").replace("/", "\\\\/").replace("-", "\\\\-").replace(".", "\\\\.")}#${TARGETSYSROOT}#g' \
         ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
 }
 
-- 
2.20.1


