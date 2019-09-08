Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id C38EA7F3C0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2019 19:20:39 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id 205so7807009pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Sep 2019 12:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=HY7CheRMvZab7h3joLJAJZot0mvmesEpYJJbiiyefAo=;
	b=n0Sz4LOPzcgS1kHVAdg2fufooL4zfCSo3aPdvi+/3Yl2ITwPuXFqX++vSCDB5TL11M
	du4PUkIW86+oXf/zkuZfDzajrwD3pjASCN1pvd68aJ2k4bOUtrCpTZzL2dJdgkSoICZg
	Xgg83NkPYRG3ynjTCLdStp7m8TF0wGFjf2bKTGlWV36ni3QXvZAvvn/xSQsXRb3i92gb
	6rCUqBNYpomDLUanylX994DWItZccuULCkFZKn5cYbawNjs64bJJaD91eTPCoBnT/tr0
	Pibvj0sg/odVqBuYHxXTD0Scxpq83MyLSDnJcMZCML2Mgef4FZ+AeDUeXFktg9BA8Zqy
	WY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=HY7CheRMvZab7h3joLJAJZot0mvmesEpYJJbiiyefAo=;
	b=FF9I3vv9csyukOivMXCIH78W6RBrkma71pwN7no0kQo+POkujmrZU+Fcd5KJPvjpmN
	LK2z0vk9II6v/wutOBl3zC7hnPoPnxYyfGPgck1TLZS4JD5CLYSSYBuKIbs4PPeyujmG
	2fPg0M46xcYrjT/xvdcqFHyae22tH7hR3VKi+L0uiAc7m+5rwsik9LObLQnOnRWbKxLd
	DNDXG5iv7TvsgE+DXbPJl85UQ+I+bwHgrMCn9fi0J78lFw1givXXwXWm+uiUMRD0zA2L
	2H1utKTo8rjyYYFEItGIzZjnIioNnsMbM9HZ+7mHnIws7Ua8foPHQth+1OR6zLvstBgR
	+ZzQ==
X-Gm-Message-State: APjAAAXA4W9WSEN/9LZmGH9LmSc/GYGXQfjYwtJwp57QiHKJRtrvGNim
	vxzWy6tkEYEZT6mcbWGbVwQ=
X-Google-Smtp-Source: APXvYqyCIuMbTk/bjbwXe8R+XM+r3Qz5UUwF8DiANqfP/tO06zxxdN0ICJcHFQQv3E7KNM1zXlw7FQ==
X-Received: by 2002:a17:90a:7308:: with SMTP id
	m8mr2756828pjk.87.1567970440724; 
	Sun, 08 Sep 2019 12:20:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1e2:13d2:378e:990e?
	([2601:202:4180:c33:1e2:13d2:378e:990e])
	by smtp.gmail.com with ESMTPSA id
	19sm11723235pjc.25.2019.09.08.12.20.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Sep 2019 12:20:40 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <760b1fdf-456d-e1db-f690-072fc19de59a@gmail.com>
Date: Sun, 8 Sep 2019 12:20:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
Subject: thud pull request
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
X-List-Received-Date: Sun, 08 Sep 2019 19:20:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit aaa6eb0bb5da516373aa9e8c1dde8fdf85a54e95:

  lua: Security fix for CVE-2019-6706 (2019-09-02 19:54:39 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded
2d088d252624b19df384aecc434d23afb636178f

for you to fetch changes up to 2d088d252624b19df384aecc434d23afb636178f:

  postgres: update to 10.10 (2019-09-04 17:34:11 -0700)

----------------------------------------------------------------
Armin Kuster (2):
      wireshark: Update to 2.6.10 for security fixes.
      postgres: update to 10.10

Maxime Roussin-Bélanger (1):
      libedit: Add native and nativesdk to BBCLASSEXTEND

 .../{wireshark_2.6.6.bb => wireshark_2.6.10.bb}    |    4 +-
 ...py-of-the-timezone-library-with-IANA-rele.patch | 1164 ----
 ...e-zone-data-files-to-tzdata-release-2018f.patch | 6452
--------------------
 meta-oe/recipes-dbs/postgresql/postgresql_10.10.bb |   10 +
 meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb  |   12 -
 .../libedit/libedit_20180525-3.1.bb                |    2 +
 6 files changed, 14 insertions(+), 7630 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb =>
wireshark_2.6.10.bb} (96%)
 delete mode 100644
meta-oe/recipes-dbs/postgresql/files/0001-Sync-our-copy-of-the-timezone-library-with-IANA-rele.patch
 delete mode 100644
meta-oe/recipes-dbs/postgresql/files/0001-Update-time-zone-data-files-to-tzdata-release-2018f.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_10.10.bb
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
~                                                                      

