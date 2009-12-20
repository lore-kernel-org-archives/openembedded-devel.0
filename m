Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMHhL-00029W-GN
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 10:03:34 +0100
Received: by iwn32 with SMTP id 32so2621532iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 01:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9jpeeWZylhaO0jj53iKD/ZknhY5+QgDLtUHSjIciQC8=;
	b=bpgWnue/jR+yiz3tie2MB4t5d2BgeP0ZNzAWuKbctaGDWrxR7X3dDJplqPV0eZ1khc
	FE7RqdwuS7EoJlaO9wP99eOoKpSb8XpGNDzjX2X5m6M+J0k6lBlOjWAtZpI9qFLHIOQN
	PjGssGuvopaysTUPLV/xuz2r41liAKB3CgucY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QSVxFj+Dq1T/VstFg0Cj5yQaHRDcsQKGxMqJ50r/42UvG7ka1rmV2lHpCqVylamKOo
	ldT+BgnW0LRVAubr1AVYeEtYt9V+EKGujFW20Qpmz5KGsyAPxNZwi0pOgAo8rkXvGdZp
	2Coh5Hskcim9p39voq9XgN9ZC/q74n769NNII=
MIME-Version: 1.0
Received: by 10.231.159.198 with SMTP id k6mr2024969ibx.54.1261299700861; Sun, 
	20 Dec 2009 01:01:40 -0800 (PST)
In-Reply-To: <200912200422.50437.holger+oe@freyther.de>
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
	<1261261596-19241-2-git-send-email-raj.khem@gmail.com>
	<200912200422.50437.holger+oe@freyther.de>
Date: Sun, 20 Dec 2009 01:01:40 -0800
Message-ID: <19c1b8a90912200101i4fa53a20q5f8f75c5e809827c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 3/3] minimal: Add 'mplt' to DISTRO_FEATURES.
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
X-List-Received-Date: Sun, 20 Dec 2009 09:03:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2009 at 7:22 PM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Saturday 19 December 2009 23:26:36 Khem Raj wrote:
>> * As minimal-uclibc includes minimal conf the
>> =C2=A0 distro features get inherited. mplt is not
>> =C2=A0 supported on uclibc yet. So we should disable
>> =C2=A0 it for uclibc/mips based distros.
>
>> =C2=A0require conf/distro/minimal.conf
>> +
>> +# FEATURE SELECTION
>> +#######################################################################=
###
>> ### +# We want images supporting the following features (for task-base)
>> =C2=A0+DISTRO_FEATURES =3D "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usb=
gadget
>> =C2=A0usbhost pci" +# Following features are for ARM and E500 based mach=
ines
>> +DISTRO_FEATURES +=3D "eabi"
>
> maybe you want to use the oe filterout thing?

I tried to use oe_filter_out but I did not succeed, I guess distro
conf files are too early for in place evaluation
and if I had to do lazy evaluation then it has to be done somewhere
later which I did not know what it could be

any ideas ?

Thanks

-Khem


