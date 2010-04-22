Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1O4xOd-0006hS-JI
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 16:28:53 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 1F07C6839D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 18:25:08 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Apr 2010 18:05:21 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201004221805.21986.khimov@altell.ru>
X-Altell-MailScanner-ID: 1F07C6839D.26EB9
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Sergey Lapin : busybox: prevent postinst script from failing
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
X-List-Received-Date: Thu, 22 Apr 2010 14:28:53 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

> recent addition in rootfs_ipk.bbclass which runs postinst scripts with
> -e option, while very useful, prevents busybox from configuring at image
> build time. It will be configured at first image boot if your file
> system is writable, but in case of e.g. squashfs, that will be fatal
> error. This commit prevents postinst to fail, so busybox will create
> all needed links at image build time.

I don't think this is the way to solve it, because alternatives setup should 
work on build machine when everything is correct in packages. Most probably it 
fails because there is some other package installed which provides some 
program that is present in busybox, but that package doesn't use alternatives 
for (some of) its binaries.

Essentially, this is a bug in a package providing "full" version of the 
binary. You can easily debug those if you add "-x" switch to sh invocation in  
rootfs_ipk.bbclass, you'll see then where it fails in image do_rootfs log.

I've catched some of those in util-linux-ng and will push some patches later 
today.


