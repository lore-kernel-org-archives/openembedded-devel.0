Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1PxJvO-0000wW-QH
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 14:59:39 +0100
Received: (qmail 12805 invoked from network); 9 Mar 2011 14:58:05 +0100
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 9 Mar 2011 14:58:05 +0100
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id wUIkr8Bk4MAt
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2011 14:58:02 +0100 (CET)
Received: (Qmail 12794 invoked from network); 9 Mar 2011 14:58:02 +0100
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 9 Mar 2011 13:58:02 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1PxJtq-0007tA-Dm
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2011 14:58:02 +0100
Date: Wed, 9 Mar 2011 14:58:02 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110309135802.GA29723@mi.fu-berlin.de>
References: <4D773276.1040907@nedap.com>
	<AANLkTinccRRrmRgcLkf0=cP_eA4Grm2HyyWrDPbT-CFw@mail.gmail.com>
	<20110309113959.GA22507@mi.fu-berlin.de>
	<4D77732F.1000005@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4D77732F.1000005@nedap.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: release-2011.3
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
X-List-Received-Date: Wed, 09 Mar 2011 13:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2011 at 01:31:43PM +0100, Jaap de Jong wrote:
>
>>>> If I use DISTRO=angstrom-2010.x and start a complete new fresh build, I get
>>>>
>>> Seems like a different bitbake must be used. You better start from the
>>> Angstrom web site Getting Started notes as that's the only place where
>>> this is up-to-date.
> Don't know what went wrong in the previous attempt but a new fresh start  
> helped a lot...
>
>> and please use uclibc-git, they other versions dont have nptl support.
>>
> How should I accomplish that?
>
>
> Thanks!
> Jaap
>


Either remove the DEFAUL_PREF = "-1" from uclibc git or
set in local.conf PREFFERED_VERSION_uclibc-initial = "git" and PREFFERED_VERSION_uclibc = "git"

Bye Henning


