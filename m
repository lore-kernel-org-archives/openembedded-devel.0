Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NO26f-0003Z6-5s
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 05:48:56 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1951D1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2009 04:43:23 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Dec 2009 05:46:52 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <1261712573-10282-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1261712573-10282-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <200912250546.52376.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Upgrade glibc from 2.6.1 to 2.10.1, the 2.6.1 glibc cause ltrace compilation failed
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
X-List-Received-Date: Fri, 25 Dec 2009 04:48:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 25 December 2009 04:42:53 Guo Hongruan wrote:
> the include/sys/ptrace.h of glibc 2.6.1 does not include the PTRACE_EVENT*
>  macroes, which is needed by ltrace. the one of glibc 2.10.1 does include
>  them and on it the compilation of ltrace succeed ---

That is quite a bad reason to upgrade the default. The problem is you would 
have to convince us that glibc 2.10.1 is working just fine for arm, armeb, 
mips, mipsel, powerpc, avr, sparc, i486, i586... Or at least your commit 
message should include the information that you have tested builds with it.


Then again. It is pretty common that older versions of a library do not have 
newere definitions of syscalls and syscall parameters (e.g. most notable this 
happened with the addition of inotify and early adaption of it). The fix is the 
one you proposed. Check if the system has the definition, if not define it 
locally.


regards
	holger




