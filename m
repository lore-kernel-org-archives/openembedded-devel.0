Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7xDj-0007Gr-8v
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 23:26:16 +0200
Received: by gya1 with SMTP id 1so830240gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+h9EKds79HbfoqTlshmeVHZ9ZuQ57lP2u36EZLta6WM=;
	b=dPetZ+wQNE6+GhpDao7ixHwF82DRy73QY6j3dytOqXP3QDDv3VXzDcGFBZdGdUYVOn
	MnkVyOhxa5/eDbQesnvJTe3IadH4fEeMX5FjO4VU9S+LyutVd2EhzXOiQLpo/HAmwdXb
	HqNKjiSrPmr6nXB0mVJwdzf8lC5ZK9wwSddOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bNNP6mK5phmHTBRDFVUw6CSMJFY3BdocVsynFWa5v6zLyQ3bgJLdP6k5hIKr4JRJSg
	il0SCvfOwlyObyaXGwVrko3g7Hm0qmSpeM4eSicROFqYbAbMl7XdcZYboD4fEZEf0WeI
	jWztMeCB2gV7UTtorBJgA6V8sZy4Lx5UHlxEM=
Received: by 10.90.97.16 with SMTP id u16mr1010734agb.164.1287437130446; Mon,
	18 Oct 2010 14:25:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Mon, 18 Oct 2010 14:25:10 -0700 (PDT)
In-Reply-To: <201010151039.08619.marcin@juszkiewicz.com.pl>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2010 14:25:10 -0700
Message-ID: <AANLkTinZpcYYu3tHyX=9DPsbqWifPMigX0B+Vmwqt_Zy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Mon, 18 Oct 2010 21:26:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2010 at 1:39 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>
> Hi
>
> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
>
> 1. drop 2.4 kernels - if someone still needs them then .oz354x and .stabl=
e
> =C2=A0 branches have them.
>
> This may affect:
>
> - zauruses (which have 2.6 kernel)
> - ipaq h36/38/39/54/55 - some have 2.6 kernel
> - ipod - but does someone really uses 2.4.24 on own ipod?
> - ramses - but this is maintained out of tree
> - wrt54 - OpenWRT distro works better there and lets keep that way
> - xxs1500, mtx, sun4cdm - if someone maintain it at all then please raise=
 your
> =C2=A0hand
> - colinux - no one will cry
> - geodegx - 2.6 mainline works on it
>
>
> 2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someone=
 uses
> =C2=A0 older one then probably also uses 3 years old OE.
>
> This may affect (checked recipes):
>
> - ep93xx - machines with this cpu are mainline supported, patches from ts=
72xx
> =C2=A0and sim.one works
> - chumby
> - compulab-pxa270
> - devkitidp-pxa255
> - fsg3
> - gumstix
> - amsdelta
> - bd-neon
> - colinux
> - epia
> - geodelx
> - h1940
> - h6300
> - ks8695
> - magicbox
> - mtx-3
> - neuros
> - sun4cdm
> - tornado-omap2
> - wrap-geode
> - x86
> - acern30
> - logicpd-pxa270
> - mainstone
> - mx21ads
> - netbook-pro
> - triton
> - blueangel
> - universal
>
> Some of those machines are not maintained anymore, many of them should wo=
rk
> with current mainline kernels. If someone cares about anything on a list =
-
> raise your hand.

good plan. Go ahead with the removal.

>
> Why 2.6.20? Because NHK-15 uses it and does not work with mainline kernel=
.
>
> Regards,
> --
> JID: =C2=A0 =C2=A0 =C2=A0hrw@jabber.org
> Website: =C2=A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


