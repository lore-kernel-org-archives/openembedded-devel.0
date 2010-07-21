Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObhDP-0001C0-F5
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 23:52:37 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObhD8-0007FB-VC from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 14:52:18 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 21 Jul 2010 14:52:18 -0700
Received: from [172.30.80.5] ([172.30.80.5]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 21 Jul 2010 15:52:17 -0600
Message-ID: <4C476C0A.5090606@mentor.com>
Date: Wed, 21 Jul 2010 14:52:10 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 21 Jul 2010 21:52:17.0900 (UTC)
	FILETIME=[FCE7D2C0:01CB291E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Wed, 21 Jul 2010 21:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Hi
> 
> The following 4 patches are based on  Jushua's work in poky to get rid of
> cross dir and install the toolchain in  native sysroot.
> 
> I have done native-sdk-builds for uclibc and eglibc. It could build the images
> and the images booted fine in qemu on mips and arm.
> 
> I would  appreciate if someone could lend a hand in testing these patches
> 
> And as we have changed tmpdir layout with this patch I have also bumped ABI
> which means tmp has to be nuked before you try these patches.
> 
> Please review/ack/nack

Thanks alot for doing this!  I've tested meta-toolchain + beagleboard on 
angstrom and minimal, acks coming.

-- 
Tom Rini
Mentor Graphics Corporation


