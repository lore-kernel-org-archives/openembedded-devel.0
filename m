Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 239516B6B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 08:41:52 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B14ADD407FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 09:41:52 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2274BD40369
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 09:41:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 09:41:52 +0100 (CET)
Date: Wed, 18 Feb 2015 09:41:47 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150218084140.GB23103@mail.itconsulting-heinold.de>
References: <E5FF0F26CCED3843A9B0899B389686BA42E571@POCITMSEXMB05.LntUniverse.com>
MIME-Version: 1.0
In-Reply-To: <E5FF0F26CCED3843A9B0899B389686BA42E571@POCITMSEXMB05.LntUniverse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Error while building openjdk-6 using meta-java
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
X-List-Received-Date: Wed, 18 Feb 2015 08:41:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2015 at 04:52:06AM +0000, Shalini K P wrote:
> Hi,
> 
>         I m using "git://git.yoctoproject.org/meta-java" layer. I m getting error while compiling java in the compilestep2. Not able to fix this. Below is the error log.
> 
> 
> /home/ubuntu/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/build/bootstrap/jdk1.6.0/bin/java  -client -Xmx896m -Xms128m -XX:PermSize=32m -XX:MaxPermSize=160m -jar /homeError: time is more than 10 years from present: 1104530400000
> | java.lang.RuntimeException: time is more than 10 years from present: 1104530400000

Please use the 1.13.4 version. This version only has the fix for it.

Bye Henning

PS: We should finally remove the other 1.1x versions.

