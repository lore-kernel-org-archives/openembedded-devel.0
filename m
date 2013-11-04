Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 83C566CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 19:52:52 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 19FDCF81206; Mon,  4 Nov 2013 12:52:52 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4258EF81205;
	Mon,  4 Nov 2013 12:52:50 -0700 (MST)
Message-ID: <5277FB19.80807@mlbassoc.com>
Date: Mon, 04 Nov 2013 12:52:57 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <F48900D76F0D8349918584FEEFEB4BCA06003FE2@SEXCHANGE0100.lpg.priv>
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA06003FE2@SEXCHANGE0100.lpg.priv>
Subject: Re: Pb compilation with BB_NUMBER_THREADS != 1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2013 19:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-04 09:44, MONDON Daniel wrote:
> I'm on a virtual Ubuntu 12.04 server, 16 cores, 8Go RAM free frequency (max = 163840MHz)
>
> With BB_NUMBER_THREADS = '1', the entire project is successfully build in 12h30.
>
> With BB_NUMBER_THREADS = '4' (same result with 12)
>
> | LD_LIBRARY_PATH=/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2:/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-eglib
> c/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib:/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib64  ./perl -f -Ilib pod/buildtoc --
> build-toc -q
> |
> |       Making x2p stuff
> | make[1]: Entering directory `/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
> |
> | make[1]: Leaving directory `/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
> | pod/buildtoc: no pods at pod/buildtoc line 305.
> | make: *** [pod/perltoc.pod] Error 255
> | ERROR: oe_runmake failed
> NOTE: package perl-native-5.14.2-r0: task do_compile: Failed
> NOTE: package perl-5.14.2-r6: task do_fetch: Started
> NOTE: package perl-5.14.2-r6: task do_fetch: Succeeded
> ERROR: Task 1239 (/home/xxxxxxxxxxsources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4055 tasks of which 4053 didn't need to be rerun and 1 failed.
>
> Summary: 1 task failed:
>    /home/xxxxxxxxxxsources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> Known problem ?
> Any solution ?

More details are probably needed to be able to help much.

Since this is a virtual server, have you tried reducing the number of cores
(not BB threads)?  I routinely use this on real Ubuntu-12.04/x86_84 with an
Core2-duo (2x2 cores) with BB_NUMBER_THREADS=4 with no problems.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

