Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Opmip-0004J8-7z
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 20:35:16 +0200
Received: by iwn2 with SMTP id 2so4175010iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=dMCdYAwV/jZkQErlEYeJRTLb56Scaetbk23wfE2nFJc=;
	b=qN2lqPb7CAcY+WDIVRn00F3mtXAV53wMpRPe2CKng+hyY2wrlEx7l3VI8xHIb0NwXw
	VyWRuIx26b2W00MB2jyePzv+5QENjCaV/2n7g7vKkup5PdykobDUp5Vv6rh1/EvhoTNr
	MPA3+tWt6bPrctxRZVrusweNMBgxugMD2W0kk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=pRTf2JrOX/onHtl/xuwO53+Dx9a3oszxP/BgGtNBb6efE+drHWoaHGBW8+y0vVW21U
	/wMZb2IlCcbByQF5bg7zCVMjXbVmdjP3UoGozdAZmXhnzEYVAnt9oCZ25eiH4GrmxWYo
	3zXlyfzGTmMSFjWZFKkc3/tcEVYrFPkKAq32E=
Received: by 10.231.166.72 with SMTP id l8mr4271831iby.95.1283106698457; Sun,
	29 Aug 2010 11:31:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 11:29:27 -0700 (PDT)
In-Reply-To: <i5dans$v2$1@dough.gmane.org>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-5-git-send-email-raj.khem@gmail.com>
	<i5dans$v2$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 11:29:27 -0700
Message-ID: <AANLkTimY78Zz8F_H96D4+gXSNe6VvLM4tE-kfYBMHuXk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/23] esc-node-demo_git.bb: Do not RDEPEND on a recipe yet which is under review
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
X-List-Received-Date: Sun, 29 Aug 2010 18:35:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2010 at 2:54 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-08-10 22:24, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0recipes/esc/esc-node-demo_git.bb | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/esc/esc-node-demo_git.bb b/recipes/esc/esc-node-dem=
o_git.bb
>> index 814771b..f29b7ba 100644
>> --- a/recipes/esc/esc-node-demo_git.bb
>> +++ b/recipes/esc/esc-node-demo_git.bb
>> @@ -23,7 +23,7 @@ do_install() {
>> =A0 =A0 =A0 =A0 =A0install -m 0755 ${S}/${i} ${D}${datadir}/esc-training
>> =A0 =A0 =A0done
>> =A0}
>> -
>> -RDEPENDS_${PN} =3D "nodejs"
>> +# disable for now until nodejs recipe is committed
>> +#RDEPENDS_${PN} =3D "nodejs"
>> =A0FILES_${PN} +=3D "${datadir}/esc-training"
>
> NAK, push the nodejs patch instead

It was still under review I can wait until that recipe is OKed

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMei48MkyGM64RGpERAj2fAKCkRK+MKrSrtYzIDiYqsEgB1VZSSACeN8cp
> wzPv0Q/K0arcwOsf3SfM+MY=3D
> =3DzXOz
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


