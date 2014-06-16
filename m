Return-Path: <gada.kashyap@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0420D6B438
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 05:51:37 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id l4so2792181lbv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jun 2014 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oA1fhtISIqyLH1qdvAup8CAN1XNAwzkCOo8fHqQ+Qkw=;
	b=iX6TL+WqRnUbQimBTSBWiFRctEV5LAD26YxNoHR++Q8BpjO4fgKECDtlkXyqIu4jaZ
	mLmP0CovnLpgrF0pRHgvmjuQv2b0qMksqVFl9CrUaHUSY3bVI9Q4KKxqLrot9iCe9SEM
	rdOfKpyGE+MNWy+aCYKc2dYggD6IkKZLjl6/+kmgGqfkfK543MymL3G0RY0cE6FrQAAI
	F+67HR9pJWn96xZnX1GhNIKGI43LE4QiwvbTfbsB5zTuxYPa134agHMgmNTdKvu4Ctnx
	68e1s5yZKJx8oJIlxC7oW3Rs1omUQBAjZRUXFQCnRDcCyhyuGQ0YCyVGzoQLn5R8Mq7W
	DiWg==
MIME-Version: 1.0
X-Received: by 10.112.140.41 with SMTP id rd9mr11990096lbb.31.1402897897061;
	Sun, 15 Jun 2014 22:51:37 -0700 (PDT)
Received: by 10.114.29.132 with HTTP; Sun, 15 Jun 2014 22:51:37 -0700 (PDT)
Date: Mon, 16 Jun 2014 11:21:37 +0530
Message-ID: <CANJXcUaZsRM-QnQx4rTO+BzNCAC7fiu4UhjxhpvQPUe=+RJRxQ@mail.gmail.com>
From: Kashyap Gada <gada.kashyap@gmail.com>
To: gary@mlbassoc.com, openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 16 Jun 2014 05:51:40 -0000
Content-Type: text/plain; charset=UTF-8

Message: 2
Date: Sat, 14 Jun 2014 06:55:53 -0600
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Rasperry Pi bcm2835-bootfiles-20140221-r3 do_fetch
Message-ID: <539C4659.2020009@mlbassoc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

On 2014-06-14 06:41, Kashyap Gada wrote:
> Hello,
> The following do_fetch of bcm28353-bootfiles-20140221-r3 is taking
> considerable amount of time. I have kept system monitor applcation on on
my
> ubuntu workstation which shows download at about 114KBps.

This is going to take a while as it's around 3GB packed.

>
> I want to know if this do_fetch task is interrupted and bitbake is stopped
> as I have to close down my office, will bitbaking the next time i start
the
> process continue download from where I stopped or will start fetching for
> the package from 0 again.
>
>
> Also can it be downloaded separately, if yes where can I find the link to
> it and where do i have to store it once its downloaded.

If you set BB_GENERATE_MIRROR_TARBALLS ?= "1" in your local.conf you'll
find the packed tarball in your downloads directory once the fetch
completes.

You can download the tarballs from my website http://www.mlbassoc.com/poky
These are from the latest build which I made on 2014-06-13.  Just put them
in your downloads directory (or mirror).  Don't forget to create the 'done'
stamp when you've downloaded it, e.g.
   % touch downloads/git2_github.com.raspberrypi.firmware.git.tar.gz.done




Thanks for your reply, but you missed out on the do_fetch restarting issue.
> I want to know if this do_fetch task is interrupted and bitbake is stopped
> as I have to close down my office, will bitbaking the next time i start
the
> process continue download from where I stopped or will start fetching for
> the package from 0 again.???

