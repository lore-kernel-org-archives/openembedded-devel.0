Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 4337271F23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:22:16 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B87DBD40346;
	Thu, 15 Jan 2015 10:22:12 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id F3278D4025E;
	Thu, 15 Jan 2015 10:22:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Thu, 15 Jan 2015 10:22:11 +0100 (CET)
Date: Thu, 15 Jan 2015 10:22:06 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150115092159.GC10646@mail.itconsulting-heinold.de>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
	<D0DC62E4.8BDA%csmiley@icontrol.com>
MIME-Version: 1.0
In-Reply-To: <D0DC62E4.8BDA%csmiley@icontrol.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Henning Heinold <heinold@inf.fu-berlin.de>,
	Alex de Cabo <alejandro.de-cabo-garcia@congatec.com>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Thu, 15 Jan 2015 09:22:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jan 15, 2015 at 12:23:49AM +0000, Colin Smiley wrote:
> 
> Earlier this week, I’d sent an email to the list about my problems getting
> openjdk-6 to build.
> 
> The short version of my build process is:
> 
> 1) install poky on daisy branch
> 2) install open embedded on daisy branch
> 3) install meta-java on trunk
> 4) attempt to bitbake java-test-image (removing openjdk-7 line).
> 5) Wait for java CurrencyData failure, fix it manually.
> 6) re-reun bitbake java-test-image
> 
> At this point, my build fails running qemu-i36. The image will use up all
> available memory on the system, and then get killed by the linux oom
> killer. I have tried this on a variety of OS, VM, physical machine, and
> memory combinations. The result is always the same.
> 
> Is the problem I’m seeing the same as what you’re describing below?

Hi,

as I worte in another email try to revert to an older qemu version locally.

> 
> Also, is there an update to meta-java to fix the CurrencyData problem?
> 

Unfornatly no,

someone has to update the icedtea-native recipes to a newer version. Which
might be some work of the patches we apply.

Bye Henning

