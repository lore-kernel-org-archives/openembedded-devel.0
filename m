Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MsO79-0001m6-4a
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 23:50:38 +0200
Received: by fg-out-1718.google.com with SMTP id e21so780468fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 14:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=06HqExBWdVkUjd8tjhmX+yOIYKF6u43UTZXxu0ogz3A=;
	b=HqFl0UbNjgKaRwtHMDnwyuxPzMRirtEWmRt2TbHK5CdrYu+Wab1FdkJIM5MR5SCq2g
	nRjD3DfxUTsADC6TcyjWXMKnARF1upzZx/Gf6RN273IlbkhPNeih0dVlZTBOZY31C+w9
	FH3KFXfUJTFVQeqhZiJX6/SrlwIaAxTId+zvA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=miSXpr2hOwRkY7Ou8kFf+F3SaJw2A2HCkScVuw1sExj7GBgLvq0N+/9jQOVdEZoKVZ
	mc7vqzjk9//7crcNUeSLC+9BDcrdRJQledtaqRC0Io7jIZorV8J2G/BnxoiCd1h6FuZE
	N5w7SQ16KGeYyCXRxW/eAwqVjXN2k8tXDbCes=
MIME-Version: 1.0
Received: by 10.239.183.32 with SMTP id s32mr287624hbg.170.1254174594505; Mon, 
	28 Sep 2009 14:49:54 -0700 (PDT)
In-Reply-To: <87zl8eok2w.wl%peter@chubb.wattle.id.au>
References: <c384c5ea0909281321k660c9ad5s154817574b54157@mail.gmail.com>
	<87zl8eok2w.wl%peter@chubb.wattle.id.au>
Date: Mon, 28 Sep 2009 23:49:54 +0200
Message-ID: <c384c5ea0909281449t2d40e28eod35e869d77713239@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x86->x86 GRUB bootable image in OE?
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
X-List-Received-Date: Mon, 28 Sep 2009 21:50:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Peter,

On Mon, Sep 28, 2009 at 11:06 PM, Peter Chubb <peter.chubb@nicta.com.au> wr=
ote:
>>>>>> "Leon" =3D=3D Leon Woestenberg <leon.woestenberg@gmail.com> writes:
>
> Leon> Hello, on x86 target support, I have some ideas how to create
> Leon> bootable disk images from OE using GRUB (not using the post
> Leon> image command approach).
>
> Leon> However, I suspect this will only work if we have GRUB on the
> Leon> host, i.e. assume a x86 host, and have grub-native.
>
> We tried this for our system. =A0You need to split grub into the
> grub-installer part and the grub part, and the way that grub 0.97
> works doesn't really fit nicely. =A0Grub 2 may be better.
>
> We ended up switching to syslinux which works nicely cross-platform.
>

It's good to know I could always bail out if it isn't going to work.

I think I have got grub working outside OE for this, I just need to
get things into OE.

Do you maybe still have any recipe that at least stages grub for the host?

Regards,
--=20
Leon


