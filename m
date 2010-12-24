Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PW9XA-0002Gc-5u
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:26:20 +0100
Received: by ywi6 with SMTP id 6so3217128ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 07:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=E+CLyUHyIzHCcjTBSq9ayikyNV1+f4wMYDPGqe6MLhQ=;
	b=BphDdGlHCacMcsK4++1K80FztIFkOOgOvGecY2hVT8hMZ7rjH6FlSydDxXqIgKKBd9
	58m904aacAg9jCUS/212eEsFqA7elIqh3WPr2nPRv05JacFLJnVBogSN6SjuUxTu/vrE
	WCsLAQgw8sB5cuFDQ91GC6GiEscDJjm8St918=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=QHcnG2fvyIrGiJB3I1DMZE5GW11vwE6jdjRuqfdVKbyBHqyihm1nPPG3wW5pWc2FBY
	qncBzbsO539Cn4oUFR2vuAJ6Ec279GQgvLfqRFKY7URcbkub1cbQ/w6mnREmiXgJeZ3f
	pLqNJkOEi8hPpey/pmpHqtUJhkPw6JxxVzEeE=
Received: by 10.90.120.17 with SMTP id s17mr908446agc.193.1293204365897; Fri,
	24 Dec 2010 07:26:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 24 Dec 2010 07:25:45 -0800 (PST)
In-Reply-To: <4D14B770.3000601@eukrea.com>
References: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>
	<AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>
	<20101216154854.GB22134@gmail.com> <4D14B770.3000601@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Dec 2010 07:25:45 -0800
Message-ID: <AANLkTimyD4zL1eOcN2oKjhd2NWRV3VXD1vbei0WVR9Az@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2010-12-10
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
X-List-Received-Date: Fri, 24 Dec 2010 15:26:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2010 at 7:08 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi Khem,
>
> On 16/12/2010 16:48, Khem Raj wrote:
>>
>> On (16/12/10 08:55), Cliff Brake wrote:
>>>
>>> beagleboard beagleboard-linuxtag2010-demo-image is failing with:
>>>
>>> http://tinderbox.openembedded.net/packages/1321155/
>>>
>>> ti-c6accel
>>>
>>> Linking c6accel_app from appMain.o c6accel_testfxns.o
>>> ../c6accelw/lib/c6accelw_omap3530.a470MV
>>> c6accel_app_config/linker.cmd..
>>> /lib/libgcc_s.so.1: file not recognized: File format not recognized
>>
>>
>> Have you tried with latest .dev ? It might work with latest .dev
>> I have fixed libgcc install locations
>>
> I tested beagleboard-linuxtag2010-demo-image for machine beagleboard with
> today's master and it still fails with the following messages :
>
> Linking c6accel_app from appMain.o c6accel_testfxns.o
> ../c6accelw/lib/c6accelw_omap3530.a470MV c6accel_app_config/linker.cmd..
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/=
sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../=
../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: c6accel_app_config/linker.cmd contains output sections; did you
> forget -T?
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/=
sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../=
../../../arm-angstrom-linux-gnueabi/bin/ld:
> skipping incompatible /lib/libgcc_s.so.1 when searching for libgcc_s.so.1
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/=
sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../=
../../../arm-angstrom-linux-gnueabi/bin/ld:
> skipping incompatible /lib/libgcc_s.so.1 when searching for libgcc_s.so.1
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/=
sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../=
../../../arm-angstrom-linux-gnueabi/bin/ld:
> .gnu.attributes not found for insert
> collect2: ld returned 1 exit status
> make[2]: *** [c6accel_app] Error 1
>
> Do you have any idea on how to fix this ?

check how libgcc is specified on linker commandlne and what search
paths are given to ld

>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


