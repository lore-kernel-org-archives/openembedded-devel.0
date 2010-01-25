Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NZOWd-0002Jx-JT
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 13:58:42 +0100
Received: by bwz26 with SMTP id 26so2643302bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 04:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dnsMgF3w+tXK2hMOMOyKV/P+VjsuiZCU9LGhbmPbtro=;
	b=LDONGtOyZS9u14E4eIpVAd21d7NbBfgxsKlR77LIrBTcDE2lj68DvJuw2/VCYBon/Q
	HM6nTQKZbUa6BG3oU1j1fRQGSou1A7H43b+Qxxp23RMEqZ7tI8qQgmLHa5s7qw4mibvN
	sYBt8erDcIbLJPNlJzW5b7PGJNN5aGV0nwtuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XiEwjxNnAskxxIIOWxe7n7aI1VRKoHwv5mrzHPn+AgoR8zyACU12BNe1DsVNRr/ocw
	v8mbZ1zshzRC80Obpk5BgaOB+vay1w2UVviOy5TOduaDt7SaxXwVWRePkCPoMdlQtXdO
	hEmTC6MtHDW/i0SULcx2lSh83VFbHKEIfdB7o=
MIME-Version: 1.0
Received: by 10.204.34.135 with SMTP id l7mr3774739bkd.57.1264424178551; Mon, 
	25 Jan 2010 04:56:18 -0800 (PST)
In-Reply-To: <70c9a9111001250434t784988d1t430800038ce6bc2d@mail.gmail.com>
References: <1264422161-15538-1-git-send-email-michael.lippautz@gmail.com>
	<70c9a9111001250434t784988d1t430800038ce6bc2d@mail.gmail.com>
Date: Mon, 25 Jan 2010 13:56:18 +0100
Message-ID: <fca63bcf1001250456w512da134yceddadb22257fbee@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libertas-firmware: Add recipe for libertas firmware.
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
X-List-Received-Date: Mon, 25 Jan 2010 12:58:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Damn...

My search for libertas failed, as nothing in this existing recipe indicates=
 it.

Ofc. I will use this then.

Regards,
Michael

2010/1/25 Enric Balletb=F2 i Serra <eballetbo@gmail.com>:
> Hello,
>
> I think similar recipe exist yet
> (recipes/firmwares/marvell-sdio-fw_9.70.3-p37.bb) so why not use this
> ?
>
> Regards,
>
> Enric
>
> 2010/1/25 Michael Lippautz <michael.lippautz@gmail.com>:
>> * Libertas firmware is used by kernel module libertas_sdio, which
>> =A0enables wifi on IGEPv2 boards.
>> ---
>> =A0.../libertas-firmware/libertas-firmware_9.70.3.bb =A0| =A0 18 +++++++=
+++++++++++
>> =A01 files changed, 18 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/libertas-firmware/libertas-firmware_9.70.3=
.bb
>>
>> diff --git a/recipes/libertas-firmware/libertas-firmware_9.70.3.bb b/rec=
ipes/libertas-firmware/libertas-firmware_9.70.3.bb
>> new file mode 100644
>> index 0000000..022115d
>> --- /dev/null
>> +++ b/recipes/libertas-firmware/libertas-firmware_9.70.3.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION =3D "Firmware for the libertas_sdio kernel module used by I=
GEPv2 board"
>> +LICENSE =3D "GPL"
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "http://extranet.marvell.com/drivers/files/SD-8686-LINUX26-=
SYSKT-9.70.3.p24-26409.P45-GPL.zip;name=3Dfirmware"
>> +SRC_URI[firmware.md5sum] =3D "f43e3f4d7fd913e3063309f4cdacc0f7"
>> +SRC_URI[firmware.sha256sum] =3D "b1f954d6beef91ad1713e6fe505fa7fe66fb6b=
bcb8e6d18cf700b4374cb358b8"
>> +
>> +S =3D "${WORKDIR}"
>> +
>> +do_install() {
>> + =A0 =A0tar -xvf ${S}/SD-8686-FEDORA26FC6-SYSKT-GPL-9.70.3.p24-26409.P4=
5.tar
>> + =A0 =A0install -d ${D}/${base_libdir}/firmware
>> + =A0 =A0install -m 0644 ${S}/FwImage/sd8686.bin ${D}/${base_libdir}/fir=
mware/
>> + =A0 =A0install -m 0644 ${S}/FwImage/helper_sd.bin ${D}/${base_libdir}/=
firmware/sd8686_helper.bin
>> +}
>> +
>> +FILES_${PN} =3D "${base_libdir}/firmware/*"
>> --
>> 1.6.4.4
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


