Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9A909755F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 20:14:21 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id i130so66830830wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kU6ofzDSlFkTuZLQ/KRGwzBPUT7seEC4yPo0b8AiKU4=;
	b=ww2kqOf8fLEXDjB0QQQcWlV0GU/42NXpxcWMqiaZTwxeGL23YaxvWSzH8h1HUV+8c4
	i8sbFbVn00W0H9Fhed5KfIM3m9cfMjV1pFQRi4IFVv5/XJMdO29sKeMkJUIm2cnz0koo
	Ft/y0Ku5RUmCC3IleIycOH08y9jbkltDsxl7VxvEhvkj5zL1cSjUpJmce1Px36oqqmX7
	IbBZzVHFlFR22fQLTBlyJH5Tc1mUJGrCICX1lY0QIufvqNqMihaTIxVU6jjK8EmxfQ69
	aenGzSDq2Fhp9beA1kPd4fx7964d1dpBNKpqV6IxMHO1+R5lbu8TZwXOJ1cp/P/Duhu8
	9Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kU6ofzDSlFkTuZLQ/KRGwzBPUT7seEC4yPo0b8AiKU4=;
	b=HV6c2KtbLE1sZt7N7d6sFeJsB97xpValqTpCxJKSLDLHaCE/vMsMPfdceQx2odVYkQ
	CbE1Phd32oFutG/jP3s3uXMUFJG42Zo6w7FdsI+pdDbBeLOoltrqcfqzQOPahfVy5mHR
	KBUV9BX5KUAI53n8uel+NgQTapqSKA8i9h35mFutRCCSHyLGoDfz/0bApTpVLmK7r4NG
	MAshk5bpDoxePmrnxt45vRyZMh3k2Je4wJiyZeNKvp5k+jt1ope6MeqNENusrpHAgVjs
	l6RyajOSkCMAq9gK7ZQFs/VOCCakQzFq+rCkRaCVu/eLYGT8A9Oig/yp7iBgGAsh0Fo/
	/Seg==
X-Gm-Message-State: AE9vXwNL45mcVpKhUsVUcdVGZD3/s883XpVKIFXO0MsHP1py/PkN3RlCNX6hTBNLXOLyOw==
X-Received: by 10.28.47.199 with SMTP id v190mr4689547wmv.28.1473884061625;
	Wed, 14 Sep 2016 13:14:21 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0BE9.dip0.t-ipconnect.de.
	[91.10.11.233]) by smtp.googlemail.com with ESMTPSA id
	17sm3999350wju.44.2016.09.14.13.14.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 13:14:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2016 22:14:08 +0200
Message-Id: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] samba: unblacklist
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
X-List-Received-Date: Wed, 14 Sep 2016 20:14:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should make all happy:

* arm people can build again
* others are not affected

Andreas Müller (1):
  samba: unblacklist and link with bfd on arm only

 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.5.5


