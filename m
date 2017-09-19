Return-Path: <prvs=428658508=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 642 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Sep 2017 08:42:58 UTC
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 65B6060750
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1505810581; x=1537346581;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=TdAFUFJFLJPAcDG98t4U23aYcXNl5XTfjeDB16woTU0=;
	b=Xu8Z2khAXzSSwoDdk5+Ig3bysjgXDeJKtIiW4jfvn+XoRX20iVvjp6WE
	dRpRbSf4FXryymSLM6w2DakWkveEWhs+6MxT9AmdXLBAczFgE9won+j9Z
	NruQWK/MrjLdZrU12VRPPJds0g8yLh/08YUQKwG7gH/6FTGDNxRqM5Nb4 4=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 19 Sep 2017 10:32:10 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
	19 Sep 2017 10:32:08 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb4.muc with ESMTP/TLS; 19 Sep 2017 10:32:08 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Tue, 19 Sep 2017 10:32:08 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1320.000;
	Tue, 19 Sep 2017 10:32:08 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [oe] Use of github /archive/ tarballs in SRC_URI
Thread-Index: AQHTMR7PasFVGl0n/ECfva4WwK6l8KK7v8eA
Date: Tue, 19 Sep 2017 08:32:08 +0000
Message-ID: <20170919083205.ojully66ojq6l2mq@hiutale>
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.110]
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 08:42:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5FFE88ACD9878C4588302F353EC57A52@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Yes, we have been affected by this several times too.

In addition to fixing recipes, a sanity test to warn about the situation
would be nice to have so that the issue could be detected in other
meta layers too.

-Mikko=

