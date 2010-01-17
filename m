Received: from smtp1.cybercity.dk ([212.242.43.251])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NWchj-0004b2-6w for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:30:42 +0100
Received: from natla.sgh.dk (0x4dd5bf76.adsl.cybercity.dk [77.213.191.118])
	by smtp1.cybercity.dk (Postfix) with ESMTP id 8A2AF5868DD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 22:31:27 +0100 (CET)
Received: from phoenix.localnet (phoenix.local [192.168.0.226])
	by natla.sgh.dk (Postfix) with ESMTP id 540B47D00E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 23:18:22 +0100 (CET)
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 22:28:26 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-020633rc4-generic; KDE/4.3.4; i686; ; )
MIME-Version: 1.0
Message-Id: <201001172228.26477.sgh@sgh.dk>
X-SA-Exim-Connect-IP: 212.242.43.251
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Mesa packages and TLS
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
X-List-Received-Date: Sun, 17 Jan 2010 21:30:42 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

After I startet using mesa >=3D7.4 at lest the mesa-packages actually compi=
les. Which is=20
good. Nevertheless there still are problems. Apparently the TLS support whi=
ch is currently=20
disables on uclibc targets is also broken on glibc. At lest I get the follo=
wing when=20
running glxgears.

/usr/lib/dri/swrast_dri.so: undefined symbol: _glapi_tls_Context)

Removing the line "inherit glx-use-tls" in mesa-common.inc makes software-r=
endering work=20
again.

/S=F8ren Holm


