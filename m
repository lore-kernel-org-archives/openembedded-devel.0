Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OxYDV-0006Dj-OI
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 06:43:02 +0200
Received: by iwn2 with SMTP id 2so4030423iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 21:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=6FWhPFUr6AcH2dTYAOTV0NzYXD2OoL1Si5+l4ZBnBSo=;
	b=nt4PF/3H34zQ5F8kpC3zvhA6iFWNSslDO09hwVW6tqzdINFFt5d03nBDL+CNRFu6v9
	DFW+lRBQbMB3GnKBpUEi+oMZT21yFV0OaNQNQhwGra+4QpEKsC+RukrUVP//oXLkD6dW
	AwOLeyRT6f5Je3GuGLYyyLG2lvmvfo+OHFh0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=nKMNFM1sMw8iQ0jGTzIJWRnizBgj5r8P+37rwogCntSy9qCPrD5wdiBHnnRQnMTxZP
	n2fiNGt7+yHUmjDozY99m7Kg54M4Ex/5TkacCPLTt8sI5mSkkTUefrpzE59ebadgqC/x
	P6vIIuK492NjIq1lvMUwgiFdYtcqrJsHBqHv4=
Received: by 10.231.19.197 with SMTP id c5mr461142ibb.151.1284957726638;
	Sun, 19 Sep 2010 21:42:06 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n20sm7131496ibe.5.2010.09.19.21.42.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Sep 2010 21:42:06 -0700 (PDT)
Date: Sun, 19 Sep 2010 21:39:11 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100920043911.GA7809@gmail.com>
References: <AANLkTinFs+k=b-UowmKXY9kWFvSdv772K1n7B+uzkJHL@mail.gmail.com>
	<AANLkTinKOg2beadzpOyLQ+eQtQa4KH5KG11OyF_jCC64@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinKOg2beadzpOyLQ+eQtQa4KH5KG11OyF_jCC64@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FA526 / CNS2132 / TS-7500 build configuration
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
X-List-Received-Date: Mon, 20 Sep 2010 04:43:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (19/09/10 19:18), R.T. McGee wrote:
> The Faraday FA526 core is used in ARM processors like the Semi STR8132
> / Cavium CNS2132 which is in my Technologic Systems TS-7500 board in
> addition to some NAS boxes out there. From what I have read, it
> basically resembles a ARM920T but has NO thumb interworking support
> which makes it not fully EABI compliant (
> http://www.mail-archive.com/openocd-development@lists.berlios.de/msg05856.html
> ). I have build a few tool chains manually that produce working code
> using a configuration meant for a OABI style armv4 which makes sense
> since it uses NO thumb instructions, but I am not sure this is
> optimal.

eabi is now supported on armv4 architecture and we have OE internal
toolchain also support it from gcc 4.4.x onwards. 

> 
> What is the best way to move forward to setup a OpenEmbedded
> distro/machine configuration for something like the TS-7500 or a
> general FA526 configuration?  

look at any armv4 machines we have in OE e.g. collie and distros like
minimal or angstrom

DISTRO=minimal MACHINE=collie bitbake minimal-image 

I guess, one option is setup OABI ARMv4
> style setup but this was removed from things like angstrom a while
> ago. Switching to OABI just to get rid of thumb seems a little silly.
> 
> It would be nice to figure out a way to use EABI ARMv4T toolkit but
> pass flags like -mapcs-32 -mno-thumb-interwork (just a guess) to GCC
> to insure no thumb instructions (other weird things are discussed in
> http://wiki.debian.org/ArmEabiPort#Otherscenarios ).  The linker
> option -fix-v4bx looks promising for the linker also. A lot of things
> are possible solutions, but whats the cleanest way to work it into
> OpenEmbedded's build system?

its already functional in OE.

> 
> Any suggestion would be helpful. Thanks.
> 


Thx
-Khem


