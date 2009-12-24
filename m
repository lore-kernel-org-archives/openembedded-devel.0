Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNmyD-0001g6-F3
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 13:39:12 +0100
Received: by pwi18 with SMTP id 18so4915864pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 04:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=B/EjyvOuBEcGRYZPDUY3TyPDZZS8gHVyS/3LFKYMeGI=;
	b=XFryDk5G/B9N7MzGh3INrJt2MAd8EvFL0T7tcthJcBiQklFZtgjullPZN6aPtNx9wQ
	Z7H5q5ZoGsoaRNQda2qV2BW4rEEpn942T0bUedF/jk5yVNtrbqP3yaJYXXNKLMWGh2Pb
	gfM5Ac2mCPtLy1p42Cq1pUeS/jCM1QdrHbb1k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=MlY64dssLVK3sTq7D4ZV4+9+IprV2dZwOy26wWDjbaw5NRgMmhyzyRpDlh26t+AZsG
	Mpa/A4ojPigXbkM2HrMTD4BB5v9EMeHwSx4CL9Y4cnQNMjYdsVdv6fT/nw60cUlCwxvZ
	9JUmK3HdG19pM34cegJ80Sn1QJnWCRi/M6ric=
Received: by 10.140.56.17 with SMTP id e17mr8024841rva.182.1261658235108;
	Thu, 24 Dec 2009 04:37:15 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 22sm7751023pzk.14.2009.12.24.04.37.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 04:37:14 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1261647639-12424-1-git-send-email-camelguo@gmail.com>
	<hgvkg5$tfh$1@ger.gmane.org>
Date: Thu, 24 Dec 2009 20:37:07 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5fzzvlmmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <hgvkg5$tfh$1@ger.gmane.org>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove ANGSTROM_FEED_CONFIGS reference in base-image.bb
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
X-List-Received-Date: Thu, 24 Dec 2009 12:39:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

on qemux86 and minimal distribution, bitbake base-image reports the  =

following:


camelguo@guohr-laptop-ubuntu:/opt/workdir/oe/build/gulessoft-oe-standard=
-conf$  =

bitbake base-image
NOTE: Handling BitBake files: \ (7951/7951) [100 %]
NOTE: Parsing finished. 7365 cached, 314 parsed, 272 skipped, 0 masked.
NOTE: oestats: build 46915
NOTE: Resolving any missing task queue dependencies
ERROR: Required build target 'base-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['base-image',  =

'${ANGSTROM_FEED_CONFIGS}']

so that can not continue

=E5=9C=A8 Thu, 24 Dec 2009 19:49:26 +0800=EF=BC=8CKoen Kooi <k.kooi@stud=
ent.utwente.nl>  =

=E5=86=99=E9=81=93:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> NAK, you don't address any of the concerns mentioned in the comment
>
> On 24-12-09 10:40, Guo Hongruan wrote:
>> Rmove ANGSTROM_FEED_CONFIGS reference in recipes/images/base-image.bb=
,  =

>> so that it is distro-independent.
>> ---
>>  recipes/images/base-image.bb |    3 +--
>>  1 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/images/base-image.bb b/recipes/images/base-image=
.bb
>> index 295e0ed..8b1ed23 100644
>> --- a/recipes/images/base-image.bb
>> +++ b/recipes/images/base-image.bb
>> @@ -22,10 +22,9 @@ DISTRO_SSH_DAEMON ?=3D "dropbear"
>>
>>  DISTRO_PACKAGE_MANAGER ?=3D "ipkg ipkg-collateral"
>>
>> -# FIXME: We need a distro-indendent way of specifying feed configs.
>>  # Once the RFC for the DISTRO_FEED_CONFIGS variable name is approved=
,
>>  # we can remove this default definition and set it in the distro  =

>> config.
>> -DISTRO_FEED_CONFIGS ?=3D "${ANGSTROM_FEED_CONFIGS}"
>> +DISTRO_FEED_CONFIGS ?=3D ""
>>
>>  DEPENDS =3D "\
>>  	task-boot \
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLM1VGMkyGM64RGpERAsACAKCsiygVUBuW/7Swgh/CIupb5d8iqgCfe/0U
> Nydk6bUz7rtQKmelrx27Kew=3D
> =3DiI12
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


