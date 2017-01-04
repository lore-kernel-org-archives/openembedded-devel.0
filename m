Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id BDD1871978
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 01:27:36 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so73757907wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 17:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Znb41plsiv+Wxe2jW2Ql5TYNsxZ30IjRATbR7YYHqzc=;
	b=efglYRKz92uxF6RCvnrP/nORjRvwuIeG163ExDWgTnkTIPg0RpcIwdKd6T0Kos4YJR
	WBHWQ627kKtkxqHXL/3KKzRI1JqzCmVI7kBP+vkqxvhcuii8grDTWbcuIoSDrvrLSxFh
	jxDk5OhLzT0ByR/P6mhdckOw6YTyvP1KMVvs8jfdEljI6J3Pu0xcki/ONDo9dDchHa9s
	iFg4HHy5LXlHuPKh7DfVk/GjDch0XzGrtPtCETfJKfHR84N5FMLXTF4C0pboOOsUhTaj
	Qz7lTSMomTQgD2vTsejjTqiJSm8QTzyN3Ipb6371iAE1P/b1BYMCv6R5OH37Tm7uLUFM
	+Ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Znb41plsiv+Wxe2jW2Ql5TYNsxZ30IjRATbR7YYHqzc=;
	b=ZgKqVuraCbqzDhgb9jYP05TkBjmpUqiko+h1Zs/FRbZhyDXPq8wT/yZBiH54JyD1km
	ew6jWsMZPF0u6uphaAPVm4yQHxI8w99Ccg4vtyn/z5Cx5X3M1nAYuXn9WCxjaCOJE/ZV
	70CrLJteZ5sb9TZEO0kTdrqNDo36oyLjp2mDyTNMRTeLIiIm5BeowcXKvePETvf9JMEh
	8p1rouWY2oLEaeNSaD+x9klO71hIq+LP7h3zyIJMcc3ttZZfzTfYGCZa7RtSd22qA4XL
	UKovEhc0N8BFQ5VnQtodSTneGKQOMksHNN2NV1gBrbPrcY2RJwSHpozd0lZ6SNsk34uu
	3X9A==
X-Gm-Message-State: AIkVDXLUvu+KcJSRuTvj43StiWl4uuhpRvxID3Ywioag7TVxCS0EeFgqZvsnPNhchIKDVA==
X-Received: by 10.194.228.100 with SMTP id sh4mr43019684wjc.116.1483493256097; 
	Tue, 03 Jan 2017 17:27:36 -0800 (PST)
Received: from localhost.localdomain (p579CE4CA.dip0.t-ipconnect.de.
	[87.156.228.202]) by smtp.googlemail.com with ESMTPSA id
	i15sm95427825wjs.16.2017.01.03.17.27.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 17:27:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jan 2017 02:27:21 +0100
Message-Id: <1483493243-30984-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH][V2 0/2] xfce4-terminal+raptor2
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
X-List-Received-Date: Wed, 04 Jan 2017 01:27:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1->V2:

* raptor2: check and fix licenses (thanks Khem)
* raptor2: check and fix patch Upstream-Status

Andreas Müller (2):
  xfce4-terminal: update to 0.8.2
  raptor2: initial add 2.0.15

 ...c-do-additional-checks-on-libxml2-also-wh.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb  | 25 ++++++++++++++++
 ...4-terminal_0.8.1.bb => xfce4-terminal_0.8.2.bb} |  4 +--
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.1.bb => xfce4-terminal_0.8.2.bb} (68%)

-- 
2.5.5


