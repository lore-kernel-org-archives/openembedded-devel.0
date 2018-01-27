Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id B1F4C787E5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:57 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id ay8so166853plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sPPbRsvqHswWrrjQN2BVm8q0JLPggyKIseZ5JmTCBH0=;
	b=Hy2FUOMt0F+ZhnbVI+cdOlZsHDVKudvv+5XcatbBhsUH+Z3JG6r7rLaRprSXxlxQu3
	oX8zoHFABtAKjG87qZRYWms36IhN3m1C8zxBVpWohH0HWQS2oOTr2WztvmF9lIBLvoA/
	u997SwCfcKCGCWTp2rs+mTwsb1wX4zKnAw3h8DDNzwAcJthjc+8jsu6jCilW6HGyiRMZ
	fvSGk8iFbuH43MkMO31rfibDwo5gUtrEJ1IF4KK5IO/Tnij3gTNQULfkjZWtdCNHvplo
	KP0JXdCOR1lWGOHulZf5CTxhRa1Bu2x6atoQhT1aK7DNd0IZp/aka1SyNNV1iU+OG2CY
	moXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sPPbRsvqHswWrrjQN2BVm8q0JLPggyKIseZ5JmTCBH0=;
	b=VS3zJH+s0EPNgqAvFmZWS9mdv+SfK7wMHbdwOlklSwD0RRXo72z+VJfEuSw+WNknkW
	adfNdcMPj1pGd68Xs7WNEd0x+AMskSxtKHnI2ARaqI9cebYrgtI27kRNJAuG7+2S0xAW
	2MZDMCwU2GEcm3gZCfx9wyqsCbMPgCfqVuoRCw5XhuZjvcXU6QBJFNfnD1Nk9bdsnfja
	9Vjr24/Y8Gizz3suCEZBtkqvA8mj2Ye1XxvPsRrP50KCjc2BmQfXkRe2ak6mEiT181HC
	D2+lI/wXq3fJjeO7Esq4DBkWtLJ1g6CR3PjSIOCD7aBrQz6octi4CtxlHzI0ymgBJlMY
	l+4A==
X-Gm-Message-State: AKwxytc23pQ1Fb9jc12ZFsI+ctR8e+srCjQr6Uk8XPB0SxiHjPZWocB7
	nJplTKLcnULgOzy71Dz9HBVaSw==
X-Google-Smtp-Source: AH8x225c6HGLcKub1md168SqCUtNN/oVFgEntN+FpmNzySbMbCMdsvdUWkxQSGmnkW5SsuyCu+cIjQ==
X-Received: by 2002:a17:902:5582:: with SMTP id
	g2-v6mr16601165pli.349.1517023498879; 
	Fri, 26 Jan 2018 19:24:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:19 -0800
Message-Id: <267301eda9bc0dc3cc02ba5cfffa4167457b7965.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 19/36] passwdqc: add pam-passwdqc to RDEPENDS
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:57 -0000

From: Mingli Yu <Mingli.Yu@windriver.com>

Some basic function such as password change invoked
by programs such as passwd depends on pam_passwdqc.so
which is provided by subpackage pam-passwdqc.

Add pam-passwdqc to RDEPENDS for passwdqc.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 1d943254ce7fb9a88e79ef175c8ec0d3d26dbbad)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
index b8f923c..198db3c 100644
--- a/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
+++ b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
@@ -59,5 +59,5 @@ FILES_lib${BPN} = "${base_libdir}/libpasswdqc.so.0"
 FILES_pam-${BPN} = "${base_libdir}/security/pam_passwdqc.so"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
-RDEPENDS_${PN} = "lib${BPN}"
+RDEPENDS_${PN} = "lib${BPN} pam-${BPN}"
 RDEPENDS_pam-${BPN} = "lib${BPN}"
-- 
2.7.4


