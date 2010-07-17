Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZuv4-0001y7-Vi
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 02:06:19 +0200
Received: by bwz10 with SMTP id 10so1683277bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 17:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rX2rJSA5fwdmFiQL1HJ6VSI0/65apJiJx+MUC76V2wU=;
	b=wXNeg85KiVkctb3Sx10+DMvX3cuoNvC2YIbjip1z0aAexQExNeNlHnkrryb7HT1NmT
	82TCJjGxYFLADQLNOREXTSPKlRdbQK57dF9abeELpuwygQyKU3z28Xvfp1ZvmgcsMQn9
	9LKUQ2pRw/k0gQNTgsYly6J+JvytTQs5KXETw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=yCac4LIgxthJEKuB4mSsZ6WkYKJoqUSnG/gFWXbjS9HORw8Mxux2WcG2N7hMAN+oMv
	3ZzHgVmIbSIlNBB+PzKRsjyS58x1dsmPhBkGzUUrXI02r0Pe6hKMdmWHN5bs+spYmhPL
	iPc7ktZoKLCk7qaQDia/+H+RrQStGEp1yA2Co=
Received: by 10.204.24.1 with SMTP id t1mr1465273bkb.178.1279325174867;
	Fri, 16 Jul 2010 17:06:14 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id 24sm13190747bkr.7.2010.07.16.17.06.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 17:06:14 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZuup-00035h-Va; Sat, 17 Jul 2010 02:06:03 +0200
Date: Sat, 17 Jul 2010 02:06:03 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100717000603.GK23169@mx.loc>
References: <AANLkTikZkRU-dCiBNlVdZ6XYsdBk3MjZBksexc6JtSAT@mail.gmail.com>
	<i1qodg$i28$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i1qodg$i28$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: busybox mdev
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
X-List-Received-Date: Sat, 17 Jul 2010 00:06:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 17, 2010 at 01:02:08AM +0200, Koen Kooi wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On 16-07-10 16:51, George C. Huntington, III wrote:
>> how do i make a distribution use mdev instead of udev?
>
>You mean "how do I make my image use mdev instead of udev?", right?

IMAGE_DEV_MANAGER = "busybox-mdev"
in your local.conf (what's the reason micro-base uses udev instead of
mdev, btw?)


