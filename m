Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.3149.1627006245564771912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oN1VE5v0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627006243; i=@fujitsu.com;
	bh=sOGltM2K6CfD9cxQ9lpH3QrVd0v9LQO4MQjnBXtRfu8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oN1VE5v0lxYXuSetzW3pUzNFTvu9VzqnKx295Eeg64fDVApebg+mWfbU+2l/2TdIJ
	 wS621olDr9oFh97YTIPsvrIj5TCHd2oTb8ntbqJRNPdBIrCYpdMIqVeVxhV56IbMPn
	 jQ99ZfFITciCxZYN5Ip+a89j/uhs4zfHwtAkTN90OvGk+5ZUDt8sOD9hUQeafUPOZy
	 UTF566TUwyKCu9b/WiUoFB8L+Sp7rdjPC2J8+sd9Cm960zM99rAnUDlg2KBEEb0mBm
	 oKaNp09DS4vC9yk7Cr+BnDQjZWr4zHU1IoGcyRAeGnf1dQ3gSCs2mANzTPN3frOD84
	 8U6r991ToM+ZA==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 3C/60-03136-2252AF06; Fri, 23 Jul 2021 02:10:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxVVdJ9Ve
  CwdI7EhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a3gw/YC/5zVszd9ZSpgXEeZxcjF4eQwGwm
  iZ3ndzJBOCcYJT59XcvaxcjJwSagJjH91g0wW0RAX2Lp7D3MIDazgIrEi9897CC2sIC3xLrfX
  8HiLAKqEj/+rQKr5xVwlJi67jwLiC0hoCAx5eF7Zoi4oMTJmU9YIOZISBx88YIZokZRYvblZq
  j6ConXhy8xT2DknYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXUNdY0MzPUSq3QT9VJ
  LdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBIZZSyHh+B+PUNx/0DjFKcjApifJKHf6ZIMSX
  lJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd4XMrwQhwaLU9NSKtMwcYLjDpCU4eJREeEslgNK8xQWJu
  cWZ6RCpU4yKUuK8kspACQGQREZpHlwbLMYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmNQ
  GZwpOZVwI3/RXQYiagxae6foIsLklESEk1MOndLmm53+vwI6ewdWJknG/hy9b7HRuu7X/Vfd1
  LZP77xo9GM9JzC/8lu9slv8njKgr8PyfYt8rqqmRH/pMpewr9LRvKXkddsXzwzWaD9NqkwgfC
  HXLJoTNvCO/osOs1f6S5VWjioQ/7jpkEvRI9qcp16KGgpQhrwdnuvgnG3zteXZrO8ftHxLPgh
  EzjOVl6X24vyuBkP3s+qbFw4aPHLswdy8ze+opIfTXMXNJgtVs74F+y1OOeQMkj17nk0oQUtu
  zgWbx8X8XzCyvue6moGS2dyueZwM+qrGTzvmA+Z1rkoz/3MwK1D9h+jN4UnaAQPv814+14JYW
  DptZzehQsnJum3f3ktb+o/8BaE097JZbijERDLeai4kQAAjrrUiwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1627006241!24552!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3614 invoked from network); 23 Jul 2021 02:10:42 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:10:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2AWF2013755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:10:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:10:30 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-desktop3: upgrade 3.36.6 -> 3.38.8
Date: Fri, 23 Jul 2021 10:10:16 +0800
Message-ID: <1627006219-7443-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-desktop3_3.36.6.bb => gnome-desktop3_3.38.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.36.6.bb => gnome-desktop3_3.38.8.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.6.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.38.8.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.6.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.38.8.bb
index a383da479b..6d2574015f 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.6.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.38.8.bb
@@ -16,7 +16,7 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.sha256sum] = "d23c76947c781f447fb39538dec509408b161b291a75a4ce1c14c2b3d33344f6"
+SRC_URI[archive.sha256sum] = "04dc3b37c2b7d98df972670ac2a5a33ec7dc278e6814c3d23d099ae6789dcae8"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.25.1

