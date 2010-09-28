Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P0dzm-0000Cl-7n
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 19:29:38 +0200
Received: (qmail 28040 invoked by uid 0); 28 Sep 2010 17:29:26 -0000
Received: from 193.8.40.126 by www139.gmx.net with HTTP;
	Tue, 28 Sep 2010 19:29:26 +0200 (CEST)
Date: Tue, 28 Sep 2010 19:29:26 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20100928172926.22160@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1+nfvstzaancgllJDFHfg/XNkmjuktq0+wsVPEMiq
	pusW6RJlFnqWF7C/BilMcxmMZ6sFm2SncYnQ== 
X-GMX-UID: mVDLf+VGeWUkUsojjm9nUaEjL0tsZg0l
X-FuHaFi: 0.59999999999999998
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,FAKE_REPLY_C,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: coreutils-native-7.2-r0 dependencies not checked
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
X-List-Received-Date: Tue, 28 Sep 2010 17:29:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

>> | make: GNUmakefile: Too many levels of symbolic links
>
>This is a known issue - please make sure you don't have simlinks in your 
>TMPDIR. If you need to offload portions of your TMPDIR to another partition 
>or other place, adjust the corresponding variables instead of symlinking...
>--
>Denys

Hello Denys,
Thanks for that reply.

My whole build dir got symlinked into the home dir due to disk space issues.
But there are no symlinks in the temp dir area as far as i can say.
A somewhat strange behavior. I never noticed tools stumbling across such.


My not that deeply tested, first shot, cheap cheat is that:

do_compile_prepend() {
        cd ${S}
        if [ -L GNUmakefile ]
        then
                rm -f GNUmakefile
                ln -s Makefile GNUmakefile
        fi
}

i've added that to the non-native recipes of the coreutils, m4 and autoconf.
lets see how far that will work for me in my setup.
the build has already flawlessly proceeded to task 181 containing the binutils-cross compilation...

regards, Alex.

PS:
later on i found those discussion mentioning three recipe names from above:
http://old.nabble.com/failing-to-make-u-boot-omap3,-Too-many-levels-of-symbolic-links-td27315933.html

-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail


