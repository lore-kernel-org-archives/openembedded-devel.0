Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (unknown [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE8B6098B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 12:16:55 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 2774AF811E2; Tue, 13 May 2014 06:16:56 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 74A5FF811E1;
	Tue, 13 May 2014 06:16:54 -0600 (MDT)
Message-ID: <53720D3C.5060607@mlbassoc.com>
Date: Tue, 13 May 2014 06:17:00 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAN-NoH3xAYL_GdgvtYzNChD0VneKjT4EoJzPLigAeCZXegcBCA@mail.gmail.com>	<53711DD9.6070506@mlbassoc.com>
	<CAN-NoH0DsTa+DYTNz8oDwWQCVPTUzBMeEQEi37sO2w9cSHByDQ@mail.gmail.com>
In-Reply-To: <CAN-NoH0DsTa+DYTNz8oDwWQCVPTUzBMeEQEi37sO2w9cSHByDQ@mail.gmail.com>
Subject: Re: kernel config/rebuilding
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 May 2014 12:16:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-05-12 18:18, Richard Cagley wrote:
> On Mon, May 12, 2014 at 12:15 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>
>> bitbake linux-xlnx -C compile
>
>
> That definitely caused the kernel to get rebuilt. Thanks.
>
> While I was waiting for a reply I stumbled on this
> https://community.freescale.com/docs/DOC-95045
>
> Do I need to move the new .config into a defconfig file somewhere? Similar
> to this step?
> $ cp
> tmp/work/imx6qsabresd-poky-linux-gnueabi/linux-imx/3.0.35-r33.10/git/.config
> ../sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-3.0.35/mx6/defconfig
>

You can do this, but only if you are interested in saving
the new/changed configuration.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

