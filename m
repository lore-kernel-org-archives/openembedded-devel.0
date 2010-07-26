Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OdWdj-0002bf-VP
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 00:59:21 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OdWdS-0004Ck-IO from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 15:59:02 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 26 Jul 2010 15:59:02 -0700
Received: from [172.30.80.16] ([172.30.80.16]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 26 Jul 2010 16:59:00 -0600
Message-ID: <4C4E1332.9080804@mentor.com>
Date: Mon, 26 Jul 2010 15:58:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 26 Jul 2010 22:59:01.0030 (UTC)
	FILETIME=[2305BC60:01CB2D16]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/7] Make multi-machine toolchains to co-exist (revised)
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
X-List-Received-Date: Mon, 26 Jul 2010 22:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Hi
> 
> Following series of patches are for making multi-machine toolchains co-exist with
> new cross staging for toolchain.
> 
> It changes the toolchain triplet from ${TARGET_ARCH}-${VENDOR}-${OS} to 
> ${TARGET_ARCH}-${CPU_SUB_TARGET}_${VENDOR}-OS
> 
> which means that a toolchain for armv7 is called armi-v7a_oe-linux-gnueabi-*
> and for armv5te its called arm-v5te_oe-linux-gnueabi-*

Sorry to come in late here, but why can't we instead populate 
sysroot/../usr/bin/${MACHINE_SYS}/ and keep the old toolchain triplet?

-- 
Tom Rini
Mentor Graphics Corporation


