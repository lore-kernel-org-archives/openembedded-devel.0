Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fat031c@gmail.com>) id 1OOVCL-0005Wn-9A
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 14:24:58 +0200
Received: by yxt3 with SMTP id 3so1173566yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 05:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vOE/UpkG/i9Ze0tjeQWon0tj6tLDMIsMsv4HAeE0j7g=;
	b=w8KaYJPQzgoQg55MNe/IjNxKHKsplRycJtqJ21Ge2v0A737uzBDvDDJSCje0HkWGV4
	SW5FCxfS1O3KD5cQz8sfUTqg/ShVcwbEu5wVz1cTQ3cK3jgvfDhXXGXgjW29WB9QcNLA
	Oltlu+iNniyLa9LtnYhqdPjW1B6OS9IK11eo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=o6QEe7BfazDfoNFKptfRHQS5KIINgGNIZPe/MV6Wo3/7qOlP3BhdlSNhs1Te70EL8d
	S1MVtQ7gcwnmv8KBS9MEMYXMFJ5yNngVFBYv9GgX1VW25oLvdhhEoQy6pInf0OFfULY4
	UKjirxRKIftp+z0x5ynLTe6rtQ5uZf4YBkb84=
MIME-Version: 1.0
Received: by 10.151.76.11 with SMTP id d11mr3073193ybl.204.1276604124476; Tue, 
	15 Jun 2010 05:15:24 -0700 (PDT)
Received: by 10.151.9.14 with HTTP; Tue, 15 Jun 2010 05:15:24 -0700 (PDT)
In-Reply-To: <hv7cjf$9kc$1@dough.gmane.org>
References: <AANLkTilHhuvcQFQBwVWkW6_Nf7xQPd6xDQlZzv4kvnel@mail.gmail.com>
	<hv7cjf$9kc$1@dough.gmane.org>
Date: Tue, 15 Jun 2010 23:15:24 +1100
Message-ID: <AANLkTilgy4hXALUWa8mcXKxM_4DEXBOFfoiwjV4VVMqq@mail.gmail.com>
From: Andrew Tverdohlebov <fat031c@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fat031c@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: STAGING_KERNEL_DIR
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
X-List-Received-Date: Tue, 15 Jun 2010 12:24:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Huge thanks, Koen!

On Tue, Jun 15, 2010 at 7:11 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 15-06-10 07:36, Andrew Tverdohlebov wrote:
>> Hello,
>>
>> I am developing a recipe for a code that needs to obtain kernel
>> configuration parameters
>> in order to compile correctly.
>
> If your recipe is really machine specific, add PACKAGE_ARCH =3D
> "${MACHINE_ARCH}"
>
> If not, add:
>
> # We want a kernel header for armv7a, but we don't want to make mplayer
> machine specific for that
> STAGING_KERNEL_DIR =3D
> "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
>
> regards,
>
> Koen
>
>
>>
>> According to the manual there is a variable STAGING_KERNEL_DIR that is
>> supposed to point to the kernel staging dir.
>> In my case it points to staging/mips-linux where I don't see '.config' f=
ile.
>> The '.config' file is located in staging/xls4lte-linux (xls4lte - is a
>> name assigned to MACHINE in local.conf)
>>
>> My question: - what is a correct way to refer to a directory where
>> kerenel's config file is located.
>>
>> The second question is - what is a point in several directories in stagi=
ng dir ?
>>
>> In my case I have:
>> i686-linux
>> i686-linux-sdk
>> mips-linux
>> xls4lte-linux
>>
>> I thought that this might be a property of my distro and checked
>> angstrom for beagleboard and saw the same picture there:
>>
>> while working on my custom linux distro based on openembedded if noticed=
.
>> armv7a-angstrom-linux-gnueabi
>> armv7a-linux
>> beagleboard-angstrom-linux-gnueabi
>> i686-linux
>>
>> In both cases at least two separate dirs are created in staging. One
>> ${MACHINE}-linux and another ${TARGET-ARCH}-linux. =A0What are they for
>> ?
>> And how to properly refer to staging/${MACHINE}-linux ?
>>
>> Any help will be hugely appreciated.
>> Andrew
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMFzWvMkyGM64RGpERApsQAJ0Wmg02kVDp5rl0jnb8nxEClBW7AACfdwLj
> JFufKD77LgRZ5pOdT9YXegk=3D
> =3DoHiS
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


