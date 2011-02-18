Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqYF1-0003oJ-5R
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 22:51:55 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PqYDo-0006tx-3K from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 13:50:40 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 13:50:39 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 14:50:38 -0700
Message-ID: <4D5EE9A9.10205@mentor.com>
Date: Fri, 18 Feb 2011 14:50:33 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5E45C1.7010504@opendreambox.org>
	<1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
In-Reply-To: <1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
X-OriginalArrivalTime: 18 Feb 2011 21:50:38.0885 (UTC)
	FILETIME=[E1765550:01CBCFB5]
Subject: Re: [PATCH] package_deb.bbclass: armel architecture name for eabi	systems.
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
X-List-Received-Date: Fri, 18 Feb 2011 21:51:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2011 02:16 PM, Filip Zyzniewski wrote:
> For dpkg EABI system architecture is called armel, not arm.
>
> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
> ---
>   classes/package_deb.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
> index 60e759d..87f31fa 100644
> --- a/classes/package_deb.bbclass
> +++ b/classes/package_deb.bbclass
> @@ -15,6 +15,8 @@ DPKG_ARCH_i486 ?= "i386"
>   DPKG_ARCH_i586 ?= "i386"
>   DPKG_ARCH_i686 ?= "i386"
>   DPKG_ARCH_pentium ?= "i386"
> +DPKG_ARCH_linux-gnueabi ?= "armel"
> +DPKG_ARCH_linux-uclibceabi ?= "armel"
>
>   python package_deb_fn () {
>       bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)

I'm a little puzzled. So little endian gnueabi ARM is armel, little 
endian OABI ARM is arm.  What about big endian ARM cases?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


