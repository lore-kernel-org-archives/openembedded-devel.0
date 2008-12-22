Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LEo5f-00081m-RF
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Dec 2008 17:57:11 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6142E8400A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2008 17:52:18 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CCD7584009E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2008 17:52:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e179039037.adsl.alicedsl.de
	[85.179.39.37]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2008 17:52:17 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 496B33C09B; Mon, 22 Dec 2008 17:52:17 +0100 (CET)
Date: Mon, 22 Dec 2008 17:52:17 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081222165216.GA5608@rhein.zuhause.netz>
References: <d1b08f940812220656u73035a94i83aa41d4480ccf53@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d1b08f940812220656u73035a94i83aa41d4480ccf53@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: libc and ARM_INSTRUCTION_SET
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
X-List-Received-Date: Mon, 22 Dec 2008 16:57:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 22, 2008 at 03:56:20PM +0100, Andrea Adami wrote:
> Hi,
> I'm testing uclibcgnueabi on c7x0.
> 
> Two doubts:
> 
> 1) arm / thumb
> 
> Now armv5te machine defaults to "thumb" and uclibc fails do_compile:
> http://tinderbox.openembedded.net/public/logs/2601805.txt
> 
> My solution offhand is to set ARM_INSTRUCTION_SET = "arm" in
> uclibc.inc but perhaps someone can sort out a proper patch.
> 
> I checked how the settings are for glibc and well, the same string is in:
> glibc.inc and (why?) in glibc-2.5.bb and glibc-2.7.bb which are
> including glibc.inc...
> 
> 2) is it actual and correct that uclibc and klibc are machine-specific?
> 
> #recent versions uclibc require real kernel headers
> PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> Well, for klibc I'd say yes, it's bound to the kernel but still...I ask.
> 
> Thanks in advance
> 
> Andrea

Philipp Blundel told me that this is probably fixed in the gcc-4.4 branch,
 unfornatly I didnt test it yet my self, for now it would be okay to turn
off thumb.

Bye Henning


