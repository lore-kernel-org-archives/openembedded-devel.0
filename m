Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbapD-0007bD-H2
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 19:12:15 +0200
Received: by eaal1 with SMTP id l1so1249827eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=XqOZ1JqGwwg7gA26BgXOIB95qdXjrVutqVKHTN+j3EY=;
	b=oACgQc/YScajz59mrai3BYjdi5NyGJMPClobybVu25rTbFbz12YsvoL7tOEgjp299Y
	lhX40yE15vQrVrwb2GAengMX5skh7qDjhSdoR427XXyl9NPm5LkO7b783UWn1zQ5LnuK
	Ka5IBjCIDVykzjFuGjbLVupzCHOaPMOvWC0cbAeggMQqiV8M0ykZjg4W7L50Geq573MS
	/jmxtkrm+G8IJtDTiNLo5Ycf2RPNiafpML1UmlqyUs+5+AvQut9BI4jV7xDk/hk/o/tw
	Pr7CkVKui9kUgGMaWXx2X2B6DH8YKPn/qpSL8s9y0rrDAdJLVfIIgr/orduNWxXPBqAW
	nZ8g==
Received: by 10.14.97.135 with SMTP id t7mr5432643eef.177.1338829310673; Mon,
	04 Jun 2012 10:01:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Mon, 4 Jun 2012 10:01:20 -0700 (PDT)
In-Reply-To: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
References: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 10:01:20 -0700
Message-ID: <CAMKF1srC1uxpT1+Z_LqRUagFhxStZb30ZU10wrRtAReSSR7_zg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Understanding what qemuppc emulates and getting it to emulate a ppc440 CPU
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
X-List-Received-Date: Mon, 04 Jun 2012 17:12:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 2:07 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote=
:
> Hi,
> =C2=A0 =C2=A0 =C2=A0I'd like some help understanding what qemuppc emulate=
s, while building the using yocto core-image-sato.
>
> I've originally built my yocto images for a virtex5 machine, and would li=
ke to test it on an emulator. The Virtex-5 FXT processor is an FPGA which c=
ontains an embedded =C2=A0PowerPC440 CPU
>
> Now if I specify machine=3Dqemuppc, wouldn't that just be generic PowerPC=
 CPU?
>
> There are so many ppc CPU variants, like ppc405, ppc440, ppc603e, etc.
>
> Can the yocto build environment be modified so that the qemuppc emulator =
emulates at least the ppc440 CPU subset?


default emulation is using mac99 I think which is ppc7xx IIRC
>
> Best regards,
>
> Elvis Dowson
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


