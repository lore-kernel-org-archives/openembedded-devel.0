Received: from mailrelay3.sunrise.ch ([194.158.229.31]
	helo=smtp-be-01.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1QngHN-00038T-8V
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 02:22:45 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-01.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p6VMU7OW022915; Mon, 1 Aug 2011 00:30:08 +0200
Message-ID: <4E35D761.1000202@vollmann.ch>
Date: Mon, 01 Aug 2011 00:29:53 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [2011.03-maintenance] Bogus check in kernel.bbclass
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
X-List-Received-Date: Mon, 01 Aug 2011 00:22:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

kernel.bbclass has the following in kernel_do_compile:
   oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
   if [ "${KERNEL_MAJOR_VERSION}" != "2.6" ]; then
           oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
   fi

The check for KERNEL_MAJOR_VERSION here is bogus, it will always
be "None", because the expansion of KERNEL_MAJOR_VERSION requires
include/linux/version.h, but that file doesn't exist when the
variable is expanded.
The problem doesn't cause any harm here, as "make dep" on newer
kernels just issues a warning, but it irritates once you look at
run.do_compile for hunting down any other errors...

If anybody cares, I'll provide a patch that just calls "make dep"
unconditionally.

Regards,
   Detlef


