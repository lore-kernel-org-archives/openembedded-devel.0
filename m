Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id AD452601F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 00:59:29 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id o86so7888425pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fTsOvFKVjZ5lXbtHFvmT9UaXqJ/Tl6zYR+okgoitdY0=;
	b=OZOmrSCxuArYf7uwh/cGWKTqTiimmmblNREMDqqX7TafPQtDBgmUyeNiKiNVCpBL/O
	mY44eIzk5GCc9Y5T7KWWza2PG91D6mDxntwvOhLFdidJNtPrFf2mu5XfrAXAEUmOf29Z
	mypkbwiyYwniwV4pmFXWipAnULzve5uKXWuetrRsCttNsQRuRj7ncs9iu/vg2YQYC/7z
	jffooO/1/NiYwmdbsJLhR75VtISNOIVOP6p4xFvzFKpag2JB2Q3eFNy/MWGxXZL8ei5F
	o4TPeUH/BYdtNX7iLPHmyFaW5mN8AWIPlpE6XHGeY0r2II3VSZk7MULTFGxOcTSUlUrr
	dz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fTsOvFKVjZ5lXbtHFvmT9UaXqJ/Tl6zYR+okgoitdY0=;
	b=pGvanpiT/ilQDoIJdbrW3MZpPfc2TBHwi68BCsb5vk2Dvo17V1x++ouY6nM0Pbs5Y5
	gRHbod4IiMGsRud6pdUhmEcFIqzDMgK9VeaVpjjzH2WtQVdPKyHj3bpeqlWaQxyPojUo
	qFzOPp6VGqMAKHvpvxxlH0pA4PM0ySvhzHY41bc/gwJl3cnTyNDn7Xzz+xVVrLqROsmR
	VbB2RLoVs6+dbdplB60njDd895rQQn6BxJppy7q/KZlBPzCbVTr1HKlsadPDgNpCJnEd
	V8DUCugSEUIO4w6VGpKLXmbD+/BiLe4AVOtZVSvQZbAJkD4xC4L7/UWeeKAxXp7yoqP4
	vPdw==
X-Gm-Message-State: AHYfb5jzuqAV7+7mFdGf21BXxsqCYxK2RUOera2gB7R9O7Uw/y9UpwbZ
	NAbxtN4lUMByl7/XMcQ=
X-Received: by 10.99.179.9 with SMTP id i9mr2296175pgf.413.1502153970650;
	Mon, 07 Aug 2017 17:59:30 -0700 (PDT)
Received: from localhost.localdomain
	([2400:2411:21c1:9d00:b8cb:4f3b:9c01:c505])
	by smtp.gmail.com with ESMTPSA id x25sm89484pfk.80.2017.08.07.17.59.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Aug 2017 17:59:30 -0700 (PDT)
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 09:59:08 +0900
Message-Id: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/6] Fix uim recipe's problems
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
X-List-Received-Date: Tue, 08 Aug 2017 00:59:29 -0000

I tried to Input Japanese via uim+anthy. However seems uim recipe is not maintained.
It has some problems.
I fixed recipes in order to Input Japanese via uim+anthy.


Yusuke Mitsuki (6):
  anthy: Added libanthy-dev to PROVIDES_class-terget     uim: Added
    libanthy-dev to DEPENDS_class-target
  uim: Modified the order of package definition.
  uim: Added glibc-utils and glibc-gconv-euc-jp to RDEPENDS_uim-anthy
  uim: Removed pkg_postinst_uim-common/pkg_prerm_uim-common.
  uim: Fixed pkg_postinst_*/pkg_prerm_* for uim-anthy and uim-skk.
  uim: Fixed a problem that an immodule.cache is not updated
    appropriately when uim-gtk2.0 or uim-gtk3 was installed.

 meta-oe/recipes-support/anthy/anthy_9100h.bb |  1 +
 meta-oe/recipes-support/uim/uim_1.8.6.bb     | 59 +++++++++++-----------------
 2 files changed, 23 insertions(+), 37 deletions(-)

-- 
2.7.4


