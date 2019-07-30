Return-Path: <jonathan.yong@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD007F2C6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 01:42:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jul 2019 18:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,325,1559545200"; d="scan'208";a="182967031"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
	by orsmga002.jf.intel.com with ESMTP; 29 Jul 2019 18:42:43 -0700
Received: from pgsmsx109.gar.corp.intel.com (10.221.44.109) by
	KMSMSX155.gar.corp.intel.com (172.21.73.106) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 30 Jul 2019 09:42:42 +0800
Received: from pgsmsx113.gar.corp.intel.com ([169.254.6.230]) by
	PGSMSX109.gar.corp.intel.com ([169.254.14.91]) with mapi id
	14.03.0439.000; Tue, 30 Jul 2019 09:42:42 +0800
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "Saini, Naveen Kumar"
	<naveen.kumar.saini@intel.com>
Thread-Topic: [oe] [PATCH] icewm: add recipe
Thread-Index: AQHVRhtizrsjF7NSN0G3ICSieCPaE6biY3WA
Date: Tue, 30 Jul 2019 01:42:41 +0000
Message-ID: <A2839490D87BE64781D1FF17AA14CEC30BAC102F@pgsmsx113.gar.corp.intel.com>
References: <20190729041128.2874-1-naveen.kumar.saini@intel.com>
	<CAMKF1sqYr+Kni1_YyLNPnNgZvpqtx0VOWW6PUi0duyC-yoiEpg@mail.gmail.com>
	<CAMKF1sp7KKLoc5zd7O9cWVTdWPYxrXycWbh5Baa2PAzBMuGC-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sp7KKLoc5zd7O9cWVTdWPYxrXycWbh5Baa2PAzBMuGC-Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] icewm: add recipe
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
X-List-Received-Date: Tue, 30 Jul 2019 01:42:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Probably better to reduce it to a compile and link test instead of outright=
 skipping the strlcat runtime test.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Monday, July 29, 2019 22:39
To: Saini, Naveen Kumar <naveen.kumar.saini@intel.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] icewm: add recipe

fails to build with aarch64/musl see

https://errors.yoctoproject.org/Errors/Details/255459/


