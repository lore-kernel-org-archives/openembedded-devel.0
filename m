Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Qedoe-0003WJ-7t
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 03:55:44 +0200
Received: by ewy5 with SMTP id 5so173728ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 18:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hJF1/+GsoSR6L9+Z/leIrznE55TRtqJFsuoUVYRGvBY=;
	b=SrXHABHdY4ByWZkHIsa0zRjF4VTy/F6ngrl4+wbC+u0sUJp0S3Xh8j+Fxl+y5b9UGD
	ZQ9aGUwgJiBR25LQcmAVWiorfWF+Ix/W61QeJJOk9xKho5eekZ3aXg2dRl1X6Cpz4RIw
	sE7dKkRGOFenDmJs8nv1rcHgU0rB4MxRcKedg=
MIME-Version: 1.0
Received: by 10.213.107.147 with SMTP id b19mr2052567ebp.7.1310003511733; Wed,
	06 Jul 2011 18:51:51 -0700 (PDT)
Received: by 10.213.31.141 with HTTP; Wed, 6 Jul 2011 18:51:51 -0700 (PDT)
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78EBC@nzc-ap-xch-02.ap.trimblecorp.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78E50@nzc-ap-xch-02.ap.trimblecorp.net>
	<CAE21AQpLShYH+82swduxQLWtpTGtTawuywbt2WxXHUTB5+9zDQ@mail.gmail.com>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04A78EBC@nzc-ap-xch-02.ap.trimblecorp.net>
Date: Thu, 7 Jul 2011 13:51:51 +1200
Message-ID: <CAE21AQq6YfPtuqxKfBs5cCGvBeO4ALk4d+_iZpZOpGZyBUNETw@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Debugging u-boot
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
X-List-Received-Date: Thu, 07 Jul 2011 01:55:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 1:13 PM, Bernard Mentink
<Bernard_Mentink@trimble.com> wrote:
> Hi Charles,
>
> Didn't know you were lurking on this list ... ;-)

You can run but you can't hide.

>
> I have built for the angstom distro (arm-angstrom-linux-gnueabi-*), but t=
he tools got put in my project path I described in my earlier email, but
> There was no GDB included for some reason ..

The regular toolchian than oe builds for its own purposes does not use
gdb because gdb is not needed for building. That toolchain is intended
for use within OE bitbakery only.

A meta-toolchain is built as a standalone toolchain intended for use
outside of OE (eg. if you pull u-boot to a standalone directory for
development purposes or want to do your own app development outside of
OE.)

>
> How do you build the meta-toolchain, and how will that help.


bitbake meta-toolchain.

This makes a toolchain which you can unpack thus:

$ cd /
$ sudo tar xvjf
${OETOP}/tmp/deploy/glibc/sdk/angstrom-2009.X-test-20110301-armv7a-linux-gn=
ueabi-toolchain.tar.bz2

[NB your toolchain name will be something different]


To set up all the paths etc use

. /usr/local/angstrom/arm/environment-setup

Google openembedded metatoolchain will also give some interesting info.

NB If you're building apps and need extra libraries you will need to
make your own SDK. That's a bit more effort and you don't need all
that just for gdbing u-boot

-- Charles

>
> Cheers,
> Bernie
>
>
> -------------------------------------------------------------------------=
-----------------
> I want to die peacefully in my sleep, like my grandfather, not screaming =
and yelling like the passengers in his car.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Charles Manning
> Sent: Thursday, 7 July 2011 12:38 p.m.
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Debugging u-boot
>
> Bernie
>
> What toolchain are you building?
>
> If you build meta-toolchain that should build all the stuff you can put i=
nto /usr/local/angstrom/arm/... which includes gdb.
>
> That should then work with a JTAG debugger etc.
>
> -- Charles
>
>
> On Thu, Jul 7, 2011 at 11:25 AM, Bernard Mentink <Bernard_Mentink@trimble=
.com> wrote:
>> Hi All,
>>
>> Can some one please tell me how to debug u-boot =A0on my target. I have
>> built u-boot for similar hardware and I want to debug with gdb, but
>> cannot even find the cross-compile version of gdb, It does not exist
>> in the directory "build/tmp/sysroots/i686-linux/usr/armv6/bin/" where
>> the other cross-compile tools live ..
>>
>> I want to execute "${CROSS_COMPILE}gdb u-boot"
>> =A0.. and breakpoint at some very early symbol ..... Some steps to
>> achieving this would be much appreciated ..
>>
>> Many Thanks,
>> Bernie
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


