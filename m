Received: from [63.210.253.237] (helo=ext-cn0ut-7.online-age.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1LKY91-0003hz-Sr
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 14:08:24 +0100
Received: from int-cn0ut-4.online-age.net (int-cn0ut-4.online-age.net
	[3.159.252.73])
	by ext-cn0ut-7.online-age.net (8.13.6/8.13.6/20051114-SVVS-TLS-DNSBL)
	with ESMTP id n07CwO7g021769
	for <openembedded-devel@openembedded.org>;
	Wed, 7 Jan 2009 07:58:26 -0500
Received: from alpmlip01.e2k.ad.ge.com (int-cn0ut-4.online-age.net
	[3.159.252.73])
	by int-cn0ut-4.online-age.net (8.13.6/8.13.6/20050510-SVVS) with ESMTP
	id n07D2GrW017376 for <openembedded-devel@openembedded.org>;
	Wed, 7 Jan 2009 08:02:16 -0500
Received: from ind-3n4b83jh1.amer.consind.ge.com (HELO [192.168.219.128])
	([3.138.54.81])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 07 Jan 2009 08:02:16 -0500
Message-ID: <4964A7D3.8060205@gefanuc.com>
Date: Wed, 07 Jan 2009 13:02:11 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
Organization: GE Fanuc Intelligent Platforms Ltd.
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200901071345.43987.openembedded@haerwu.biz>
In-Reply-To: <200901071345.43987.openembedded@haerwu.biz>
Subject: Re: [REVIEW] conf/machine cleanup
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
X-List-Received-Date: Wed, 07 Jan 2009 13:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> --- a/conf/machine/include/tune-pentiumpro.inc
> +++ b/conf/machine/include/tune-pentiumpro.inc
> @@ -1,4 +1,4 @@
>  TARGET_CC_ARCH = "-march=pentiumpro"
>  BASE_PACKAGE_ARCH = "i686"
>  FEED_ARCH = "i686"
> -PACKAGE_EXTRA_ARCHS += "i386 i486 i586"
> +PACKAGE_EXTRA_ARCHS += "x86 i387 i486 i586"

This looks like a typo         ^^^^

Martyn

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 729849476


