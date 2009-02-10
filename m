Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LX2GY-00064b-J0
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 00:43:46 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LX2FY-0004YG-1g
	for openembedded-devel@openembedded.org; Tue, 10 Feb 2009 23:42:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 10 Feb 2009 23:42:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Feb 2009 23:42:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 11 Feb 2009 00:42:34 +0100
Message-ID: <gmt3da$4r1$1@ger.gmane.org>
References: <20090210204817.GH11815@smtp.west.cox.net>	<03499B67-9FFC-43D7-91C4-A92ECDB55370@student.utwente.nl>
	<20090210225940.GI11815@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <20090210225940.GI11815@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Tue, 10 Feb 2009 23:43:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10-02-09 23:59, Tom Rini wrote:
> On Tue, Feb 10, 2009 at 11:43:07PM +0100, Koen Kooi wrote:
>> Op 10 feb 2009, om 21:48 heeft Tom Rini het volgende geschreven:
>>
>>> Hey all.  I'd like to commit the following patch.
>> Looks ok, one minor featurerequest:
>>
>>
>>> +IMAGE_CMD_ubi = "echo \[ubifs\]>  ubinize.cfg ; echo mode=ubi>>
>>> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/$
>>> {IMAGE_NAME}.rootfs.ubifs>>  ubinize.cfg ; echo vol_id=0>>
>>> ubinize.cfg ; echo vol_type=dynamic>>  ubinize.cfg ; echo
>>> vol_name=rootfs>>  ubinize.cfg ; echo vol_flags=autoresize>>
>>> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/$
>>> {IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}&&  ubinize -o $
>>> {DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS}
>>> ubinize.cfg"
>> echo vol_name=${MACHINE}-rootfs would be nice :)
>
> Really?  iirc from the mounting commandline stuff that means you have to
> pass in machine-rootfs rather than just rootfs, ie
> root=ubi0:machine-rootfs not root=ubi0:rootfs

You'll have to update your bootloaders anyway, so cutting down on 
'flashed wrong machine' errors is a big win :)

regards,

Koen



