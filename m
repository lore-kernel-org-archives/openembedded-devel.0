Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp31h-0003nz-VW
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 19:19:58 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pp30a-0007hN-5V from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 10:18:48 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 10:18:47 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 11:18:46 -0700
Message-ID: <4D5971FB.9070701@mentor.com>
Date: Mon, 14 Feb 2011 11:18:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
In-Reply-To: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
X-OriginalArrivalTime: 14 Feb 2011 18:18:46.0462 (UTC)
	FILETIME=[9E9D85E0:01CBCC73]
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 18:19:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2011 07:08 AM, Filip Zyzniewski wrote:
> The whole reposotiry is about 24MB in size and it's rarely needed
> whole. It is now splitted into bus specific subpackages (and some
> device-specific for devices on a bus like SPI or SBUS) all depended
> on by the linux-firmware package.
[snip]
> +RDEPENDS += "${SUBPACKAGES}"

Given the previous threads, I think we still have a problem, which is 
that this should be
RDEPENDS_${PN} += "${SUBPACKAGES}"
so that there's a valid upgrade path.

-- 
Tom Rini
Mentor Graphics Corporation


