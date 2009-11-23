Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NCWap-0008UK-FX
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 11:56:30 +0100
Received: by pwj11 with SMTP id 11so3362343pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 02:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=yWnzvw7mgm8/nv6OZksFyn/WzyQ6sJGqNLhnEAnXRUk=;
	b=lRyflmrtTDrP/ZLfcTVoVAEH098ZYSsad+AGsPjOoqBx4u2YNVRWK0sXyQeKdsG07Y
	w6xutoqZCKMR2RH+rLuB+8DAia5vn9WgcuCNE717XRb4++LLSN59f4+x7R20LW2Uydax
	URTa20fXX01ngFiK21Hq0JhYaYOMRn9cKo2Lo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=o3EY+gUtx6qWY9n/OB7dRW2rd4urp3P4XasqPrmiurLMBzmRc+4n1J8eqjCwhiP3SO
	CM6NueyzIpkyzThnfHBleFqfBlzRo1+5BnbmW91wdKc3ndwxRtgijzKbOa0xBWJijGjr
	iky8e01IBlPvJ+ZZ9PwQcGTbkRy+pkO/9WRnY=
MIME-Version: 1.0
Received: by 10.140.158.8 with SMTP id g8mr247747rve.157.1258973698607; Mon, 
	23 Nov 2009 02:54:58 -0800 (PST)
In-Reply-To: <hedg4o$hn9$1@ger.gmane.org>
References: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
	<hedg4o$hn9$1@ger.gmane.org>
Date: Mon, 23 Nov 2009 16:24:58 +0530
Message-ID: <ec1f3d400911230254g51d95762y72147461ea5ea8e5@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Mon, 23 Nov 2009 10:56:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Koen. Falling back to default Angstrom distro triggers this error -

**************************
| echo |
/home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
-march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
-isystem/home/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-B/home/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/
-B/home/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/lib/ -isystem
/home/raghu/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/include
-isystem
/home/raghu/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/sys-include -E
-dM - | \
|         sed -n -e 's/^#define \([^_][a-zA-Z0-9_]*\).*/\1/p' \
|                -e 's/^#define \(_[^_A-Z][a-zA-Z0-9_]*\).*/\1/p' | \
|         sort -u > tmp-macro_list
| *cc1: error: bad value (cortex-a9) for -mtune= switch
*| /bin/sh
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r7.1/gcc-4.3.3/gcc/../move-if-change
tmp-macro_list macro_list
************
I have removed gcc specific variables from my local.conf, so they must be
getting picked up from the distro conf file.

Is cortex-a9 not yet supported by the default Angstrom toolchain or am i
missing something ?

--RK


On Mon, Nov 23, 2009 at 1:42 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> On 23-11-09 07:14, RK Raggit wrote:
>
>> Hi,
>>
>> I am adding support for a cortex-a9 based machine but the build fails at
>> gcc
>> with this error -
>>
>> ****************
>> |
>>
>> /home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.4-r9.1/gcc-4.2.4/gcc/crtstuff.c:1:
>> error: bad value (cortex-a9) for -mtune= switch
>>
>
> Gcc 4.2.4 doesn't support armv7
>
>
>
> gcc variables in my local.conf read thus -
>>
>> PREFERRED_VERSION_gcc                    = "4.2.4"
>> PREFERRED_VERSION_gcc-cross              = "csl-arm-2008q1"
>> PREFERRED_VERSION_gcc-cross-initial      = "csl-arm-2008q1"
>> PREFERRED_VERSION_gcc-cross-intermediate = "csl-arm-2008q1"
>>
>
> Don't use CSL toolchains, they are waaaay to broken, especially 2008qX:
> http://hardwarebug.org/2008/11/28/codesourcery-fails-again/
> Stick with the default toolchain angstrom is using, it is tested on real
> hardware (CS only tests inside qemu) and is know to work well
>
> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

