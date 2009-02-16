Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LYypv-0000Q1-KF
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 09:28:19 +0100
Received: from gandalf.denix.org ([71.251.57.220]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KF5008PSGRK7SK8@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	16 Feb 2009 02:26:09 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EEFF26B83A8; Mon,
	16 Feb 2009 03:26:07 -0500 (EST)
Date: Mon, 16 Feb 2009 03:26:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090216082607.GA30105@denix.org>
References: <000d01c98f79$3e36e6d0$baa4b470$@com>
MIME-version: 1.0
In-reply-to: <000d01c98f79$3e36e6d0$baa4b470$@com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: image.bbclass broken?
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
X-List-Received-Date: Mon, 16 Feb 2009 08:28:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Feb 15, 2009 at 03:25:24PM +0100, Christian P?ssinger wrote:
> Hello, 
> 
> after a recent 'git pull' of the -dev branch I'm not able to create images.
> 
> I receive the following error:
> 
> | awk: {size = 10240 + $1; print (size > ${IMAGE_ROOTFS_SIZE} ? size :
> ${IMAGE_ROOTFS_SIZE}) }
> | awk:
> ^ syntax 
> | du: write error
> 
> Doing a grep for the line I found it:
> 
> org.openembedded.dev/classes/image.bbclass:110:
> ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = ${IMAGE_EXTRA_SPACE} + $1;
> print (size >                  ${IMAGE_ROOTFS_SIZE} ? size :
> ${IMAGE_ROOTFS_SIZE}) }'`
> 
> After replacing image.bbclass with the one from the -stable branch
> everything worked again. I run OE on an up-2-date Ubuntu Server 8.10.
> 
> Can anyone confirm this behavior?

Christian,

The change was made almost a month ago:
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=d38f1dd24dd6ed94408aa49aad33e46634a129ff
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=9d7586e655755f51be3f09f3da48147b0937c3e1

I haven't heard of anyone having any issues creating images since then.

Now, judging from the error message, I'd guess you have IMAGE_ROOTFS_SIZE 
variable undefined. Normally it is set to a default value by conf/bitbake.conf,
unless it was specifically set in one of the image recipes and/or your
local.conf...

-- 
Denys


