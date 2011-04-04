Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <v2g.udel@gmail.com>) id 1Q6kvx-0001Lr-Js
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:39:13 +0200
Received: by qyk35 with SMTP id 35so1171105qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to
	:x-mailer; bh=iHMVy5mf6mU0t6kBlPqmoG1vEug77pCVo9ZaN5Iwels=;
	b=bqVUoUnxPtFDrgtu0W4u81JW8z6m6utBkFaHvIDFSba3hTNadeVx2pIA8gPeClNwgj
	l/yU238ToSlgB63ob3BuIEIBZ1Hgh15TcO9rHN3wS+3iZipGfS1OgbUEvQsvpTcNP7U+
	nYuziL1+KOtrR0DKSx1B7J+dZs6kEuJDUQvYA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	b=Q/1v2YKm/VGPS3aOTey5WtkGG8sQuFQ8+VyuNdGjZcGNslXFH/3Hj+rxS6NePHd0y0
	PrYVp+E7S6kjjdGmatIqz5SuV1tRXyQufnTK3Ahd6tZfy8SQ8LABE7D38FnkvMqMmcbj
	tc5eg8wjaHLShigkP4BqyIUK5xkXXKsWbcoiE=
Received: by 10.229.221.139 with SMTP id ic11mr5831433qcb.129.1301927828105;
	Mon, 04 Apr 2011 07:37:08 -0700 (PDT)
Received: from roaming-188-24.nss.udel.edu (roaming-188-24.nss.udel.edu
	[128.175.188.24])
	by mx.google.com with ESMTPS id m7sm3490059qcg.29.2011.04.04.07.37.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 07:37:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Sachin Kamboj <v2g.udel@gmail.com>
In-Reply-To: <4D99D689.9050705@mlbassoc.com>
Date: Mon, 4 Apr 2011 10:37:06 -0400
Message-Id: <79CF2877-D36A-412A-AF90-6FF538AACF9C@gmail.com>
References: <4D99D609.8020800@mlbassoc.com> <4D99D689.9050705@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1084)
Subject: Re: Master broken?
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
X-List-Received-Date: Mon, 04 Apr 2011 14:39:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The problem is "angstrom-2008.1" has been retired and is no longer =
available in the master branch. Use "angstrom-2010.x" instead as your =
distro. Alternatively, use the maintenance branch:

=
http://www.angstrom-distribution.org/angstrom-20081-moves-maintenance-bran=
ch
=20
/Sachin.

On Apr 4, 2011, at 10:32 AM, Gary Thomas wrote:

> On 04/04/2011 08:30 AM, Gary Thomas wrote:
>> I just updated to org.openembedded.dev =
556819235f501bf762c8d8cc9f41a1a8244b106f
>=20
> To be clear, local.conf includes these settings:
>  DISTRO =3D "angstrom-2008.1"
>  MACHINE =3D "beagleboard"
>  IMAGE_PKGTYPE ?=3D "ipk"
>=20
>> Now I get these errors during the initial parse:
>> $ bitbake xfce-image
>> NOTE: Handling BitBake files: | (0046/7335) [ 0 %]ERROR: global name =
'runtime_mapping_rename' is not defined while parsing =
/local/Angstrom_BeagleBoard/openembedded
>> /recipes/images/x11-gpe-image.bb
>> NOTE: Handling BitBake files: \ (0053/7335) [ 0 %]ERROR: global name =
'runtime_mapping_rename' is not defined while parsing
>> =
/local/Angstrom_BeagleBoard/openembedded/recipes/images/angstrom-gnome-ima=
ge.bb
>> NOTE: Handling BitBake files: \ (0113/7335) [ 1 %]ERROR: global name =
'runtime_mapping_rename' is not defined while parsing
>> =
/local/Angstrom_BeagleBoard/openembedded/recipes/images/helloworld-image.b=
b
>> ... etc
>>=20
>> What am I missing?
>>=20
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



