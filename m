Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LmBxL-0002fB-Fp
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 20:06:35 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1864583yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 12:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=mPmsfzqYaJCa9CUDYx9DtrgEoIJLOpsNPI+UwaZbAzY=;
	b=Nr+rMyOgN1cDMgR0oU/lh/F8d2DNPgjKheI2h2Jhrif8Y/UuVwZ/+OKI4iqStx8i5c
	Z+gmSkh6EiT1bcAS3hoZF+daeHS0AWDKZz76kSjq8qbExASL7Mus/0f//MzGHeFBq3er
	B0a06SfRsDkJ4Nng24hcrhert/euc7Cp8/7t0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=q9OU6RwVkZc7/Fg5r1HLfvM+Rc29+KbUg/AM4ZmJxlLWaCDRGRwEPi/npG7AZUzaf9
	Xh4J2YMU5YMgRfGp2T3kMMZ3WRBtEv21sjAL56NCLW6Y3TpiONfTSvaXyZKWP7ChV11C
	XNt+t6bfL2MG1p9qU2xt5CjNzuIVnqI+f30VU=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.150.57.17 with SMTP id f17mr15493556yba.136.1237921505502; 
	Tue, 24 Mar 2009 12:05:05 -0700 (PDT)
In-Reply-To: <49C92CC7.2080801@gmail.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<49C92CC7.2080801@gmail.com>
Date: Tue, 24 Mar 2009 12:05:05 -0700
X-Google-Sender-Auth: be836b13b80a531d
Message-ID: <b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 19:06:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2009 at 11:56 AM, Junqian Gordon Xu <xjqian@gmail.com> wrot=
e:
> On 03/24/2009 01:36 PM, Frans Meulenbroeks wrote:
>>
>> Disadvantage of a Maintainers file is that it is yet another file to
>> update when you create a package (adjacent to the checksums file and
>> of course the package recipe). Guess it will be forgotten regularly.
>>
>> Also I fear we're going to end up with a lot of orphaned packages.
>
> One possibility is to get statistics about the committer from the last X
> commits, calculate the mean and standard deviation (STD) of the age of th=
e
> last X commits to indicate how likely the maintainer is alive, and
> automatically update the Maintainer file every month. There will be other
> details to discuss, but the maintainer file would look something like thi=
s.
>
> Recipe name =C2=A0 =C2=A0 Maintainer =C2=A0 =C2=A0 =C2=A0Mean Age (last 5=
) =C2=A0 =C2=A0 =C2=A0 STD (last 5)
>
> gcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Koen =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A02 month =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 10 days
> binutils =C2=A0 =C2=A0 =C2=A0 =C2=A0RP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A01 year =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A02 month

That's an interesting possibility.  I'd thought about looking at the
committers, but didn't think about using the age.  How would you
handle something that's had 3 commits by one person and 2 by another?
And those 3 were minor bugfixes by a contributer, not someone who
plans on taking any responsibility for the state of the recipe? :)
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


