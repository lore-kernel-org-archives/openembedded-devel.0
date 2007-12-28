Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J8FZP-000499-Oe
	for openembedded-devel@openembedded.org; Fri, 28 Dec 2007 14:48:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBSDgLf9008391;
	Fri, 28 Dec 2007 13:42:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08072-08; Fri, 28 Dec 2007 13:42:17 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBSDgFSP008375
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 28 Dec 2007 13:42:15 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1376655424.20071228131603@gmail.com>
References: <E1J80sQ-0005Qr-AC@linuxtogo.org>
	<1376655424.20071228131603@gmail.com>
Date: Fri, 28 Dec 2007 13:42:13 +0000
Message-Id: <1198849334.4663.65.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: [oe-commits] org.oe.dev linux-rp-2.6.23: Add atags export	patch for kexec use. Fix spitz suspend key issue. Sync kernel mirror uri	tweak from poky.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2007 13:48:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-12-28 at 13:16 +0200, Paul Sokolovsky wrote:
>    This undos changes I did just a couple of days ago to address
> http://bugs.openembedded.org/show_bug.cgi?id=2515 . Can you please
> enable ext3 module for all devices in your master copies and re-push
> them? While we're at it, enabling NFS support and iptables is worth
> doing too. (Corresponding changes were applied to linux-handhelds-2.6
> for Angstrom release too.)

Sorry, I'll fix the ext3 changes. I'd noticed them and tried to avoid
corrupting them too :/.

NFS is already enabled for most linux-rp machines, I'll change the two
where its not (bootcdx86, hx2000).

iptables actually increases the kernel size by 1100 bytes even when its
compiled as modules :(. The Zaurus kernels are already marginal so this
will probably have to wait.

Regards,

Richard






