Received: from exprod5og105.obsmtp.com ([64.18.0.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martyn.welch@ge.com>) id 1PxLpb-00057M-Nq
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 17:01:48 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob105.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTXekCKNJ4qgzWB0LYLDGAn+ql+KsqWnq@postini.com;
	Wed, 09 Mar 2011 08:00:14 PST
Received: from unknown (HELO alpmlef06.e2k.ad.ge.com) ([3.159.18.15])
	by Alpmlip05.e2k.ad.ge.com with ESMTP; 09 Mar 2011 08:12:40 -0500
Received: from [3.138.54.92] ([3.138.54.92]) by alpmlef06.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 9 Mar 2011 08:12:15 -0500
Message-ID: <4D777CC5.6090303@ge.com>
Date: Wed, 09 Mar 2011 13:12:37 +0000
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D7759A1.4060802@dresearch.de>
In-Reply-To: <4D7759A1.4060802@dresearch.de>
X-Enigmail-Version: 1.1.2
X-OriginalArrivalTime: 09 Mar 2011 13:12:16.0072 (UTC)
	FILETIME=[9C96F480:01CBDE5B]
Subject: Re: u-boot-utils and UBOOT_MACHINE?
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
X-List-Received-Date: Wed, 09 Mar 2011 16:01:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/03/11 10:42, Steffen Sledz wrote:
> The current recipe for the u-boot-utils (u-boot-utils_1.2.0.bb) contains this:
> 
> ------------------->snip<--------------------
> do_configure() {
>         oe_runmake Sandpoint8240_config
> }
> ------------------->snip<--------------------
> 
> This seems to be very machine specific.
> 
> I'm not a u-boot-tools specialist. If the tools are not machine specific and the above line is just a placeholder, this should be documented.
> 

It's been a while since I looked at u-boot-utils, I think the tools are
generic but the build scripts need a config to run.

> But if the tools itself are machine specific i believe there should be something like
> 
> ------------------->snip<--------------------
> do_configure() {
>         oe_runmake ${UBOOT_MACHINE}
> }
> ------------------->snip<--------------------
> 

I guess you mean "oe_runmake ${UBOOT_MACHINE}_config" :-)

I doubt I'm the only one who uses OE to generate Linux images without having a
suitable U-Boot machine that could be used to satisfy that. We could put
Sandpoint8240 in each such machine conf and document why there. I also assume
that there are machine confs that currently lack a UBOOT_MACHINE variable
which could cause problems building the U-Boot tools if this change is made,
especially for machines that might exist in an overlay (more likely now with
OE-core?).

> and package build should go into machine specific workdir. Right?
> 

I think they are generic, though I'm no expert.

Martyn

-- 
Martyn Welch (Principal Software Engineer) | Registered in England and
GE Intelligent Platforms                   | Wales (3828642) at 100
T +44(0)127322748                          | Barbirolli Square, Manchester,
E martyn.welch@ge.com                      | M2 3AB  VAT:GB 927559189


