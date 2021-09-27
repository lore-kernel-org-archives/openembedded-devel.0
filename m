Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75ADFC4332F
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:52:33 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.30710.1632747151800525033
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lL/jJe8R;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632747149; i=@fujitsu.com;
	bh=5T8SdQZUUYmhoHRP7wSVJLlE118LbmS53i1Yv0PTZxc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lL/jJe8RvXE9DgGRFn2B+HEkTZcs3BURaVviuNy38VOSxA9FaufhSAROB4tfXYOrt
	 D7bOFIVGWQxUWNtrJm0uEH6Z5uMD2Q93we4M7iOdz0lszBpy2TZ3nqn9xERaBCae8I
	 zfAiufoBblt2veJ6H0nyIoJckMD3iRfbbWpQc8FHcJQR5EDTvir7UCJ/hkbjT+PwqU
	 xYFn/qFU/cryfC7IimgJIaG4QtIfwQxG5/vTdWL0HiyySHkg6pxk/phJP7OnOzZVA8
	 QFV2acDf/UvbNEIgfq9+zu2rieFq+LeBzQxpDifel+fu1ey+F379Oq8i1C8eca8sMi
	 jD1CeRtoETVVw==
Received: from [100.113.3.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 60/F9-29877-D8EB1516;
 Mon, 27 Sep 2021 12:52:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRotuzLzD
  R4EWDjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFh3w3GghPcFTt6d7M0MM7l6mLk4hASmM0k
  sXxdMzuEc4JR4vbVOUAOJwebgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfveA1QgL2Ev8eryIC
  cRmEVCV2H7mJlicV8BJom3ef7BeCQEFiSkP34P1cgo4S2y8/wKsXgio5s/Tm2wQ9YISJ2c+YY
  GYLyFx8MULZoheRYnZl5tZIOwKiVmz2pgmMPLPQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga
  6hobGuka6poZ6iVW6iXqppbrJqXklRYlASb3E8mK94src5JwUvbzUkk2MwIBMKWQy3sF47fUH
  vUOMkhxMSqK8IWsDE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8M7YA5QTLEpNT61Iy8wBRgdMW
  oKDR0mEl2MvUJq3uCAxtzgzHSJ1ilFRSpzXACQhAJLIKM2Da4NF5CVGWSlhXkYGBgYhnoLUot
  zMElT5V4ziHIxKwrzZIFN4MvNK4Ka/AlrMBLS4dlIAyOKSRISUVAPTQfW7XYtnHnzG0ekxsSF
  AeG6YT5pv6H6eHZsjeaz3MTnu3JpwqsqfZeMm92lTnrF1HDVjbdg5X5gluPuSYfeK2yK64qdL
  TnW3TZkidmh389x5lzzZjvZvbed8Zn30xY5g1x+3VC0upiS27dwbFVtdtX9q1uyWBo0J6p/fs
  FsZCng0r0peGr9Wd/0hro+nRTYdi8ysun58hqjlD9mM39s1pOZ8PqjRyyLB8fB6t3Me+1pVxZ
  dWIdPtn9lPlHrL9HXPg9JFZ7aZTmQsrONeFL88SjamfTXH28+i06cXPWC1s3P4evb8+ctP7dg
  Cl8RrHZm5qtRNoO/eFsWv0V4nIyr/s4cskD93Tu+5Re2+dfICSizFGYmGWsxFxYkAeu7RPEMD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-228.messagelabs.com!1632747148!24897!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28759 invoked from network); 27 Sep 2021 12:52:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 12:52:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18RCqI1W007977
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:52:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 13:52:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libsass: upgrade 3.6.4 -> 3.6.5
Date: Mon, 27 Sep 2021 20:52:07 +0800
Message-ID: <1632747129-70797-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632747129-70797-1-git-send-email-wangmy@fujitsu.com>
References: <1632747129-70797-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 12:52:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93145

Changelog
Fix extend edge case going endlessly (@mgreter #3081)
Fix source-maps and how we count unicode characters (@mgreter #3096)
Fix seed generator if std::random_device fails (@benbucksch #3151)
Fix url() containing exclamation mark causing an error (#2880)
Fix Offset initialization when end was not given (@ihsinme #3131)
Fix obvious backporting error in pseudo extend (@mgreter #3136)
Fix obvious identical subexpressions in op_color_number (@ariccio #3148)
Fix edge case regarding unit-less number equality as object keys (@mgreter #3095)
Revert compound re-ordering for non extended selectors (@mgreter #3100)
Prevent compiler warning about unnecessary copy (@acocuzzo #3129)
Replace Travis CI with GitHub Actions (@mgreter #3150)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/sass/libsass_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipes-support/sass/libsass_git.bb
index 9cba3a8901..bc2ec805e5 100644
--- a/meta-oe/recipes-support/sass/libsass_git.bb
+++ b/meta-oe/recipes-support/sass/libsass_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 inherit autotools
 
 SRC_URI = "git://github.com/sass/libsass.git;branch=master"
-SRCREV = "8d312a1c91bb7dd22883ebdfc829003f75a82396"
-PV = "3.6.4"
+SRCREV = "f6afdbb9288d20d1257122e71d88e53348a53af3"
+PV = "3.6.5"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


