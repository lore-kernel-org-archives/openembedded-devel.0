Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNWRl-0008CP-1m
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 00:46:25 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 4F2881FF85
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2013 00:29:15 +0200 (CEST)
Message-ID: <515CAD3B.4090809@pseudoterminal.org>
Date: Thu, 04 Apr 2013 00:29:15 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
	<515C8C04.3040904@balister.org>
	<4A3AFD82-E315-40D4-B21E-4E3005CBE86D@dominion.thruhere.net>
	<515C95F5.3080705@pseudoterminal.org>
	<CAP9ODKrKkqBQ8BduoazZ+xj8U09yWAnUoGBR=P_bN_dY-q0SbQ@mail.gmail.com>
	<1E8177FC-75D6-4877-A3F3-12678E7505BF@gmail.com>
In-Reply-To: <1E8177FC-75D6-4877-A3F3-12678E7505BF@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 22:46:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-04 00:21, Khem Raj wrote:
> On Apr 3, 2013, at 2:45 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> On Wed, Apr 3, 2013 at 5:49 PM, Carlos Rafael Giani
>> <dv@pseudoterminal.org> wrote:
>>> Okay, I think I see the problem now. DEFAULTTUNES should not be set by the
>>> machine config. So, removing it
>>> and fixing the README accordingly takes care of that. People who for example
>>> want hardfp then
>>> set DEFAULTTUNE ?= "marvellpj4hf" in their local.conf . Is this correct?
>> You may provide a machine variant with has this set; so it will build
>> a machine with this enabled.
> I would say no. Weather to choose Hard float or not is more of a capability that machine exposes
> but distro decided the policy see how its done in angstrom for beagle board and beagle bone
>

You mean this file? 
https://github.com/Angstrom-distribution/meta-angstrom/blob/master/conf/distro/include/arm-defaults.inc

