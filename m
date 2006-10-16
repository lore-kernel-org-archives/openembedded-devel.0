Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GZIGL-0006CP-7W
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 04:31:33 +0200
Received: by nf-out-0910.google.com with SMTP id l23so2320753nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 19:24:50 -0700 (PDT)
Received: by 10.49.93.13 with SMTP id v13mr11301121nfl;
	Sun, 15 Oct 2006 19:24:50 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id p72sm480371nfc.2006.10.15.19.24.47;
	Sun, 15 Oct 2006 19:24:48 -0700 (PDT)
Date: Mon, 16 Oct 2006 05:24:49 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <686010435.20061016052449@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <1160951360.8144.2.camel@lieve>
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200610151544.28474.openembedded@hrw.one.pl>
	<161534574.20061016010222@gmail.com>
	<1160951360.8144.2.camel@lieve>
MIME-Version: 1.0
Subject: Re: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
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
X-List-Received-Date: Mon, 16 Oct 2006 02:31:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, October 16, 2006, 1:29:20 AM, you wrote:

> Op ma, 16-10-2006 te 01:02 +0300, schreef Paul Sokolovsky:

>>    If it can be made so clean, why do we have so tangled configs for
>> many machines, at least for PocketPC-based?

> Historical reason, and we'd welcome a cleanup

>>  Do we need more strict
>> policy of what goes into machine configs and about the order of
>> variables? 

> Yes :)

  Ok, to start with, I've reordered vars in h2200.conf & h4000.conf,
(plus moved weird-looking LAB setting to include file). Please tell me
if it looks ok, and I'll apply it to other files (pocketpc-based
devices at least).

>> For example, I doubt it's good idea to have IMAGE_FSTYPES
>> in machine configs - how that can be machine's property? 

> Some bootloaders can be quite demanding, like the one for the spitz
> machine only likes tar.gz, not tar.bz2. It should be overridable,
> though.

  Ok. But again, for any PocketPC one would use jffs2 for flash
install, tar.bz2 for secondary storage (card) install, ext2 for
initrd-like booting. As it is consistent for all devices, it can be
omitted from machine files, and controlled by distro and local.conf.
If there will be added support to build adhoc image reflash formats of
native pocketpc bootloaders, I agree, it is worth to add it
per-device, at least, as a kind of annotation.

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



