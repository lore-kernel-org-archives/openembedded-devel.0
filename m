Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3104278947
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:00:09 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b7-v6so231303plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/zv9wJ5fPqiYX4KZ1/GAB2r0CWpKC25Ts9RO9FY9aFw=;
	b=NfrhCNEx8ChKUewDjJebkpa5E/kRMDhtDLCfM5P19vKE+BXTqUlhIdlR5k9xRTL0fd
	mRjCYtnDhqzHuFALbXW1xqiwrvL9tx8w81f0gp0LpfAod7fjf+xsx38h98+4x0FS0B+C
	ZiidCK6igOixiAOYTvLqoDkzVuBBVO9xBRkxjyfeqNWQXlhQutQvTkmd03WdgC7II663
	i8J1GBGuhPaxkjB+gDPFQ4NDLyqMa5VEF6HROS5lMJTD7fH/8FHYMc/YxHASXmFLwwjT
	UIMu+e5K1WXgZQd4Art4mKxseOWOcfkpa0TwT/UKkQ2HTHa7oXi1L5l21X0IRAYKGAAA
	j1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/zv9wJ5fPqiYX4KZ1/GAB2r0CWpKC25Ts9RO9FY9aFw=;
	b=UznpB7dt76NJefjjEfWmB3G1CwSpf3dylWCy5PQimso9dZX9LOrQbz0SlQMOlzJshz
	t7yTQIepH2khIF02zWPrLw9iGpPm7b5WJ2ond/b9V5/zEx/0vpMSuEsUddIm6KTGc3/G
	F/Oadgd67ZQAuXdJUYKTgZogIJch0syBfjBHWPDILqnA9wLG110tq1BamE1hy7tLyml1
	GrqxJe6C3Ial3wgoRRfbpXxS3tJ8AZghSHu/teBA70Fh1/blwzzbfOTvLRdJOr7L4Jiv
	+xco9aPhHqEpU1FIiSNynbR+MH2SY8wq2L75YyfgJTWnbBaIUDRbK9jD9SmF9D+ncUqn
	ztGA==
X-Gm-Message-State: AElRT7Gk9J8xdvG6nP2WHKyEeE2CPtskFr1SZoxBS+L/PEMtRCBtxZLA
	IbNyD8wOYrNQhVOPOrIEiHNE8w==
X-Google-Smtp-Source: AG47ELuTlhrviEhvojBy7vAgOA4o0evy1tNHOQnfWw489WMFYsaftCTLEvBUVbnerm0NatSOky6w8w==
X-Received: by 2002:a17:902:7b95:: with SMTP id
	w21-v6mr15278097pll.260.1521518411250; 
	Mon, 19 Mar 2018 21:00:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	m9sm927862pff.143.2018.03.19.21.00.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 21:00:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 20:59:56 -0700
Message-Id: <20180320040000.29408-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320040000.29408-1-raj.khem@gmail.com>
References: <20180320040000.29408-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] krb5: Add -D_REENTRANT -pthread to CFLAGS on risc-v
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
X-List-Received-Date: Tue, 20 Mar 2018 04:00:10 -0000

This is not defined by gcc for risc-v, probably a bug in
gcc but until then insulate ourselves

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
index 3bdb090be..267a40ced 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
@@ -51,6 +51,7 @@ CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
                   ac_cv_file__etc_TIMEZONE=no"
 
 CFLAGS_append = " -fPIC -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
+CFLAGS_append_riscv64 = " -D_REENTRANT -pthread"
 LDFLAGS_append = " -pthread"
 
 do_configure() {
-- 
2.16.2


