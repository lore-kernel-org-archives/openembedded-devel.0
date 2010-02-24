Received: from ironport2-out.teksavvy.com ([206.248.154.181]
	helo=ironport2-out.pppoe.ca) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@slashdev.ca>) id 1NkLdd-0005sF-TY
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 19:07:16 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApEBAGf4hEtFpaLh/2dsb2JhbAAH2GyEcgSDFodv
X-IronPort-AV: E=Sophos;i="4.49,533,1262581200"; d="scan'208";a="56676724"
Received: from 69-165-162-225.dsl.teksavvy.com (HELO [192.168.1.10])
	([69.165.162.225])
	by ironport2-out.pppoe.ca with ESMTP; 24 Feb 2010 13:03:18 -0500
Message-ID: <4B856BBE.6010309@slashdev.ca>
Date: Wed, 24 Feb 2010 13:11:10 -0500
From: Josh Kropf <josh@slashdev.ca>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Shredder/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 206.248.154.181
X-SA-Exim-Mail-From: josh@slashdev.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: python-pygame: rect.so: ELF file version does not match current one
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
X-List-Received-Date: Wed, 24 Feb 2010 18:07:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

(stable/2009 branch, angstom, mini2440 board, armv4t)

When I attempt to import the pygame module I get the following error:

ImportError: /usr/lib/python2.6/site-packages/pygame/rect.so: ELF file 
version does not match current one

I'm not really sure how to debug this.  On my build system I used 
readelf to compare the header of rect.so and the python exectuable 
itself and they both appear to have the same info (ie: machine type = 
ARM, version = 1).

Any tips on how to figure this out?


