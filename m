Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 910F472C06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:54:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 16 Jan 2015 03:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,410,1418112000"; d="scan'208";a="652100325"
Received: from ogiles1-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.108])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2015 03:54:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Fan, Xin" <fan.xin@jp.fujitsu.com>
Date: Fri, 16 Jan 2015 11:54:32 +0000
Message-ID: <1564018.h6sptGTLbK@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <72334B6CF8FF6542A565D43122925D601A0E7C@G01JPEXMBYT21>
References: <72334B6CF8FF6542A565D43122925D601999FF@G01JPEXMBYT21>
	<2746815.1G8tsLzyMa@peggleto-mobl5.ger.corp.intel.com>
	<72334B6CF8FF6542A565D43122925D601A0E7C@G01JPEXMBYT21>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Question about ntp build option
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
X-List-Received-Date: Fri, 16 Jan 2015 11:54:41 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 16 January 2015 02:05:27 Fan, Xin wrote:
> > There will always be differences in how people expect software to b=
e
> > configured for whatever target and application they are building fo=
r,
> > hence why we make it fairly easy to adjust the configuration.
>=20
> Actually, I had the same opinion with you at the beginning.
>=20
> But in last December, the ntp published 4 serious
> vulnerabilities(CVE-2014-9293, CVE-2014-9294,CVE-2014-9295,CVE-2014-9=
296).
> So I think even the display a clock function, it should=E3=80=80also =
be protected
> by openssl for the safety connection.

I'm not sure this follows. Correct me if I'm wrong, but SSL doesn't act=
ually=20
prevent me as an unauthorised user from making a connection - it just e=
nsures=20
that when I connect to a server that firstly the data sent over the con=
nection=20
is encrypted, and furthermore that the connection is directly to the se=
rver I=20
think it is and not someone else masquerading as that server. This woul=
d mean=20
that for example any buffer overflows such as the ones in the vulnerabi=
lities=20
you point to would still be accessible and potentially exploitable even=
 if the=20
connection were only available as encrypted using SSL, at least as far =
as I=20
can tell.

> And I find more packages in Yocto=E3=80=80which also use the openssl =
as the
> default option, so I think ntp also should set the openssl option as =
default
> setting.

In a lot of other cases SSL is on by default because it really makes se=
nse;=20
for example it's common to want to fetch files from https servers so in=
 the=20
general case you would want curl to be built with SSL support by defaul=
t. I'm=20
not sure the same can be said of ntp. Again, I'm happy to be corrected =
though.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

