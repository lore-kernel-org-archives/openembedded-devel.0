Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E02C433FE
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:18:00 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.6805.1634807878428539187
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=krW7boJ4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807879; i=@fujitsu.com;
	bh=yblZKqMkuFxpFtzs+CtgVxXILNZ32kRvzLegMfBSyf0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=krW7boJ453nOXHr1TuUUgYbgE2/UeRvOg73HXTUPAgq78vWDwFgl3t4VxPMNRlceD
	 ciHE8zfVRw9f2EbSchPOnXYUcNMU7wMxDY890WXaIr5YShhbKZdIuXqZa3/soinvOL
	 imtRDekqBdorTdcOzc5H2aSH+ede5VCb2XpqcvG5Nw+bEXMu276o1emnJkkKZzQnT3
	 BuZlaC4N2fCc5TkkpXQ2josfiyNHyoXD/wolCdK1GJmBR+fZNFkEhGNwBXoG9qRkhU
	 l9jq2kJpWZMt/UEuWWBe2KH/orlR4cdzw+9b9hn1nQd4lWDIPXJk8HK60iHAaDPQog
	 hQGTH0PQ2fFCw==
Received: from [100.113.7.241] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 82/77-01506-74031716;
 Thu, 21 Oct 2021 09:17:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0XUzKEw
  0mLlO3uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzbjV08lesJ6r4sDHecwNjIc5uxi5OIQEZjNJ
  7F3TwQbh7GGUeDL3CHMXIycHm4CuxLnHa9lBbBEBfYmls/eAxYUFfCWm/prPCGKzCKhKTH73m
  wnE5hXwkDj/5yQLiC0hoCAx5eF7Zoi4oMTJmU/A4swCEhIHX7wAinMA1ShKzJ4uD1FeIfH68C
  XmCYw8s5B0zELSsYCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhsa6ZroW5XmKVbpJeaqlucmpeSVE
  iUFIvsbxYr7gyNzknRS8vtWQTIzCMUgrZwncwnnn9Qe8QoyQHk5Ior86vgkQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKErw71QsThQSLUtNTK9Iyc4AhDZOW4OBREuGdpAeU5i0uSMwtzkyHSJ1iV
  JQS530nD5QQAElklObBtcHi6BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4uXaApPJl5JX
  DTXwEtZgJaXGBRALK4JBEhJdXAVLf05SkdR+FT4a1ukzUMdt5d37y8efmks0/1WH4sWxlSO73
  bf2XqrH/uU/0azhhdf1345/AZ1egvlmJLsv7G7vH0Otgkf2j2DXWFOX/D3DPFw9P/3LTfoN66
  bft81+hKOxG/ui+8x96UPw+3ueixM2KNR5JOZ6cJj7q5E999iR9cVgdTVhS6VXNc6JvhFabc7
  i6yMEXZKKHw4G4hEZVdnHraPKtlz+Y77HljfFfoz3r3BSbP1aYru3XM2BWUnqbxx2/3I0Nx/R
  cJlu1Cmw36ZrGXv/vyd3u77MQJE4Ue3BBTz+S4dnNHfXWZyF8JI/9t9lYmvTvPlk0tff1TwWY
  9h9hvb7GS0491Te2iG3mVWIozEg21mIuKEwEsP19CHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-238.messagelabs.com!1634807876!14333!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23246 invoked from network); 21 Oct 2021 09:17:58 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:17:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19L9HuWm031413
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:17:56 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:17:54 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 3.4.0 -> 3.5.0
Date: Fri, 22 Oct 2021 02:17:49 +0800
Message-ID: <1634840269-44112-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93518

3.5.0
-----
* Add Python3 yoga unit tests
* Update master for stable/xena
* Rely on member access, the preferred access since importlib\_metadata 4.8

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-stevedore_3.4.0.bb => python3-stevedore_3.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.4.0.bb => python3-stevedore_3.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
index e2f43048e..8d345e66e 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "59b58edb7f57b11897f150475e7bc0c39c5381f0b8e3fa9f5c20ce6c89ec4aa1"
+SRC_URI[sha256sum] = "f40253887d8712eaa2bb0ea3830374416736dc8ec0e22f5a65092c1174c44335"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.25.1


