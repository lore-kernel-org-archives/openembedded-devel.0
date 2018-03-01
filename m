Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F28578836
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:36:01 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id i6-v6so3641320plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ty2SdaNKVX1QwfJPCSiSckvoRH6BG2gvx31nATu2cTY=;
	b=fXjx0Ra/fPhZYZXERbGCc3D5hzRl4c/XSVVnS/1QW85pLRk32lRKfPQSBJ8eqm/rEF
	Z0vl6h+INK66BJnWTXf3KieIMhxsXHqxTqLhfIxbELyb7Klf+XlB6VuR7V5u9iwm3+yR
	r4sPd9PTLqr8Tje1/CMhw80Wy5wiQv8r1mqMcl353q5yJtQCx0K3YkQUCnNmpY4fmMer
	VBJu3nI2eRNWf5+5gAWYHO6k3qPBkCOPAH/sIu+JKvdCycYO3gTT5qe+4yzzey/uIq0e
	lIaspdoYsSR1PK36C9x+kEjLydepymVvFJ8iB4Diz0LbvuG1BoS5u0n6oL8T5mVDMovZ
	jG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ty2SdaNKVX1QwfJPCSiSckvoRH6BG2gvx31nATu2cTY=;
	b=LTQF8gW8asr2lCE5t6fGAdsD/xPbxDCK3crBwJqcPqiAsRelQY3hiKL1kCgqkVp0eW
	o8azxhvYUuKXZxX1crppaELI3YtmwlAxLVEzMeDTX++wik+YVPjrlVI9iWcezkMgoLB8
	Y3ziL7yWV/sJrW40DB23rRclwE2aQ1McbQCnzBHPfrLcUkQxECwMGWA1lfejw2pJBLR5
	tHo+rd1cZW/2HDpmOtb5FfyEjuBLAQwXdCzjgJMKG8IHJ+TQadJDUJ8EEaQKWKW7udBi
	GSNTbLqrKcsvQ6DZ4pPyS/12r8jhP/i6BhIpkNrHCP8vdGPkxp0raWaWCX1ri4ghoebx
	jYUQ==
X-Gm-Message-State: APf1xPCaIioXAv4HuHW9go0HuoMyBr/yO2g01JH+UdyHuaBKlyPGRJTM
	jCZ7AUChZZuKtkhSlIZBRRZdMEsr
X-Google-Smtp-Source: AG47ELshm7i8c+Y+y0Dm5FpPgfj3brBYuohzOTyj9nUZSaYe/5ws6MeciPKKAfmVeVxjXcjZ4pnSBQ==
X-Received: by 2002:a17:902:8a94:: with SMTP id
	p20-v6mr1980467plo.74.1519911363353; 
	Thu, 01 Mar 2018 05:36:03 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	b6sm9853743pfm.160.2018.03.01.05.36.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Mar 2018 05:36:02 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 19:05:51 +0530
Message-Id: <1519911354-18140-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-openwrt][PATCH 2/5] libubox: fix hardcoded lib string to solve unshipped file warnings
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
X-List-Received-Date: Thu, 01 Mar 2018 13:36:02 -0000

Solves below warning, when libdir is other than /usr/lib/:

-- snip --
WARNING: libubox-2.0.0+gitAUTOINC+96305a3caf-r0 do_package: QA Issue: libubox: Files/directories were installed but not shipped in any package: /usr/lib/lua/5.1/uloop.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libubox: 1 installed and not shipped files. [installed-vs-shipped]
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-core/libubox/libubox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/libubox/libubox_git.bb b/recipes-core/libubox/libubox_git.bb
index e175547..75b3135 100644
--- a/recipes-core/libubox/libubox_git.bb
+++ b/recipes-core/libubox/libubox_git.bb
@@ -66,7 +66,7 @@ do_install_append() {
     fi
     install -m 0644 ${S}/*.h ${D}${includedir}/libubox
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'lua', 'ON', 'OFF', d)}" = "ON" ]; then
-        install -m 0755 ${B}/lua/uloop.so ${D}/usr/lib/lua/5.1/uloop.so
+        install -m 0755 ${B}/lua/uloop.so ${D}${libdir}/lua/5.1/uloop.so
     fi
 }
 
-- 
2.7.4


