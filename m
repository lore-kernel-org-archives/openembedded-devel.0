Received: from mail-iw0-f183.google.com ([209.85.223.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NeJSz-0000Jm-2T
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 03:35:16 +0100
Received: by iwn13 with SMTP id 13so4532497iwn.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 18:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bUcqTsPreRAnWyfRfUORmU+N44fyUeyBm4CR+ILzTfE=;
	b=D3ZCV998ECo9obeKBBrlA7K8csOuLhQ4zyA2eNDntNnxY8yxABAZsOzbwucRYbMt5B
	vVH8a4CyVFUGVijhfVZesNTeMytqQbbOfdti+9qzCabL7pwg3YLx6dc0K7yd3ZJPnJ68
	PXZtsXVRoft16APu04YKg4kbzdOLbS/bI7MTo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Go1AEra2YtegJ2TNRzDmCv/kxMUlyvF360uPHz0TIijmJvdGd7kpd2qNQJCbGKBsvm
	6dAUDE8Vm24VHklkyHlqmU25wU7yYlc8SS5PGvo1Z4J3T7LELn5keO/u5N9Y1EvoZSJa
	aT89lhrUaTHEBPJYn6ulIVLkK3MQr80KZ026k=
MIME-Version: 1.0
Received: by 10.231.150.142 with SMTP id y14mr2926893ibv.32.1265596360797; 
	Sun, 07 Feb 2010 18:32:40 -0800 (PST)
In-Reply-To: <4B6F3274.2010508@theforce.com.au>
References: <4B6B4EBC.1030906@theforce.com.au>
	<1265356132.3907.12.camel@mattotaupa>
	<4B6F3274.2010508@theforce.com.au>
Date: Sun, 7 Feb 2010 18:32:40 -0800
Message-ID: <19c1b8a91002071832u5d5c3efcxf5bc2a572cfb1e1a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.183
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mtr
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
X-List-Received-Date: Mon, 08 Feb 2010 02:35:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 7, 2010 at 1:36 PM, Grahame Jordan <gbj@theforce.com.au> wrote:
> =A0 Hi Paul,
>
> Cannot bitbake mtr. It is set to PV=3D0.65.
>
>
> can you please post the error message and the log files?
>
>
>
> =A0 | checking for floor in -lm... yes
> =A0 | checking for socket... yes
> =A0 | checking for gethostbyname... yes
> =A0 | checking for seteuid... yes
> =A0 | checking for res_mkquery... no
> =A0 | checking for res_mkquery in -lbind... no
> =A0 | checking for res_mkquery in -lresolv... no
> =A0 | configure: error: No resolver library found

are you using uclibc ? if yes then you can get along this error by adding
UCLIBC_HAS_LIBRESOLV_STUB=3Dy to uClibc.distro file. If its glibc/eglibc th=
en
there should be some issue with the configure test of mtr.

Thx

-Khem


> =A0 org.openembedded.dev/conf/distro/include/preferred-om-2008-versions.i=
nc
> =A0 Thanks
> =A0 Grahame
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


