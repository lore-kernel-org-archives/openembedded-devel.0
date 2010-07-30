Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1OeyVR-0001rz-Tw
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 00:56:59 +0200
Received: by vws13 with SMTP id 13so1921907vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 15:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hGCDeDHPDG8zPROAH1GXLmGN/GK5w/z6k2pRRVmXWOY=;
	b=N7MPqgElnHO929AqawFX/RjyskQJPK5W8Iw1A3Mn6nl0Qebry+wWb39q+WsnJmxhOM
	SFVFYs/XDmOscQYIf2C8TYkR1GBmhn3u3VakMmBQb0ORPGeDnUBQpSBlSxznmxHw+FK4
	Xel0SLn9TcBhUSsTCzSm9flDX+U87P5PHIV38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LDrT1f+ut9uYl8y4X5eigEVDhXKrB7IzEO3unJxZhQVMf3DBRaX4Mgm1fzMHutVLMW
	CAa5h+tAO/ONaSzjuoaaHtMSB4Z+sWhAAIpxZrw7xwP2dr/Nj8BbVGwYnnd2+tAP0yQi
	1girkJjT/ujJDkQ/iKto1AAwcRGzDKuAzhktc=
MIME-Version: 1.0
Received: by 10.220.71.16 with SMTP id f16mr1493630vcj.139.1280530581422; Fri, 
	30 Jul 2010 15:56:21 -0700 (PDT)
Received: by 10.220.175.136 with HTTP; Fri, 30 Jul 2010 15:56:21 -0700 (PDT)
In-Reply-To: <BAY127-W10E6C2CDE8C1012D38BAE0D8A40@phx.gbl>
References: <BAY127-W10E6C2CDE8C1012D38BAE0D8A40@phx.gbl>
Date: Sat, 31 Jul 2010 00:56:21 +0200
Message-ID: <AANLkTi=jMitPBp8toXY0zJTWyVOJ0r48jKJq49N7E_uO@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kerniel issue on DM6446
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
X-List-Received-Date: Fri, 30 Jul 2010 22:57:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 24 July 2010 17:25, saleh usman <salehusman@hotmail.com> wrote:
>
> Till now I was using a kernel on Dm6446 which was =C2=A0cross compiled by=
 ELDK and rootfile system is =C2=A0OpenEmbedded generated . Now when I writ=
e Openembedded generated kernel to NAND flash it is not working and the log=
 messages and u-boot environment are shown below, Where might be the proble=
m.? Problem with ELDK compiled kernel was that it was not configured to be =
run OProfile.

[snip lots of boot messages]

> Root-NFS: No NFS server available, giving up.
> VFS: Unable to mount root fs via NFS, trying floppy.
> VFS: Cannot open root device "mt-" or unknown-block(2,0)
> Please append a correct "root=3D" boot option; here are the available par=
titions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block=
(2,0)

I think the bootargs are wrong as the kernel complains about 'Cannot
open root device "mt-" or unknown-block(2,0)'. Try changing U-Boot
bootargs to

setenv booargs mem=3D120M noinitrd console=3DttyS0,115200n8
root=3D/dev/mtdblock2 rootfstype=3Djffs2

(notice: no hyphen + linebreak in root=3D...)

Best regards,
Bj=C3=B8rn Forsman


