Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PKu3s-0002TV-1V
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:41:38 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PKu2f-0004cg-RN from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 06:40:21 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 23 Nov 2010 06:40:21 -0800
Received: from [172.30.80.10] ([172.30.80.10]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Nov 2010 07:40:20 -0700
Message-ID: <4CEBD252.7000502@mentor.com>
Date: Tue, 23 Nov 2010 07:40:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20101123113706.GA3533@lit.local.igalia.com>
In-Reply-To: <20101123113706.GA3533@lit.local.igalia.com>
X-OriginalArrivalTime: 23 Nov 2010 14:40:20.0957 (UTC)
	FILETIME=[5AD6E8D0:01CB8B1C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Tue, 23 Nov 2010 14:41:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/2010 04:37 AM, Víctor M. Jáquez L. wrote:
> I'm trying to build minimal-image with CSL toolchain, but I got this error:
>
> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Started
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb do_install failed
> ERROR: Task 187 (/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb, do_install) failed with 256
> ERROR: '/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb' failed
> ERROR: Function do_install failed
> NOTE: Task failed: ('function do_install failed', '/media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227')
> ERROR: Logfile of failure stored in: /media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227
> Log data follows:
> | cp: cannot stat `/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-gnueabi/libc/lib/*': No such file or directory
> | ERROR: Function do_install failed
> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Failed
> ERROR: TaskFailed event exception, aborting
>
> For some reason the variable ${TARGET_SYS} is evaluated as
> arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which is the
> correct value.

Please post your local.conf settings as well as what version of 
openembedded (and what branch) you are using.

-- 
Tom Rini
Mentor Graphics Corporation


