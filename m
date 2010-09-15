Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OvrLH-00049I-2q
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 14:44:14 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 9542B1660525; Wed, 15 Sep 2010 06:43:04 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6BCD71660525;
	Wed, 15 Sep 2010 06:43:03 -0600 (MDT)
Message-ID: <4C90BF57.9050308@mlbassoc.com>
Date: Wed, 15 Sep 2010 06:43:03 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C90B821.10203@mlbassoc.com>
	<AANLkTik7C4xZOGMobssYDEAD96kpAUweQAOZ99dsh7a1@mail.gmail.com>
In-Reply-To: <AANLkTik7C4xZOGMobssYDEAD96kpAUweQAOZ99dsh7a1@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: another failure in testing-2010-09-13
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
X-List-Received-Date: Wed, 15 Sep 2010 12:44:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/15/2010 06:28 AM, Frans Meulenbroeks wrote:
> 2010/9/15 Gary Thomas<gary@mlbassoc.com>:
>> MACHINE=qemuarm
>> DISTRO=angstrom-2010.x
>> TARGET=x11-gpe-image
>>
>> NOTE: package xf86-input-mouse-1_1.5.0-r14.1: task do_configure: Failed
>> | Requested 'xorg-server>= 1.5.99.901' but version of xorg-server is
>> 1.4.0.90
>>
>> As far as I can tell, there is no xorg-server in the tree which
>> satisfies these criteria.
>
> Is this a new one for this tag or did it also appear on the previous
> tag (or was it first tested with this tag).
> I'm not too much into x but I guess you get your server from
> xserver-kdrive_1.4.0.90.bb
> suspect this only works with the xserver-xorg recipes like xserver-xorg_1.9.0.bb

It's new - I've built this combo every week so far with no troubles.

Angstrom is currently pinned to xorg-server-kdrive, so this is
an issue since there is not a new enough version out there.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


