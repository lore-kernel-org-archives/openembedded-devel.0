Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlV0H-00078z-VC
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 00:51:38 +0200
Received: by ewy7 with SMTP id 7so3532363ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 15:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NDBYRxkqhBlfYBbpWoO6MxwRzzLRNyBGuAbihNjZprk=;
	b=QPvWXUFheKAwW8LB8StkhMkG4vQiRH8/10+/VcFeLnsBta8wdeBP7i7KRdtei4MCES
	blbhAYMw8JrHXR14hBPo2VS+4JnAY311zNDhcROD+0BOB79+AefhezgB1bFEDNBSdyMc
	bD54LDJzhGNShrDRIv+Pm7/EnhPZgT7vL4Djs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cxUlT/tr9WR3OGXNRJNKP61FjAOnGeGBscCiOEP+I90PT2fzotahMRcF9+TOKjEbPb
	3NsSyrPajcurKjb5RKKOEhkOVClchnSX1DQRKZkhx2AYU6kttV7nFCMXjP317RYbKHdC
	QwCrBvjPrXPH1n+g0vwmqFYH1MXchF0kUCUfI=
Received: by 10.213.17.7 with SMTP id q7mr6601557eba.23.1282085477134; Tue, 17
	Aug 2010 15:51:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Tue, 17 Aug 2010 15:50:56 -0700 (PDT)
In-Reply-To: <1282030248.3641.19.camel@mattotaupa>
References: <1281861970.3854.14.camel@mattotaupa>
	<1281897933.3693.41.camel@mattotaupa>
	<1282030248.3641.19.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Aug 2010 15:50:56 -0700
Message-ID: <AANLkTimm+Y2A_kvu-Et3t7Hfthg4fGLLmMHcMEh_Q8-j@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: evince_2.30.0.bb: Problem with new style staging?
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
X-List-Received-Date: Tue, 17 Aug 2010 22:51:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2010 at 12:30 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 15.08.2010, 20:45 +0200 schrieb Paul Menzel:
>> Am Sonntag, den 15.08.2010, 10:46 +0200 schrieb Paul Menzel:
>>
>> > I set up a basic build host with no GNOME installed and did `bitbake
>> > beagleboard-demo-image` with the standard local.conf provided by
>> > =C8=A6ngstr=C3=B6m and org.openembedded.dev.
>> >
>> > Compile is failing because it is looking for a file on the build hosts
>> > environment (and not stagang(?)).
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 xsltproc -o evince-C.omf --stringparam db2=
omf.basename evince --stringparam db2omf.format 'docbook' --stringparam db2=
omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang C =
--stringparam db2omf.omf_dir "/usr/share/omf" --stringparam db2omf.help_dir=
 "/usr/share/gnome/help" --stringparam db2omf.omf_in "/home/paul/oe/build/a=
ngstrom-dev/work/armv7a-angstrom-linux-gnueabi/evince-2.30.0-r1/evince-2.30=
.0/help/evince.omf.in" =C2=A0`/home/paul/oe/build/angstrom-dev/sysroots/i68=
6-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils` C/evince.xml =
|| { rm -f "evince-C.omf"; exit 1; }
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 warning: failed to load external entity "/=
usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 cannot parse /usr/share/xml/gnome/xslt/doc=
book/omf/db2omf.xsl
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 make[2]: *** [evince-C.omf] Error 1
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 make[2]: Leaving directory `/home/paul/oe/=
build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/evince-2.30.0-r1/evin=
ce-2.30.0/help'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 make[1]: *** [all-recursive] Error 1
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 make[1]: Leaving directory `/home/paul/oe/=
build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/evince-2.30.0-r1/evin=
ce-2.30.0'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 make: *** [all] Error 2
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 FATAL: oe_runmake failed
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR: Function do_compile failed
>> >
>> > The call of `xsltproc` seems to point to the wrong location. Does anyo=
ne
>> > know how to fix this error besides installing those files on the build
>> > host?
>>
>> Judging from `run.do_compile.6321` `PKG_CONFIG_PATH` gets set
>> incorrectly.
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 export PKG_CONFIG_PATH=3D"/oe/build/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig:/oe/build/ang=
strom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/pkgconfig"
>>
>> I checked `gnome-doc-utils.pc` in these directories and both point to
>> `/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl`, which is incorrect
>> (`datadir=3D/usr/share`)
>>
>> In the staging(?) path
>> `/oe/build/angstrom-dev/sysroots/i686-linux/usr/lib/pkgconfig/`
>> everything is set up correctly.
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 datadir=3D/oe/build/angstrom-dev/sysroots/i6=
86-linux/usr/share
>>
>> Also running
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /oe/build/angstrom-dev/sysroots/i686-linux/u=
sr/bin/pkg-config --variable db2omf gnome-doc-utils
>>
>> in a clean environment without exporting `PKG_CONFIG_PATH` works.
>>
>> Is this a problem with new style staging? Could you please provide a
>> hint on how to fix this.
>
> I am stuck. Could someone take a look at this please and give me a hint
> on how to proceed? (I know the week just started.)
>
>

I fixed it. Update evince and see if it builds for you now.

> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


