Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ORTfl-0005sU-DF
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:23:40 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ORTbH-0002b5-Un from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 10:18:59 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 23 Jun 2010 10:18:59 -0700
Received: from [172.30.80.125] ([172.30.80.125]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 23 Jun 2010 11:18:58 -0600
Message-ID: <4C2241FE.1040008@mentor.com>
Date: Wed, 23 Jun 2010 10:18:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>	<hvl1uc$bol$1@dough.gmane.org>	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>	<hvsjso$8bh$1@dough.gmane.org>	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>	<AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
	<20100623171524.GA5535@gmail.com>
In-Reply-To: <20100623171524.GA5535@gmail.com>
X-OriginalArrivalTime: 23 Jun 2010 17:18:58.0697 (UTC)
	FILETIME=[2AA70790:01CB12F8]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a question)
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
X-List-Received-Date: Wed, 23 Jun 2010 17:23:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:

> some architectures may not support particular version of say gcc but
> still if that architecture is supported by a given distro then it should
> define the required version of say gcc in distro.conf with override
> 
> for instance check conf/distro/include/sane-toolchain.inc which is serving
> a few distributions overrides default compiler versions for AVR32
> you need to do something same for nios2

In short, some of us would love it if we could all rely on either 
sane-toolchain.inc or at least everyone using the same variables for 
picking a toolchain so that the "We must use x/y/z tools" could move to 
tune-ARCH.inc.  But there's probably some issue that doesn't come to 
mind with moving that override control to the machine level.

-- 
Tom Rini
Mentor Graphics Corporation


