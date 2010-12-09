Received: from mail-ey0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris.spehn@gmail.com>) id 1PQlnX-00049p-W5
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 20:05:00 +0100
Received: by eyf5 with SMTP id 5so1746053eyf.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 11:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uJ3EAbHjUOM1lutPj85W/bJ3U1xc1N8TlpW1qDtq/Lw=;
	b=WHPIM0khiPj5VH1rFX4aOqgyLy4ZCBbMi+1ZXBj48gu9Gwy/PnMAD9zXQXlmWoQGtu
	9juyB2jXmL+BLqhBbvkjtTqc5BxNYCLVfsO3LmuSJ3i/hSFMhWqPv3yqpYzibDVygKB2
	7gNHeBsWDuV3UzZ0bMZ8f6Dsb8K4H7wl/1R7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=C9pXwAG85p6iHv7tDTQ21+LMk7vMX8lCOpYdvhmMH9hmtqUFu8CFu6hbVeA/dybz1a
	IMCYfgtyGb/GkIrHVue/MozPDeJYBHW7J9UWZEs2lWn/evqgnFbtCOriEBtf/FAKqZvd
	yjeq/S8t1QI6YtAQf4eRF5173GOjRhh9xclU8=
MIME-Version: 1.0
Received: by 10.213.8.138 with SMTP id h10mr171518ebh.76.1291921407443; Thu,
	09 Dec 2010 11:03:27 -0800 (PST)
Received: by 10.213.22.16 with HTTP; Thu, 9 Dec 2010 11:03:27 -0800 (PST)
In-Reply-To: <20101209143141.GB29826@excalibur.local>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
	<1291732373-17953-2-git-send-email-GNUtoo@no-log.org>
	<20101209143141.GB29826@excalibur.local>
Date: Thu, 9 Dec 2010 13:03:27 -0600
Message-ID: <AANLkTikt0-foWmGMM7dH78Ph9J3YhuN8+g8a-1L2-cop@mail.gmail.com>
From: Chris Spehn <chris.spehn@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.170
X-SA-Exim-Mail-From: chris.spehn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] Add initial support for iphone3g(machine config and kernel)
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
X-List-Received-Date: Thu, 09 Dec 2010 19:05:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The file system is currently emulated. We mount the loopback image
formatted as ext2 from the iOS partition. I think I misunderstood what
ext2 actually does in the machine configuration file. Although, in the
future the iDroid project plans to partition the NAND. When this will
get done, I have no idea. I could probably remove gps and bluetooth
from MACHINE_FEATURES as well since I have not implemented those
features yet.

On Thu, Dec 9, 2010 at 8:31 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Tue, 2010-12-07 at 15:32, Denis 'GNUtoo' Carikli wrote:
>> Android was ported to Apple's iDevices including the iPhone3G by the
>> iDroid Project ( http://www.idroidproject.org/wiki/Main_Page )
>> Their kernel is standard enough to be able to run GNU/Linux distribution=
s
>> =C2=A0 such as SHR
>>
>> Signed-off-by: Chris 'Lopi' Spehn <chris.spehn@gmail.com>
>> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>> ---
>> =C2=A0conf/machine/iphone3g.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 27 +
>> =C2=A0recipes/linux/linux-iphone/iphone3g/defconfig | 1570 +++++++++++++=
++++++++++++
>> =C2=A0recipes/linux/linux-iphone_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 15 +
>
> I usually split this up in twpo commits. One for the amchine file the oth=
er one
> for the kernel. No strong feelings on this though.
>
>> =C2=A03 files changed, 1612 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 conf/machine/iphone3g.conf
>> =C2=A0create mode 100755 recipes/linux/linux-iphone/iphone3g/defconfig
>> =C2=A0create mode 100644 recipes/linux/linux-iphone_git.bb
>>
>> diff --git a/conf/machine/iphone3g.conf b/conf/machine/iphone3g.conf
>> new file mode 100644
>> index 0000000..f2c3196
>> --- /dev/null
>> +++ b/conf/machine/iphone3g.conf
>> @@ -0,0 +1,27 @@
>> +#@TYPE: Machine
>> +#@NAME: iPhone3G
>> +#@DESCRIPTION: Machine configuration for the iPhone3G
>> +
>> +TARGET_ARCH =3D "arm"
>> +
>> +require conf/machine/include/tune-arm1176jzf-s.inc
>> +
>> +MACHINE_DISPLAY_WIDTH_PIXELS =3D "320"
>> +MACHINE_DISPLAY_HEIGHT_PIXELS =3D "480"
>> +MACHINE_DISPLAY_ORIENTATION =3D "0"
>> +
>> +MACHINE_FEATURES =3D "kernel26 touchscreen screen wifi ext2 phone gps u=
sbgadget bluetooth"
>
> For what do you need ext2 here? Is the project that far that it actually
> reflashes the device to run ext2 on the internal nand or does the iphone =
has a
> secret SD controller I don't know about? :)
>
> Machine and kernel recipes are looking good.
>
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


