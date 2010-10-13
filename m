Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P67b1-0000zt-Em
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 22:06:45 +0200
Received: by ywl5 with SMTP id 5so2160011ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Dr1pVOlXU/Y039HxujSdJy6yMTixFEHxZYQiZBSLJfk=;
	b=L+jjJ1XbrAJKvjaSvvdjFEJSNiNYfLyHWGBMr3XzKunCNbF1/TzQuWZYwwBVKtTDWV
	k3kz4NQcLGe0Wj9XWsxI61xHol+NOZa8Lkup3gju/2TKaAFkRinRnqz2kQ94Qt0W9mB9
	1j6pYV+Hf1dor/8I5oLpl6S8WHH1Ewk+2OJF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=HJl6QUFspNNiFEJjGoUWsGh/DQbYr0mIa9BH3/f4T5kNCat7fediSlqssR2noVhvyl
	iXaYmxXetWoq8pbebDagR2ZMI0WNDzlfqT1VH+TrT8uJnp44HOnkAnbzKK4IxOCzznZt
	JG80TlRQ1qNWGIQQ7JRi4tIIOQEGClsqu+x2o=
Received: by 10.90.96.17 with SMTP id t17mr4277686agb.90.1287000374181; Wed,
	13 Oct 2010 13:06:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 13 Oct 2010 13:05:52 -0700 (PDT)
In-Reply-To: <i94qt5$r2l$1@dough.gmane.org>
References: <AANLkTikN5UjQfK=AvKV8YeqxFb1U7bq7ZZYuvxE5MHbq@mail.gmail.com>
	<i94qt5$r2l$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Oct 2010 13:05:52 -0700
Message-ID: <AANLkTimxBvq6yYJLFX1GSAKcJjq00RsrhAtshKS0kr7z@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openjade-native build fails
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
X-List-Received-Date: Wed, 13 Oct 2010 20:06:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 13, 2010 at 10:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> This sort of came back with libtool 2.4:
>
> NOTE: package openjade-native-1.3.2-r3: task do_populate_sysroot: Succeeded
> NOTE: Running task 6999 of 12209 (ID: 11645,
> virtual:native:/OE/angstrom-setup-scripts/sources/openembedded/recipes/openjade/openjade_1.3.2.bb,
> do_package)
> ERROR: QA Issue with staging: libospgrove.la failed sanity test
> (workdir) in path
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib
> ERROR: QA Issue with staging: libostyle.la failed sanity test (workdir)
> in path
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib
> NOTE: package openjade-native-1.3.2-r3: task do_package: Started
>

its known to me. We need to update the libtool macros which sometimes is easy
but sometimes not. Openjade its the latter. I will see if I can force
it to accept
2.4 macros somehow.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMte7lMkyGM64RGpERAjI7AKCstqWALEuTSZKJLAoMDFFk4spPJgCeJenM
> N/6drLWQ9uYSky93TyGQyNY=
> =ZpI7
> -----END PGP SIGNATURE-----
>


