Return-Path: <henry.bruce@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 692EA735B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 07:00:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2015 23:00:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,637,1418112000"; 
	d="scan'208,217";a="656289545"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2015 23:00:24 -0800
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 23 Feb 2015 23:00:24 -0800
Received: from orsmsx104.amr.corp.intel.com ([169.254.3.113]) by
	ORSMSX115.amr.corp.intel.com ([169.254.10.201]) with mapi id
	14.03.0195.001; Mon, 23 Feb 2015 23:00:23 -0800
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Why no recipe for openjdk-headless?
Thread-Index: AdBP/L1HbtyqS+zmR/SMcDiep4TwVQAAlqmg
Date: Tue, 24 Feb 2015 07:00:23 +0000
Message-ID: <F81DC1078564A34BB4DA30CAE03814D127697625@ORSMSX104.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Why no recipe for openjdk-headless?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Feb 2015 07:00:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm putting together an OS image that includes  a Java headless application=
. Having used the openjdk7-jre-headless package on Ubuntu I was hoping to f=
ind a matching recipe, but sadly none exist,.  The openjdk7-jre recipe requ=
ires the X11 distro feature which adds unnecessary luggage for a small foot=
print IoT solution. Thanks to a bbappend from https://github.com/woglinde/m=
eta-java/issues/45 I can minimize footprint, but a headless recipe would be=
 a better solution.  I'm fairly new to Yocto so could someone explain the c=
hallenges of a headless recipe and where one might start when creating one?

Henry Bruce



