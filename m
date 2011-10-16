Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1RFWan-0002Tw-Go
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Oct 2011 21:41:53 +0200
Received: from trisquel.localnet (79.17.209.133) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4E6FEAFE00AC30B9; Sun, 16 Oct 2011 21:30:46 +0200
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Oct 2011 21:30:45 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic; KDE/4.6.2; x86_64; ; )
References: <1313604363-2973-1-git-send-email-pespin.shar@gmail.com>
	<1313666756.4016.76.camel@mattotaupa>
	<1313759841.3673.42.camel@mattotaupa>
In-Reply-To: <1313759841.3673.42.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201110162130.45541.GNUtoo@no-log.org>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: minimal-uclibc: ../../src/lib/.libs/liblightmediascanner.so: undefined reference to `libiconv_open' (was: [meta-efl] lightmediascanner: Add version 0.4.3.0 (initial recipe))
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
X-List-Received-Date: Sun, 16 Oct 2011 19:41:53 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

>The upstream developer Gustavo provided a patch and this seems to fix
>the build issues. Could you test if the recipe in oe.dev [1] works for
>you.
it doesn't work for me:
| configure.ac:37: required file `./config.rpath' not found
| autoreconf: automake failed with exit status: 1
and at line 37 there is:
AM_ICONV
which is added by that patch.

Denis.


