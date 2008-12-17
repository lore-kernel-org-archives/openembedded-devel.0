Received: from [128.178.50.22] (helo=smtp1.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1LCx8o-0002dQ-H3
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 15:12:47 +0100
Received: (qmail 2815 invoked by uid 107); 17 Dec 2008 14:08:13 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp1.epfl.ch with SMTP; 17 Dec 2008 14:08:13 -0000
Received: from (unknown [128.178.224.226]) by mailav3.epfl.ch with smtp
	id 0ab8_24548620_cc44_11dd_b2ae_0014221528b0;
	Wed, 17 Dec 2008 15:08:13 +0100
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 17 Dec 2008 15:08:13 +0100
Message-ID: <494907CC.2020009@epfl.ch>
Date: Wed, 17 Dec 2008 15:08:12 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.18 (X11/20081125)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Best way to tune a distro and to build a toolchain for it
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
X-List-Received-Date: Wed, 17 Dec 2008 14:12:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

We have designed a processor board in our laboratory that we are going 
to use to control our robots for experiments. The board is now supported 
in OE (mx31moboard machine) and I am very happy to be able to build a 
Linux distro for our board thank to OE.

Until now I have used the Angstrom distro with success. Now since my use 
is mostly going to be for a robot with no screen (and of course no 
PIM/agenda, games and these kinds of things) I have always built a 
console-image. However now I would like to add some packages by default 
in the images that I want to build for our robot (for instance hal is 
needed by one of our softs, I would like it to be included by default).

I could do this by adding these packages in the MACHINE_EXTRA_RDEPENDS 
variable in the machine config file, but I think this is more a distro 
question.

To summarize: what would be the best way to create a "robotic version" 
of angstrom in OE ?

The second question is about toolchains. This platform is going to be 
used by many other labs that are going to use our robots or at least our 
hardware. I would like to be able to build a "sdk" for them, with all 
the libs that we include by default in their sdk (because I already fear 
all the mechanical engineers that would have to build OE ...). I can 
build meta-toolchain, but how could I tune a toolchain so that it 
includes for instance all the headers for the libs that I would add in 
my "robotic version" of anstrom ?

Thank you for your help.

Val

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


