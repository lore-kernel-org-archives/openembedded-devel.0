Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NeT9B-0004zN-N8
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 13:55:29 +0100
Received: (qmail 13388 invoked by uid 1003); 8 Feb 2010 12:52:52 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 8 Feb 2010 12:52:52 -0000
Message-ID: <4B700922.1000102@balister.org>
Date: Mon, 08 Feb 2010 07:52:50 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <000001caa883$7bdd6710$73983530$@in> <hkohno$vbt$1@ger.gmane.org>
	<000b01caa8b3$54add050$fe0970f0$@in>
In-Reply-To: <000b01caa8b3$54add050$fe0970f0$@in>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Facing problem while building Angstrom Image with help of openembedded
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
X-List-Received-Date: Mon, 08 Feb 2010 12:55:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2010 06:39 AM, Tejas wrote:
> Hi All,
> 	I have resolved problems of host name and temporary failure names by
> modifying following file.
> /etc/wgetrc and added http_proxy and ftp_proxy to my proxy setting.
>
> 	After that bitbaking has been started but stuck up on checksum of 2
> packages. Log is as followed.
>
> 	Try to help me out to resolve it.

In the directory that OE is downloading the source tarballs to, delete 
the tarball and the corresponding md5 file. I suspect the download is 
corrupt, doing this will force OE to re-download the file.

Philip


