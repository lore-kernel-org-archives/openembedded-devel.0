Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6F172787D9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 05:53:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a79so12020132wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2018 21:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y8Qi26FrTfv2tlRv5pPqxEwcAbNiUIvu1JKsWhMHK3Y=;
	b=SlHQjStoBFRRhtv8f08S/R3+ioTXizY/Mzzu4tFz6otE/aKByjOWnIxnWV5vLr2FlN
	yBEkLEz67/queXI4IulY6AuEeyo6dxPCmVHxlbGItu21OUNi5vsijui1CHCHvifPNYyV
	gwF8vRz29MbJAQr86GZWZPIhkxQoaCkxjEl7sVcA47JzaNe84TEB8xldKq7BmUifF+Ep
	IznYml44n5Cefo9pJomT3ispiAb2igywZpZGNDq+zBDBq9Rs/vqjB5CXGw0ULDDmAbrQ
	kEMNpK6iAshN8cDNeCQrRzulaOxn/gC/J+m4w4zYgdRH61KJc3xAvONip1Tpc2grvu7b
	1eXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y8Qi26FrTfv2tlRv5pPqxEwcAbNiUIvu1JKsWhMHK3Y=;
	b=ISAR2zHnaxp5nqYFq4I2njR76QQ6XzhI65srsl3qnJ7f+S5ot+DETRofEecioyFTkd
	0m1E8+tIR+9OFAJPpH6LS3vmQ/7Fi78QGPJj+C6fjxUtV606ZBJ9TAWG6YBh+fq7E2UA
	5deW0IP4+bxC6FPTLPWT7xcQGCu/OMPeEHP/FNZVyf+RJiXBSGl8GHC8DKeYhXm7kthB
	l/BAy3kNGxCt3goJWoqM468+Q8TGlYOW/rW3Pabhrt0qflGFqgukTPhv4fyXEhncAGZG
	LfOAECqKhXbB/aknlP7omrocULk+ynUBXivzpkEWZTsVIg9nCCakYLNLWl9KlYWOCTD4
	Ctug==
X-Gm-Message-State: AKGB3mIpYSd7TjnLtBmLMTttP3aF/12sRiCdqQCdcFKrkPysbKTWbUXI
	7F4/I0L2OYeO/015TX71p9bmHOW5cbY=
X-Google-Smtp-Source: ACJfBotaeFsJqlBPMieeu5dPLDa/jh3dGa4X+OoeiFGV1h6ZtCMwe9zi6Fjca0N+HZlT7SvhHFbMug==
X-Received: by 10.80.142.15 with SMTP id 15mr14728598edw.127.1515390830019;
	Sun, 07 Jan 2018 21:53:50 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([111.207.81.199]) by smtp.gmail.com with ESMTPSA id
	e46sm7344354edb.93.2018.01.07.21.53.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Jan 2018 21:53:49 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jan 2018 06:52:05 +0100
Message-Id: <1515390727-15579-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-qt5][PATCH 0/2] Fix several qtbase issues
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
X-List-Received-Date: Mon, 08 Jan 2018 05:53:49 -0000

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (2):
  meta: introduce QT_EDITION
  meta: fix a regression

 conf/layer.conf                        | 1 +
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 7 ++++++-
 recipes-qt/qt5/qt5-native.inc          | 7 -------
 recipes-qt/qt5/qt5.inc                 | 7 -------
 recipes-qt/qt5/qtbase-native_git.bb    | 7 ++++++-
 recipes-qt/qt5/qtbase_git.bb           | 7 ++++++-
 6 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.7.4


