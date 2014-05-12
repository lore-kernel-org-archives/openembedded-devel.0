Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 515 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 19:24:09 UTC
Received: from mail.chez-thomas.org (unknown [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0B760167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 19:24:09 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8F785F811DC; Mon, 12 May 2014 13:15:35 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8C543F811DA;
	Mon, 12 May 2014 13:15:33 -0600 (MDT)
Message-ID: <53711DD9.6070506@mlbassoc.com>
Date: Mon, 12 May 2014 13:15:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAN-NoH3xAYL_GdgvtYzNChD0VneKjT4EoJzPLigAeCZXegcBCA@mail.gmail.com>
In-Reply-To: <CAN-NoH3xAYL_GdgvtYzNChD0VneKjT4EoJzPLigAeCZXegcBCA@mail.gmail.com>
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
X-List-Received-Date: Mon, 12 May 2014 19:24:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-05-12 12:43, Richard Cagley wrote:
> This is likely an incredibly dumb question.
>
> After I do this
> bitbake -c menuconfig linux-xlnx
> Then go through the menu options and select the kernel changes I want.
>
> How do I get the kernel to rebuild?
>
> bitbake linux-xlnx

Try 'bitbake linux-xlnx -C compile'

> and
> bitbake core-image-minimal-dev
> don't seem to generate new uImages.
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

