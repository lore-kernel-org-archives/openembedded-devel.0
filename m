Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpLjL-00039y-0T
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 15:18:15 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PpLiC-0005Qg-Iv from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 06:17:04 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 06:17:04 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 07:17:02 -0700
Message-ID: <4D5A8AD3.2050901@mentor.com>
Date: Tue, 15 Feb 2011 07:16:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimE1MUCjZx+dRSna8+38OHy+cZ0GdQDL+EN+it7@mail.gmail.com>
In-Reply-To: <AANLkTimE1MUCjZx+dRSna8+38OHy+cZ0GdQDL+EN+it7@mail.gmail.com>
X-OriginalArrivalTime: 15 Feb 2011 14:17:03.0102 (UTC)
	FILETIME=[045A29E0:01CBCD1B]
Subject: Re: linux-libc-headers and eglibc having circular dependency
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
X-List-Received-Date: Tue, 15 Feb 2011 14:18:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2011 04:20 AM, George Alexandru Dorobantu wrote:
> Hello guys,
>
> I've just started a new building and I got this error:
>
> g@g-home:/media/500GB/oe/openembedded$ bitbake qt4e-base-image
> NOTE: Handling BitBake files: - (7318/7318) [100 %]
> Parsing of 7318 .bb files complete (6892 cached, 426 parsed). 7596 targets,
> 357 skipped, 0 masked, 0 errors.
>
> Build Configuration:
> BB_VERSION        = "1.10.2"
> METADATA_BRANCH   = "org.openembedded.dev"
> METADATA_REVISION = "b4a8a11"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "qemuarm"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v20110215"
> TARGET_FPU        = "soft"
>
> NOTE: Resolving any missing task queue dependencies
> FATAL: Task /media/500GB/oe/openembedded/recipes/linux-libc-headers/
> linux-libc-headers_2.6.32.bb (do_package) has circular dependency on
> /media/500GB/oe/openembedded/recipes/eglibc/eglibc_2.12.bb (do_package)
>
>
> Can anyone help me with this?

Can you please put your local.conf into pastebin.com and give us a link? 
  We don't usually see this kind of problem, thanks!

-- 
Tom Rini
Mentor Graphics Corporation


