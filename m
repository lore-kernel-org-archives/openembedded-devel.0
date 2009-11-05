Received: from [195.77.234.26] (helo=pegasus.cirsa.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=jorgefm=553f55816@cirsa.com>)
	id 1N5xBo-0003rO-Us for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 08:55:32 +0100
X-IronPort-AV: E=Sophos;i="4.44,685,1249250400"; 
   d="scan'208";a="3775892"
Received: from unknown (HELO NTCASA.central.cirsa.com) ([172.17.102.9])
	by pegasus.cirsa.com with ESMTP; 05 Nov 2009 08:54:15 +0100
Received: from ntdes2.central.cirsa.com (172.17.102.2) by
	NTCASA.central.cirsa.com (172.17.102.9) with Microsoft SMTP Server id
	8.2.176.0; Thu, 5 Nov 2009 08:54:15 +0100
In-Reply-To: <19c1b8a90911041015x52a6f139w5d243eec57b63b80@mail.gmail.com>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: Lotus Notes Release 6.5.3 September 14, 2004
Message-ID: <OFD304A523.BBE570B9-ONC1257665.002B2A2A-C1257665.002B8252@cirsa.com>
From: jorge fernandez monteagudo <jorgefm@cirsa.com>
Date: Thu, 5 Nov 2009 08:54:12 +0100
X-MIMETrack: Serialize by Router on ntdes2/DESAR(Release 8.0.2|August 07,
	2008) at 05/11/2009 08:54:12,
	Serialize complete at 05/11/2009 08:54:12
X-SA-Exim-Connect-IP: 195.77.234.26
X-SA-Exim-Mail-From: prvs=jorgefm=553f55816@cirsa.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problems building binutils-cross_2.18.50.0.7.bb
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
X-List-Received-Date: Thu, 05 Nov 2009 07:55:32 -0000
Content-Type: text/plain; charset="US-ASCII"

> 
> what version of gcc is installed on your build box ? My guess is that
> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
> is causing trouble for you in the CFLAGS. IIRC there was some issue
> with gcc 4.2 where isystem mucked with compiler defaults and it did
> not search the default include paths correctly.  You can build a local
> version of different gcc (say gcc 4.4) on your build box and install
> it and use to compile the cross and native packages.
> 
> Thanks
> 
> -Khem
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Yes, you're right. My gcc version is

$ gcc --version
gcc (GCC) 4.2.2 20071128 (prerelease) (4.2.2-3.1mdv2008.0)
Copyright (C) 2007 Free Software Foundation, Inc.

Is there some way to solve this without installing a new gcc ?

Thanks!
Jorge
From gcho-openembedded-devel@m.gmane.org Thu Nov 05 09:09:25 2009
Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N5xPG-0005pU-OL for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 09:09:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N5xO3-0003Ci-91
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 09:08:07 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 09:08:07 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 09:08:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Nov 2009 09:07:47 +0100
Lines: 79
Message-ID: <hcu14j$odu$1@ger.gmane.org>
References: <1257337925-46801-1-git-send-email-koen@dominion.thruhere.net>
	<20091105055944.GE30116@denix.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <20091105055944.GE30116@denix.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe] [STABLE][PATCH 1/3] clutter.inc: rework armv7a machines a
 bit and add omap3517-evm to compatible machines
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
X-List-Received-Date: Thu, 05 Nov 2009 08:09:26 -0000

On 05-11-09 06:59, Denys Dmytriyenko wrote:
> On Wed, Nov 04, 2009 at 01:32:03PM +0100, Koen Kooi wrote:
>> From: Koen Kooi<koen@openembedded.org>
>>
>> Signed-off-by: Koen Kooi<k-kooi@ti.com>
>
> Is it a correct assumption that all armv7a machines will be OMAP3-based with
> GLES? :)

No :)

> Would SOC_FEATURES fit here better?

Yes, I hope to have some time next week to come up with a implementation.

regards,

Koen


> Acked-by: Denys Dmytriyenko<denis@denix.org>
>
>>
>> ---
>>   recipes/clutter/clutter.inc |   18 +++++-------------
>>   1 files changed, 5 insertions(+), 13 deletions(-)
>>
>> diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
>> index e900c43..7bce3e2 100644
>> --- a/recipes/clutter/clutter.inc
>> +++ b/recipes/clutter/clutter.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "Clutter graphics library"
>>   HOMEPAGE = "http://www.clutter-project.org/"
>>   LICENSE = "LGPL"
>>
>> -COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|beagleboard|overo|omap3evm)"
>> +COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|omap3517-evm|beagleboard|overo|omap3evm)"
>>
>>   STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
>>   BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
>> @@ -20,6 +20,10 @@ EXTRA_OECONF_mx31litekit = "${BASE_CONF} --with-flavour=eglnative"
>>   PACKAGE_ARCH_mx31litekit = "${MACHINE_ARCH}"
>>   LDFLAGS_append_mx31litekit = " -lpvrNULLWSEGL -lstdc++ "
>>
>> +DEPENDS_armv7a = "${STDDEPENDS} libgles-omap3 tslib"
>> +EXTRA_OECONF_armv7a = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
>> +PACKAGE_ARCH_armv7a = "${MACHINE_ARCH}"
>> +
>>   DEPENDS_omap-3430ldp = "${STDDEPENDS} libgles-omap3 tslib"
>>   EXTRA_OECONF_omap-3430ldp = "${BASE_CONF} --with-flavour=eglx"
>>   PACKAGE_ARCH_omap-3430ldp = "${MACHINE_ARCH}"
>> @@ -28,18 +32,6 @@ DEPENDS_omap-3430sdp = "${STDDEPENDS} libgles-omap3 tslib"
>>   EXTRA_OECONF_omap-3430sdp = "${BASE_CONF} --with-flavour=eglx"
>>   PACKAGE_ARCH_omap-3430sdp = "${MACHINE_ARCH}"
>>
>> -DEPENDS_beagleboard = "${STDDEPENDS} libgles-omap3 tslib"
>> -EXTRA_OECONF_beagleboard = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
>> -PACKAGE_ARCH_beagleboard = "${MACHINE_ARCH}"
>> -
>> -DEPENDS_omap3evm = "${STDDEPENDS} libgles-omap3 tslib"
>> -EXTRA_OECONF_omap3evm = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
>> -PACKAGE_ARCH_omap3evm = "${MACHINE_ARCH}"
>> -
>> -DEPENDS_overo = "${STDDEPENDS} libgles-omap3 tslib"
>> -EXTRA_OECONF_overo = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
>> -PACKAGE_ARCH_overo = "${MACHINE_ARCH}"
>> -
>>   DEPENDS_mx31ads = "${STDDEPENDS} libgles-mx31 tslib"
>>   EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
>>   PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
>> --
>> 1.6.1
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




