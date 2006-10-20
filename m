Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gb38I-00039Q-D9
	for openembedded-devel@openembedded.org; Sat, 21 Oct 2006 00:46:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9KMdJgN023853
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 23:39:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23739-03 for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 23:39:17 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9KMdHtx023845
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 23:39:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <432beae0610201458l1bde9ca8v7877a6964e94e710@mail.gmail.com>
References: <595433076.20061021003331@gmail.com>
	<432beae0610201458l1bde9ca8v7877a6964e94e710@mail.gmail.com>
Date: Fri, 20 Oct 2006 23:39:16 +0100
Message-Id: <1161383956.6639.84.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Preferring tar.bz2 over tar.gz if there's a choice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 22:46:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-10-20 at 14:58 -0700, Justin Patrin wrote:
> What exactly are you referring to? Which distributed files? OE doesn't
> really distribute anything but an OE db and that's one-time downloaded
> when starting.
> 
> If you mean the images distributed from OE, that's a distribution
> choice and OZ in particular can't just make the choice to switch
> without adding a static binary of bzip2 (for flashing) and changing
> its flashing script.

I think Paul means things other people distribute i.e. packages
referenced in SRC_URIs. He's suggesting we prefer bz2 over gz given a
choice which seems like a good idea.

Cheers,

Richard



