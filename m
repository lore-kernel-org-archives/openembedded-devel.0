Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NmSsn-0005BP-Om
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 15:15:38 +0100
Received: by fxm20 with SMTP id 20so302546fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 06:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=SwFrgkAFv1fw2jaKxRDMDGVRBifBdJxauVxJdjf0QTk=;
	b=c3ho/t+FE2cGZImwzLeYhx4HsGTX223Y1qMg90bdNJnBmoLeFYja/cYe9Fn6zUfQ84
	yazjF91QYMLMsujt5WyN++WLxV6kPJVOZu7QmDRM5+J5Du5iAKnYEigpJTFC3+Co3TE6
	RDwtMzAQdCF0/nCvw1r+Uyy4SUIm7emuNmpY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fxcj2qEvKAIpnstv00kJU9iLeTjvzqf05FpUppUIuAfvxeSnSbbMIoBSxQ6dsiSecf
	zoCHurPBGg9TkjSGaTsHImIwetzuw1S7FlO7Wv4KDZZMsKTk+cRkDN5AcRc3jlP0SbRE
	aTuWZGKAFKwbaCS1cPlAcw5jNpP9rk4oH/fcI=
Received: by 10.87.45.20 with SMTP id x20mr9678032fgj.63.1267539163132;
	Tue, 02 Mar 2010 06:12:43 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2890978fxm.11.2010.03.02.06.12.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Mar 2010 06:12:41 -0800 (PST)
Date: Tue, 2 Mar 2010 15:13:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100302141306.GF3206@jama>
References: <20100301152627.GT3206@jama>
	<201003011651.37372.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <201003011651.37372.holger+oe@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building ubi/ubifs images
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
X-List-Received-Date: Tue, 02 Mar 2010 14:15:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2010 at 04:51:37PM +0100, Holger Hans Peter Freyther wrote:
> On Monday 01 March 2010 16:26:27 Martin Jansa wrote:
> 
> > NOTE: Running task 7195 of 7198 (ID: 10,
> > /home/shr/shr-unstable/openembedded/recipes/images/shr-lite-image.bb,
> > do_rootfs) *** glibc detected *** mkfs.ubifs: double free or corruption
> > (!prev): 0x000000000060d0c0 *** ======= Backtrace: =========
> > /lib/libc.so.6[0x2b4e55501948]
> > /lib/libc.so.6(cfree+0x76)[0x2b4e55503a56]
> > mkfs.ubifs[0x403bc4]
> > mkfs.ubifs[0x4050ca]
> > /lib/libc.so.6(__libc_start_main+0xe6)[0x2b4e554ac1a6]
> >
> 
> In general it might be nice to build mkfs.ubifs with debug information and 
> send the backtrace upstream and ask for help to resolve the issue?

Hi,

so I guess I'm not the only one..

Sent upstream
http://lists.infradead.org/pipermail/linux-mtd/2010-March/029271.html

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


