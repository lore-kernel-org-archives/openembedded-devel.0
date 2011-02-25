Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PszAM-00018u-3o
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:01:10 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Psz91-00078F-Bc from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 06:59:47 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 25 Feb 2011 06:59:47 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 25 Feb 2011 06:59:46 -0800
Message-ID: <4D67C3D4.4000504@mentor.com>
Date: Fri, 25 Feb 2011 07:59:32 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D67ABEB.5020509@dresearch.de>
In-Reply-To: <4D67ABEB.5020509@dresearch.de>
X-OriginalArrivalTime: 25 Feb 2011 14:59:47.0181 (UTC)
	FILETIME=[A4CB11D0:01CBD4FC]
Subject: Re: Release-2011.03/5dbd8d6 libnl2-1_2.0-r1: task do_compile: Failed
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
X-List-Received-Date: Fri, 25 Feb 2011 15:01:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2011 06:17 AM, Steffen Sledz wrote:
> First error with the latest testing-release-2011.03 while trying clean build of console-image. :(
>
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "testing-release-2011.03"
> METADATA_REVISION = "5dbd8d6"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "hipox"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2010.7-test-20110225"
> TARGET_FPU        = "soft"
>
> Making all in lib
> make[1]: Entering directory `/var/lib/jenkins/jobs/OE-testing/workspace/tmp/work/armv5te-angstrom-linux-gnueabi/libnl2-1_2.0-r1/libnl-2.0/lib'
> bison -y -d  -o route/pktloc_syntax.c route/pktloc_syntax.y
> make[1]: *** No rule to make target `route/pktloc_grammar.y', needed by `route/pktloc_grammar.c'.  Stop.
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory `/var/lib/jenkins/jobs/OE-testing/workspace/tmp/work/armv5te-angstrom-linux-gnueabi/libnl2-1_2.0-r1/libnl-2.0/lib'
> make: *** [all-recursive] Error 1

Yeah, sorry about that.  I went and pushed the same thing (fixed it last 
night but was waiting for any other fall-out overnight).

-- 
Tom Rini
Mentor Graphics Corporation


