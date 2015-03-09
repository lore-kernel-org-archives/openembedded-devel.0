Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 636 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Mar 2015 13:11:58 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id C780373927
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1326; q=dns/txt; s=iport;
	t=1425906722; x=1427116322;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=p1S2dfEcEv7B28geUfl1CaY6FpJuDTAtAPnGSHzMvFc=;
	b=JMjvCKbpEQpQSaKKr4VwJSSuV8d4sH1fKUgqGyjHFN9pP7HhggQhZ0Dy
	WltBNyZo4ZmwfeT5iUu4+Vl5jWsVkkbf0ERn2bp2aplCSLKp6t7Q2vFmh
	4eiK5PljDYWHQp3ZXryyCDfdjfwvJTRG9h9zIvCZCIx1HXZifR9KeGCY0 Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0CIHQBxmf1U/4sNJK1XA4MGUloEv2lFgiwKhSdJAoElTQEBAQEBAXyEDwEBAQQBAQE3NBcEAgEIEQQBAQEKFAkHJwEKFAkIAgQTCIgnDcNNAQEBAQEBAQEBAQEBAQEBAQEBAQEBF4sXhD0hFwYLgwaBFgWQD4Nkg06DdJIhI4IygTxvgUR/AQEB
X-IronPort-AV: E=Sophos;i="5.11,367,1422921600"; d="scan'208";a="402030081"
Received: from alln-core-6.cisco.com ([173.36.13.139])
	by rcdn-iport-6.cisco.com with ESMTP; 09 Mar 2015 13:01:14 +0000
Received: from xhc-aln-x01.cisco.com (xhc-aln-x01.cisco.com [173.36.12.75])
	by alln-core-6.cisco.com (8.14.5/8.14.5) with ESMTP id t29D1E8n017185
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Mar 2015 13:01:14 GMT
Received: from xmb-aln-x12.cisco.com ([169.254.7.174]) by
	xhc-aln-x01.cisco.com ([173.36.12.75]) with mapi id 14.03.0195.001;
	Mon, 9 Mar 2015 08:01:14 -0500
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH] qt5-git, qtbase, qt5everywheredemo: use
	https protocol for gitorious
Thread-Index: AQHQWmiJ33xeLmJoBUWxdw2Dwk7aoJ0UHMPw
Date: Mon, 9 Mar 2015 13:01:13 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D05983328@xmb-aln-x12.cisco.com>
References: <CAL5ScNULNnnK5NyZ9SN2q2fidHpDW8XR6DL_kkMujgTXDCogFw@mail.gmail.com>
	<CAP9ODKqqy9xU3NW=0LDzsVDokA5xiCnH49kY2Kw_wVSL9U1bQA@mail.gmail.com>
In-Reply-To: <CAP9ODKqqy9xU3NW=0LDzsVDokA5xiCnH49kY2Kw_wVSL9U1bQA@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.144]
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH] qt5-git, qtbase, qt5everywheredemo: use https protocol for gitorious
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
X-List-Received-Date: Mon, 09 Mar 2015 13:12:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wouldn't be better to move to http://code.qt.io/ ? This is the new place wh=
ere Qt repositories are hosted, and it supports git:// protocol.

Julien

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: lundi 9 mars 2015 13:56
To: Frederico Cadete
Cc: OpenEmbedded Devel List
Subject: Re: [oe] [meta-qt5][PATCH] qt5-git, qtbase, qt5everywheredemo: use=
 https protocol for gitorious

On Mon, Mar 9, 2015 at 9:52 AM, Frederico Cadete <frederico@cadete.eu> wrot=
e:
> As of Gitorious 3.2, this service no longer supports the git:// protocol.
>
> Added ";protocol=3Dhttps" to the SRC_URI's that are pointing there.
>
> Signed-off-by:Frederico Cadete <frederico@cadete.eu>

Being it now a GitLab company it seems good to move out to github and avoid=
 another migration in near future.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

