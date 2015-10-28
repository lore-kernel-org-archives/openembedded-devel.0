Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4B676710
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 19:59:07 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so11586252wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=fXXQRTNF0jgTwRbiOLq1j+lWjC20V7JFwP2eP+mLx/Y=;
	b=jVPR5Wm28kw9YYcEqRDuUhYg7zBjqb3xO4gizSVyQRvvSwl87KLn9N30n8IZm823wt
	SJVv6FH2zpoI1WvbZT3uNxekpkzAAER9aGbzio6s3oNBYsxKdsAleJv3HqypYbVv7xmc
	idvouhX3SU44KoYfucCdkjXnwKw+S8FuD4MBAZqnEgvEtvzIezr3eBeKoEayWNVlSy3P
	twwY73hcf9CpJaUI7kTzqcyZz0kfMWlSFmo1SZ2c4HiaZ0cBHtw7VKHrZ6xpm8tP4MXs
	EBu8mcMqzYHe9it1KlI2354bkx0bC5UuXX+dqqSv9JRqSa1BusEAe3we8pA7uMqFHMX0
	P+BQ==
X-Received: by 10.28.54.211 with SMTP id y80mr2624626wmh.3.1446062347543;
	Wed, 28 Oct 2015 12:59:07 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id t20sm5486073wme.0.2015.10.28.12.59.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Oct 2015 12:59:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CACS+7ZR3ok=Dh-ckPXwYVOjVVprkU30TPP_chAtAfCQ5LioXgQ@mail.gmail.com>
Date: Wed, 28 Oct 2015 20:59:05 +0100
Message-Id: <96E09775-068F-43DC-BB69-96171C19B783@gmail.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<CACS+7ZR3ok=Dh-ckPXwYVOjVVprkU30TPP_chAtAfCQ5LioXgQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Wed, 28 Oct 2015 19:59:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 28.10.2015 um 20:34 schrieb Dan McGregor =
<danismostlikely@gmail.com>:
>=20
> On 28 October 2015 at 12:01, Jens Rehsack <rehsack@gmail.com> wrote:
>>=20
>> This adds openjdk-8 for native and target builds and allows a =
stripped
>> openjre-8 being built as well instead of trying to cherry-pick jre
>> components from jdk-image.
>>=20
>> The recipes allow building openjdk-8 with or without:
>> * x11
>> * cups
>> * alsa/pulseaudio
>> and let packager enable unlimited-crypto, if desired.
>>=20
>> Since there can be only one PROVIDES for virtual/java-native and =
virtual/javac-native,
>> move the provides to openjdk-8-native (I think everyone agrees it's a =
better
>> choice than ecj-bootstrap-native).
>>=20
>> Plus: Applying a fix from openjdk-9 repository which fixes build =
issues using gcc5
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>=20
> My biggest issue with this patchset (I haven't looked at it too
> closely yet, but it does seem to work) is
> that the new recipes and recipe include files have inconsistent
> whitespace. This matches the openjdk-7
> recipes, but I'd rather not see it perpetuated with new recipes. How
> you feel about doing a tab kill and
> using spaces?

Fine with me ;)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


