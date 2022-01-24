Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEADC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 15:16:02 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.4809.1643037360144076392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 07:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=O9tPjH8X;
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
	bh=yHg2TB27H9Wnu5OYOgA51zooQa/5GaLBddiez9LIp8Y=; b=O9tPjH8Xmqc/2UR71MRaxf7sN4
	SGaQ0/Qev235GRqkfdL84syC7tha+74rBaVvCBiipuG1P9jvsg3tM/wivU+ZLrK+/qthWjffLnBnl
	ZQrjiX0QkbeY40HOSSZVfTzHZA6UtbD5f/M8/H0U9AnAsM2sUEV5vfvuwJMNlcqB6wDPiFOfBUjae
	wLlHSNLPBEFaw48SZN93802NZ8SeTnKku4jt/phI8n0uyXZPFLZetHleEUERchOPClUeRSNBpYeWu
	XAitJ7X6ljJtSa3MQKVpbv3CT8/EL1oFUkVWMhyXAHHgdFNTMTR6ktDjgOI5GKXoNVvOtF2tgqos/
	gx7i/8RQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:54618 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nC14p-0009G6-7C; Mon, 24 Jan 2022 17:15:59 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-pandas: Upgrade 1.3.5 -> 1.4.0
Date: Mon, 24 Jan 2022 17:15:42 +0200
Message-Id: <20220124151544.876177-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124151544.876177-1-leon.anavi@konsulko.com>
References: <20220124151544.876177-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 15:16:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95036

Upgrade to release 1.4.0:

- Improved warning messages
- Index can hold arbitrary ExtensionArrays
- Styler
- Multi-threaded CSV reading with a new CSV Engine based on
  pyarrow
- Rank function for rolling and expanding windows
- Groupby positional indexing
- DataFrame.from_dict and DataFrame.to_dict have new 'tight'
  option
- Fix inconsistent date string parsing
- Fix ignoring dtypes in concat with empty or all-NA columns
- Null-values are no longer coerced to NaN-value in value_counts
  and mode
- mangle_dupe_cols in read_csv no longer renames unique columns
  conflicting with target names
- unstack and pivot_table no longer raises ValueError for result
  that would exceed int32 limit
- groupby.apply consistent transform detection

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pandas_1.3.5.bb => python3-pandas_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.3.5.bb => python3-pandas_1.4.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.3.5.bb b/meta-python/recipes-devtools/python/python3-pandas_1.4.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.4.0.bb
index 254787539..9b395440f 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.4.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "1e4285f5de1012de20ca46b188ccf33521bff61ba5c5ebd78b4fb28e5416a9f1"
+SRC_URI[sha256sum] = "cdd76254c7f0a1583bd4e4781fb450d0ebf392e10d3f12e92c95575942e37df5"
 
 inherit pypi setuptools3
 
-- 
2.30.2


