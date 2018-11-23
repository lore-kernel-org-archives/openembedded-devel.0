Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 8A21D6C190
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:03:57 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 7076A1C1B29;
	Fri, 23 Nov 2018 11:03:58 +0100 (CET)
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
To: =?UTF-8?Q?Peter_Ba=c5=a1ista?= <pbasista@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20181118170442.14670-1-pbasista@gmail.com>
	<8d3cef96-99d2-a8ce-6eeb-213942b77047@geanix.com>
Message-ID: <dfb2174d-cc13-5ff1-1830-9d572cd61c3b@geanix.com>
Date: Fri, 23 Nov 2018 11:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <8d3cef96-99d2-a8ce-6eeb-213942b77047@geanix.com>
Subject: Re: [meta-multimedia][PATCH] Add a working tvheadend recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2018 10:03:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Sorry, I hadn't noticed PATCHv3 on the list when I wrote this.

// Martin

On 23/11/2018 10.58, Martin Hundebøll wrote:
> 
> 
> On 18/11/2018 18.04, Peter Bašista wrote:
>> The original one was previously removed
>> by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
>> as part of a clean-up of blacklisted recipes.
>>
>> Signed-off-by: Peter Bašista <pbasista@gmail.com>
>> ---
>>   .../recipes-dvb/tvheadend/tvheadend_git.bb    | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 
>> meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>>
>> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb 
>> b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> new file mode 100644
>> index 000000000..2a76d5d34
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> @@ -0,0 +1,37 @@
>> +SUMMARY = "Tvheadend: TV streaming server and recorder"
>> +HOMEPAGE = "https://tvheadend.org/"
>> +
>> +DEPENDS = "avahi cmake-native gettext-native libpcre2 libdvbcsa 
>> openssl zlib python-native"
>> +
>> +LICENSE = "GPLv3+"
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
>> +
>> +SRC_URI = "git://github.com/tvheadend/tvheadend.git"
>> +
>> +inherit gitpkgv
>> +SRCREV = "${AUTOREV}"
>> +PV = "4.3+git${SRCPV}"
>> +PKGV = "4.3+git${GITPKGV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +PACKAGECONFIG ?= ""
>> +PACKAGECONFIG[uriparser] = 
>> "--enable-uriparser,--disable-uriparser,uriparser"
>> +
>> +do_configure() {
>> +    ./configure ${PACKAGECONFIG_CONFARGS} \
>> +                --prefix=${prefix} \
>> +                --libdir=${libdir} \
>> +                --bindir=${bindir} \
>> +                --datadir=${datadir} \
>> +                --arch=${TARGET_ARCH} \
>> +                --disable-libav \
>> +                --disable-ffmpeg_static \
>> +                --disable-hdhomerun_static
>> +}
>> +
>> +do_install() {
>> +    oe_runmake install DESTDIR=${D}
>> +}
> 
> do_configure() and do_install() look pretty much like the ones from 
> autotools.bbclass. Wouldn't it be prettier to do:
> 
> inherit autotools
> 
> EXTRA_OECONF = "--disable-libav --disable-ffmpeg_static 
> --disable-hdhomerun_static"
> 
> do_compile[noexec] = "1"
> 
> ?
> 
> // Martin
> 
>> +
>> +FILES_${PN} += "${datadir}/${BPN}"
>>
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

