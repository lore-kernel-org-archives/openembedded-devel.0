Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8cKP-0006uW-Ja
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 19:19:54 +0200
Received: by yxt3 with SMTP id 3so1871616yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=K2XxhgsczwHwALL3YFRGxJhcs0gr6VMT27Z1bSHhkU4=;
	b=TMk0338j0BvaDsTNDkFStGJZ8p/i9ONKtvQG40Z5XQQBWzq4K68oBitm0tBffZ+BYl
	OlJ5ZheDwZLDxkCpyWxPy4SxsuHWFV+sLEhEwnxvk5loswm+PlcpSUlsAX9LjRyoIn6T
	oFtMsecKqZclpbf5mlJ2Tice2H6a7JPRH5Yi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ssHHiHm6cdQhnhquLJ638gCu4Dcf3ZOkNHeXunoGNavEd3vBrBeRVIgPyHTT4LMHkI
	mDGqbuaCHZnbc0EzFUmGkGjQyTUokN5ZaXkbkbRq1wqAoOVeWsq7HO8I6q3FMhS+3Bdm
	jLLPsehyDxzEe52gg8NLiPQhlUzZbDisd5OXE=
Received: by 10.90.68.14 with SMTP id q14mr615487aga.74.1287595155794; Wed, 20
	Oct 2010 10:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 20 Oct 2010 10:18:55 -0700 (PDT)
In-Reply-To: <i9n56p$ppm$1@dough.gmane.org>
References: <4CBEB7E8.5020109@nedap.com>
	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>
	<29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
	<20101020140543.GN3324@jama>
	<4CBF01C6.7030409@gravedo.de> <i9n56p$ppm$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2010 10:18:55 -0700
Message-ID: <AANLkTikF4A8F5n8nNdr=5ttSox5qgfTwobz-pNTEL+Li@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 17:19:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2010 at 9:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-10-10 16:50, Simon Busch wrote:
>> On 20.10.2010 16:05, Martin Jansa wrote:
>>> On Wed, Oct 20, 2010 at 09:26:32AM -0400, Nik wrote:
>>>> What os are you compiling on? =C2=A0Can you run the cross compile gcc =
from the command line and get the no input files message?
>>>
>>> Related log from #oe - as I'm lazy to type it again :)
>>>
>>
>> As I tried a little bit more I tracked it down to the commit
>> f1148d26740e57cba4fe29fd78c234359868a50e ("binutils.inc: Filter out
>> --with-sysroot for target binutils"). If you revert this one and do a
>> fresh build (rm -rf tmp) everything compiles fine.
>
> It would be nice if commits like that bumped PR so problems also show up
> in incremental builds. And in this case, the fixed *packages* can end up
> in the feeds.

indeed. my bad. The problem should be fixed now

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMvxgZMkyGM64RGpERAnirAKCvfFOmzQTOqYTS5+PxFUFHzxHDrwCgonk2
> PxM2Xi/EQa0uma+SY+F1LmI=3D
> =3DB1wz
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


