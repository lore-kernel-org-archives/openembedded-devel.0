Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N0JNP-0002Zi-Sn
	for openembedded-devel@openembedded.org; Tue, 20 Oct 2009 20:24:11 +0200
Received: (qmail 16263 invoked by uid 1003); 20 Oct 2009 18:23:07 -0000
Received: from localhost (HELO ?192.168.1.194?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 20 Oct 2009 18:23:06 -0000
Message-ID: <4ADE0009.4090006@balister.org>
Date: Tue, 20 Oct 2009 14:23:05 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <23738f080910021832k712d31dcra5e2fda045a892e6@mail.gmail.com>
	<19c1b8a90910201108u1ad326c3w251d73e793d1b848@mail.gmail.com>
In-Reply-To: <19c1b8a90910201108u1ad326c3w251d73e793d1b848@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building module-init-tools-cross fails
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
X-List-Received-Date: Tue, 20 Oct 2009 18:24:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

yum install glibc-static ?

Philip

On 10/20/2009 02:08 PM, Khem Raj wrote:
> On Fri, Oct 2, 2009 at 6:32 PM, Sashan Govender<sashang@gmail.com>  wrote:
>> I'm trying out openembedded but get this error:
>>
>> ERROR: function do_compile failed
>> ERROR: log data follows
>> (/home/sashan/code/openembedded/build/tmp/work/i486-oe-linux-gnu/module-init-tools-cross-3.2.2-r5/temp/log.do_compile.12217)
>> | NOTE: make
>> | gcc  -isystem/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/include
>> -O2 -g -Wunused -Wall -static
>> -L/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
>> -Wl,-rpath-link,/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
>> -Wl,-rpath,/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
>> -Wl,-O1 -o insmod.static insmod.o
>> | /usr/bin/ld: cannot find -lc
>> | collect2: ld returned 1 exit status
>> | make: *** [insmod.static] Error 1
>> | FATAL: oe_runmake failed
>>
>> This is my local.conf file:
>>
>> DL_DIR = "${HOME}/archives"
>> BBFILES = ${OEBASE}/openembedded/recipes/*/*.bb
>> BBMASK = ""
>> PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
>> PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
>> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
>> PREFERRED_PROVIDERS += "
>> virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
>> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
>> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
>> MACHINE = "x86"
>> TARGET_OS = "linux"
>> DISTRO = "minimal"
>> IMAGE_FSTYPES = "jffs2 tar"
>> BINCLUDELOGS = "yes"
>>
>> What am I missing?
>
> its looking for libc.a on your build machine because you are linking
> static version. Depending upon what distro you run on
> your host you can install appropriate package. e.g on debian/ubuntu
> libc6-dev provides it.
>
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


