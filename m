Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNrJe-0008Tj-8M
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 23:03:28 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 24ABD1FF7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2013 22:46:15 +0200 (CEST)
Message-ID: <515DE693.1050601@pseudoterminal.org>
Date: Thu, 04 Apr 2013 22:46:11 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: DEFAULTTUNE_<machine> not working
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
X-List-Received-Date: Thu, 04 Apr 2013 21:03:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have tried to set a machine specific DEFAULTTUNE in the local.conf . 
Example:
     DEFAULTTUNE_beagleboard = "cortexa8hf"

but this does not seem to work. I do not see "callconvention-hard" in 
the TUNE_FEATURES list bitbake shows me.

Writing this in local.conf works, however:
     DEFAULTTUNE = "cortexa8hf"

I am using OE Danny, and distro is Poky 8.0 .

Any ideas on what is going on here?


