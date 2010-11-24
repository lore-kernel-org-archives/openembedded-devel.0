Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PLJjP-0003Tq-JP
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 19:06:12 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PLJiC-0004kE-8e from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 10:04:56 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 24 Nov 2010 10:04:55 -0800
Received: from [172.30.80.10] ([172.30.80.10]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 24 Nov 2010 11:04:55 -0700
Message-ID: <4CED53C2.7070109@mentor.com>
Date: Wed, 24 Nov 2010 11:04:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>
In-Reply-To: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>
X-OriginalArrivalTime: 24 Nov 2010 18:04:55.0483 (UTC)
	FILETIME=[1970B0B0:01CB8C02]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails sanity check
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
X-List-Received-Date: Wed, 24 Nov 2010 18:06:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2010 10:32 AM, Zach Frey wrote:
> Hi,
>
> I'm seeing a new error using git HEAD and trying to build for the omapzoom2:
>
>
> Build Configuration:
> BB_VERSION        = "1.10.0"
> METADATA_BRANCH   = "master"
> METADATA_REVISION = "20117ec"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "omapzoom2"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "next"
> TARGET_FPU        = "hard"
>
> | checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc
> -E
> | configure: error: in
> `/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r16.7+svnr11982/build-arm-angstrom-linux-gnueabi':
> | configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails
> sanity check
> | See `config.log' for more details.
> | ERROR: Function do_configure failed
>
> Suggestions?  More info I can provide?

Yes, look at the config.log file to see why it failed.  I hate to be 
rude but it's right there in what you sent.

-- 
Tom Rini
Mentor Graphics Corporation


