Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PxMxK-0000e7-7t
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 18:13:50 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PxMvl-0005yD-5e from Tom_Rini@mentor.com ;
	Wed, 09 Mar 2011 09:12:13 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 9 Mar 2011 09:12:12 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 9 Mar 2011 09:12:12 -0800
Message-ID: <4D77B4E3.3030305@mentor.com>
Date: Wed, 9 Mar 2011 10:12:03 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D7759A1.4060802@dresearch.de>
In-Reply-To: <4D7759A1.4060802@dresearch.de>
X-OriginalArrivalTime: 09 Mar 2011 17:12:12.0979 (UTC)
	FILETIME=[21D0A030:01CBDE7D]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 09 Mar 2011 17:13:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2011 03:42 AM, Steffen Sledz wrote:
> The current recipe for the u-boot-utils (u-boot-utils_1.2.0.bb) contains this:
>
> ------------------->snip<--------------------
> do_configure() {
>          oe_runmake Sandpoint8240_config
> }
> ------------------->snip<--------------------
>
> This seems to be very machine specific.
>
> I'm not a u-boot-tools specialist. If the tools are not machine specific and the above line is just a placeholder, this should be documented.
>
> But if the tools itself are machine specific i believe there should be something like
>
> ------------------->snip<--------------------
> do_configure() {
>          oe_runmake ${UBOOT_MACHINE}
> }
> ------------------->snip<--------------------
>
> and package build should go into machine specific workdir. Right?

So, currently, and modulo the config files that are shipped per-BSP 
anyhow, the utils that are made are generic.  It's possible, but I 
haven't confirmed, that both this and u-boot-mkimage could just build 
sans a config target, since it's just building in the tools subdir.

-- 
Tom Rini
Mentor Graphics Corporation


