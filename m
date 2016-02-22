Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id D612670101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:30:12 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id of3so81801660lbc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8qDRhNb1U7HQpXKf04ql6lW5ZxpqKGuSKHNIJK+fCkg=;
	b=F/qnTciPSp0BSnoS6rkrSEwjMdEYpdyNal3b4BWFJNQqWo6up4aIUeNZ7mTVIYiCIm
	RgRLSrEXQkfehSX/w/q7t3ZxRxQXNblXwn86wVV/szIQCOnY/7C/lyZNRHIAjPSWF4vD
	3vEljM/stpWP+BdMg8y/PfLTIkbLdwiH4uTHBtHP1IK71LO0oCOkRyXhabxkONYfVFn4
	AWFS4o0zIXZgjP3mvrxhFddLvq2b4rpi02J8s0g/14Wh1mp3SGWmQJvax4wrOJsMYjfn
	ElZjprztNEumPhgEIwsTwItfG/ovTbERd39TpZRMDuM48lyrsP7n4pxZjpkDqTS6mG7M
	FW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8qDRhNb1U7HQpXKf04ql6lW5ZxpqKGuSKHNIJK+fCkg=;
	b=kW5qkDkzDRQ7+7cY32//Sv8jzbQ4AVkbi03Xa74cJpTeclGGf75LEWiMFO1DwtUZSV
	Rz45OjPla10bwlwiHnZlNqhquHLLGWigShwLJlFL67uEm9tgVfBtMqQmQe3Goj3gellB
	n43JGT5/9XhzTLEq6K7ihj5JqCqybcAMiInRVPyMeiGT92Ugl8BGNgmysFQ7DYVASxIz
	c/uDtE6QRMqQ3bi1ui6kknM8TsSu5ag24ck+Cp053A6sFJjoohjF0fyhFm+xb574MoSo
	Mgag2fLyIoHgKggycdpatcmO8rMLOXWpeGyXnjz2/1Ps07Ho11fuhA+DnGI3y3SLi3FM
	GCJw==
X-Gm-Message-State: AG10YOQy2GNfo49tmruZlCWoMRRpdwfcifk5/tFoCkOSF/dIUw9g7KrKPmGD+75nEwAGng==
X-Received: by 10.112.137.41 with SMTP id qf9mr10231925lbb.140.1456147812528; 
	Mon, 22 Feb 2016 05:30:12 -0800 (PST)
Received: from localhost (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	u201sm3389468lfd.13.2016.02.22.05.30.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:30:11 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:30:07 +0100
Message-Id: <cover.1456147772.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.7.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-python][PATCH 0/1] Add RDEPENDS to python-werkzeug
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
X-List-Received-Date: Mon, 22 Feb 2016 13:30:13 -0000

A simple python flask demo app failed to run, as werkzeug tried to import a number
of non-existing (on my system) python modules.

This patch adds all those modules to RDEPENDS of pyton_werkzeug.
The following changes since commit 92b50622506c14e08e4d4a725818a685a463f46a:

  avahi: rename the bbappend to apply for all versions (2016-02-20 14:51:57 +0100)

are available in the git repository at:

  git://github.com/darander/meta-openembedded python-werkzeug-rdepends
  https://github.com/darander/meta-openembedded/tree/python-werkzeug-rdepends

Anders Darander (1):
  python-werkzeug: add required RDEPENDS

 meta-python/recipes-devtools/python/python-werkzeug.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.7.0


