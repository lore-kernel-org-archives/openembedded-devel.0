Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.35.1585772936744695630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 13:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 031KStmG021415
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2020 13:28:55 -0700 (PDT)
Received: from mt-manjaro (128.224.21.105) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Apr
 2020 13:28:54 -0700
References: <87o8sbf8e4.fsf@windriver.com>
User-agent: mu4e 1.2.0; emacs 28.0.50
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Regarding poppler auto PACKAGECONFIG when qt5-layer exists
Date: Wed, 1 Apr 2020 16:28:53 -0400
Message-ID: <87k12zeyre.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.21.105]
Content-Type: text/plain


Hello,

In meta-oe/recipes-support/poppler/poppler_0.85.0.bb line 17, there is the line

    PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"

Let's say I add meta-qt5 to bblayers.conf, but I don't plan to use it immediately in a build. Therefore I haven't make any additional change to local.conf.

However I will be receiving the following error when starting a build:

    WARNING: qtbase is not whitelisted, figuring out PNWHITELIST...
    ERROR: Nothing PROVIDES 'qtbase' (but .../meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.85.0.bb DEPENDS on or otherwise requires it)

because PACKAGECONFIG is changed so it assumes I'll be using qt5. Is this reasonable?


--
Mingde (Matthew) Zeng