>
> [neelam@Fedora openembedded]$ MACHINE=beagleboard bitbake base-image
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to
> increase performance.
> NOTE: Handling BitBake files: \ (6701/6701) [100 %]
> NOTE: Parsing finished. 6414 cached, 0 parsed, 287 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: preferred version git of u-boot not available (for item u-boot)
> NOTE: preferred version git of u-boot not available (for item u-boot)
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 346 of 2946 (ID: 458,
> /home/neelam/tejas_work/oe/openembedded/recipes/linux-libc-headers/linux-lib
> c-headers_2.6.23.bb, do_patch)
> NOTE: Running task 366 of 2946 (ID: 2442,
> /home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.3.1.
> bb, do_setscene)
> NOTE: Running task 370 of 2946 (ID: 1917,
> /home/neelam/tejas_work/oe/openembedded/recipes/glibc/glibc-initial_2.6.1.bb
> , do_munge)
> NOTE: Running task 373 of 2946 (ID: 1305,
> /home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-intermediate_4
> .3.1.bb, do_fetch)
> NOTE: Applying patch 'unifdef.patch'
> (recipes/linux-libc-headers/files/unifdef.patch)
> NOTE: Running task 374 of 2946 (ID: 2443,
> /home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.3.1.
> bb, do_fetch)
> NOTE: Running task 375 of 2946 (ID: 1905,
> /home/neelam/tejas_work/oe/openembedded/recipes/glibc/glibc-initial_2.6.1.bb
> , do_patch)
> NOTE: Running task 376 of 2946 (ID: 459,
> /home/neelam/tejas_work/oe/openembedded/recipes/linux-libc-headers/linux-lib
> c-headers_2.6.23.bb, do_configure)
> NOTE: The MD5Sums did not match. Wanted: '4afa0290cc3a41ac8822666f1110de98'
> and Got: 'efb33027b07a1fba27d528b2aba7792a'
> NOTE: Task failed: Checksum of
> 'ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2' failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-intermediate_4
> .3.1.bb do_fetch failed
> NOTE: Applying patch 'arm-memcpy.patch'
> (recipes/glibc/glibc-2.4/arm-memcpy.patch)
> NOTE: Applying patch 'arm-longlong.patch'
> (recipes/glibc/glibc-2.4/arm-longlong.patch)
> ERROR: Task 1305
> (/home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-intermediate_
> 4.3.1.bb, do_fetch) failed
> NOTE: Waiting for 3 active tasks to finish
> NOTE: 1:
> /home/neelam/tejas_work/oe/openembedded/recipes/linux-libc-headers/linux-lib
> c-headers_2.6.23.bb, do_configure (29454)
> NOTE: 2:
> /home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.3.1.
> bb, do_fetch (29452)
> NOTE: 3:
> /home/neelam/tejas_work/oe/openembedded/recipes/glibc/glibc-initial_2.6.1.bb
> , do_patch (29453)
> NOTE: Applying patch 'fhs-linux-paths.patch'
> (recipes/glibc/files/fhs-linux-paths.patch)
> NOTE: The MD5Sums did not match. Wanted: '4afa0290cc3a41ac8822666f1110de98'
> and Got: 'efb33027b07a1fba27d528b2aba7792a'
> NOTE: Task failed: Checksum of
> 'ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2' failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.3.1.
> bb do_fetch failed
> NOTE: Applying patch 'dl-cache-libcmp.patch'
> (recipes/glibc/glibc-2.4/dl-cache-libcmp.patch)
> NOTE: Applying patch 'ldsocache-varrun.patch'
> (recipes/glibc/glibc-2.4/ldsocache-varrun.patch)
> NOTE: Applying patch 'nptl-crosscompile.patch'
> (recipes/glibc/glibc-2.4/nptl-crosscompile.patch)
> NOTE: Applying patch 'glibc-2.5-local-dynamic-resolvconf.patch'
> (recipes/glibc/files/glibc-2.5-local-dynamic-resolvconf.patch)
> ERROR: Task 2443
> (/home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.3.1
> .bb, do_fetch) failed
> NOTE: Waiting for 2 active tasks to finish
> NOTE: 1:
> /home/neelam/tejas_work/oe/openembedded/recipes/linux-libc-headers/linux-lib
> c-headers_2.6.23.bb, do_configure (29454)
> NOTE: 2:
> /home/neelam/tejas_work/oe/openembedded/recipes/glibc/glibc-initial_2.6.1.bb
> , do_patch (29453)
> NOTE: Applying patch 'glibc-check_pf.patch'
> (recipes/glibc/glibc-2.4/glibc-check_pf.patch)
> NOTE: Applying patch 'zecke-sane-readelf.patch'
> (recipes/glibc/glibc-2.4/zecke-sane-readelf.patch)
> NOTE: Applying patch 'ldd-unbash.patch'
> (recipes/glibc/glibc-2.4/ldd-unbash.patch)
> NOTE: Applying patch 'glibc-2.6.1-RTLD_SINGLE_THREAD_P-1.patch'
> (recipes/glibc/files/glibc-2.6.1-RTLD_SINGLE_THREAD_P-1.patch)
> NOTE: Applying patch 'glibc-2.6.1-use-short-for-fnstsw.patch'
> (recipes/glibc/files/glibc-2.6.1-use-short-for-fnstsw.patch)
> NOTE: Applying patch 'glibc-use-isystem-include-fixed.patch'
> (recipes/glibc/glibc-2.4/glibc-use-isystem-include-fixed.patch)
> NOTE: Applying patch 'glibc-arm-no-asm-page.patch'
> (recipes/glibc/glibc-2.4/glibc-arm-no-asm-page.patch)
> NOTE: Applying patch 'armv4t-interworking.patch'
> (recipes/glibc/files/armv4t-interworking.patch)
> NOTE: Applying patch 'march-i686.patch'
> (recipes/glibc/files/march-i686.patch)
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1:
> /home/neelam/tejas_work/oe/openembedded/recipes/linux-libc-headers/linux-lib
> c-headers_2.6.23.bb, do_configure (29454)
> NOTE: Tasks Summary: Attempted 372 tasks of which 369 didn't need to be
> rerun and 2 failed.
> ERROR:
> '/home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-intermediate_
> 4.3.1.bb' failed
> ERROR:
> '/home/neelam/tejas_work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.3.1
> .bb' failed
> [neelam@Fedora openembedded]$ ^C
>
>
>
> -Tejas.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Koen
> Kooi
> Sent: Monday, February 08, 2010 1:54 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Facing problem while building Angstrom Image with help of
> openembedded
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08-02-10 06:56, Tejas wrote:
>
> Let's trim the log a bit:
>
>> Resolving ftp.gnu.org... failed: Temporary failure in name resolution.
>>
>> wget: unable to resolve host address `ftp.gnu.org'
>> NOTE: fetch ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz
>> failed: Temporary failure in name resolution.
>>
>> wget: unable to resolve host address `download.savannah.gnu.org'
>>
>> NOTE: fetch
>> http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz
>> failed: Temporary failure in name resolution.
>>
>> wget: unable to resolve host address `www.angstrom-distribution.org'
>
> That is not an OE problem, that is most likely a problem with your
> corporate firewall, contact your IT department to get that fixed.
>
> There is a bug in bitbake where it doesn't honour GIT_PROXY_COMMAND, but
> you shouldn't be running into that since all the git stuff for
> stable/2009 is already mirrored on htttp
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLb8o5MkyGM64RGpERAlfNAJ9FO1WvxJ6Baw4DXLlEok/+KKLuEgCbBVIm
> zWiq1kwYJDdanQr7273TId0=
> =qLSY
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


