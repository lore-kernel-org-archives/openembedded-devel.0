Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>)
	id 1JQnrs-0007Yp-4A; Sun, 17 Feb 2008 19:04:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1HI3R2P022804;
	Sun, 17 Feb 2008 18:03:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22781-01; Sun, 17 Feb 2008 18:03:19 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1HI3ITV022790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 17 Feb 2008 18:03:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080217163310.6abf7a95@widy.localdomain>
References: <E1JQkAu-00025r-6H@linuxtogo.org>
	<20080217163310.6abf7a95@widy.localdomain>
Date: Sun, 17 Feb 2008 18:03:19 +0000
Message-Id: <1203271399.8272.72.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev classes/kernel.bbclass: Remove	usage of non-standard variables (DEPLOY_TO) and random renaming of output.
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
X-List-Received-Date: Sun, 17 Feb 2008 18:04:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sun, 2008-02-17 at 16:33 +0200, Paul Sokolovsky wrote:
> On Sun, 17 Feb 2008 15:07:24 +0100
> "rpurdie commit" <openembedded-commits@lists.openembedded.org> wrote:
> 
> > classes/kernel.bbclass: Remove usage of non-standard variables
> > (DEPLOY_TO) and random renaming of output.
> 
> Well, if it's not standard, let's make it standard. 

The is absolutely no need for any new ones and I just made it conform to
existing standards. Binary output goes into DEPLOY_DIR_IMAGE. It should
have a name consistent with other output that ends up there. Other
external tools are still perfectly free to change DEPLOY_DIR_IMAGE and
INITRAMFS_SYMLINK_NAME as needed.

"DEPLOY_TO" just makes a mess of the consistency and efforts other
develops have made and are making. 

> deliver some result to the place expected by the tool, instead of
> making tool dig in external OE structures, which are also subject to
> change, also on per-distro (-user?) level.

Most OE variables are overridable at the user, machine and distro
levels. External tools equate to the "user" and the power of OE means we
don't need any new ways to do this since we already have perfectly good
ones.

Regards,

Richard




