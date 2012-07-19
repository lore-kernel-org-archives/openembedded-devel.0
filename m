Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1Srv5F-00055O-BM
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 20:04:17 +0200
Received: from [10.1.14.186] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id 6EF9421AA2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:47:28 +0200 (CEST)
Message-ID: <50084830.1060708@pseudoterminal.org>
Date: Thu, 19 Jul 2012 19:47:28 +0200
From: dv <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.28) Gecko/20120313 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: GStreamer plugins are built with Orc support disabled, why?
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
X-List-Received-Date: Thu, 19 Jul 2012 18:04:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I noticed that the GStreamer plugins from the base, good, bad, and ugly 
packages are all built with Orc support disabled
(the configure lines use --disable-orc). I wonder why. No Orc means that 
the plugins are considerably slower.
Is this related to ARM? (I noticed this when building for a Beaglebone 
machine.) Or does Orc break something?

Thanks,
   dv


