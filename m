Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 595 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Nov 2016 12:00:22 UTC
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id 7839460589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1589; q=dns/txt; s=iport;
	t=1479124824; x=1480334424;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=AfCWj34lz7wtzBMkzJzUwbdkRp8k1T6C429FzPw76E4=;
	b=jH6wY1P7fLCAyXsqVePOkRaH4RaDs2I6xcvk5GHZQZLYL3aRVjABM2on
	RKWNEE3bu5ZAJ4QpxdXet/lyCFzCVFAEl7+5AeP9TRgE7g0gj7nD9+2vf
	6iUNR0RXZfrpl6FqeCi9uS8xmyGDFwLkTBW9DcQAvu07hn3/3rYUj5UQQ M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B+AQBZpClY/4QNJK1eGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBgzEBAQEBAR9YgQAHjTeXCZRgggcdC4UxSgKCHD8UAQIBAQEBAQEBYh0?=
	=?us-ascii?q?LhGEBAQEEAQEBNw8lFwQCAQgRBAEBHwkHJwEKFAkIAgQTCBOIRg6xGItGAQEBA?=
	=?us-ascii?q?QEBAQECAQEBAQEBAQEBAR2GPIRahFiFUQWaQQGGO4VjhDeCRY1iLI0YhAkBHjc?=
	=?us-ascii?q?qWRyDbYEtcoZwgQwBAQE?=
X-IronPort-AV: E=Sophos;i="5.31,638,1473120000"; d="scan'208";a="348009093"
Received: from alln-core-10.cisco.com ([173.36.13.132])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	14 Nov 2016 11:50:28 +0000
Received: from XCH-ALN-007.cisco.com (xch-aln-007.cisco.com [173.36.7.17])
	by alln-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id uAEBoSjJ006032
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 11:50:28 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-ALN-007.cisco.com
	(173.36.7.17) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 14 Nov 2016 05:50:27 -0600
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1210.000;
	Mon, 14 Nov 2016 05:50:27 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser] Chromium crash start the test www.html5test.com
Thread-Index: AQHSPAzUK43W6vGvQEev/z3uKxBH2qDYYlVA
Date: Mon, 14 Nov 2016 11:50:27 +0000
Message-ID: <e9a8aedbf732444598e003ce0c553ab9@XCH-ALN-008.cisco.com>
References: <3A8890C59B0943428C1CECF15A6881A74332681B@ASAS013.asem.intra>
In-Reply-To: <3A8890C59B0943428C1CECF15A6881A74332681B@ASAS013.asem.intra>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.228.180.56]
MIME-Version: 1.0
Subject: Re: [meta-browser] Chromium crash start the test www.html5test.com
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
X-List-Received-Date: Mon, 14 Nov 2016 12:00:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Do you have a callstack or any debug information about this crash ?

Julien

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Flavio Suligoi
Sent: vendredi 11 novembre 2016 12:18
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-browser] Chromium crash start the test www.html5test.co=
m

Hi all,

I'm using Yocto 2.1 Krogoth, with an i.MX6DL (DualLite) board and the meta-=
browser layer.
The chromium version is the classic" 48.0.2548.0.

To call the executable I use the switches:

  *   --use-gl=3Degl
  *   --gpu-no-context-lost
  *   --ignore-gpu-blacklist
  *   --user-data-dir=3D/home/root/.chromium/

I use chromium in kiosk mode, with the web address directly written on the =
command line.

This because chromium, when more than one tab is opened, always crashes.


Anyway, when I try to test the HTML5 compatibility using the website "www.h=
tml5test.com<http://www.html5test.com>" , chromium crashes immediately, aft=
er downloading the html5 code, even before starting the test.


Do you have any solution/patch to solve this problem?


Best regards,


Flavio


P.S.: html5test is a very used and common html5 test and I have to use it t=
o check the html5 compatibility of my board.







--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

