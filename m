Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SKiG0-0001Zw-1J
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 05:42:08 +0200
Received: by qafl39 with SMTP id l39so1243011qaf.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 20:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=RDmztzmNdchd3Jf5LS5QLP4YdXflxyFuYUu9CwS6F8Y=;
	b=SPZGGnBItOYUoKYTl6Q3RxIu1fqjAi+6hu42zg+z0UChpCnf5dnul4ZdYG0LLWhuRk
	uvO3YnkWpCEDC7wsN4pSFovw5viiOKFK+bdHLwb6/OB6JKRIzxRKTSmfO9JsYiaJpkyQ
	7iJkdDuU0cIX59o97gjjmdDi37DyR9EvFY7d0jJrsQLssOZeNykZq06GalCJ7Y9NyFLA
	EbrJZYbGp0k+jV12YuzClqun5JbgsVwWcJ0oRflfahFEilWfEUdRpxyNkx428osJg/Cj
	W9LLbI4h36NvefXo7EOnEdBkIlrx5cPfI6nCgzIRf1T+2QXc0MxOcmomdpI9wCa15wTg
	RdeA==
Received: by 10.229.136.212 with SMTP id s20mr145921qct.118.1334806358929;
	Wed, 18 Apr 2012 20:32:38 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id bm15sm2073942qab.17.2012.04.18.20.32.34
	(version=SSLv3 cipher=OTHER); Wed, 18 Apr 2012 20:32:38 -0700 (PDT)
Message-ID: <4F8F8749.8000803@gmail.com>
Date: Wed, 18 Apr 2012 20:32:25 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
In-Reply-To: <CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Thu, 19 Apr 2012 03:42:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2012 03:00 PM, Khem Raj wrote:
> On Tue, Apr 17, 2012 at 10:40 PM, j<vwyodapink@gmail.com>  wrote:
>> Sorry to sound so dumb but if there is no recipe failing and 2 separate
>> systems are segfaulting in similar manners and both result with not fully
>> functioning images/packages where else can I look for info? I posted all the
>> logs to one of the builds, and the QA log seems to be the only thing really
>> spitting out anything. I am open to trying and or sharing any and all
>> relevant info to help sort it out or get me on track to sorting it out.
> what I am hearing is that your build succeeds despite these ld
> segfaults. Am I right ?
> but then when you run the resulting images then the images dont
> function correctly
> on your target
First off thank you all for your time and information, and putting up 
with me learning and trying to get things working!!
Yes you are correct. Nothing in the images or packages fail, but the 
build machine itself segfaults. Then if I put the image on my BB-XM 
sdcard they boot and "run" but things are not right, such as directories 
that should not be there are, some do not build a fully functioning 
package, such as task-native-sdk.



> and you also mentioned that its expat package when being built that
> causes the ld
> segfaults. Are you sure about that ? You could somehow forge ulimit to unlimited
> that will dump
No I am not sure about it. As I am just trying to watch it build and 
look for the build machine to segfault and see what packages it is 
working on. Though after further messing with expat I think you are 
correct in doubting that is the one causing it.

I just did a clean build of perl with no rm_work enabled, and I am 
trying to dig through the logs and info. From your earlier 
advice/mentioning of libtool-cross I do notice some things while it is 
building according to the info. I will post some of what stood out to 
me, which may in turn mean nothing. If I can post anymore of the logs or 
anything please let me know. I did notice today setting things to build 
one at a time, that it does appear that its working on libtool-cross, 
but again I could be wrong.

>
> on ubuntu edit /etc/security/limits.conf on build host and then add
> *         soft    core    unlimited
>
> that should generate core files. After this search for core* files in build tree
> and see if there are any then debug them with gdb to diagnose it further
>
> Now I am not sure if those segfaults directly relate to malfunction of image
> if thats the case but its likely. You should also try to explore the reasons why
> the image fails to behave as expected.
I will do as suggested as well as do a full image build again and see if 
I can find out all that is not working. Thank you for the extra 
debugging info and suggestions. Are there any keywords to search through 
all the files for including the normal log files, it may help me track 
down things even further.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I really am not trying to be a pain in the a** and would like to get 
things sorted out and understood on my side. Honestly if the resulting 
images worked and did not get any extra folders in their paths I would 
not care about the resulting segfaults on the build machine.

Another side note, I am borrowing another build machine for a few days 
to see, this is a non nvidia machine just in case that is the bad 
variable in both machines.

libtool-cross info::
log.do_configure
/configure: WARNING: unrecognized options: --disable-silent-rules, 
--with-sysroot/

log.do_compile:
help2man is installed on the system, whereis help2man
help2man: /usr/bin/help2man /usr/lib/help2man 
/usr/share/man/man1/help2man.1.gz

/WARNING: `help2man' is missing on your system.  You should only need it if
      you modified a dependency of a manual page.  You may need the
      `Help2man' package in order for those modifications to take
      effect.  You can get `Help2man' from any GNU archive site.
PATH=".:$PATH"; export PATH; /bin/sh 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.4.2-r2.1/libtool-2.4.2/libltdl/config/missing 
--run help2man --output=doc/libtoolize.1 libtoolize
WARNING: `help2man' is missing on your system.  You should only need it if
      you modified a dependency of a manual page.  You may need the
      `Help2man' package in order for those modifications to take
      effect.  You can get `Help2man' from any GNU archive site./

log.do_package
/DEBUG: Preparing tree 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.4.2-r2.1/shlibs 
for packaging at 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.4.2-r2.1/sstate-build-package/shlibs
sed: no input files/

log.do_package_write_ipk & log.do_populate_lic
/sed: no input files/

log.do_populate_sysroot
/DEBUG: No site_config directory, skipping do_siteconfig/

Again a big thank you!

