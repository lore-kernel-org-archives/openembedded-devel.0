Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QndxT-0008UX-Fj
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jul 2011 23:54:03 +0200
Received: (qmail 23458 invoked by uid 501); 31 Jul 2011 14:49:42 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13382. avast: v3.2.0/110730-1. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.012162 secs); 31 Jul 2011 21:49:42 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 31 Jul 2011 14:49:41 -0700
MIME-Version: 1.0
x-mimeole: Produced By Microsoft Exchange V6.5
Date: Mon, 1 Aug 2011 09:49:39 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A5EB@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Serial Console name for i.mx31
Thread-Index: AcxPy79qVTNBJrIwTR24WgL9ktGKJw==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Serial Console name for i.mx31
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
X-List-Received-Date: Sun, 31 Jul 2011 21:54:03 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi,

Can anyone verify what the kernel command line option should be to use
the first imx31 uart? As far as I can tell it is
"console=3Dttymxc0,115200"

The reason I ask, is that I am seeing the kernel messages in the ram
kernel ring buffer, but not seing them come out the serial console.

I am porting linux to our own hardware which is similar to the LogicPD
LiteKit platform (I have compiled the kernel for this platform ..)

Debugging into the serial driver in ../drivers/serial/mx31  .. I see the
function init_serial_init() being called ( .. and it's printk message is
in the buffer)
but I am not seeing the serial_imx_probe() being called ..

I do not understand the the registering of platform drivers enough to
work out how the kernel connects the diver with the hardware .... Can
someone enlighten me
on how to debug this further ..... Or even better just tell me to use
the correct command line option and it all bursts into life  :-)

Thanks,
Bernie=20






