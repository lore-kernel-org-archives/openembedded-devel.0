Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PHK8o-0005h0-Ui
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 18:43:59 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PHK7n-0001uc-Uw from Tom_Rini@mentor.com ;
	Sat, 13 Nov 2010 09:42:51 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 13 Nov 2010 09:42:51 -0800
Received: from [172.30.80.225] ([172.30.80.225]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 13 Nov 2010 10:42:50 -0700
Message-ID: <4CDECE19.5050904@mentor.com>
Date: Sat, 13 Nov 2010 10:42:49 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1289657589.3693.113.camel@mattotaupa>
In-Reply-To: <1289657589.3693.113.camel@mattotaupa>
X-OriginalArrivalTime: 13 Nov 2010 17:42:50.0967 (UTC)
	FILETIME=[316C5670:01CB835A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Revert "unzip: Add update-alternatives to unzip"
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
X-List-Received-Date: Sat, 13 Nov 2010 17:43:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/2010 07:13 AM, Paul Menzel wrote:
> Date: Sat, 13 Nov 2010 14:49:28 +0100
>
> This reverts commit 902b98f32ffd35661e43382f47226f65528ff1b1.
>
> With this patch, decompressing zip files does not work anymore in `angstrom-2008.1, angstrom-2010.x`, `minimal` and `minimal-uclibc`.
>
>          /oe/build-angstrom-next$ bitbake -k jasper
>          […]
>          NOTE: package jasper-1.900.1-r1: task do_unpack: Started
>          NOTE: Unpacking ../downloads/jasper-1.900.1.zip to angstrom-dev/work/armv7a-angstrom-linux-gnueabi/jasper-1.900.1-r1/
>          FATAL: Unable to unpack '/oe/downloads/jasper-1.900.1.zip' to '/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/jasper-1.900.1-r1' (cmd: unzip -q -o '/home/paul/oe/downloads/jasper-1.900.1.zip'):
>          Execution of 'unzip -q -o '/oe/downloads/jasper-1.900.1.zip'' failed with exit code 127:
>          /bin/sh: unzip: command not found
>
>          ERROR: TaskFailed event exception, aborting
>          ERROR: Build of /oe/openembedded/recipes/perl/perl-native_5.10.1.bb do_compile failed
>          ERROR: TaskFailed event exception, aborting
>          ERROR: Build of /oe/openembedded/recipes/jpeg/jasper_1.900.1.bb do_distribute_sources failed
>          /oe/build-angstrom-next$ find . -name unzip
>          ./angstrom-dev/work/i686-linux/unzip-native-552-r2/unzip-5.52/unzip
>
> I do not know what in Tom’s patch might cause this behavior but reverting this patch fixes the problem for me.
>
> Please note, that `unzip` is not installed on my build host.
>
> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>

OK, my fault, I forgot about the -native case here.  The right way that 
I should have done here is to make the final mv be 
do_install_append_pn-unzip or so (will grep check).  I'll fix this 
momentarily, sorry!

-- 
Tom Rini
Mentor Graphics Corporation


