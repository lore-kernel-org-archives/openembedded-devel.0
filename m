Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74FCC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 07:40:33 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.9772.1642491626609427080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 23:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J+uYO/W4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642491624; i=@fujitsu.com;
	bh=JVZhYZ2n5QYgpb/O/crwHaphS/HG+6Nu6OiblA/ewDw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=J+uYO/W40kiND4SK/lkqpWgzyZG/W1xG8vnKoItQa3tfDVuYYaaTqtWmsraut3s4M
	 9FWqSmOTewiD+wMbgossRDmfXr8zoIbpCL842ScOMjvzRcadeIsOfQYQ05/rYItJHE
	 sox+HXmatq6we2yvWljo0V7vk7TEARfnYJElhVRwrm/Z+UYdUIuKQpEuo8c8K7vwA0
	 SBlQqQR+SyXq2LntXr3QGNhPPp869qVccKIOoMEOpqIOgvXgqgwzLFjF8GBxP8nQpz
	 zrXpUglardgx3OSwWjD2pVTGNCDGL07tXvmzAmINfrH7j0HUXSB4fiCM9FYnJrh0h7
	 9S3dgU4RRCR7w==
Received: from [100.115.65.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 57/82-24146-8EE66E16; Tue, 18 Jan 2022 07:40:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRovs871m
  iwc87phYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aMNwfZC16zVnT+8m5gbGbtYuTiEBKYySRx
  4/AmNghnL6PEjj87mLsYOTnYBDQkdk+9DGaLCOhLLJ29B8xmFlCTOPryJ5gtLBAhcbnlFzuIz
  SKgKrGh/T2YzSvgInFzwTFGEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44gUzRI2SxNtLe6DqKy
  RmzWpjmsDIOwtJyywkLQsYmVYx2iUVZaZnlOQmZuboGhoY6BoamuqaAykzM73EKt1EvdRS3eT
  UvJKiRKC0XmJ5sV5qcbFecWVuck6KXl5qySZGYKilFLst28G4r++n3iFGSQ4mJVFepVNPE4X4
  kvJTKjMSizPii0pzUosPMcpwcChJ8OrnPEsUEixKTU+tSMvMAYY9TFqCg0dJhDc8GyjNW1yQm
  FucmQ6ROsVozHH5+rxFzByvW37uYBZiycvPS5US52XOBSoVACnNKM2DGwSLx0uMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHmDQKbwZOaVwO17BXQKE9Apqz4+AjmlJBEhJdXAVPxnat16l5q
  vN1P1DprNselsSLO7s0LHTiF9efzO5t3MAjoed58IXajv2evWIi27uGSyx0dHnrfnt/kekguT
  9HN3uHLCYEF6QdDEYxs4Vq3bNifASG7PxXVT9NJTxTOnH3op+ODinqNHGGzZ1oo+7XvtXdkol
  XzHTub8sRO3+Y7cbFlWwJNcdOIJk2Kjyo49HNXJWkHzV/uKBd+pf/pY7tOEpF32acIJi5aKN1
  /+VjTxefabiMfuYlc2Tk0TWRcUUDXnfFBhy0yVZ/OF8sxexntO/+P/92bHM76+OTJMp++tEGr
  SM1vZxCTtvHxOo/3qm98EbHnaFh1uYYup8Jtxc+lHeTfTfx3WO1Lnd3VJKLEUZyQaajEXFScC
  AMj8PdhCAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-12.tower-545.messagelabs.com!1642491623!50218!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25781 invoked from network); 18 Jan 2022 07:40:23 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Jan 2022 07:40:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20I7eG6q014537
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 07:40:23 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 18 Jan 2022 07:40:13 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 0/2] Deleted xorg-xrdp and xrdp from PNBLACKLIST and
 upgraded them.
Date: Wed, 19 Jan 2022 00:40:02 +0800
Message-ID: <1642524004-3612-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 07:40:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94908

- xorg-xrdp: By the suggestion from upstream(https://github.com/neutrinolabs/xrdp/issues/2121), fixed build error of xrdp with openssl3.So, deleted xorg-xrdp and xrdp from PNBLACKLIST.

- Upgraded xorg-xrdp and xrdp to the last version.

Lei Maohui (2):
  xrdp: Fixed build error with openssl 3.0 and upgraded from 0.9.17 to
    0.9.18.
  xorg-xrdp: Upgraded from 0.2.5 to 0.2.18.

 .../{xorgxrdp_0.2.5.bb => xorgxrdp_0.2.18.bb} |  8 +++----
 .../xrdp/{xrdp_0.9.17.bb => xrdp_0.9.18.bb}   | 24 +++++++------------
 2 files changed, 12 insertions(+), 20 deletions(-)
 rename meta-oe/recipes-support/xorg-xrdp/{xorgxrdp_0.2.5.bb => xorgxrdp_0.2.18.bb} (62%)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.17.bb => xrdp_0.9.18.bb} (82%)

-- 
2.25.1


