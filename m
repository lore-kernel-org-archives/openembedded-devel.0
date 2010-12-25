Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWaHj-0004Cc-A0
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 21:00:11 +0100
Received: by pwi8 with SMTP id 8so781781pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=ttKkWUL5PwBmbBsQogSQTmGFdkniey6reoLqF9e3SrI=;
	b=npn1aebdzKXW/A4TXmS4EbR79qq5CMbM7hayYBCaM7ojmX0Udq4QzngGTiixqkbGxw
	2pOwqrarsgAU69NzUiRkiH3zWwumMA8Dj9cUu9ZJsCxv9ZQMd4bqDCoAV2/9Bee0mIhb
	CAAyJxX7LwTW2+sjcfmYAUN9nMfs+a/Vp01ic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=N64rNcESQaqDwvooz3CNTEkaMr9AikstS0gCy3qPeaFUAQncUYKKZeXT7C/JsX4ZAQ
	0r8R8gzksCDekhBEGvJw2lUSceP+JXLCHZt2g1AHEMO0uFqS+Ol/ZRiZc6a5xISaCEsD
	Pzsn8xl0WlPqcc0or1p/O/I0ECTBy+kcZ67oQ=
Received: by 10.142.226.4 with SMTP id y4mr8575303wfg.8.1293307186536;
	Sat, 25 Dec 2010 11:59:46 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y42sm14604675wfd.22.2010.12.25.11.59.45
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 11:59:45 -0800 (PST)
Message-ID: <4D164D30.3080301@gmail.com>
Date: Sat, 25 Dec 2010 11:59:44 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>	<AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>	<20101216154854.GB22134@gmail.com>	<4D14B770.3000601@eukrea.com>	<if2l7k$6v8$1@dough.gmane.org>	<4D163892.4070205@eukrea.com>
	<4D163B57.8040808@eukrea.com>
In-Reply-To: <4D163B57.8040808@eukrea.com>
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
X-List-Received-Date: Sat, 25 Dec 2010 20:00:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/25/2010 10:43 AM, Eric Bénard wrote:
> On 25/12/2010 19:31, Eric Bénard wrote:
>> On 24/12/2010 18:28, Koen Kooi wrote:
>>> That looks like the xdctools linkerscript problem we had before. Maybe
>>> an xdc .clean and xdc .make would help.
>>>
>> thanks, will try this.
>>
>> other problem found with ti-dmai_svn during the same build :
>> cc1: warnings being treated as errors
>> In file included from
>> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/beagleboard-angstrom-linux-gnueabi/kernel/include/linux/videodev2.h:66:0,
>>
>>
>> from linux/Capture.c:43:
>> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/beagleboard-angstrom-linux-gnueabi/kernel/include/linux/types.h:13:2:
>>
>> error: #warning "Attempt to use kernel headers from user space, see
>> http://kernelnewbies.org/KernelHeaders"
>> make[1]: *** [obj/linux/Capture.omap3530.o470MV] Error 1
>>
> and removing -Werror to workaround this issue leads to a link error :
>
> Linking linux/audio_decode1_omap3530.x470MV from appMain.omap3530.o470MV
> linux/main.omap3530.o470MV linux/audio_decode1_oma
> p3530_config/linker.cmd..
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc
> -lpthread -lm
> -L/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> -lasound -Wl,-Map,linux/audio_decode1_omap3530.x470MV.map -o
> linux/audio_decode1_omap3530.x470MV appMain.omap3530.o470MV
> linux/main.omap3530.o470MV
> linux/audio_decode1_omap3530_config/linker.cmd/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: linux/audio_decode1_omap3530_config/linker.cmd contains output
> sections; did you forget -T?
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> .gnu.attributes not found for insert

it seems like linker scripts for this need some scrutiny. How can I 
reproduce this problem.

-Khem


