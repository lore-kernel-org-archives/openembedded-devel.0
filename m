Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id D68B07BFFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 10:54:43 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id y8so1906445wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 02:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gFqW5PzFAR0CioYHbDTZ6Kmbu6EBhUkzIaeSiQL1YSc=;
	b=bxVOpYBSv7ktv8SXEfLxoDTac8nb+O1OxeDFC1JQXOAeaiXKBoMjH6cWegAj23PeL2
	tXrHwaY4wssPoOeLV6JdCq3pSKkrZP6Jq17oTkSNmFWn307LYxLsodRcYRBD2qLVgdqk
	xLmTawLof3d23hFISjeSlNKAohfddECN/b5Ds7JZpnk3m2HzV90yoU84mmHOvdJtQwo8
	JMsGYwdtSLuRV+D2bddPE8bTS+kWL//F+VjWId72Mwq7/t+h/EyYWPqbTYS3dSLPYevp
	K+xq1ll8E/NXYCyZUY7rarKwqZ0HzjJj5TtWztGUkGtoIxY+ln3Rwr6KahzETumOlFwr
	XCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gFqW5PzFAR0CioYHbDTZ6Kmbu6EBhUkzIaeSiQL1YSc=;
	b=Xun5zjM4svJyqS+NKWzLIgWCj/pT07VOmDdbcSbzpsaGCWKWtnPcGpQY9AG2cPTBtC
	t6cvewf0YTc230lkq7lrZSkT33CxMoTWm6DT9TGyoEFpHjg3tYS9n2l6XUcjOL60DhRC
	4fMG5iFyOpPyhVi0Xqu7J0Cz7ILLAmxFJXRvJbxxnX948qgUMp5jK2Wn487O1qnKNpY4
	bc/CrjF5hzhCbTKsuUAH29QIprFxXpBIzniu3BLoU1K5ZMoMBF8JEpHYtSFaDU7paiQv
	THQZBVzjOQrDNubMmR3q/Lk+j5Zv1jYCGA8FSBH9XOmV/cWQWcAeW1LiAXEjLnGT6O1p
	DTpw==
X-Gm-Message-State: AJcUukeRFx0UGJ28N5s/Qo/55v8MDT9cfE34qphD+45vaCK4TkTPnHB3
	xHCcdDcJ9DfeTOk958XqnaqoM11N
X-Google-Smtp-Source: ALg8bN7Iu5RtJU3/z1sbLak9Jez6F4yOsfi12b+ydima3bKs/vohlkj2uEkDVTuPKpnFEj7/aKFqtQ==
X-Received: by 2002:a1c:5892:: with SMTP id m140mr1836789wmb.60.1547204083909; 
	Fri, 11 Jan 2019 02:54:43 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x10sm72616360wrn.29.2019.01.11.02.54.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 02:54:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jan 2019 11:54:35 +0100
Message-Id: <20190111105437.35023-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] adduser: correct perl installation directory to match new perl recipe
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
X-List-Received-Date: Fri, 11 Jan 2019 10:54:44 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-perl/recipes-perl/adduser/adduser_3.118.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
index 660a7f777..e695c5894 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -22,7 +22,7 @@ do_install() {
     install -m 0755 ${S}/adduser ${D}${sbindir}
     install -m 0755 ${S}/deluser ${D}${sbindir}
 
-    install -D -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl/${@get_perl_version(d)}/Debian/AdduserCommon.pm
+    install -D -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl5/${@get_perl_version(d)}/Debian/AdduserCommon.pm
     sed -i -e "s/VERSION/${PV}/" ${D}${sbindir}/*
 
     install -d ${D}/${sysconfdir}
-- 
2.17.1


