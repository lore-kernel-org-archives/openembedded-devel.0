Received: from portal.beam.ltd.uk ([62.49.82.227] helo=mailgate.beam.ltd.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <terry@beam.ltd.uk>) id 1PzruB-0003g9-RB
	for openembedded-devel@linuxtogo.org; Wed, 16 Mar 2011 15:40:56 +0100
Received: from beam.beamnet (beam.beamnet [127.0.0.1])
	by mailgate.beam.ltd.uk (8.14.4/8.14.4) with ESMTP id p2GE3LHo003569;
	Wed, 16 Mar 2011 14:03:22 GMT
Message-ID: <4D80C329.9020309@beam.ltd.uk>
Date: Wed, 16 Mar 2011 14:03:21 +0000
From: Terry Barnaby <terry@beam.ltd.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Ludovic Desroches <ludovic.desroches@atmel.com>
References: <4D80653A.7010804@beam.ltd.uk> <4D80772A.8080207@atmel.com>
In-Reply-To: <4D80772A.8080207@atmel.com>
X-Enigmail-Version: 1.1.1
Cc: openembedded-devel@linuxtogo.org, openembedded-users@linuxtogo.org
Subject: Re: [Openembedded-users] Problem with patch version 2.6.1-7 and	after
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
X-List-Received-Date: Wed, 16 Mar 2011 14:40:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/16/2011 08:39 AM, Ludovic Desroches wrote:
> Hello,
> 
> On 3/16/2011 8:22 AM, Terry Barnaby wrote:
>> Hi,
>>
>> I am getting the error:
>>
>> NOTE: Applying patch 'arm-thumb-mutex_db5.patch'
>> (openembedded/recipes/db/db-5.1.19/arm-thumb-mutex_db5.patch)
>> ERROR: Execution of 'quilt
>> --quiltrc=/scratch/OpenEmbeddedNew/tmp/sysroots/i686-linux/usr/bin/quiltrc
>> push' failed with exit code 1:
>> Applying patch arm-thumb-mutex_db5.patch
>> patch: **** rejecting target file name with ".." component:
>> ../src/dbinc/mutex_int.h
>> Patch arm-thumb-mutex_db5.patch does not apply (enforce with -f)
>>
>> ERROR: Function 'patch_do_patch' failed
> 
> I have no problem to apply the patch manually or running bitbake db-5.1.19. I am
> using the latest bitbake release and the 2011.03 oe release.
> 
>>
>> This appears to be due to a security enhancement made to the patch utility
>> relatively recently. 
> I have updated my patch utility we the latest release, not version on the alpha
> ftp :
> 
> $ bitbake db-5.1.19
> ...
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "2011.03_atmel"
> METADATA_REVISION = "8c6a371"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "at91sam9m10g45"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v20110316"
> TARGET_FPU        = "soft"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing RunQueue Tasks
> ...
> NOTE: package db-5.1.19-r1: task do_patch: Started
> NOTE: package db-5.1.19-r1: task do_patch: Succeeded
> NOTE: Running task 721 of 732 (ID: 11,
> /local/users/ldesroch/workspace/openembedded/openembedded/recipes/db/db_5.1.19.bb,
> do_configure)
> ...
> 
> ldesroch@RFOLXTS02:openembedded (master)$ patch --version
> patch 2.6.1
> 
>> Is there a known clean way of fixing this and where
>> should I report the bug ?
>>
> You should use the openembedded-devel list. I think you will have more answers.
> 
> 
> Regards
> 
> Ludovic Desroches
> 
> 
> 
> _______________________________________________
> Openembedded-users mailing list
> Openembedded-users@linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
Hi,

### Forwarded to openembedded-devel ###

We are using Fedora14. That is using patch 2.6.1-8.

The -8 release includes the following patches to patch.
Patch1: patch-2.5.4-sigsegv.patch
Patch2: patch-get-arg.patch
Patch3: patch-CVE-2010-4651.patch
Patch100: patch-selinux.patch

I think one of those fixes a security issue in patch where ".." in
path names were allowed. With this version of patch (which I assume
will become standard ?) the OpenEmbedded fails.
Any ideas on a way to get around this (ideally without using a
different patch version :) )

Cheers


Terry


