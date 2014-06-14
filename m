Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 066D36B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 12:55:41 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5C328F811E3; Sat, 14 Jun 2014 06:55:42 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3378DF811DD;
	Sat, 14 Jun 2014 06:55:41 -0600 (MDT)
Message-ID: <539C4659.2020009@mlbassoc.com>
Date: Sat, 14 Jun 2014 06:55:53 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CANJXcUaVsvT2JUS=o-vHEh9kAT7S75ec7rywWLrAf2ypydPJuA@mail.gmail.com>
In-Reply-To: <CANJXcUaVsvT2JUS=o-vHEh9kAT7S75ec7rywWLrAf2ypydPJuA@mail.gmail.com>
Subject: Re: Rasperry Pi bcm2835-bootfiles-20140221-r3 do_fetch
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
X-List-Received-Date: Sat, 14 Jun 2014 12:55:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-06-14 06:41, Kashyap Gada wrote:
> Hello,
> The following do_fetch of bcm28353-bootfiles-20140221-r3 is taking
> considerable amount of time. I have kept system monitor applcation on on my
> ubuntu workstation which shows download at about 114KBps.

This is going to take a while as it's around 3GB packed.

>
> I want to know if this do_fetch task is interrupted and bitbake is stopped
> as I have to close down my office, will bitbaking the next time i start the
> process continue download from where I stopped or will start fetching for
> the package from 0 again.
>
>
> Also can it be downloaded separately, if yes where can I find the link to
> it and where do i have to store it once its downloaded.

If you set BB_GENERATE_MIRROR_TARBALLS ?= "1" in your local.conf you'll
find the packed tarball in your downloads directory once the fetch completes.

You can download the tarballs from my website http://www.mlbassoc.com/poky
These are from the latest build which I made on 2014-06-13.  Just put them
in your downloads directory (or mirror).  Don't forget to create the 'done'
stamp when you've downloaded it, e.g.
   % touch downloads/git2_github.com.raspberrypi.firmware.git.tar.gz.done

Good luck - If you have troubles, try the mailing list again as
I'll be away on holiday.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

