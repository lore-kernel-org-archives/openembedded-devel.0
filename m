Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q8kQR-0003uT-3l
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 04:30:55 +0200
Received: by pvc30 with SMTP id 30so1710272pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2011 19:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7mA7VYD0giTH5TEUBudirwu5Glxwuv3URLzpz6209vY=;
	b=ZgfroqQUNwYKYl8J3jvizffxnbwRgnaJpzOPnOnHPfed2e2G/Az0eWRICwtf4Tx04z
	BIMwO3N5qd4jXwfl94bqpLJT0h/286JoRDIUYtX7DqsozZFj2WLCfh+NDpKt4EqTdBfX
	Fs62OVA1CnxJjjlndWTIvBK4GEoUFFGzTSoW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Xvs6LuJTDCVE6GjVD8NvW+FTo1YvyADxdTKN/I32heb0p9793yQ/NIPmDWEzHZaDIE
	i/RF29AfexN9W0l1YqDVJzCeWWIcFlbHcomJqd+tdhhwybXE5Ba3d3HRvzXbnqtyB6Op
	Y0F8aKZCqD2gI92tS6GKjDMPlGCyWX3fF8ONQ=
Received: by 10.142.173.5 with SMTP id v5mr3557460wfe.66.1302402522842;
	Sat, 09 Apr 2011 19:28:42 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w32sm6017020wfh.7.2011.04.09.19.28.40
	(version=SSLv3 cipher=OTHER); Sat, 09 Apr 2011 19:28:41 -0700 (PDT)
Message-ID: <4DA115DB.1000209@gmail.com>
Date: Sat, 09 Apr 2011 19:28:43 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BANLkTimy1b_JM5zx9EYJddfEqk4MYWZ2Pg@mail.gmail.com>
	<BANLkTimD2hxAA-nQPGFzUhXtJLzVXui1Jg@mail.gmail.com>
In-Reply-To: <BANLkTimD2hxAA-nQPGFzUhXtJLzVXui1Jg@mail.gmail.com>
Subject: Re: ESE Key Daemon 1.2.4: FTBFS with gcc-4.5
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
X-List-Received-Date: Sun, 10 Apr 2011 02:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 4/6/2011 4:34 AM, Luís Filipe Salé Borlido wrote:
> Hi!
>
> I was compiling a new image for mini2440  that contains esekeyd and I got an
> error:
>
> NOTE: Running task 2457 of 4369 (ID: 199,
> /opt/OpenEmbedded/openembedded/recipes/esekeyd/esekeyd_1.2.4.bb, do_compile)
> NOTE: package esekeyd-1.2.4-r0: task do_compile: Started
> ERROR: Logfile of failure stored in:
> /opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.4-r0/temp/log.do_compile.11553
> Log data follows:
> | + do_compile
> | + base_do_compile
> | + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
> | + oe_runmake
> | + oenote make
> | + echo NOTE: make
> | NOTE: make
> | + make
> | make  all-recursive
> | make[1]: Entering directory
> `/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.4-r0/esekeyd-1.2.4'
> | Making all in src
> | make[2]: Entering directory
> `/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.4-r0/esekeyd-1.2.4/src'
> | arm-angstrom-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
> -mthumb-interwork -mno-thumb
> --sysroot=/opt/OpenEmbedded/build/tmp/sysroots/armv4t-angstrom-linux-gnueabi
> -DHAVE_CONFIG_H -I. -I..     -fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2 -ggdb2 -MT keytest.o -MD -MP -MF .deps/keytest.Tpo -c
> -o keytest.o keytest.c
> | keytest.c: In function 'main':
> *| keytest.c:55:3: error: variable-sized object may not be initialized*
> | make[2]: *** [keytest.o] Error 1
> | make[2]: Leaving directory
> `/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.4-r0/esekeyd-1.2.4/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.4-r0/esekeyd-1.2.4'
> | make: *** [all] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> NOTE: package esekeyd-1.2.4-r0: task do_compile: Failed
> ERROR: Function 'do_compile' failed (see
> /opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.4-r0/temp/log.do_compile.11553
> for further information)
> ERROR: Task 199 (/opt/OpenEmbedded/openembedded/recipes/esekeyd/
> esekeyd_1.2.4.bb, do_compile) failed with exit code '1'
> ERROR: '/opt/OpenEmbedded/openembedded/recipes/esekeyd/esekeyd_1.2.4.bb'
> failed
>
> In one of the Debian bug reports (
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=564981), they seem to say
> that the package cannot be built using gcc-4.5, which is the version of
> arm-angstrom-linux-gnueabi-gcc that is being used to build the package.
>
> To solve this problem I added a recipe to esekeyd-1.2.7 (in attach) and now
> it's working.
>

can you resend the patch following submission guidelines
http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
> Best regards,
> Luís Borlido
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



