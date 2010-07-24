Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ocawr-0005hs-8M
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 11:23:15 +0200
Received: by iwn34 with SMTP id 34so1074027iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=wC5rBiXNbe3bTA9AvfN63iKkjF2K9foYhafOF4CDS48=;
	b=DHzKkyN7eFD+Q0qMGezmlQbGCW9ddDSVowsP8hyfXB0F1b8TI01/Y5vKKbeEjWwWj2
	ANHFq8pHtFCfJJiWfu4kzGxy8NXvvzHEA1yqIKJLSwtzLgNrSPFTmFndA/Fcj5t6OKS1
	k4M9jcLepzT7EW3SBCQykvILo7G7V84BoAvGU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fEDJ180M3I2vF1XmIQO4r+oQvGcMlxag2D5g6BLv1hx5N6Kx6fPlyVulmX3f8CIru7
	7Q7zI0z3xXHlCRYo9GaozQxJdebJ07WbO8kr438MYysZIb96T5a1HSREM584X+AuvS4H
	lDqCiA4snc3s6p29qFZvddh/G5ORka87OS6SQ=
Received: by 10.231.39.134 with SMTP id g6mr5155842ibe.151.1279963380171; Sat, 
	24 Jul 2010 02:23:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Sat, 24 Jul 2010 02:22:40 -0700 (PDT)
In-Reply-To: <1279886129.2692.39.camel@mill.internal.reciva.com>
References: <1279752241-21656-1-git-send-email-raj.khem@gmail.com> 
	<1279886129.2692.39.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Jul 2010 02:22:40 -0700
Message-ID: <AANLkTik+1nEThDrcaehKVZy3xS5YnKED8L+j+stDrAGZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] distro: Add new feature to indicate thumb-interworking.
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
X-List-Received-Date: Sat, 24 Jul 2010 09:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2010 at 4:55 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2010-07-21 at 15:44 -0700, Khem Raj wrote:
>> +# Add thumb-interwork to feature list if selected machine supports it.
>> +DISTRO_FEATURES +=3D ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB=
_INTERWORK', d, 1) =3D=3D "yes"]}'
>
> Would it not be better to put this in some generic place (maybe even
> bitbake.conf) rather than adding it to every DISTRO individually?

yes thats better I guess.

>
>> --- a/conf/distro/include/slugos.inc
>> +++ b/conf/distro/include/slugos.inc
>> @@ -23,9 +23,18 @@ DISTRO_VERSION ?=3D "${SLUGOS_VERSION}${DISTRO_REVISI=
ON}-${DISTRO_TYPE}"
>> =A0# DISTRO_FEED ?=3D "${SLUGOS_VERSION}-${DISTRO_TYPE}"
>> =A0DISTRO_FEED ?=3D "unstable"
>>
>> +THUMB_INTERWORK =3D "yes"
>> +# "yes" "no"
>> +# =A0 =A0Whether to compile with code to allow interworking between the=
 two
>> +# =A0 =A0instruction sets. =A0This allows thumb code to be executed on =
a primarily
>> +# =A0 =A0arm system and vice versa. =A0It is strongly recommended that =
DISTROs not
>> +# =A0 =A0turn this off - the actual cost is very small.
>> =A0# We want images supporting the following features (for task-base)
>> =A0DISTRO_FEATURES =3D "nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda=
 pcmcia usbgadget usbhost pci"
>
> Is this a policy change for slugos? =A0If so, are the SlugOS people happy
> with it?

I have tried to build for slugos and the device nslu2 is based on xscale so=
 I
this this should be needed for slugos.


>
> p.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


