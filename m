Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UJStU-0008Fi-H9
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Mar 2013 19:10:20 +0100
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 0AF3F21338
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Mar 2013 18:43:32 +0100 (CET)
Message-ID: <514DEA2D.3040305@pseudoterminal.org>
Date: Sat, 23 Mar 2013 18:45:17 +0100
From: dv <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: iwmmxt tune feature is useless for Marvell PJ4 processors
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
X-List-Received-Date: Sat, 23 Mar 2013 18:10:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I noticed that the iwmmxt tune feature in the 
conf/machine/include/tune-iwmmxt.inc file pulls in the armv4, armv4t, 
and armv5te architectures as well. This will lead to problems with PJ4 
processors, which use armv7, but also support iwmmxt and iwmmxt2.

In addition, the tune-iwmmxt.inc file contains the following comment:

# Configurations for the Intel PXA27x Appications Processor Family.
# Please use tune-xscale for PXA255/PXA26x based processors.

I think the name "tune-iwmmxt.inc" is misleading. It certainly does not 
just add iwmmxt flags, but also CPU specific architectures. This line 
should probably be removed:

PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te iwmmxt"

What do you think?


