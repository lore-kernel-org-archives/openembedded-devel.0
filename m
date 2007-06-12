Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <robert@linuxdevelopment.de>) id 1HyAee-0005PN-4e
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jun 2007 19:59:44 +0200
Received: from [89.59.7.76] (helo=[10.0.0.7])
	by mrelayeu.kundenserver.de (node=mrelayeu1) with ESMTP (Nemesis),
	id 0MKwpI-1HyAbm06XK-00041h; Tue, 12 Jun 2007 19:56:46 +0200
Message-ID: <466EDE5D.7060304@linuxdevelopment.de>
Date: Tue, 12 Jun 2007 19:56:45 +0200
From: =?ISO-8859-15?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20060911)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.2.0
X-Provags-ID: V01U2FsdGVkX1/wcjEsKoCZIVPr9eR3R1sq2bzF6PtyNRx8DgP
	dZ9/rny5V6ep9N+00+fEOQCW5iBiJJ1D0912zXXpygr+/Dc3m6
	DLrQXUK5cU9fYIjtog43BSN3noHmC0F
Subject: ixp425 vs madwifi with armv5te big endian AND EABI error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2007 17:59:44 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Dear Openembedded Devel List

Iam developing a least cost router based on the Intel ixp425 CPUI and
some minipci slots. ( Board ADI Pronghorn-Metro).

Iam now infront of a problem where i would like ask for assistance.

The madwifi driver which powers the atheros wifi cards ( quite some wide
range also on multiband cards) uses firmware code tobe linked into their
drivers.
Now as i need to crosscompile my build fails like this
 LD [M]
/tmp/work/ixp4xxbe-angstrom-linux-gnueabi/madwifi-modules-1.0.0+cvs20060814-r0/madwifi/ath_hal/ath_hal.o
| armeb-angstrom-linux-gnueabi-ld: ERROR: Source object
/tmp/work/ixp4xxbe-angstrom-linux-gnueabi/madwifi-modules-1.0.0+cvs20060814-r0/madwifi/ath_hal/hal.o
has EABI version 0, but target
/mp/work/ixp4xxbe-angstrom-linux-gnueabi/madwifi-modules-1.0.0+cvs20060814-r0/madwifi/ath_hal/ath_hal.o
has EABI version 4


My suspicion is that the this binary code was compiled oabi hence eabi v
0. But the rest off all is of course eabi compiled.

will i need to get a armv5te firmware supporting this ?
is it an option to go oabi on my whole toolchain ? ( if yes point me to
side effects and ways to go, please)

I am kinda lost now .. what can i do ?

Kind Regards
rob_w



