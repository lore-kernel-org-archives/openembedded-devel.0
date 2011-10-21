Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RHMPx-0000lS-Qr
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 23:14:19 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p9LL8GjT011482
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 23:08:21 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Fri, 21 Oct 2011 23:08:14 +0200
From: =?Windows-1252?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] 2011.03-maintenance: Bad checksums in
	binutils-cross-sdk_2.18.bb
Thread-Index: AQHMkDJ4v+KJPO8aEkSqMrMAe8XxmZWHSN4m
Date: Fri, 21 Oct 2011 21:08:14 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4013D19C@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013CD9B@post.tritech.se>
	<1319192173.3766.16.camel@mattotaupa>
	<4EA18A1F.9040409@telia.com>,<1319229929.3448.7.camel@mattotaupa>
In-Reply-To: <1319229929.3448.7.camel@mattotaupa>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.89.227.239]
MIME-Version: 1.0
Subject: Re: [PATCH] 2011.03-maintenance: Bad checksums in binutils-cross-sdk_2.18.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 21:14:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Paul,=0A=
=0A=
I think Denys is correct in saying that "my" fix is a fix to a slightly dif=
ferent problem (http://article.gmane.org/gmane.comp.handhelds.openembedded/=
48425) . The way the included binutils_2.18.bb was fixed may be wrong and r=
equire an additional fix though. I'll look into this.=0A=
=0A=
BR // Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Paul Menzel [paulepanter@user=
s.sourceforge.net]=0A=
Sent: Friday, October 21, 2011 10:45 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [PATCH] 2011.03-maintenance: Bad checksums in binutils-cr=
oss-sdk_2.18.bb=0A=
=0A=
Dear Ulf,=0A=
=0A=
=0A=
Am Freitag, den 21.10.2011, 17:05 +0200 schrieb Ulf Samuelsson:=0A=
> 2011-10-21 12:16, Paul Menzel skrev:=0A=
=0A=
> > Am Freitag, den 21.10.2011, 06:42 +0000 schrieb Mats K=E4rrman:=0A=
> >=0A=
> >> My first patch, please be gentle if i did something wrong ;)=0A=
> > our commit policy describes how patches should be formatted [1][2]. Mos=
t=0A=
> > importantly you forgot your Signed-off-by line.=0A=
> >=0A=
> >> The following patch is from a local branch tracking=0A=
> >> 2011.03-maintenance, should it be done different?=0A=
> I did a similar fix for binutils-2.20.1, and that is apparently not the w=
ay=0A=
> so this was rejected. (See other discussions on binutils this week).=0A=
>=0A=
> I sent a new version of binutils-2.20.1 patch today,=0A=
> which is taken from openembedded-core, and that=0A=
> combines the new checksums, with downloading a new tarball.=0A=
>=0A=
> If it follows the same scheme, then:=0A=
> binutils-2.18.tar.bz2 is only a link to binutils-2.18a.tar.bz2=0A=
> Your SRC_URI should be pointing at binutils-${PV}a.tar.bz2=0A=
=0A=
you describe indeed the correct fix. Unfortunately the =93wrong=94 fix was=
=0A=
already committed so I just continued on this track. I also noted that=0A=
in my commit message.=0A=
=0A=
Ulf thank you for the correct fix for 2.20.1 and Mats, if you have some=0A=
time it would be great if you could send a patch for what Ulf proposed.=0A=
=0A=
[=85]=0A=
=0A=
=0A=
Thanks,=0A=
=0A=
Paul=0A=
=0A=
=0A=
> > [1] http://www.openembedded.org/wiki/Commit_Policy=0A=
> > [2] http://www.openembedded.org/wiki/Category:Policy=0A=
> > [3] http://www.openembedded.org/wiki/2011.03-maintenance=0A=
> > [4] http://git.openembedded.org/openembedded/commit/?id=3Df2d53aa074d76=
509384e7bb8a9c39e2e27210f4a=0A=


