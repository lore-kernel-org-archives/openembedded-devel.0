Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RGyCy-0004d0-S0
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 21:23:17 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 8583016606CB; Thu, 20 Oct 2011 13:17:20 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1A90B16605E5;
	Thu, 20 Oct 2011 13:17:20 -0600 (MDT)
Message-ID: <4EA073C0.7000502@mlbassoc.com>
Date: Thu, 20 Oct 2011 13:17:20 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1319132705374102500@rkmorris.us>
In-Reply-To: <1319132705374102500@rkmorris.us>
Subject: Re: Machine Configuration
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
X-List-Received-Date: Thu, 20 Oct 2011 19:23:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-20 11:45, Russell Morris wrote:
> Hi,
>
> I am trying to do some builds for an am3517-evm ... but the machine configuration doesn't seem to be working (or I'm doing it wrong, more likely ... :-().
>
> I have successfully built console-image for qemuarm, and then use oebb.sh to set the machine (to am3517-evm, followed bu ./oebb.sh update) - but then when I try to build for this machine I see the following ...
>
> OE Build Configuration:
> BB_VERSION        = "1.13.3"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "qemuarm"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v2011.10-core"
> TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
> TARGET_FPU        = "soft"
>
> So it's still building for qemuarm, not am3517-evm ... :-(. Is anyone else having this issue? Any suggestions of how to fix this?

You need to always specify MACHINE="am3517-evm" on your command line, e.g.
   % MACHINE="am3517-evm" bitbake systemd-image

Alternatively, you can add just a single line to conf/local.conf
and then it will be "sticky"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


