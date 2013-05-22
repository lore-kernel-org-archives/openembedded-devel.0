Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF8A60810
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 20:39:48 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id bv13so262237pdb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=y0NfiNZFDo7jOnfSjRUN01QxTYwXB4CK7K8hmPikt34=;
	b=CQidPxOqRy4aLF3w6bE2LOmQ9UtPjlJUKOWYFhmB9L8RWTzNtDH7DQT/480ScjKH7P
	VF6qctJmOpQN2bSW97+hD81E7+kxpumIGVEfeVdP36kDZToK+M61fTvcX7NCXdM6pvOc
	J/ndv1vnEUcUPkJYg5yQ98lH1TKZO7zmwiKCMPFXqWQIAcuP/8kaeKn/imSDTJixwmoP
	3lAsgRe0Q0g2cicJutUAdZyvcxBr5aH/ae/1Q0Ya/u4qfBqcWo1q04Smf94JG7cmI2Js
	fIN2Klldoia0X6ms139EasztcnCOSv0kIcyLCl/F+N//FDfSqB09Qar29kv5CzABGjso
	v4dA==
X-Received: by 10.68.162.163 with SMTP id yb3mr9413451pbb.212.1369255188558;
	Wed, 22 May 2013 13:39:48 -0700 (PDT)
Received: from sa-nc-common3-43.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id ra4sm9469500pab.9.2013.05.22.13.39.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 13:39:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130522144925.GJ32431@jama>
Date: Wed, 22 May 2013 13:39:44 -0700
Message-Id: <D8003811-36A9-4347-A895-3FB3BCF569DC@gmail.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<519CCFFF.2060506@windriver.com> <20130522144925.GJ32431@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 20:39:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 22, 2013, at 7:49 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Wed, May 22, 2013 at 09:02:39AM -0500, Mark Hatle wrote:
>> (Background) When the spacing was decided, looking at the existing OE =
recipes=20
>> and classes, the majority of things were indented such that python =
used tabs,=20
>> and recipe (shell scripting) used spaces.  During the cleanup of the =
scripting=20
>> sections it was decided that the least impact to all was desirable.  =
Thus the=20
>> python-tab, shell-spaces convention.
>=20
> "python used tabs, and recipe (shell scripting) used spaces"
> "python-tab, shell-spaces convention"=20
>=20
> ...=20
>=20
> you have it WRONG
>=20
>> It's true that shell scripts don't really care about indenting, so =
the four=20
>> spaces is just a convention that was decided on based on that.  The =
concern is=20
>> that if we go in and change the convention now, it's going to cause a =
lot of=20
>> potential disruption.
>>=20
>> So the answer isn't that it's a technical reason, it's a community =
reason.=20
>> Don't rock the boat on something that is just going to annoy people =
and provide=20
>> no actual help.  So far I haven't seen a compelling argument to =
change the=20
>> convention BTW, other then (paraphrase) "I don't like spaces, and =
want to use=20
>> tabs".  (Note, when I write shell scripts, I prefer tabs as well..)
>=20
> layers in meta-oe repo were using tabs in less shell tasks then some
> amount of spaces.
>=20
> Using combination of tabs and spaces in the same file (and even on the
> same lines) is quite bad, because it looks different based on tab =
length
> and can show wrong indentation in case like 8 spaces and 2
> 4-character-wide tabs on next line (where author was seeing 18 spaces =
on
> 2nd line)
>=20
> It was acked by 2 TSC members:
> Koen: =
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0901=
62.html
> Khem: =
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0902=
03.html

I was of a different opinion since we did not have any coding style =
using two was an improvement. However
since then I have been dealing with OE  newbies and using two different =
indentation style has compounded
the issues for them, its not one but each one of the new folks who I =
interact with are trying to learn writing OE
metadata. I for one happen to be familiar with metadata a bit more than =
them so for me having two sets was
less of an issue however I did realize the pain it was causing for on =
boarding new folks so I thought it would
be a better option for us to have uniform style guides for metadata.  =
Question about back porting the fixes is
a concern but I think who will do back porting understand OE metadata =
better than newbies and can deal with
it a bit better than the newbies would deal learning a new project.

>=20
> 3rd member of TSC and maintainer of some meta-oe layers, was aware of =
this change=20
> and wasn't complaining:
> Paul: =
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0901=
84.html
>=20
> Joe who also maintains layer in meta-oe repo agreed that it's good =
idea:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0901=
81.html
>=20
> Otavio also contributes a lot and agreed with that change:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0901=
46.html
>=20
> Andreas is sending also lot of patches and formally supported that
> change now.
>=20
> You on other hand don't even follow meta-networking/MAINTAINERS file
> when sending patches...
>=20
> When this was discussed about a year ago in TSC, the most important
> reason was complicating backports, you can read something about it my =
RFC:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0901=
35.html
> Now close to creating dylan branch for meta-openembedded is imho best
> time to do this, not many changes from released dylan will be =
backported
> to danny, because people will start moving to newer release instead of
> backporting more and more stuff to old one (also resolving possible
> whitespace merge conflict it not hard). Causing conflicts for merge =
was
> IIRC most important reason why my proposal was rejected for oe-core.
>=20
> Original proposal here
> =
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.ht=
ml
> was also supported by
> Chris =
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026201.ht=
ml
>=20
> Since the change I had to manually update only 6-10 patches submitted =
for
> meta-oe and backporting patches from dylan to danny or denzil is not
> influenced by this change.
>=20
> And TSC minutes which discussed it say:
> Reluctant conclusion: tabs for shell, 4 spaces for python.
>=20
> So please stop trying to show it as action of one maintainer who
> decided to go against TSC decision and to scr3w everybody.
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


