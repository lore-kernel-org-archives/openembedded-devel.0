Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Pxz8p-00052p-Em
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:00:16 +0100
Received: by iwn10 with SMTP id 10so2618021iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 01:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=lYA55P0yVL9SJ5iHJUfMuquKV/sqB3EPk3HqvmgrL/s=;
	b=u1pHft5JhOGqORsUiSRtSGWWbCKWaXvAwDkzEBggIoc+znHq6UtMLr0+Ny292Ys2Rz
	8kz1OgZHHEPntIpB5rH8XLuj196ivcDl8/SY0yFOXJ479fLCR1H0utHs+6UogzzfZjCM
	+kbXRHmQSP/M1guQo+Ux3yno+OdwrGp9UKDBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WMQXtfPpg+Y3AiVfeuxWXboWvz+Kh99ISXdDkkcF609Eib4OdPFNABkFPys8kTwkNn
	ade1uHzigSFUGMKSmblVIccDLLd3mwpox2dMgQ5Ht8Q+E25W9WGI/Ng0vJ9szZReZz/9
	Jb9RDrZqdvMfdPOiVY9MAuPEpoLTpBxTb47ek=
MIME-Version: 1.0
Received: by 10.43.65.83 with SMTP id xl19mr8985003icb.55.1299837083957; Fri,
	11 Mar 2011 01:51:23 -0800 (PST)
Received: by 10.42.117.138 with HTTP; Fri, 11 Mar 2011 01:51:23 -0800 (PST)
In-Reply-To: <AANLkTimLqGc2snJHw4Oymfz9q+t+GDWF+ErL46eTzJB5@mail.gmail.com>
References: <AANLkTik1GhO_ZX_oP3_TB6JR_73QPmM7t3jzxd4vbOkW@mail.gmail.com>
	<20110311080427.GB2478@sakrah.homelinux.org>
	<AANLkTimLqGc2snJHw4Oymfz9q+t+GDWF+ErL46eTzJB5@mail.gmail.com>
Date: Fri, 11 Mar 2011 10:51:23 +0100
Message-ID: <AANLkTinGAS+x7q=RVynv8QVV9gCD9RC_Yd+msyzYm=_m@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] cpio.lzma compression level in bitbake.conf
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
X-List-Received-Date: Fri, 11 Mar 2011 10:00:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2011 at 10:49 AM, Andrea Adami <andrea.adami@gmail.com> wro=
te:
>> I think this is something we can encapsulate in machine.conf files
>> so unless the general value in bitbake.conf does not fail for almost
>> all cases I would suggest to keep it and instead introduce a new
>> variable to control the level
>> -Khem
>
> Ok, but then we need a weak assignment in bitbake.conf to allow the
> setting =A0in machine conf.
>
> So, in bitbake.conf
>
> -IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
> (find . | cpio -o -H newc | lzma -c -9
>>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
> ${EXTRA_IMAGECMD}"
>
> + LZMA_COMPRESSION_LEVEL ?=3D "-9"
> +IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
> (find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL}
>>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
> ${EXTRA_IMAGECMD}"
>
> And in machine.conf e.g.
> + LZMA_COMPRESSION_LEVEL ?=3D "-7"

Copy and paste is for the lazy..obviously I meant
+ LZMA_COMPRESSION_LEVEL =3D "-7"


>
> Acceptable?
>
> Regards
>
> Andrea
>


