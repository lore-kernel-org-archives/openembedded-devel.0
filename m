Return-Path: <andrey.rusalin@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id E750360112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 16:34:35 +0000 (UTC)
Received: by lfdo63 with SMTP id o63so72468079lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 08:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type; bh=cVqa8i1zDZa1nujMoa/txPxR5HI0DmjvuISBSlXIM5k=;
	b=OLNvkmI9vZm5QfWzU8d4hHx7DMcVrZxnkd7fMg/qdDIvuiYm+z6q7fTDaoHAK15t9i
	/Zs5fKV/KpGW+M4N4+cOn/rlmDkzSEv7OIADbhq7+l4gafflZo6FUlEx3GWTpa4GYIym
	Y5oGGynBKB/cS2dFa5rQvz5LSNn8hDz3nWmtprkdkW5p+I6XV345ZDl6yTDXEhTlCDCU
	1yk1XeSwMeklplBunDxKZ/wMaE7S+TWIbdcMe8Mh23Wtt2eIGGE4A+YxdnO7Urw9YNWu
	z8ZXaJtV3P6xQnMc2IYFPtfLMi5N2qBDpGaUPnv0WfoqTKara05IBX4D7mkCpvfnbqMV
	zZGQ==
X-Received: by 10.25.210.135 with SMTP id j129mr6217573lfg.101.1448037275648; 
	Fri, 20 Nov 2015 08:34:35 -0800 (PST)
Received: from [192.168.14.14] (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	xn8sm33179lbb.41.2015.11.20.08.34.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Nov 2015 08:34:34 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
From: Andrey Rusalin <andrey.rusalin@gmail.com>
Message-ID: <564F4B99.8070908@gmail.com>
Date: Fri, 20 Nov 2015 19:34:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
Subject: [meta-qt5][PATCH]
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
X-List-Received-Date: Fri, 20 Nov 2015 16:34:36 -0000
X-Groupsio-MsgNum: 58765
Content-Type: multipart/mixed; boundary="------------000009090501000604040005"

--------------000009090501000604040005
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here is a patch to prevent build failure of qtsystems package on yocto 
jethro.

AR.

--------------000009090501000604040005
Content-Type: text/x-patch;
 name="0001-qtsystems-downgrade-SRCREV-on-one-commit-to-fix-buil.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-qtsystems-downgrade-SRCREV-on-one-commit-to-fix-buil.pa";
 filename*1="tch"

From 68e1d88d779b5f1070dcfa04b38a89e6837feffd Mon Sep 17 00:00:00 2001
From: Andrey Rusalin <andrey.rusalin@gmail.com>
Date: Fri, 20 Nov 2015 19:56:15 +0400
Subject: [PATCH] qtsystems: downgrade SRCREV on one commit to fix build issue

Downgrade source revision on one commit to fix build issue.
Last one commit in qtsystems repo is "Use the new way of
disabling strict C++ support".
Seems there is some restrictions with current version of
compiler that is used in yocto.

Signed-off-by: Andrey Rusalin <andrey.rusalin@gmail.com>
---
 recipes-qt/qt5/qtsystems_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 7e36e80..4f76c06 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -30,4 +30,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.5
 
-SRCREV = "0577ffca58b7fed78c1820fc1c2b7ab3533d5698"
+SRCREV = "75738fd2cc441e5e8ebe353d90e1bb810d15ee72"
-- 
1.9.1


--------------000009090501000604040005--
