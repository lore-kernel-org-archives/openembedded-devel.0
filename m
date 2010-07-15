Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OZWIs-0000Kl-Mo
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 23:49:18 +0200
Received: by iwn34 with SMTP id 34so1466744iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=16qnfJ6xzN60ywIKfOvzs/6uozxyLgXR3+uZPnQfSng=;
	b=uYcdnrXpF5zTFJDhOs4lQAhFy3+suevvfBmoSEE+jQjId1pHqW6c47esqRgzHwPR9b
	odBUaEkz1Hgscq4671AFdALvXZBZX1ZNAwkSxoMAz4kPRNaVUErz8H+ip5lIa3Bf0inS
	KdlUWKfQJG8fSpKgqQf8qdLl8Tv9Y7Mei2gOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uVY2c1PUjgzj5DAFX0inzPIkoKj0oD3KKM0afVXMnPfxuuzG+VcvJwAj3bXvqV0Umw
	dXFV+LyeprBl36pM7NvFTriWLc0TEOaAAJXnZGpPXgcOMwTeFASgb+qC/a0OIFLd6m97
	9R9fvFmBhBv+IuoEnDd37Dv0y2fkvmhBoxJLc=
Received: by 10.231.139.195 with SMTP id f3mr19395845ibu.139.1279230551201; 
	Thu, 15 Jul 2010 14:49:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Thu, 15 Jul 2010 14:48:51 -0700 (PDT)
In-Reply-To: <201007121053.23909.roman@khimov.ru>
References: <AANLkTin5ott-60Mn_j6a7iPGhr30gQ9R1JaeuYOCezM-@mail.gmail.com> 
	<1278917375-22463-1-git-send-email-khimov@altell.ru>
	<201007121053.23909.roman@khimov.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jul 2010 14:48:51 -0700
Message-ID: <AANLkTilTdJMEfrAalhDWRFr2g6lK4E9ls919GlMb64v4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	URIBL_SBL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] perl 5.10.1: fix standard module rdependencies
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
X-List-Received-Date: Thu, 15 Jul 2010 21:49:18 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 11, 2010 at 11:53 PM, Roman I Khimov <roman@khimov.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
12 =C9=C0=CC=D1 2010 10:49:35 =C1=D7=D4=CF=D2 Roman I Khimov =CE=C1=D0=C9=
=D3=C1=CC:
>> Automatic dependency extraction script made some errors thus perl-module=
s
>> wasn't installable.
>>
>> =9A* s/perl-module-encode-kr-2022_kr/perl-module-encode-kr-2022-kr/
>> =9A* perl-module-your-module-here came from example in script, dropped i=
t
>> =9A*
>> =9As/perl-module-cpan-exception-yaml_not_installed/perl-module-cpan-exce=
ption
>> -yaml-not-installed/ * perl-module-dbd-sqlite - not part of standard per=
l,
>> =9Aprovided by libdbd-sqlite * perl-module-dbix-simple - same as above,
>> =9Aprovided by libdbix-simple
>>


After todays commit it doesnt seem to be fixed fully.
I still get errors

| log_check: There were error messages in the logfile
| log_check: Matched keyword: [Cannot satisfy the following dependencies]
|  * resolve_conffiles: Existing conffile
/scratch/oe/rootfs/native-sdk-image/etc/device_table is different from
the conffile in the new package. The new conffile will be placed at
/scratch/oe/rootfs/native-sdk-image/etc/device_table-opkg.
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-sdk-native:
|  *    libdbd-sqlite-perl *    libdbix-simple-perl *
|
NOTE: package native-sdk-image-1.0-r0: task do_rootfs: Failed
ERROR: TaskFailed event exception, aborting



>> Signed-off-by: Roman I Khimov <khimov@altell.ru>
>> ---
>> =9Arecipes/perl/perl-rdepends_5.10.1.inc | =9A 23 +++++++++++-----------=
-
>> =9Arecipes/perl/perl_5.10.1.bb =9A =9A =9A =9A =9A | =9A =9A2 +-
>> =9A2 files changed, 12 insertions(+), 13 deletions(-)
>
> Please, ignore this one too, as it's exactly the same as previous, really
> updated one is on the way.
>
> --
> =9Ahttp://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


