Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UOQxx-0006a5-5A
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 13:07:55 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 53EDA200E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2013 12:50:11 +0200 (CEST)
Message-ID: <515FFDE5.2020303@pseudoterminal.org>
Date: Sat, 06 Apr 2013 12:50:13 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Can a .bbappend introduce a different PACKAGE_ARCH ?
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
X-List-Received-Date: Sat, 06 Apr 2013 11:07:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

assume there is package foo, which is normally not dependent on a 
specific machine. It is built with default, machine independent 
configuration options.
But then I want to add a .bbappend to it, which add some configuration 
options that make it machine dependent (imagine something like 
--device=beagleboard).
I then add PACKAGE_ARCH=${MACHINE_ARCH} to the .bbappend file. Is this 
actually okay to do? Or does it break something?


