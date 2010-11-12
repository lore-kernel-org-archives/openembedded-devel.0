Received: from usps2.crhc.illinois.edu ([130.126.143.231]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PH2KH-0003Qb-Om
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 23:42:42 +0100
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id 73231340009F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 16:41:34 -0600 (CST)
Received: from [192.168.1.198] (unknown [63.252.64.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id 39635340008F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 16:41:33 -0600 (CST)
Message-ID: <4CDDC29D.3050106@crhc.illinois.edu>
Date: Fri, 12 Nov 2010 16:41:33 -0600
From: Matt Johnson <johnso87@crhc.illinois.edu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CDDB992.7000603@crhc.illinois.edu>
	<AANLkTikdSDT0+JSSgSEeHrWFC3n6Km0GMuX2umS3OgNu@mail.gmail.com>
In-Reply-To: <AANLkTikdSDT0+JSSgSEeHrWFC3n6Km0GMuX2umS3OgNu@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.231
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_BL_SPAMCOP_NET,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gcc-4.5 r166342 PCHFLAGS problem
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
X-List-Received-Date: Fri, 12 Nov 2010 22:42:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2010 04:31 PM, Khem Raj wrote:
> On Fri, Nov 12, 2010 at 2:02 PM, Matt Johnson
> <johnso87@crhc.illinois.edu>  wrote:
>    
>> Hi All,
>>     I built gcc-cross from x86_64 host to armv7a target using gcc 4.5
>> r166342.  I then tried to bitbake gcc (an armv7a-host, armv7a-target native
>> compiler) with the same revision and got build errors on libstdc++:
>>
>>      
> hmmm I dont see these issues here. I am using latest gcc in OE and
> minimal distro with libtool 2.4 which is same like angstrom-2010
> I wonder if there are some header files extra somewhere on your host
> system that are interfering libstdc++ configure.
> what OS do u run on the build machine.
>
> -Khem
>
>    
Kubuntu 10.04, with gcc 4.4.3:

gcc -v
Using built-in specs.
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 
4.4.3-4ubuntu5' --with-bugurl=file:///usr/share/doc/gcc-4.4/README.Bugs 
--enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr 
--enable-shared --enable-multiarch --enable-linker-build-id 
--with-system-zlib --libexecdir=/usr/lib --without-included-gettext 
--enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.4 
--program-suffix=-4.4 --enable-nls --enable-clocale=gnu 
--enable-libstdcxx-debug --enable-plugin --enable-objc-gc 
--disable-werror --with-arch-32=i486 --with-tune=generic 
--enable-checking=release --build=x86_64-linux-gnu 
--host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 4.4.3 (Ubuntu 4.4.3-4ubuntu5)

My log.do_configure is here: http://pastebin.com/9ZPUB4KJ .  The error 
at the top is slightly concerning:

   1.
      configure.ac:32: error: Please use exactly Autoconf 2.64 instead
      of 2.65.
   2.
      config/override.m4:34: _GCC_AUTOCONF_VERSION_CHECK is expanded from...
   3.
      configure.ac:32: the top level
   4.
      autom4te:
      /media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/sysroots/x86_64-linux/usr/bin/m4
      failed with exit status: 1

But I'm not sure if that's the issue.
-Matt


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    

-- 
Matt Johnson
Graduate Student
University of Illinois at Urbana-Champaign, Dept. of ECE
Coordinated Science Lab, Rm. 213


