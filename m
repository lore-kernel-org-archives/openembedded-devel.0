Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 225266F301
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:16:07 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q59so3364000wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y39S6779U/4a4DoVXcn8H+3EYaxfxaqvPWnJMcsNMF0=;
	b=ZB3LoEVS5AxbeQSSvVxqSbqh1pq0nne9JNLXkZhK9dI8evS4QStmhfjlmXdNO/5pby
	TbembE6Wb2oGF7wuKCnTeZxTay/14H+EJHRQgdc/5emhzxbymp1xv933oOGXnQCs9ILI
	HdLuUejDiRwmZzgEEaCOOYgOMOM7uayE3NS/LT83AMvzwU2oaqJw4tjOwktUeYBjr6+f
	HNzDv/IYeU50o3Noq9X1fpSkQQ1sM3QNSgaXcPAvt8GKr8X3JJ1SzWGPuBmmJoc35eTh
	qr7Llc1xVpQ2lr0u55S1i83SSSzGlQ7vSkW2PockPV25PIEK0OAdcSC8e6IV0NfXHVzz
	stkg==
X-Gm-Message-State: ALoCoQmoNSEJEWB1nZA5fRAZ3zTHqzje+EXohOOjcFBlBiZgO2WRGvNrBt0zWPgDU9x26LneY6zA
X-Received: by 10.194.58.19 with SMTP id m19mr10253053wjq.30.1393539367266;
	Thu, 27 Feb 2014 14:16:07 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	bj3sm14499950wjb.14.2014.02.27.14.16.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:16:06 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:15:57 +0100
Message-Id: <1393539360-17923-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora v2 0/3] A couple of backport for dora
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 22:16:11 -0000

Hi Martin,

the following commits were recently merged in master branch. I have
rebased/backported on dora and tested on ARM board. Only 1 minor had
to be resolved. Can you please merge them in dora branch?

Changes in v2:

 - cleanup commit message in 0003, as per Martin request.

thanks

nico


Andre McCurdy (3):
  qtbase.inc: don't force ARM_INSTRUCTION_SET to arm
  qtbase: configure with -openssl-linked instead of -openssl
  qtwebkit-examples: add RDEPENDS for ca-certificates

 recipes-qt/qt5/qt5.inc               |  2 ++
 recipes-qt/qt5/qtbase.inc            | 10 +++++-----
 recipes-qt/qt5/qtwebkit-examples.inc |  1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
1.9.0


