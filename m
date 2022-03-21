Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C085C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 10:46:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.28825.1647859566932224511
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 03:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cE6JsQXh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647859565; i=@fujitsu.com;
	bh=z45189rhf0xJw6DaK6WBteOeiEkwZoi6I9zw2ho0sLM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cE6JsQXhsPHOBZARdyvqKmuGyUnfHW80W6JqHmoYKEZcuVD6G7Bnf4dTFevaHwyAb
	 CUOOZepD1NIh3JQJvTm6BgjS/aJQjxMEfIzN5yurZfFvCeUQVXESCCO/qYg2yoFxgU
	 /nii0jrJJQbWRSY/U2GkKbf2J+INiNP7cS3DI6Xs6lHxWqc8ORP1ARlRndT9c+IsTO
	 S1B/GGmhfsMX7oI3tzm1euccV46JtpvUINzLTLN9koftthNwPR5ke3qmplHmDMt520
	 nDwSFa/ALwLvwe2zEuV2drRJPeUIDclNjbPzBiP6Xt+A4LbktEG2IbV04INF91oYF3
	 v72Z/i71vidWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MRopsbbpF
  kcErW4uLhpcwW9+YvYHNg8ji3cQWjR8fv64wBTFGsmXlJ+RUJrBmrTj1lK9jBUTHt7gX2Bsar
  7F2MXBxCAi8ZJY7camaCcPYwSvRMmAOU4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQF5i+aY/b
  CC2sICTxMl9Dxi7GDk4WARUJfYdDgIJ8wKFOz6dBWuVEFCQmPLwPVgrp4CzxMXe90wgthBQzf
  zFR1kh6gUlTs58wgIxXkLi4IsXzBC9ihKzLzezQNgVErNmtTFNYOSfhaRlFpKWBYxMqxitk4o
  y0zNKchMzc3QNDQx0DQ1NdY2NdQ3NLfUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTy
  Uks2MQLDNKVYcfMOxokrf+odYpTkYFIS5a0zskgS4kvKT6nMSCzOiC8qzUktPsQow8GhJMGbF
  wSUEyxKTU+tSMvMAcYMTFqCg0dJhNcHpJW3uCAxtzgzHSJ1ilFRSpz3WChQQgAkkVGaB9cGi9
  NLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5BcKApvBk5pXATX8FtJgJaLE+qxnI4pJEhJR
  UA1ONltX0mNPdcU2r7zeeuuS1ki/q+cHAugeJOz/833ksQPB89z+N/d53g/ZH/e2Z3HYqO/LO
  p55vNg9C1R1mu+Y+7vm7suSie+vEFq50pSW1f98ImFk39rxhF/syj/ewyzbxpi/BupeNpv+Un
  2US37bjWPhrI6+jiw4rXm55aaAu07/6deg37zPa0krePvWBhhodlkLhfz6znria4bDxbDRjzL
  rNnsm/ti5obt60p9gyxPXMdtm9TeanZ8fLPu2avyXw8aaQM2ui3q98o3v+1bmCQye+x4Xam1x
  7xqtQHl3/o0Auz2KV+qHCRq+F7k+W2yxnuuZd5ZrPt1pIgdXQMi11sd3hrqZ5N89EOnzI+6DE
  UpyRaKjFXFScCADob4ARTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1647859564!158459!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17617 invoked from network); 21 Mar 2022 10:46:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Mar 2022 10:46:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22LAjnka006943
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 21 Mar 2022 10:46:04 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 10:45:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [oe] [meta-oe] [PATCH] graphene: upgrade 1.10.6 -> 1.10.8
Date: Mon, 21 Mar 2022 18:45:37 +0800
Message-ID: <1647859537-30207-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647859537-30207-1-git-send-email-wangmy@fujitsu.com>
References: <1647859537-30207-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 10:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96103

From: Upgrade Helper <uh@not.set>

---
 .../graphene/{graphene_1.10.6.bb => graphene_1.10.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphene/{graphene_1.10.6.bb => graphene_1.10.8.bb} (86%)

diff --git a/meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb b/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
similarity index 86%
rename from meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb
rename to meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
index 0c05c60eee..813ff74adf 100644
--- a/meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb
+++ b/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -7,7 +7,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI[archive.sha256sum] = "80ae57723e4608e6875626a88aaa6f56dd25df75024bd16e9d77e718c3560b25"
+SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
 
 # gtk4 & mutter 41.0 requires graphene build with introspection
 PACKAGECONFIG ?= "introspection"
-- 
2.25.1


