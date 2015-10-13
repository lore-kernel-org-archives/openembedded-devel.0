Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 573 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Oct 2015 10:22:35 UTC
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id A8E2275F3A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=592; q=dns/txt; s=iport;
	t=1444731756; x=1445941356;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=o0FrF5fDAMzbn92/PWoeFfgBJ7ZXu3vJwjjBb+vtcLQ=;
	b=UYIkY7OOlIRBUvjQDhgUogEbafhZxTsl1n8aSpmSIbUoma83YHjJH47J
	cL8WQdM7pQTPRGpo7f8V4qfld1IAV4KxJKqzBROpdB0tse5iCVkTQXqMJ
	gUWpWaRhQUymh94AmUTDVbSAPJ608I+u0w/sC0rBlnLdU/HveNtfM9xmj w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0DfAgBD2BxW/5hdJa1dgyZUbwW+CQENgVohgnKCCn8CgT84FAEBAQEBAQF/C4QmAQEBAwE6RAsCAQg2EDIlAgQbiB4IDcBSAQEBAQEBBAEBAQEehnWEfoUUhC4FlhYBhRiHeoInmWcBHwEBQoQChlyBBgEBAQ
X-IronPort-AV: E=Sophos;i="5.17,677,1437436800"; d="scan'208";a="196880748"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
	by alln-iport-4.cisco.com with ESMTP; 13 Oct 2015 10:13:02 +0000
Received: from XCH-ALN-008.cisco.com (xch-aln-008.cisco.com [173.36.7.18])
	by rcdn-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id t9DAD2LZ031006
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:13:02 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-ALN-008.cisco.com
	(173.36.7.18) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Tue, 13 Oct 2015 05:12:49 -0500
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1104.000;
	Tue, 13 Oct 2015 05:12:49 -0500
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  [meta-browser] Recipes draft for Chromium V45 and V47
Thread-Index: AQHRAoYUCV2kssPkaUy95Sr6oOwhBp5pNIUw
Date: Tue, 13 Oct 2015 10:12:49 +0000
Message-ID: <2f4be637747c4a7eb3f2d5dd7a0b8465@XCH-ALN-008.cisco.com>
References: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
In-Reply-To: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.60.62.122]
MIME-Version: 1.0
Subject: Re: [meta-browser] Recipes draft for Chromium V45 and V47
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
X-List-Received-Date: Tue, 13 Oct 2015 10:22:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> It still needs some cleanup before upstream, comments are welcome.

I think it would be great to take the opportunity to clarify license declar=
ation in chromium recipes.
Currently, LICENSE is set to BSD only for chromium recipes, through chromiu=
m.inc file.
Archives from http://gsdview.appspot.com/chromium-browser-official contain =
third party source code (ffmpeg for instance) that is not BSD licensed, whe=
reas it is compiled by the recipe.

Shouldn't licenses from 3rd party code compiled by chromium be declared in =
the recipe as well ?

Regards,

Julien

