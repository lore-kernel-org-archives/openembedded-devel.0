Received: from out4.smtp.messagingengine.com ([66.111.4.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjensen@gmx.de>) id 1R1A7T-0004rU-Hn
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 06:52:15 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id B716824E0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2011 00:39:41 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Wed, 07 Sep 2011 00:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:subject:in-reply-to
	:message-id:references:mime-version:content-type; s=smtpout; bh=
	7IqblISyFxtXwtm32V9RYp73nQk=; b=P9ogHrERcD91ofuIzfTNGV5PNyh3waBk
	nqPzG+0+xsGVOKbwajqhj2jf79BUiryNzgKyfr5UxkmiTBJamW1uccINeKQPgHvB
	nEZLThK9x4uPiIWEO0RgcRTXtSnZQ6QVswHmTQbQr98RfuOKSpNLsuPHC9K/W59b
	44Flbv1vvbw=
X-Sasl-enc: RSZuGXOKuE+y/JGdiCw1jGLr0Ax4AwGN9IxbBNdHG8A+ 1315370380
Received: from newslug (hnvr-4dbd1593.pool.mediaWays.net [77.189.21.147])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 0C496B60F4D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2011 00:39:39 -0400 (EDT)
Date: Wed, 7 Sep 2011 06:45:42 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110824093802.194230@gmx.net>
Message-ID: <alpine.LNX.2.00.1109070637200.6141@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1108232320390.6141@asterix.crazy-teaparty.dyndns.org>
	<201108241102.05565.ml@vdm-design.de>
	<20110824093802.194230@gmx.net>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
Subject: Re: bitbaking aufs
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
X-List-Received-Date: Wed, 07 Sep 2011 04:52:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Wed, 24 Aug 2011, Vitus Jensen wrote:

> On Wed, 24 Aug 2011 11:02:05 +0200 Thomas Zimmermann wrote:
>> On Wednesday, August 24, 2011 00:11:39 Vitus Jensen wrote:
>>>
>>> I would like to use a layered filesystem in our ppc603e-based machine:
>>> the rootfs built from openembedded would be read-only, any
>>> customizations go to a writable filesystem and should the need
>>> occur to start fresh all I
>>> need is a mechanism to remove the contents of the writable filesystem.
>>>
>>> In openembedded (2011.03) there is unionfs and aufs
>>> (http://aufs.sourceforge.net/), aufs is more actively developed so
>>> I would like to use that.
...

>> In my opinion a standalone aufs recipe is not possible, because the
>> kernel needs to be patched and you have to use the specific branch
>> for your kernel version.
>
> In this case (and in the meantime I came to the same conclusion) it is 
> easiest to use the already patched kernel tree from aufs.sourceforge, 
> create a linux-aufs_2.6.36.bb and use that for my device.  Or have a 
> second look to union-mount (http://valerieaurora.org/union/) and build a 
> recipe for that tree.

FYI:

Built a linux-unionmount 2.6.35 kernel recipe plus 
initramfs-module-unionmount and installed that.  I did encounter problems 
to mount the upper-half (filesystems ext2 and jffs2 weren't accepted) and 
when googling for help I found that the race for kernel tree acceptance is 
still open: it might be overlayfs and not union-mount.  Let's wait some 
years and see :-(

As I need a working solution now and aufs2 is actively developed 
(ready-to-be-made kernel trees up to 3.0.0) I will now create a 
linux-aufs2 bb.

Bye,
    Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


