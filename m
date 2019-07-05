Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 72CC47ECFD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:52 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i11so7953146edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YriI8X6XgYXsZpPLasSvfDhtKQeP+0nlCBGBbvPbFfs=;
	b=js0j7dJCB7/CmGwKD/8GHrQfBiFigUBYfr0hxOZzvyO5lc44TGREhBNnct6Qp43hPE
	it9pu3ELi0sF1NyeUZ0nYPAsA4qzJrvVALLl1FOWTWcC5e8AXuFlBGC1vWpMnetcnCTc
	tIjZZGsRW44hwY5sYUwJngYjo+pT9BVGk4Bck2UhfmqFnzpQg34KPpvxhraufBUR6vD1
	CCgFny0aasC0tTQzvvibCmmzzSt1toz2W1ckV82oj6ikYSF98wX5aVG4ATeytxtxAvkW
	eQkfECiorCPSEyhZVphHKhxUBhCJM03F7JKVZ3yH14qo5qRdL88UHyRDp017HZP7774i
	15tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=YriI8X6XgYXsZpPLasSvfDhtKQeP+0nlCBGBbvPbFfs=;
	b=in/B60KQcXEj5Z2crjPsfSa7P+RsDAqwxV8xKTcPA6IMBDuXTzqA/2/J8Ey86ohVT0
	PGSqxLtt/7vklU4QWl8uXnHujlPEDo5UH+6x4zlvtETLm07M1D93zFWGQh0Q2wy4Xkyn
	9xE2F9l4hxMzoc3VCcZiD3unPSTrL/JoX5ti/V2h5hIRMmSi7bUPFqaQuEUFuGJNTp6t
	93UVcXmuiIy6WmllTIpl0CyHjOnwCao6KfkaAhrPAxvv0S6QsR3k3ElYH5ZR4Rk0y/Cm
	QgCS5bh0eWouREv2CVLeHquW6duvZ57OBjguwi7rhH4E0m4dQvxQlxQxUqDEBLGu78gd
	lSHw==
X-Gm-Message-State: APjAAAVU/WHmojYhzQ3LhCRtuH1ReTePhfwxRVxPKy93zf53xfOmxbgm
	YOBk54tlMRDOwVaxDIHb6wb6B2ObGkQ=
X-Google-Smtp-Source: APXvYqw08u+r8oKuhD/MoB73br13JLmDHG1PHGfFC3aafZ+dfi7nqklRoWdZA7dOg+vq/PUvGw2WyQ==
X-Received: by 2002:a05:6402:1456:: with SMTP id
	d22mr3890824edx.57.1562325532864; 
	Fri, 05 Jul 2019 04:18:52 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:51 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:07 +0200
Message-Id: <20190705111824.22255-7-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 06/23] cacao: Do not build for aarch64 targets
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:52 -0000
Content-Transfer-Encoding: 8bit

Avoids:
| configure: error: aarch64 systems are currently not supported.
| NOTE: The following config.log files may provide further information.
| NOTE: /workdir/build/tmp/work/aarch64-poky-linux/cacao/1.6.1-r0/cacao-1.6.1/src/mm/boehm-gc/libatomic_ops/config.log /workdir/build/tmp/work/aarch64-poky-linux/cacao/1.6.1-r0/cacao-1.6.1/config.log

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/cacao/cacao_2d6f6c14daf9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
index 91a03fc..6783894 100644
--- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
+++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
@@ -64,3 +64,5 @@ FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/.debug/lib*.so*"
 FILES_${PN}-doc += "${datadir}/gc"
 
 BBCLASSEXTEND = "native"
+
+COMPATIBLE_MACHINE_aarch64 = "-"
-- 
2.20.1


