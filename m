Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JzKmw-0005ud-9s
	for openembedded-devel@openembedded.org; Fri, 23 May 2008 02:05:39 +0200
Received: by an-out-0708.google.com with SMTP id b21so74001ana.6
	for <openembedded-devel@openembedded.org>;
	Thu, 22 May 2008 17:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:cc:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	bh=giFSQCkasczMhoq632ViqAQRzu1gRG6zjBGYFWjoV9c=;
	b=BlSYwf9J6MoSfmFrL7i5GFAUswPczE+E8Yq0jzRnIYwpDu/chMK9unjBrcPJvSjyuQPryoC6/318avRkUBhKcIfuCbW/8jFOOxPvmPqj+xZMDVCGxRnU0qgaTJOG4qau+3j//VylO2HnRFRbjrn0zkDmIe9q7Ss15WAKXAWIxeI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:cc:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	b=lyTNIyjSr8GEv1LrueBzMr2Q6ribsWsPAoTBX3Qoe1o9Erh5zQGaYj/5L3dvtZFpSLX/VdtRY5WRgclx68M6g+MfcycW4uhiNKhbjBdmC//EBalENGl3KiifWgenIXyvuSE71syIi3JL/l7n5ONb9YIps64WfG/U6zu54H4+pYU=
Received: by 10.143.160.6 with SMTP id m6mr303403wfo.162.1211500972727;
	Thu, 22 May 2008 17:02:52 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.23.244])
	by mx.google.com with ESMTPS id 32sm7640872wfc.16.2008.05.22.17.02.51
	(version=SSLv3 cipher=RC4-MD5); Thu, 22 May 2008 17:02:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g14do2$eur$1@ger.gmane.org>
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
	<g14do2$eur$1@ger.gmane.org>
Date: Thu, 22 May 2008 17:02:50 -0700
Message-Id: <1211500970.10806.14.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 23 May 2008 00:05:39 -0000
X-Groupsio-MsgNum: 5233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6JgUfnVwTO8ctwOzVKdq"

--=-6JgUfnVwTO8ctwOzVKdq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-05-22 at 20:24 +0200, Rolf Leggewie wrote:
> Enric Balletb=C3=B2 i Serra wrote:
> > I have the same problem, but at this moment I don't have idea about sol=
ution.
>=20
> I am also experiencing similar problems for a spitz build.  The problem
> started to appear about a week ago.
> f2497299e919cb94e12fc8690a709479451e5510 still builds fine.  I think the
> most likely candidates that triggered this problem are to be found among
> the changes to gcc that were made after that revision.  I see changes
> from koen and RP in the commit-ml.  It would be nice if the people who
> understand this stuff took a look to spot a possible regression.  I will
> try and narrow the revision down further.
>=20
> http://oss.leggewie.org/wip/f2497299e919cb94e12fc8690a709479451e5510_vs_H=
EAD.txt

Looking at this file. I dont see any obvious problem unless you are
using armv7a and angstrom-2008.1

in this changeset the preferred gcc version has been changed from=20
4.2.3+csl-arm-2008q1-126 to 4.2.1+csl-arm-2007q3-53

Otherwise these changes look only like new gcc recipe has been added and
no common code is modified which could affect gcc 4.3

glibc changes also seems specific to armv7a



>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=-6JgUfnVwTO8ctwOzVKdq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBINgmqHnJKy6V6em4RAq8LAJ9aYBgqZ88LKnhzkRX/aOrP/7SE6gCfWau6
bJWy2LOboVO4xXsEHMiaIH4=
=Kaqb
-----END PGP SIGNATURE-----

--=-6JgUfnVwTO8ctwOzVKdq--
