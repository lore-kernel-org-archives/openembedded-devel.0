Received: from [209.85.128.190] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4QfC-000422-2R
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 01:50:26 +0100
Received: by fk-out-0910.google.com with SMTP id 18so2167062fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 16:45:34 -0800 (PST)
Received: by 10.86.81.8 with SMTP id e8mr7020901fgb.59.1197938734547;
	Mon, 17 Dec 2007 16:45:34 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 31sm18373520fkt.2007.12.17.16.45.30
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2007 16:45:30 -0800 (PST)
Date: Tue, 18 Dec 2007 02:50:52 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1672988162.20071218025052@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <47671326.3090300@whitby.id.au>
References: <47671326.3090300@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pfalcon: revert r5dc6982e... vfat nls modules are not for task-base-kernel26
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
X-List-Received-Date: Tue, 18 Dec 2007 00:50:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Tuesday, December 18, 2007, 2:24:06 AM, you wrote:

> <CIA-34> pfalcon org.oe.dev * r5dc6982e... / (1
> packages/tasks/task-base.bb):
> <CIA-34> task-base: Add NLS modules for VFAT support.
> <CIA-34> * Add to task-base-kernel26, as vfat is pretty basic feature.
> <CIA-34> Worth refactoring to vfat feature still, I guess.

> You guessed right.

> kernel26 is not a kitchen sink where you can just add vfat-related nls
> modules that are not strictly required for booting a 2.6 kernel.

  As you perfectly know, defining what is strictly required is yet
long task to do for OE and specific machine in it. Whereas Angstrom
RCs are something to do right now.

> Your addition has just *bloated* the rootfs for *every* 2.6 machine,

  No, it did not. It just added 10k of uncompressed modules.

> including those that have no possible way of ever mounting an external
> memory stick at all, let alone a vfat-formatted one.

> vfat is *not* a basic feature that should be enabled for all 2.6 kernel
> machines.  If you want vfat nls modules, then create a vfat feature
> (just like there is an ext2 feature).  Do not pollute the basic kernel26
> feature with this stuff.

  Yeah, I have hundreds of other items on my list too ;-).

> And the comment about "# If you don't need VFAT support - don't enable
> them in defconfig." is not applicable, because there are machines that
> want vfat-related nls modules available in the feed as a downloadable
> package, but not in the initial rootfs.  Therefore they need to be in
> the defconfig, but certainly should not be in task-base-kernel26.

  Again, lots of things need to be, etc. But for now (as is), my doing it
right won't help any machine except some small nslu2. Because vfat of
course will be a distro feature, and so far 1) only nslu overrides
angstrom's DISTRO_FEATURES. Also, there're following things to
consider:

2) It's unclear if vfat feature should ship only 40-50K of kernel
modules, or truly bloat it with dosfsutils. Maybe fdisk?
3) There's also need to clear off machine configs from this stuff,
including proverbial fic-gta*.conf.


  So, I'm actually glad that you care about such stuff. So, while I
planned to do all stuff above via RFCs over following Angstrom RCs,
I'd be glad to just do another quick fix now as you request and
offload tasks 1-3 above to you. How that sounds?


> I expect you to revert this change and do it properly, or not do it at all.

> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



