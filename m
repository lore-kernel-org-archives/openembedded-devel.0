Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RXxEQ-0003l6-Jx
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 16:46:58 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB6Fe6KG020534
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Dec 2011 16:40:11 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Tue, 6 Dec 2011 16:40:05 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Pull request for libpam
Thread-Index: AQHMs2zS+vIjg8Dblk6vPcxGVI57oJXNlnGAgADZT4+AAGFMAIAAH7Ji
Date: Tue, 6 Dec 2011 15:40:05 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A4DAE@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>	,
	<CA+M6bXnrw7p=5ACg99REKASR4L+0yzgunJ6xDWWSwcFeR82hww@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C401A4A69@post.tritech.se>,
	<1323182142.4571.10.camel@mattotaupa>
In-Reply-To: <1323182142.4571.10.camel@mattotaupa>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request for libpam
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
X-List-Received-Date: Tue, 06 Dec 2011 15:46:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Paul Menzel [paulepanter@us=
ers.sourceforge.net]=0A=
> Sent: Tuesday, December 06, 2011 3:35 PM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] [2011.03-maintenance] Pull request for libpam=0A=
> =0A=
> Dear Mats,=0A=
> =0A=
> =0A=
> Am Dienstag, den 06.12.2011, 07:55 +0000 schrieb Mats K=E4rrman:=0A=
> > > From: openembedded-devel-bounces@lists.openembedded.org [openembedded=
-devel-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmai=
l.com]=0A=
> > > Sent: Monday, December 05, 2011 8:49 PM=0A=
> > > To: openembedded-devel@lists.openembedded.org=0A=
> > > Subject: Re: [oe] [2011.03-maintenance] Pull request for libpam=0A=
> > >=0A=
> > > On Mon, Dec 5, 2011 at 9:42 AM, Mats K=E4rrman <Mats.Karrman@tritech.=
se> wrote:=0A=
> > > > Hello Tom,=0A=
> > > >=0A=
> > > > Please pull this commit from here:=0A=
> > > >=0A=
> > > > git://github.com/mkarrman/openembedded=0A=
> > > > Branch: maintenance=0A=
> > > >=0A=
> > > > Mats K=E4rrman (1):=0A=
> > > >      368c68a  libpam_1.1.1: remove directory preventing /var/run fr=
om being volatile.=0A=
> > >=0A=
> > > Where is this a backport from?  Thanks!=0A=
> =0A=
> > My local project...=0A=
> > Maybe I went ahead of myself but the solution is ~equivalent to the=0A=
> > solution applied in libpam recipes of oe-core but 1.1.1 does not exist=
=0A=
> > there and the corresponding fix was a part of the original recipes for=
=0A=
> > later versions.=0A=
> =0A=
> so why not push it to OE-classic master first?=0A=
> =0A=
=0A=
Perhaps I missed the consensus of the "Plans for OE classic future" thread?=
=0A=
To my understanding pull requests from "somewhere" and master will sooner-t=
han-later die was the way to go.=0A=
Also, pushing requires write access to the repo (that I don't have) but I c=
an send a patch to the mailing list, if you like.=0A=
=0A=
BR // Mats=0A=
=0A=
> =0A=
> Thanks,=0A=
> =0A=
> Paul=0A=
> =0A=


