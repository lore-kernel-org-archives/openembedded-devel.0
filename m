Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id CDFCE78741
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:32 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id u13so8128600plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=71eoSb2OtECOL+3JfzCpEF60nJ8kd5i3KKC67ZOeYp4=;
	b=QrKyD6ZKavIqE4lbDHPWm7BdaVNZzsNIjYCE5g7OUlq1N+3Z+zXe7uO9eCORs8bxDO
	uwwnSBZVnacd++5U+tHaHmCtw8XPmbpqFQeRkKCnPhzp3TajFIf22mqXh5OCnrgdGVYS
	+ao19W6HHl4azRB5+sjUkaMpCcg9CFReGMHfxCTgAKbvWtUYuWcx3AljycacvL22uS7B
	Eff5smzH0bcFeWJFcI6aB+KTL9OzUxMQMzM1SBXUY2lsteTLS4bHPPdjALFw9UOd3NsM
	51dSDLe+sRWE2JzupTupN/9TUwRNzbl9dLfoT3DFDlciE0pcBJcpI0KINMhPfVTnltIg
	udhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=71eoSb2OtECOL+3JfzCpEF60nJ8kd5i3KKC67ZOeYp4=;
	b=KWbAsIu2Um2UDFYFxB0WcROg1fakoI6pMKJ4sXRjEr49z+zGs6zhDfC992GicEM3V5
	qkgoFf6l/Uv9YxW9OO4LPda8VRldilMJI1sFJfp0PmsPJY3/RSopo+MnjWBAoQlGKPEi
	iaUdHKnIN+6NP2eohpm1tL3lVp9aaMXi/cwbW/TsBjYPpNG/1K+dOSaIxmMibxmF/mRD
	Qjzy9A259U5gGrUecEGTcnh+Rq6VJEkLEAw1YIyGVrlfrdYv5/krxjydBLuEvsMCQLo8
	p87vYu53FF6zJ3cg8Q52bEG32dDtCzsJrImNEu6L1YgEhq2+NVdcx1/0bew36Wdpasm+
	og1g==
X-Gm-Message-State: APf1xPC2uf1wx2SdlI7mPXgrP+roz9W72HdfzdZx1HYBDxUfyshOfVq6
	qPZd8QVeb2EbwfoQeegMS5Rpgg==
X-Google-Smtp-Source: AG47ELtOpA5LUmt3wobE/xJXaCRzUZb6T3StlB7/I/K1LNFUaMsbKFJpgzsvI1G2NCwbScqudvOcAQ==
X-Received: by 2002:a17:902:768b:: with SMTP id
	m11-v6mr4855848pll.185.1519594414233; 
	Sun, 25 Feb 2018 13:33:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:57 -0800
Message-Id: <1519594406-24490-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 07/36] soci: move to recipes-dbs
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:33 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-dbs}/soci/soci/soci_libdir.patch | 0
 meta-oe/{recipes-support => recipes-dbs}/soci/soci_3.2.2.bb          | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-dbs}/soci/soci/soci_libdir.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/soci/soci_3.2.2.bb (100%)

diff --git a/meta-oe/recipes-support/soci/soci/soci_libdir.patch b/meta-oe/recipes-dbs/soci/soci/soci_libdir.patch
similarity index 100%
rename from meta-oe/recipes-support/soci/soci/soci_libdir.patch
rename to meta-oe/recipes-dbs/soci/soci/soci_libdir.patch
diff --git a/meta-oe/recipes-support/soci/soci_3.2.2.bb b/meta-oe/recipes-dbs/soci/soci_3.2.2.bb
similarity index 100%
rename from meta-oe/recipes-support/soci/soci_3.2.2.bb
rename to meta-oe/recipes-dbs/soci/soci_3.2.2.bb
-- 
2.7.4


