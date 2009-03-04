Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Leuu9-0007AC-4V
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 18:29:13 +0100
Received: from [192.168.1.105] (e180183108.adsl.alicedsl.de [85.180.183.108])
	by drlauer-research.com (Postfix) with ESMTP id 27045584167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 18:49:43 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236178967.4249.7.camel@debian.dorg.org>
References: <1236178967.4249.7.camel@debian.dorg.org>
Organization: Vanille-Media
Date: Wed, 04 Mar 2009 18:25:01 +0100
Message-Id: <1236187501.10602.130.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: Linux/Opie/Angstroem on Fujitsu Siemens Loox 420
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
X-List-Received-Date: Wed, 04 Mar 2009 17:29:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 04.03.2009, 16:02 +0100 schrieb harald:
> managed to build a complete opie-image with
> openembedded. Read that my Fujitsu Siemens Pocket Loox is very similar
> to HP Ipaq 4000. So i built system for this machine type. Unfortunately
> the system does not start througth. It hangs after "freeing init
> memory:88k", then some lines appear with some bluetooth informations.
> That's all.

Sounds like an EABI/OABI kernel/userland problem. Make sure your kernel
contains the ABI support you build userland with.

-- 
:M:



