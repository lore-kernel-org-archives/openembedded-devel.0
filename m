Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id A766178221
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 16:03:26 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q76so1002674pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=MSqDtf5dxvs+vSv6Vbd/mdCEQx2zgJIl6739AyQZ8o8=;
	b=ZbMCMDpJc7sldZbo3XRmH6sSkjNxlTyf30a4Tt7fl2c6tmsOKBECxrXIuA3rsbe1Th
	VPDoOHA1CIAKN3pUPTHpYXTJ9OrNjUiyNiim8TruehCDuEJeDYIIHyfewHgL4NCI5eUV
	nQttJ6oalJrD0x8aXC/nqlXe/4meHL+GNFDB5Wt6H6wXB/B/rPhlNv5TXhzYrcLRZZOO
	cAMnAWcPAXx3y2ID4MkXVNpuz9+um4JkgrBNKxYvOMHZXgD4vfO8CuNxH36xgh3IRI3N
	CGiX6hxOaKja4wHtYvKtWnGrdoJYN5hI/m5ftIDL9CXb1bArm4Z5iWtBDTitvPXWDgMJ
	Wa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MSqDtf5dxvs+vSv6Vbd/mdCEQx2zgJIl6739AyQZ8o8=;
	b=bIVB/e4uqQDQyUJ1Pi9DaNsJCFC+0S2wkD+wAUefXMrTSL3vc20q5VgN0c/D7UMByq
	+bEaHCCvhPOsti1tj2r6G0SAR6jtxuTXifItPTuGj/tcU34SAf5QnEAL42yPJVn3VyN1
	vNkPFqrzJnxJ9+f/Fl1K+vIrDxNmqdNYnPetJTeE51oStgHsRWTST7bqRxlaRMrb1dPq
	P0IQIAcriclIRnPdK+hALAjhKjEWgYyWJT/81SslvpdGZs6ZRY4C4wp2R4rY8ztOIG8t
	+ds1nDmAfQuWQxmi5Xhg8SyQAjGSQe/0NyS3BDT+jmMTDdzwwGtv4DjcYz5Yebjfqbm9
	7YbQ==
X-Gm-Message-State: AHPjjUhg+v1cYJ6viNR4JySpuBnKOkoQxYsOqBuy25D37D8ofZ2B8OEB
	7i/GJbvmkHPNhQ==
X-Google-Smtp-Source: ADKCNb7ZW4b8HiqD/AMapSOROaJkPnDCHLvf/dJq3i/QGZjGNnTdnOfYrK+wMlzOcrl9k3PsC1+E4w==
X-Received: by 10.98.131.141 with SMTP id h135mr10355911pfe.204.1505145807563; 
	Mon, 11 Sep 2017 09:03:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:d402:d3c9:ca3b:9b54])
	by smtp.gmail.com with ESMTPSA id
	m24sm17292692pfj.28.2017.09.11.09.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Sep 2017 09:03:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 09:03:16 -0700
Message-Id: <cover.1505145706.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/3] pryo-next pull request additional changes
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
X-List-Received-Date: Mon, 11 Sep 2017 16:03:26 -0000

Please consider these 3 additional changes for pyro.

The following changes since commit b435d7b59d7fffba06c0b2bef55be8cb220401a4:

  krb5: fix CVE-2017-11368 (2017-09-10 09:00:19 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/pyro-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/pyro-next

Alejandro Mery (3):
  gitver: extend class to use EXTERNALSRC if set
  gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
  gitver: skip packages instead of panic()ing if ${GITVER} fails to
    expand

 meta-oe/classes/gitver.bbclass | 47 +++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

-- 
2.7.4


