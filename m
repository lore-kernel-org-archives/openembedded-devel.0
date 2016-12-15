Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f179.google.com (mail-wj0-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCA5772E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 17:52:21 +0000 (UTC)
Received: by mail-wj0-f179.google.com with SMTP id tk12so73248948wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CoOxD9CFyJER6G7JoMiGSJEiAAwBNn63jN2Ro7ULF4o=;
	b=U5lagoOmOuWqXZrArxqzmMxp8O1QH8G2oAZdQxndnfI1YmVSWfZ1orWP+1i7dGVQy3
	vlef86wxa5XXrWtB7LauUjxwidUDIaUfCh9MbYJX37crevpDz3s4GTN3TI767+tnBA5W
	eXw+kS34ajrv3vA4Mt0TXR942RtAW0GaNy8wr717+TC6lBrysG45vlRGBtiUQlREvyvR
	g4u3ZNO7aOzL8ANcoC2uTSaZJZBK+hAUff2V2YCq8s+sp0ZWQUVKNXhTMNQQbzkSPJbf
	7F2hEK8Vx+KJqlx86yTLx6FCYD1WyggzffmmHpCOxQpo8kMS7XD0c1lyhyM1PQhWOiWr
	csFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CoOxD9CFyJER6G7JoMiGSJEiAAwBNn63jN2Ro7ULF4o=;
	b=AMlepZBUgOEl2Bh9i/ftvAY3+SfLrKnIB7lFAn32X6gAz5bgB+nmCEinT5OBzJjLAK
	b1nBRMuNoT0aholV+W31XdlUSPCqALmCfd/Ng5pgAgNk9Sr3ONk8mOKgoYXM/GbsmMAj
	nkE75RYT6LDqqzYP08i5Qki4TwCwMqJ1vwwJvyLWDky4M+du95cyaaxeJu62foFFsHDF
	aMv5NQALeGISDi+7TV9ijZWmObKDQIEJWX8CVtuWcwLx9eWe778+uqR8e/ri9zeZ673Q
	zFH0EcrNaYx7wcHB7sBDYAKwNVBRj26eayxu1+sW6aNWiQ9+pb8w9kjHD5UDzJBW7KJW
	/oAg==
X-Gm-Message-State: AKaTC02Wkk6lxDxg/xKhs5qFiNZa6FuC11Ss7f9Ma3Km+LVw1vDn/hYTBaI5GXvl6SVO+w==
X-Received: by 10.194.148.134 with SMTP id ts6mr2618239wjb.220.1481824342007; 
	Thu, 15 Dec 2016 09:52:22 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-90-226-171.hsi11.unitymediagroup.de. [109.90.226.171])
	by smtp.googlemail.com with ESMTPSA id
	e5sm13482891wma.12.2016.12.15.09.52.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 09:52:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 18:52:08 +0100
Message-Id: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-browser][PATCH V2 0/3] firefox fix build on oe-core master
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
X-List-Received-Date: Thu, 15 Dec 2016 17:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* recent 'use system's nss/nspr' broke firefox
* to build properly patch sent to oe-core is necessary [1]

V1 -> V2: 0003-.. added to really fix build

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130211.html

Andreas Müller (3):
  firefox: fix configure with oe-core master - there is no nss-config
  firefox: use pkg-config to find nspr
  firefox: do not link against crmf library it is not there

 .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 ++++++++++++++++++++++
 .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 +++++++++++++++++
 ...link-against-crmf-library-it-is-not-there.patch | 47 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  3 ++
 4 files changed, 134 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch

-- 
2.7.4


