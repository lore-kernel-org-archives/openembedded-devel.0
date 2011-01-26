Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiCKn-0001kq-OR
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 21:51:21 +0100
Received: by bwz10 with SMTP id 10so1720219bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 12:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hOawmBfJUjKtc/8QkgXy3B8j6NoexCAVIlhACLxcd54=;
	b=WISikYZF6lAfXpOb1mJ89vV5ZPe6/cjvEDS9mRbh9kPpcB/J8s6DkslMNzTo7t03XO
	hfW8bbRAEgOdm8sxXxaCZbyAkVSaNjbtdOqPiuUZRPF4DMaQmh1TAKhEDO92B8HYAAYo
	wTz2dARRu0jd0hewzk9nGhvbL908GCqA9RhTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Te+phV+9H4FeFGUjxbhe3CbtmsLt+tD5IOPntV7Nx7IhCZbyQfZZ/38DeV5zpM5SQz
	TsQqZROS2cgZHz0x3r2J9zbjtEUwNUVxRCmLUO0qgHMnDA5N6cePJWYQ16cEwtOcRd1w
	8BsWj21inKdDouQB+pmU/TccIlt6ok5tMujgI=
Received: by 10.204.63.206 with SMTP id c14mr840922bki.95.1296073774238;
	Wed, 26 Jan 2011 12:29:34 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id b6sm7721865bkb.22.2011.01.26.12.29.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 12:29:33 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PiBzf-0003RB-GO; Wed, 26 Jan 2011 21:29:31 +0100
Date: Wed, 26 Jan 2011 21:29:31 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110126202931.GD714@mx.loc>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
	<1296065612-9637-8-git-send-email-rep.dot.nop@gmail.com>
	<4D407550.8040903@mentor.com> <4D407B96.2010801@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D407B96.2010801@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 7/9] kernel.bbclass: simplify "if image" condition
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
X-List-Received-Date: Wed, 26 Jan 2011 20:51:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 26, 2011 at 12:52:54PM -0700, Tom Rini wrote:
>On 01/26/2011 12:26 PM, Tom Rini wrote:
>>On 01/26/2011 11:13 AM, Bernhard Reutner-Fischer wrote:
>>>Anything that expands image to any false value should not set
>>>INITRAMFS_TASK (instead of just "" or None).
>>>
>>>Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>>>---
>>>classes/kernel.bbclass | 2 +-
>>>1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>>diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>>>index ea1daf6..d0608e5 100644
>>>--- a/classes/kernel.bbclass
>>>+++ b/classes/kernel.bbclass
>>>@@ -18,7 +18,7 @@ python __anonymous () {
>>>bb.data.setVar("DEPENDS", depends, d)
>>>
>>>image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
>>>- if image != '' and image is not None:
>>>+ if image:
>>>bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
>>>
>>>machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>>
>>Er, right below these lines it still does:
>>INITRAMFS_IMAGE ?= ""
>>INITRAMFS_TASK ?= ""
>>
>>Which would be a problem yes? Or is there some pythonism I'm forgetting?
>
>OK, after some quick IRC conversation, my only concern is the message
>wasn't clear to me, but the changes are fine.  Could it be expanded
>to say:
>Remove some checks because <existing message more or less> means they
>aren't necessary?

Remove superfluous checks since testing for any False, None or empty object
yields False in python.

I'll phrase it like this. Thanks!
>
>Acked-by: Tom Rini <tom_rini@mentor.com>
>


