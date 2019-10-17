Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94FD7731CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E2308184A2;
	Thu, 17 Oct 2019 23:12:29 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id M0uE1771GXQp; Thu, 17 Oct 2019 23:12:28 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 407AD1849F;
	Thu, 17 Oct 2019 23:12:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23AC01A081;
	Thu, 17 Oct 2019 23:12:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 178901A07C;
	Thu, 17 Oct 2019 23:12:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 17 Oct 2019 23:12:28 +0200 (CEST)
Received: from XBOX08.axis.com (xbox08.axis.com [10.0.15.178])
	by thoth.se.axis.com (Postfix) with ESMTP id 0AA4E2FA9;
	Thu, 17 Oct 2019 23:12:28 +0200 (CEST)
Received: from XBOX03.axis.com (10.0.5.17) by XBOX08.axis.com (10.0.15.178)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 17 Oct 2019 23:12:27 +0200
Received: from XBOX03.axis.com ([fe80::e49e:4060:87cc:61a]) by XBOX03.axis.com
	([fe80::e49e:4060:87cc:61a%22]) with mapi id 15.00.1365.000;
	Thu, 17 Oct 2019 23:12:27 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [oe] [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
Thread-Index: AQHVhPJHHb7YltMhkUWhTl2xMdK7lqde3lfw///iBwCAAJQs8A==
Date: Thu, 17 Oct 2019 21:12:27 +0000
Message-ID: <11adeb7603d84ebc941d0835c5a00f0b@XBOX03.axis.com>
References: <20191017135309.32441-1-trini@konsulko.com>
	<a481c7b712504bb4a40364fab7ff1a0b@XBOX03.axis.com>
	<20191017141932.GJ16029@bill-the-cat>
In-Reply-To: <20191017141932.GJ16029@bill-the-cat>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: George Kiagiadakis <george.kiagiadakis@collabora.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	=?iso-8859-1?Q?Jan-Simon_M=F6ller?= <jsmoeller@linuxfoundation.org>
Subject: Re: [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
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
X-List-Received-Date: Thu, 17 Oct 2019 21:12:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Tom Rini <trini@konsulko.com>
> Sent: den 17 oktober 2019 16:20
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-devel@lists.openembedded.org; George Kiagiadakis
> <george.kiagiadakis@collabora.com>; Jan-Simon M=F6ller
> <jsmoeller@linuxfoundation.org>
> Subject: Re: [oe] [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
>=20
> On Thu, Oct 17, 2019 at 02:11:11PM +0000, Peter Kjellerstedt wrote:
>=20
> > Just to add to this, I have attached a recipe for pipewire that we=20
> > used to use (we have not used it for a while so it is not up-to-date).=
=20
> > It should hopefully give you some more ideas. E.g., it uses automatic
> > splitting of all the spa and module packages similar to how the=20
> > GStreamer plugins are automatically split into separate packages.
>=20
> I hesitate on adding stuff like this right now in that with 0.3 (and
> audio support) a bunch more stuff changes.  One of my goals right now
> is to get pipewire 0.2.7 in such that it meets Andreas' needs and then
> with 0.3 later being able to confirm his use case still works when=20
> updating.
>=20
> --
> Tom

As I wrote, it was mainly to give you more ideas. Since we were sitting=20
on them, but not using them ourselves, I thought it better to pass them=20
along. Then you, or anyone else, can use them to improve the recipe at=20
a convenient time.

//Peter


