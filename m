Received: from [203.8.2.122] (helo=mail.einfosolutions.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <Richard.How@einfosolutions.com>) id 1GZHSY-0004cZ-OY
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 03:40:07 +0200
Received: from Ubiquitous.localnet ([203.8.2.80] RDNS failed) by
	mail.einfosolutions.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 16 Oct 2006 11:08:21 +0930
Date: Mon, 16 Oct 2006 11:02:46 +0930
From: Richard How <Richard.How@einfosolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20061016110246.73bc9292.Richard.How@einfosolutions.com>
In-Reply-To: <20061015145613.ovhqbcfhdndc888c@webmail.neophob.com>
References: <20061015145613.ovhqbcfhdndc888c@webmail.neophob.com>
X-Mailer: Sylpheed version 2.2.9 (GTK+ 2.6.10; i686-pc-linux-gnu)
Mime-Version: 1.0
X-OriginalArrivalTime: 16 Oct 2006 01:38:21.0859 (UTC)
	FILETIME=[C3A97730:01C6F0C3]
Subject: Re: build cairo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2006 01:40:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Oct 2006 14:56:13 +0200
michu@neophob.com wrote:

> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/directfb
> | cc1: internal compiler error: in add_path, at c-incpath.c:362
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <URL:http://gcc.gnu.org/bugs.html> for instructions.

I have been wrestling with this problem for a week now. Our development
board has changed from pxa255 arm processor to mipsel and I have
managed to bitbake meta-gpe and run it successfully. Now I need to bitbake
FBReader which requires enca. The configuration stage shows this in the
config.log

Extract from config.log in enca-1.9

configure:20864: checking for sqrt in -lm
configure:20894: mipsel-linux-gcc -Os -mips2 -o conftest -Wall -W -pedantic -isystem/stuff/build/tmp/staging/mipsel-linux/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -isystem/stuff/build/tmp/staging/mipsel-linux/include -I/usr/include -L/stuff/build/tmp/staging/mipsel-linux/lib -Wl,-rpath-link,/stuff/build/tmp/staging/mipsel-linux/lib -Wl,-O1 -L/usr/lib conftest.c -lm   >&5
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
cc1: internal compiler error: Aborted
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.

I have found examples mentioning this problem but so far no solution.
Any help or advice would be much appreciated :)

Regards Richard



