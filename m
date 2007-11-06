Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IpMdJ-0003ve-Mt
	for openembedded-devel@openembedded.org; Tue, 06 Nov 2007 12:30:16 +0100
Received: from bq8.dotserv.com (localhost [127.0.0.1])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lA6BJ0Pe011069
	for <openembedded-devel@openembedded.org>;
	Tue, 6 Nov 2007 12:19:00 +0100
Received: (from apache@localhost)
	by bq8.dotserv.com (8.13.1/8.13.1/Submit) id lA6BJ0EA011066;
	Tue, 6 Nov 2007 12:19:00 +0100
X-Authentication-Warning: bq8.dotserv.com: apache set sender to
	eha@doredevelopment.dk using -f
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Date: Tue, 6 Nov 2007 12:19:00 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
Organization: =?UTF-8?Q?Dor=C3=A9_Development_ApS?=
Message-ID: <deb87fbca36a04509dc0b6893bca86ec@127.0.0.1>
X-Sender: eha@doredevelopment.dk
User-Agent: RoundCube Webmail/0.1b
X-MIME-Autoconverted: from 8bit to quoted-printable by bq8.dotserv.com id
	lA6BJ0Pe011069
Subject: Why not use config.guess in conf/bitbake.conf ?
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
X-List-Received-Date: Tue, 06 Nov 2007 11:30:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


What is the reason that conf/bitbake.conf is relying directly on the 'una=
me' output for generating the BUILD_SYS string?

I am trying to get OE building on Cygwin, and on my machine bitbake.conf =
generates a BUILD_SYS that is not supported by config.sub, which breaks a=
 autotools packages.

$ uname -a
CYGWIN_NT-5.1 PC_K_EHA 1.5.24(0.156/4/2) 2007-01-31 10:57 i686 Cygwin

As bitbake.conf takes the first field as BUILD_OS, and the 5th field as B=
UILD_ARCH and then set BUILD_SYS to ${BUILD_ARCH}-${BUILD_OS} I end up wi=
th
i686-cygwin_nt-5.1
which breaks config.sub due to the '-' in the os string.

Using a current config.guess on this system, I get
i686-pc-cygwin
which is fine.
On my laptop (running gutsy) it would give me a BUILD_SYS
i686-pc-linux-gnu

Another workaround is to use the last field (also output from 'uname -o')=
 as BUILD_OS which give
i686-cygwin
On my laptop (still running gutsy) it would also give me a BUILD_SYS
i686-pc-linux-gnu

To keep paths short and nice, I can see it would be prefereable to end up=
 with i686-cygwin and i686-linux.
On the other hand, using the output from config.guess migt warrant some m=
ore consistency.

Anyway, the current solution just don't work for cygwin, so I would like =
to hear what kind of solution would fit OE the best.

P.S. No, I cannot just use coLinux.

/Esben
--=20
Esben Haabendal
Embedded Software Consultant
Dor=C3=A9 Development ApS



