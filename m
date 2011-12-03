Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1RWmHh-00016J-AO
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 10:53:29 +0100
Received: from trisquel.localnet (80.116.58.40) by smtp203.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4ECA5E230060D273; Sat, 3 Dec 2011 10:46:45 +0100
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: Mr Dash Four <mr.dash.four@googlemail.com>
Date: Sat, 3 Dec 2011 10:46:43 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-12-generic; KDE/4.6.5; x86_64; ; )
References: <4ED8307F.2060306@googlemail.com> <4ED960AB.5040502@googlemail.com>
	<4ED96455.8060008@googlemail.com>
In-Reply-To: <4ED96455.8060008@googlemail.com>
MIME-Version: 1.0
Message-Id: <201112031046.44018.GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Sat, 03 Dec 2011 09:53:29 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

>Apart from setting "CONFIG_FRAMEBUFFER_CONSOLE=y" (and possibly setting 
>"# CONFIG_DUMMY_CONSOLE is not set") should I activate anything else 
>from the above? Is that all what's needed?
Instead of trying to edit the file manually, try "make xconfig" in the 
directory where the kernel is extracted(something like work/htcdream*/linux-
leviathan*/git/ ) and do it manually trough the GUI, then save back the 
resulting defconfig, increase PR in the recipe and rebuild your console-image.

Denis.


