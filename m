Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LX1b1-0008Bt-48
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 00:01:53 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090210225940.YXSJ12540.fed1rmmtao106.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Feb 2009 17:59:40 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id ENzh1b0091E665w03NzhyZ; Tue, 10 Feb 2009 17:59:41 -0500
X-Authority-Analysis: v=1.0 c=1 a=xH9YHErz6UQA:10 a=SkQkoGgxQdMA:10
	a=XYVFzeZhw_1cFryQpogA:9 a=pdH8Nv3591DFixng9EZvo9m6IqYA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 10 Feb 2009 15:59:40 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090210225940.GI11815@smtp.west.cox.net>
References: <20090210204817.GH11815@smtp.west.cox.net>
	<03499B67-9FFC-43D7-91C4-A92ECDB55370@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <03499B67-9FFC-43D7-91C4-A92ECDB55370@student.utwente.nl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Add ubi volume image support, fix ubifs
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
X-List-Received-Date: Tue, 10 Feb 2009 23:02:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 10, 2009 at 11:43:07PM +0100, Koen Kooi wrote:
>
> Op 10 feb 2009, om 21:48 heeft Tom Rini het volgende geschreven:
>
>> Hey all.  I'd like to commit the following patch.
>
> Looks ok, one minor featurerequest:
>
>
>> +IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >>  
>> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/$ 
>> {IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >>  
>> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo  
>> vol_name=rootfs >> ubinize.cfg ; echo vol_flags=autoresize >>  
>> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/$ 
>> {IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o $ 
>> {DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS}  
>> ubinize.cfg"
>
> echo vol_name=${MACHINE}-rootfs would be nice :)

Really?  iirc from the mounting commandline stuff that means you have to
pass in machine-rootfs rather than just rootfs, ie
root=ubi0:machine-rootfs not root=ubi0:rootfs

-- 
Tom Rini


