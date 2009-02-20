Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LaIwq-000849-60
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 01:08:58 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFC009438A2DSYB@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Feb 2009 18:06:08 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3C1F26B83A8; Thu,
	19 Feb 2009 19:06:02 -0500 (EST)
Date: Thu, 19 Feb 2009 19:06:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090220000602.GE22652@denix.org>
References: <1235086132-21843-1-git-send-email-clarson@kergoth.com>
	<20090219234114.GD22652@denix.org>
	<A1953057-56C2-4B3D-BF40-9778AC3D9139@mvista.com>
MIME-version: 1.0
In-reply-to: <A1953057-56C2-4B3D-BF40-9778AC3D9139@mvista.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Christopher Larson <clarson@mvista.com>
Subject: Re: [PATCH] bitbake.conf: rework FILESPATH generation.
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
X-List-Received-Date: Fri, 20 Feb 2009 00:09:14 -0000
X-List-Received-Date: Fri, 20 Feb 2009 00:09:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 19, 2009 at 04:58:25PM -0700, Christopher Larson wrote:
>
> On Feb 19, 2009, at 4:41 PM, Denys Dmytriyenko wrote:
>
>> On Thu, Feb 19, 2009 at 04:28:52PM -0700, Chris Larson wrote:
>>> From: Chris Larson <clarson@mvista.com>
>>>
>>> Rework FILESPATH generation to be done in bitbake.conf, avoiding the
>>> confusion about it being in multiple places.  Adds FILESPATHBASE and
>>> FILESPATHPKG which can be manipulated rather than manipulating FILESPATH
>>> directly.
>>>
>>> One usage possibility:
>>>
>>> FILESPATHBASE =. "${TOPDIR}/files:"
>>>
>>> Which would let me provide a custom busybox config for this build by
>>> copying the defconfig from the openembedded metadata into my
>>> build/files/busybox-1.0/ directory, for example.
>>
>> Can you please provide more details on this example? Thanks.
>
> Normally, all paths in FILESPATH are relative to FILE_DIRNAME, the location 
> of the recipe being operated against.  With this change, you can place 
> files which are in SRC_URI as file:// urls in paths relative to other 
> locations.
>
> You can do package customizations via changes to file:// files without 
> mucking up the local clone of the openembedded repository.
>
> My intent is to create a class to facilitate running make menuconfig on 
> your kernel and busybox, and retain those changes.  Today, people either go 
> into workdir and customize it there, but those changes are lost when you 
> clean the package, or they overwrite files in the metadata repository, 
> which can lead to conflicts, and is just all around more annoying to work 
> with.  It's better to be able to have per build or site wide overrides of 
> those files.
>
> Does that answer your question?

That would be a very welcome addition! Thanks.

-- 
Denys


