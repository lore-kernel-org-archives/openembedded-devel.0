Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LmCG5-0006EP-Et
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 20:25:57 +0100
Received: by yw-out-1718.google.com with SMTP id 9so2190037ywk.30
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 12:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=u8NT3WP1okyLvq8MUWd2zLyYwaqjPxzhKHZ+sOQPQCk=;
	b=X3FqN/74nkB+ECwqRMDwA4BQnEcuP6X10IaIoQ61ZenuB6b4xOFcOjmPwdu2MRduCt
	ryenrJHU/rdv4hxa8Z1hXagnM1v61tJzeGw5NGgGaa0jMRPw7wHJxH3pmf6wxvvoKB+z
	EEvbggn6doGgffOZjeCR5ygl9FWq9bM8hih+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=qWolfVPUXKZE2wEDekPz+ki9A/EWzs3nkldwmX0OhzlkTSM+zM8/skUacbPQLjqOHk
	/27LDfVS5ajjEZDs2l9eFZRv5uTIE1LzlcAqmweOsbzRhU71m/W/zoJsCqnrKK6UUlMq
	1Pzoom9snj7XDZje0Eh2cxK6V4rTisLVqHP8E=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.40.3 with SMTP id s3mr15524966ybj.169.1237922667425; Tue, 
	24 Mar 2009 12:24:27 -0700 (PDT)
In-Reply-To: <gqbbf3$jak$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<b6ebd0a50903241155u7743eaads81be33e350925b7a@mail.gmail.com>
	<gqbbf3$jak$1@ger.gmane.org>
Date: Tue, 24 Mar 2009 12:24:27 -0700
X-Google-Sender-Auth: 4fccb7bd8b83ffa6
Message-ID: <b6ebd0a50903241224j9f11e8dp73fe5eb1a81bfd86@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Tue, 24 Mar 2009 19:25:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2009 at 12:14 PM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> On 24-03-09 19:55, Chris Larson wrote:
>>
>> On Tue, Mar 24, 2009 at 11:36 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> =C2=A0wrote:
>>>
>>> Disadvantage of a Maintainers file is that it is yet another file to
>>> update when you create a package (adjacent to the checksums file and
>>> of course the package recipe). Guess it will be forgotten regularly.
>>>
>>> Also I fear we're going to end up with a lot of orphaned packages.
>>
>> The point I'm trying to make is that we have a lot of orphaned
>> packages today, we just aren't being honest about it. =C2=A090% of the
>> recipes in the tree don't get the attention they should.
>
> I suspect we have approx 100 properly maintained recipes, which is approx
> 1.5%. The rest is 'unmaintained' due to dormant upstream, or because it
> builds and works just well enough for people to ignore it.
> Also, having people put their name down as maintainer doesn't help when t=
hey
> have no interest in QA at all.

Having people put down their name as the maintainer means they're the
ones responsible for keeping it in good shape.  They're responsible
for fixing it if it breaks, though someone else may be nice enough to
fix it themselves, if it's blocking them.

I also don't think the fact that a recipe builds is an excuse to
ignore it.  Recipes should be kept in good shape, by current
standards, in my opinion.  As an example, many recipes still don't
take advantage of the ${BP}, etc variables, and are overriding
FILES{DIR,PATH} unnecessarily.

> What about recording when a recipe has been 'vetted' and the results of t=
he
> 'vetting':
>
> # foo_1.0.bb vetting record:
> # 2008/10/31 =C2=A0- =C2=A0koen@openembedded.org
> # =C2=A0 =C2=A0 =C2=A0 beagleboard/angstrom-2008.1
> # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fails to build with gc=
c >=3D 4.3.0
> # =C2=A0 =C2=A0 =C2=A0 tosa/angstrom-2008.1
> # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 works
> # 2006/5/16 - hrw@openembedded.org
> # =C2=A0 =C2=A0 =C2=A0 tosa/openzaurus-3.5.3
> # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 works

I'm sure that would be useful, but I don't see that as a replacement
for people taking responsibility.  Personally, I'd be a lot more
confident in my builds if I knew everything I was building was
actively maintained by an individual member of the team.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


