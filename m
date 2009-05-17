Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M5l9U-0008P2-5j
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 20:32:00 +0200
Received: (qmail 20173 invoked from network); 17 May 2009 18:24:48 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 May 2009 11:24:48 -0700
Date: Sun, 17 May 2009 11:24:48 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090517182448.GF23842@smtp.west.cox.net>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<200905160931.25224.marcin@juszkiewicz.com.pl>
	<200905161121.55689.g.eismann@gmx.net>
	<f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>
	<guoe44$ff1$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <guoe44$ff1$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Kernel modules
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
X-List-Received-Date: Sun, 17 May 2009 18:32:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 17, 2009 at 09:24:51AM +0200, Koen Kooi wrote:
> On 16-05-09 23:38, Cliff Brake wrote:
>> On Sat, May 16, 2009 at 5:21 AM, G. Eismann<g.eismann@gmx.net>  wrote:
>>
>>> BTW, is there any way to install the modules but not the kernel image?
>>> I have the kernel in a separate partition, so I don't need it into the rootfs.
>>
>> One way is to put the following in the kernel recipe:
>>
>> FILES_kernel-image_<machine_name>  = ""
>
> Please don't do that, it breaks all sorts of things, one of which is  
> field upgrades.

If and only if it's what your distro wants, of course.

-- 
Tom Rini


