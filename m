Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1085F71AFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 07:44:43 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n129so2246289wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 23:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=44WvvY1IrzodEeDp79P9sJrInuS5dGwK9obSaNRRsPE=;
	b=T8+zcco764W12pB9sWBLL728q54anw6Za3kathg619gIz3c4CpsxnWP9+Jh/71itq8
	1IutmPPcHELpxXmprscOW7/ZEXif2t8zE020jsM44PdBSTj2BgMXkjumnLVCubABGxh7
	rzqyQZlxwhYUoR8jXs0c3dlSzHvaI8PTK/8xcegl1ms/sbPeMLl2l2Na6B3NVEwquFfP
	a8JlM88nVjG4dGpIkc5HlBATOmM4mptDllrzMBEnWFN3ooZbQyhELficrnEj2X8316BC
	MiUgBVP3wXOZk40+VWeT/irjUHgzpf/GxWK2UQZkYi6XWUD6nPmvrl/m84BUg2ds8vNd
	Xbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=44WvvY1IrzodEeDp79P9sJrInuS5dGwK9obSaNRRsPE=;
	b=hd+Qzaq5UByB5vX3SNFU0gC+s9SRKLwMMfwJLdqDfVo/7FPbZKuQM/mjeAPET3l6mK
	0aVw48OrRXlYl0M4sWexwZKqoVPv7Aj34EI5jOcCzxKL4LEdFTT4yx3QXpr0HcsdrGad
	zh268fQA4rq+DUOaq29cnCNMJg4fSWEAWro37tc0cPokgFdNpbDP1Tql9lD50VS9hy+a
	4f1WZiTPx35tOTREOnmg2/VqSIIxZz+8idCUVmnMRiNhaUxIEKjQcfTAytYUfuybHctm
	W2xuvkWqx+lWJhSkL+3ysTVLo6BKpaqEWyfEX/WOHYnekqt8opuuCtzB8DzMyMVgjNCn
	zteQ==
X-Gm-Message-State: AIkVDXIo+Tm6SmsiXGryDjxOXGrd6Pdy5fMjEltYaNvzH/kZ02uOtftda+LAGE3GrJ9jMw==
X-Received: by 10.223.174.1 with SMTP id x1mr6161850wrc.113.1484207083505;
	Wed, 11 Jan 2017 23:44:43 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	wp2sm12186778wjc.35.2017.01.11.23.44.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 23:44:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2017 08:44:25 +0100
Message-Id: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-browser][PATCH V3 0/3] firefox build fixes
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
X-List-Received-Date: Thu, 12 Jan 2017 07:44:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hope patches apply now...

Andreas Müller (3):
  firefox: fix configure with oe-core master - there is no nss-config
  firefox: use pkg-config to find nspr
  firefox: do not link against crmf library it is not there

 .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 +++++++++++++++++++++
 .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 +++++++++++++++++
 ...link-against-crmf-library-it-is-not-there.patch | 48 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  3 ++
 4 files changed, 135 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch

-- 
2.7.4


