Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbUiK-0002pO-7N
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 09:27:08 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD005584BF for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 09:10:37 +0200
Message-ID: <4A83BC6C.3090308@atmel.com>
Date: Thu, 13 Aug 2009 09:10:36 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A81BE84.6010607@atmel.com>	<200908121433.31479.marcin@juszkiewicz.com.pl>
	<1250092579.12282.73.camel@mill.internal.reciva.com>
In-Reply-To: <1250092579.12282.73.camel@mill.internal.reciva.com>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Thu, 13 Aug 2009 07:27:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Status of build:
I tried building some boards overnight.

sam9263dfc:	x11-gpe-image
	I had
	GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"
	from an old local.conf.sample
	This should be
	GLIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"

sam9261df:
	Same as sam9263dfc

sam9g45ek:	x11-gpe-image
	I enabled power management for the linux kernel.
	This does not work, so I will change the linux config.

sam9260dfc:	console_image
	compiles, but bitbake u-boot is needed to complete the build

sam9g20dfc:	console_image
	compiles, but bitbake u-boot is needed to complete the build


....

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



