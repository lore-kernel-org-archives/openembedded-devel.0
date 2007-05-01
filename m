Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1HikrU-0006nk-Sn
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2007 07:25:17 +0200
Received: by py-out-1112.google.com with SMTP id n39so1442493pyh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2007 22:16:00 -0700 (PDT)
Received: by 10.64.131.17 with SMTP id e17mr6405499qbd.1177996559876;
	Mon, 30 Apr 2007 22:15:59 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id 6sm24277996nzn.2007.04.30.22.15.57;
	Mon, 30 Apr 2007 22:15:58 -0700 (PDT)
Message-ID: <4636CCC0.1010109@gmail.com>
Date: Tue, 01 May 2007 00:14:40 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20070427105722.GA4340@twibble.org> <46359408.9060800@gmail.com>
	<20070430080044.GA15877@twibble.org>
In-Reply-To: <20070430080044.GA15877@twibble.org>
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2007 05:25:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks. I fixed the hostperl problem.

Don't know why. Even I commented out the DEFAULT_PREFERENCE = "-1", 
bitbake still try to get perl-5.8.7 compiled first

NOTE: package perl-5.8.8-r8: task do_unpack: completed
NOTE: package perl-5.8.8: completed
NOTE: Running task 285 of 302 (ID: 130, 
/home/OE/org.openembedded.dev/packages/perl/perl_5.8.7.bb, do_fetch)
NOTE: package perl-5.8.7: started
NOTE: package perl-5.8.7-r22: task do_fetch: started

Besides, I noticed another issue:
I had linux-libc-headers-2.6.15.99 compiled (I think it's determined 
Machine and Distro) . But perl-5.8.8 wants linux-libc-headers-2.6.20. 
Will that cause problem?

Thanks
Gordon


Jamie Lenehan wrote:
> On Mon, Apr 30, 2007 at 02:00:24AM -0500, Junqian Gordon Xu wrote:
>   
>> Jamie Lenehan wrote:
>>     
> [...]
>   
>> perl-native-5.8.8 builds fine but with the following error
>>
>> ERROR: QA issue: libgettextsrc.la failed sanity test (reference to 
>> workdir or installed)
>>     
> [...]
>
> These ones aren't related to perl-native at all, so no problems there.
>
> [...]
>   
>> perl-5.8.8 build failed. Detail in the attached log file.
>>     
> [...]
>   
>> | hostperl -I/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../fake_config_library -MConfig ../../lib/ExtUtils/xsubpp -noprototypes -typemap ../../lib/ExtUtils/typemap  attrs.xs > attrs.xsc && mv attrs.xsc attrs.c
>> | Perl lib version (v5.8.8) doesn't match executable version (v5.8.7) at /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../fake_config_library/Config.pm line 46.
>>     
>
> This error is saying that "hostperl" is perl 5.8.7 but that it needs
> to be perl 5.8.8. Can you check what your hostperl, which would be:
>
>   /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/bin/hostperl
>
> is pointing at? It should be 5.8.8 but this error makes it sound like
> it's pointing at 5.8.7:
>
>   %~> ls -l tmp/staging/x86_64-linux/bin/hostperl 
>   lrwxrwxrwx 1 lenehan lenehan 82 2007-04-30 13:28 tmp/staging/x86_64-linux/bin/hostperl -> /home/lenehan/devel/oe/build/titan-glibc-25/tmp/staging/x86_64-linux/bin/perl5.8.8*
>
> Thanks.
>
>   



