Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AEDC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:17:39 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.7387.1645622256358004840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=IsAvYM/+;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WAV4bO17MQZEA8Hay5m5dDU+wXVV6jmKUMnMGWy2ntc=; b=IsAvYM/+/XmvNxldiBtGCoxTSz
	7EktOc/Jza2xLvpf2uzRSoRPeRIxFTSCqAQppqqxUkZe9U/GuHTVRzJDUqag7R5ux93T18aube15w
	uW4mPIdAxY//26oBKPDQDsT4u7GqIe3AqVzE8wKzWFylsGPGqt3ePbaolDRwYOOXSqXziwr9AJzYe
	XLshWU/uDAmJgLAuiB883ib/a0GePu403IKBLl0wMd/lFtz+Trovpb4hUOh0EoOBd6DbNR5M8k9Ip
	Lf7pxL07QEDTXDoTcxCSI0ymrhU56X8XZwZCdWEhpMfm1NvnBF2TCv20yBn5hDDTmiyTZoGjqKCOe
	RWbuw2Hw==;
Received: from lan.nucleusys.com ([92.247.61.126]:51954 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMrYu-000Bp1-76; Wed, 23 Feb 2022 15:17:36 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pandas: Upgrade 1.4.0 -> 1.4.1
Date: Wed, 23 Feb 2022 15:17:19 +0200
Message-Id: <20220223131721.1683054-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223131721.1683054-1-leon.anavi@konsulko.com>
References: <20220223131721.1683054-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 13:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95479

Upgrade to release 1.4.1:

- Regression in Series.mask() with inplace=True and PeriodDtype and
  an incompatible other coercing to a common dtype instead of
  raising
- Regression in assert_frame_equal() not respecting check_flags=False
- Regression in DataFrame.loc() raising ValueError when indexing
  (getting values) on a MultiIndex with one level
- Regression in Series.fillna() with downcast=False incorrectly
  downcasting object dtype
- Regression in api.types.is_bool_dtype() raising an AttributeError
  when evaluating a categorical Series
- Regression in DataFrame.iat() setting values leading to not
  propagating correctly in subsequent lookups
- Regression when setting values with DataFrame.loc() losing Index
  name if DataFrame was empty before
- Regression in join() with overlapping IntervalIndex raising an
  InvalidIndexError
- Regression when setting values with Series.loc() raising with all
  False indexer and Series on the right hand side
- Regression in read_sql() with a DBAPI2 connection that is not an
  instance of sqlite3.Connection incorrectly requiring SQLAlchemy
  be installed
- Regression in DateOffset when constructing with an integer
  argument with no keywords (e.g. pd.DateOffset(n)) would behave
  like datetime.timedelta(days=0)
- Fixed segfault in DataFrame.to_json() when dumping tz-aware
  datetimes in Python 3.10
- Stopped emitting unnecessary FutureWarning in
  DataFrame.sort_values() with sparse columns
- Fixed window aggregations in DataFrame.rolling() and
  Series.rolling() to skip over unused elements
- Fixed builtin highlighters in Styler to be responsive to NA with
  nullable dtypes
- Bug in apply() with axis=1 raising an erroneous ValueError
- Reverted performance speedup of DataFrame.corr() for
  method=pearson to fix precision regression

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pandas_1.4.0.bb => python3-pandas_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.4.0.bb => python3-pandas_1.4.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.4.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.4.1.bb
index 9b395440f..4877194a5 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.4.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "cdd76254c7f0a1583bd4e4781fb450d0ebf392e10d3f12e92c95575942e37df5"
+SRC_URI[sha256sum] = "8db93ec98ac7cb5f8ac1420c10f5e3c43533153f253fe7fb6d891cf5aa2b80d2"
 
 inherit pypi setuptools3
 
-- 
2.30.2


