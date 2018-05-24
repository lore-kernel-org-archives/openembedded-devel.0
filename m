Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id DC4A874A13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:13 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id c9-v6so2547858iob.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5vDnq/O4vhgWMM+bQGaBoKCdQY82abAiiWV1yvAu/Xo=;
	b=OojnUT7GgJo3U6YBbXIGxYka0XrReKixnmJELaBeQ3jTD6uETKEmNpk1YAKhJygCi+
	jVS6DGsgVT70+1DD5oxN4AGbXaOMsf+LBs3bO72cb8uwWCzbFAKxG+dVcDV4jAkBn0mX
	IgEAFmiljCP/BW3VvDMSv01ZuIRBdJLxF56PulSINUfmn+NvJyVHCs6Ar1dA7dQyEjSY
	O40lI/X3JmnI5OhZNIpjcpCAwnceoMfOQDrgtl/QxWNpbVZx+sxph6hYKUTs0Pgqxp0S
	GTiCvi5ICPLfJXL1GpUDyRsJznf/oSqTOMjjtly2xQmPPyE52KlbDelelhkkOmeYMYKo
	qqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5vDnq/O4vhgWMM+bQGaBoKCdQY82abAiiWV1yvAu/Xo=;
	b=OQPoRCRqzu6OtaMoJuuhCPO4rXky9HXg9dIKpN90uLIOw9R9ixdnrin7lvgXLjeFS1
	RYYYLfsOeUPEAQ1Z3uMLbVFzy+P0DiXBwklAEVAc+2xB0uz+kM3DrRngEMCgdpsJScQQ
	bx73DWgQB9/z0Xp+Ah0eSGxq6qa378zHw73Zin3uwIqQ6rUMCcY4zfTy1YVHZUhlwbMK
	l6Bx+lhG5gFth8/zJMtMSCyCZMd3b5mbWS5htIYGC1xHkNG+Ijb+h9qS8JkZFxNwC6Kk
	0J9C5ldQdsK3BT8OdXn6rY0GIZJXqzZeuONZihetSLQzfEfQoDf5tFNX3E8pOtWK6oUQ
	N5TQ==
X-Gm-Message-State: ALKqPwd/dB2Re6xcHn1irNOzKE4+6XwTeyT2a1GBrBv+TzA2v+TrkNCe
	Wbg+T1uSwfe8mXRRa1B2114z9GEl
X-Google-Smtp-Source: AB8JxZoDdcArOx+lAKMvxX70oNVM1QYcLCKqjZX2Mv86alg3VLyCfG90nKYV+1KUFl+yr4DALaiMGw==
X-Received: by 2002:a6b:cd49:: with SMTP id
	d70-v6mr6981839iog.150.1527172754267; 
	Thu, 24 May 2018 07:39:14 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:13 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:42 -0400
Message-Id: <20180524143854.24096-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 05/17] librcf: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:14 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 267c0e79f5..dcd47a4e69 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -47,7 +47,6 @@ PACKAGECONFIG[demos] = "-DLIBRCF_BUILD_DEMOS=ON,-DLIBRCF_BUILD_DEMOS=OFF,"
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'demos', '${PN}-demos', '', d)}"
 
 FILES_${PN}-demos = "${bindir}/*"
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibRcf.cmake"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.17.0.582.gccdcbd54c


