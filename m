Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RG4tp-0008Mm-ER
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 10:19:49 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 05D04EA95E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 10:13:59 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtkvAHo0nU5T4zkNPGdsb2JhbAAMN4k8kD6OfAEBAQE3giEBAQQ4QBEsFg8JAwIBAgExFBMIAQG+QIgbBJN9kVg
X-IronPort-AV: E=Sophos;i="4.69,364,1315173600"; d="scan'208";a="496397421"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph2.telenor.se with ESMTP; 18 Oct 2011 10:13:59 +0200
Message-ID: <4E9D3547.4050809@telia.com>
Date: Tue, 18 Oct 2011 10:13:59 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C975D.60709@telia.com>
In-Reply-To: <4E9C975D.60709@telia.com>
X-Forwarded-Message-Id: <4E9C975D.60709@telia.com>
Subject: Building multiple u-boot binaries in oe-core?
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
X-List-Received-Date: Tue, 18 Oct 2011 08:19:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I added the functionality for building multiple u-boot binaries to
classic openembedded, but this has not been implemented in oe-core.
I find that rather useful. Anyone disagreeing?

The core of this is:

do_compile () {
     if ! [ "x${UBOOT_MACHINES}" == "x" ] ; then
         for board in ${UBOOT_MACHINES} ; do
             if ! [ `grep ${board}_config Makefile | wc -c` == 0 ] ; then
                 mkdir -p binaries/${board}
                 oe_runmake O=binaries/${board} distclean
                 oe_runmake O=binaries/${board} ${board}_config
                 oe_runmake O=binaries/${board} all
             fi
         done
     else
            oe_runmake ${UBOOT_MACHINE}
            oe_runmake all
     fi
}

Note that I removed the _config part from UBOOT_MACHINES.

At the moment, the binary after youv'e done
"make beagleboard_config; make" will be called:
u-boot-beagleboard_config-${PV}-${PR}.bin

I think "u-boot-beagleboard-${PV}-${PR}.bin" is nicer.

There aren't that many boards in oe-core at the moment.
Isn't this a good time to get rid of UBOOT_MACHINE altogher
and/or redefine it without the "_config"

P.S: I am working on another project right now, so I don't know
when I have time to test this out on oe-core, so anyone
else interested, feel free to implement it

-- 
Best Regards
Ulf Samuelsson



