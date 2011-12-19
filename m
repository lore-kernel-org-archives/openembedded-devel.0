Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RclsH-0001xi-EJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 23:40:01 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Dec 2011 14:31:48 -0800
Received: by iazz13 with SMTP id z13so7158768iaz.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 14:31:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.43.65.79 with SMTP id xl15mr369042icb.6.1324333906924; Mon, 19
	Dec 2011 14:31:46 -0800 (PST)
Received: by 10.50.66.2 with HTTP; Mon, 19 Dec 2011 14:31:46 -0800 (PST)
In-Reply-To: <20111216215455.GC28832@sakrah.homelinux.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
	<44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
	<20111216215455.GC28832@sakrah.homelinux.org>
Date: Mon, 19 Dec 2011 14:31:46 -0800
Message-ID: <CAPhnLPDSpXjAi+V9gjJCsrdoYez5CJWzv-+ejmDqm8P5mFu_Kw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-devel@lists.openembedded.org, 
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH meta-oe 5/9] nerperf: add
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
X-List-Received-Date: Mon, 19 Dec 2011 22:40:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2011 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (16/12/11 10:22), Koen Kooi wrote:
>>
>> Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende geschrev=
en:
>>
>> > Hello Koen,
>> >
>> >> -----Original Message-----
>> >> From: openembedded-devel-bounces@lists.openembedded.org [mailto:opene=
mbedded-
>> >> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
>> >> Sent: Friday, December 16, 2011 3:52 PM
>> >>
>> >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0 +1,=
47
>> >>> @@ +DESCRIPTION=3D"Network performance benchmark including tests for
>> >>> TCP, UDP, sockets, ATM and more." +SECTION =3D "console/network"
>> >>> +HOMEPAGE =3D "http://www.netperf.org/" +LICENSE =3D "netperf"
>> >>
>> >> Can you include a comment on what type of license netperf is? MIT lik=
e, BSD like,
>> >> GPL like?
>> > [Luo Zhenhua-B19537] May I know which license type should be with foll=
owing COPYING content?
>>
>> That looks like a BSD or MIT derivative, maybe Beth can give us some gui=
dance on what to use as LICENSE
>
> it says "for non-commercial purposes only"

Yeah.... in this case, I would do one of two things (and I have a
feeling one will be more valid that the other):

1. Email the author and see if we can use BSD-4-Clause. My guess is no.
2. We'll need to add a Netperf license to common-licenses and set
LICENSE =3D "Netperf"

I've checked the openSuSE Build Service and they have this as an
"Other" license, so, check with the author first, but be prepared to
add Netperf to the common-licenses directory.

And yes, Koen is right. I wouldn't use BSD or MIT for this,
specifically because of the non-commercial clause in (ii).

-b

>
>>
>> regards,
>>
>> Koen
>>
>>
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0Copyright (C) 1993 Hewlett-Packard Company
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ALL RIGHTS RESERVED.
>> >
>> > =A0The enclosed software and documentation includes copyrighted works
>> > =A0of Hewlett-Packard Co. For as long as you comply with the following
>> > =A0limitations, you are hereby authorized to (i) use, reproduce, and
>> > =A0modify the software and documentation, and to (ii) distribute the
>> > =A0software and documentation, including modifications, for
>> > =A0non-commercial purposes only.
>> >
>> > =A01. =A0The enclosed software and documentation is made available at =
no
>> > =A0 =A0 =A0charge in order to advance the general development of
>> > =A0 =A0 =A0high-performance networking products.
>> >
>> > =A02. =A0You may not delete any copyright notices contained in the
>> > =A0 =A0 =A0software or documentation. All hard copies, and copies in
>> > =A0 =A0 =A0source code or object code form, of the software or
>> > =A0 =A0 =A0documentation (including modifications) must contain at lea=
st
>> > =A0 =A0 =A0one of the copyright notices.
>> >
>> > =A03. =A0The enclosed software and documentation has not been subjecte=
d
>> > =A0 =A0 =A0to testing and quality control and is not a Hewlett-Packard=
 Co.
>> > =A0 =A0 =A0product. At a future time, Hewlett-Packard Co. may or may n=
ot
>> > =A0 =A0 =A0offer a version of the software and documentation as a prod=
uct.
>> >
>> > =A04. =A0THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
>> > =A0 =A0 =A0HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
>> > =A0 =A0 =A0REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE =
OR
>> > =A0 =A0 =A0DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUA=
L
>> > =A0 =A0 =A0PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
>> > =A0 =A0 =A0DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
>> > =A0 =A0 =A0EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
>> > =A0 =A0 =A0DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
>> > =A0 =A0 =A0MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
>> >
>> > =A05. =A0HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR A=
NY
>> > =A0 =A0 =A0DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMA=
GES
>> > =A0 =A0 =A0(INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
>> > =A0 =A0 =A0MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTAT=
ION.
>> >
>> >
>> > Best Regards,
>> >
>> > Zhenhua
>> >
>>
>
>
>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


