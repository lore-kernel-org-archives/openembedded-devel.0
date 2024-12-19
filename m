Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B71E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:28:35 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.138164.1734640111229241717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=rfV99b1v;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241219202829d52a003e5395f4783a-1scl85@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241219202829d52a003e5395f4783a
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:28:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TIVs6o34LZZncOKiGjQFRqDrhK+uhtZgd/HGh0EcKPQ=;
 b=rfV99b1vLkzQzWtt+iN/4xue9b+8YaqG+pcvot1W6HX/e6SqliUsF1oGr8Esi5Z2MjJQm3
 9gfEMMmwTwiWvmkFaYFa3z+nH3g9nxiQGHZfc6bqoqR15vePvtTImWmmMcxoPBdKNcWmJE+U
 IE1KVu4m68LMh2+jXCFR/e7sV1P/O6WNwXmQgqBSy5WDk36rVti+M47q9Ve0AAcS1FbzWC2u
 xrsyXxlhCg3jVvgeaIgNSXwAMi1Xu1yaLp0JcgM9wvRg4hTU3vT3YkeG4ogAWd15qo8YgtZj
 twMXnC4F8zCDeevuqA59nTDhA6o5U9gsuPCsCjEH4gawUUTxbu+vRUYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 00/12] ignore or mark fixed several CVEs
Date: Thu, 19 Dec 2024 21:27:26 +0100
Message-Id: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114401

This series handles all CVEs in meta-openembedded master report which I
think that can be removed from reports without doing an upgrade or patch.

Peter Marko (12):
  ace: ignore CVE-2009-1147
  apache2: ignore CVE-1999-0678 and CVE-1999-1412
  apache2: remove old version references from CVEs
  spice: ignore CVE-2016-0749
  gattlib: mark CVE-2019-6498 as fixed
  monkey: ignore CVE-2013-1771
  redis: ignore CVE-2022-0543
  spice-gtk: mark CVE-2012-4425 as fixed
  apache2: ignore disputed CVE CVE-2007-0086
  swagger-ui: mark CVE-2016-1000229 as fixed
  memcached: ignore disputed CVE-2022-26635
  emlog: set CVE_PRODUCT

 .../memcached/memcached_1.6.17.bb               |  2 ++
 .../recipes-support/spice/spice-gtk_0.42.bb     |  2 ++
 .../recipes-support/spice/spice_git.bb          |  1 +
 meta-oe/recipes-connectivity/ace/ace_8.0.1.bb   |  2 ++
 .../recipes-connectivity/gattlib/gattlib_git.bb |  2 ++
 meta-oe/recipes-core/emlog/emlog.inc            |  2 ++
 meta-oe/recipes-extended/redis/redis_7.2.6.bb   |  1 +
 .../swagger-ui/swagger-ui_5.18.2.bb             |  2 ++
 .../recipes-httpd/apache2/apache2_2.4.62.bb     | 17 ++++++++++-------
 .../recipes-httpd/monkey/monkey_1.6.9.bb        |  1 +
 10 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.30.2


