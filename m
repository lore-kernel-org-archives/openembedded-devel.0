Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbhHx-0001Ad-L3
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 22:52:45 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A7285AE0013EAEF for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 22:36:11 +0200
Message-ID: <4A84793A.3090203@atmel.com>
Date: Thu, 13 Aug 2009 22:36:10 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A83BD15.7070006@atmel.com>	<h60je5$992$1@ger.gmane.org>	<4A83E5FC.2020002@atmel.com>	<h60t34$5kl$1@ger.gmane.org>	<4A8402B0.1000308@atmel.com>	<h611re$jjp$1@ger.gmane.org>	<4A842FF6.70906@atmel.com>
	<h61f31$vvd$2@ger.gmane.org>
In-Reply-To: <h61f31$vvd$2@ger.gmane.org>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 20:52:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 13-08-09 17:23, Ulf Samuelsson wrote:
> 
>> I maintain that if I do "MACHINE=at91sam9260dfc bitbake at91bootstrap"
>> from the build directory, it is ignored and the MACHINE definition
>> (MACHINE=at91sam9261df) in local.conf is used.
> 
> Yes, local.conf takes precedence over env, so remove it from local.conf.
> 

Thanks,
It is easier in the script to symlink "build/conf/local.conf" to
"build/conf/${MACHINE}.conf" which has the correct MACHINE definition.
Then I can use the script as well as building manually
without having to remember to set MACHINE explicitly


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



