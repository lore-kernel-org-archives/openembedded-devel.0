Return-Path: <jonathan.yong@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 708A87E71F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:20:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2019 09:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; d="scan'208";a="363092273"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
	by fmsmga006.fm.intel.com with ESMTP; 03 Jul 2019 09:20:57 -0700
Received: from pgsmsx113.gar.corp.intel.com ([169.254.6.230]) by
	KMSMSX155.gar.corp.intel.com ([169.254.15.33]) with mapi id
	14.03.0439.000; Thu, 4 Jul 2019 00:16:59 +0800
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Backport 'multiconfig' -> 'mc' patch to warrior?
Thread-Index: AdUxuiVEBGurEFcbS6mdNT4Tnkyy0w==
Date: Wed, 3 Jul 2019 16:16:58 +0000
Message-ID: <A2839490D87BE64781D1FF17AA14CEC30B9D7183@pgsmsx113.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Backport 'multiconfig' -> 'mc' patch to warrior?
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
X-List-Received-Date: Wed, 03 Jul 2019 16:20:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Can someone please backport the following patch from OE-Core master to warr=
ior?

commit 8a6f7c1e455156966f467008645fef14db679ccf
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Jun 7 13:45:17 2019 +0100

    multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

The warrior branch is broken with bitbake master branch, and I want to avoi=
d needing to change all my local recipes when the time comes to upgrade to =
zeus.
Thanks.


