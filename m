Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MN619-00078U-RA
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jul 2009 16:15:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C740F4F9499
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jul 2009 10:02:49 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26349-02 for <openembedded-devel@lists.openembedded.org>; 
	Sat,  4 Jul 2009 10:02:49 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 98BAC4F9457
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jul 2009 10:02:49 -0400 (EDT)
Date: Sat, 4 Jul 2009 10:02:49 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c2a08bbd0907040026s1d7d617fg95537e865b254761@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0907040946320.3731@juice.ott.cti.com>
References: <c2a08bbd0907040026s1d7d617fg95537e865b254761@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: OpenEmbedded goals?
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
X-List-Received-Date: Sat, 04 Jul 2009 14:15:04 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="346837782-1613558282-1246716169=:3731"

--346837782-1613558282-1246716169=:3731
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 4 Jul 2009, Mart R. wrote:

> I have been exploring =C3=85ngstr=C3=B6m and thus OpenEmbedded lately. Th=
e
> building process works nicely out of the box, but running it on some
> low end embedded system is out of the question because it is just too
> slow and bloated for my taste. Stripping it down is not an easy job
> either as I would have to edit countless of *.bb files.

Hi Mart,

If you create an overlay, you can fairly easily tweak individual .bb files=
=20
to strip them down without rewriting the entire recipe.

You can list your overlay dir before the OE recipe dir in COLLECTIONS. Set=
=20
FILESPATHBASE to look in your COLLECTIONS for extra patches and files,=20
include amend-recipes.inc from your distro conf, and create amend.inc in=20
your overlay for any recipes you want to mangle.

This is what the COLLECTIONS and FILESPATHBASE setting looks like:

http://jrz.cbnco.com/git/?p=3Dtoastix/toastix.git;a=3Dblob;f=3Dpublic/conf/=
site.conf;h=3Dee1a6d9ce60f65d37dca293c5c4ded04bbb03ff4;hb=3DHEAD

amend-recipes.inc:

http://projects.linuxtogo.org/pipermail/openembedded-devel/2009-May/011181.=
html

An amended recipe:

http://jrz.cbnco.com/git/?p=3Dtoastix/toastix.git;a=3Dblob;f=3Dpublic/recip=
es/diffutils/amend.inc;h=3D09b24cf568bea5311c1f0a2d154a710752d4e24e;hb=3DHE=
AD

(Don't expect much in that repo to work...)

Mike

--346837782-1613558282-1246716169=:3731--
