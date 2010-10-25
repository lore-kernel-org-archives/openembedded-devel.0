Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PARTK-0006UD-57
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 20:08:41 +0200
Received: by gxk22 with SMTP id 22so2366958gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=FNXWzTa4tbBDbyDh4WCWFnglmSl0nSG1/Y5alAbmplw=;
	b=Y86yakw3ilVFEr3gzd2GXufNW6fIsABAz/eC7pcUW2PeHjHWVpcBrGAVIr2PI9/5xZ
	1bGwOGsFf2t/kod6uhrBlUyozeUazA0K3kcMfoN8029Ko9fA4AEZD29WAaZ0S4syDzxQ
	iCMIgoWGj9xeY0maqIW6TebSRf0fnhzaOmRdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=dKD1IbpoH4Vb92V9gOP2fRTM026cfoj04z22ZsQCn3hZ9GGD2RZxc1IAcWImYfeiCF
	9VsBWB1IhN2x0FHLiT8EkFrwpG+OhDV9YKec+GQnlW5VwEixk1CLKsuGxmpkx/kJPCV2
	TffL8Vky5N85qG/pkpoQ0k8Br+mEzxHxYmZuM=
MIME-Version: 1.0
Received: by 10.42.12.129 with SMTP id y1mr1451685icy.185.1288030076125; Mon,
	25 Oct 2010 11:07:56 -0700 (PDT)
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 11:07:56 -0700 (PDT)
In-Reply-To: <1287998693.3793.30.camel@mattotaupa>
References: <1287998693.3793.30.camel@mattotaupa>
Date: Mon, 25 Oct 2010 11:07:56 -0700
Message-ID: <AANLkTi=CQtr4Ubg2JothivG=GR99RkztCn8FHgOG6kYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xdelta_3.0z.bb: `QA Issue with xdelta: No GNU_HASH in the elf binary`
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
X-List-Received-Date: Mon, 25 Oct 2010 18:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/25/10, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> Dear Michael,
>
>
> `xdelta_3.0z.bb` you committed in 117024 [1] fails with the following
> error when building it wtih `angstrom-2008.1` for `MACHINE =3D
> "beagleboard"`.
>
>         $ more
> angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xdelta-3.0z-r0/temp/log.d=
o_package*
>         ::::::::::::::
>
> angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xdelta-3.0z-r0/temp/log.d=
o_package.1558
>         ::::::::::::::
>         ERROR: QA Issue with xdelta: No GNU_HASH in the elf binary:
> '/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xdelta-3.0z-r0=
/packages-split/xdelta/usr/bin/xdelta
>         3'
>         FATAL: QA run found fatal errors. Please consider fixing them.
>         ERROR: Error in executing python function in:
> /oe/openembedded/recipes/xdelta/xdelta_3.0z.bb
>         ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>         ERROR: Printing the environment of the function
>         ERROR: Function do_package_qa failed
>
> There is no mention in the commit message, what distribution and machine
> you tested this recipe with.
>
> =C8=A6ngstr=C3=B6m includes `insane.bbclass` [2][3] and therefore breaks.
>
> Could you please look into this.
>

easier fix is to add TARGET_CC_ARCH +=3D "${LDFLAGS}" to the concerning .bb

>
> Thanks,
>
> Paul
>
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D117024cef=
a6d38753e3094b964b077aa7c0ce17f
> [2]
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/distro/inclu=
de/angstrom.inc?id=3D117024cefa6d38753e3094b964b077aa7c0ce17f#n88
> [3]
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/insane.bb=
class?h=3D117024cefa6d38753e3094b964b077aa7c0ce17f#n273
>


--=20
-Khem


