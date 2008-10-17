Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1Kql5s-0006cp-CH; Fri, 17 Oct 2008 10:54:00 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1Kql38-0005R8-5A; Fri, 17 Oct 2008 09:51:10 +0100
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1Kql37-0005d6-VK; Fri, 17 Oct 2008 09:51:10 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
	<gd8630$66f$1@ger.gmane.org>
	<87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>
Date: Fri, 17 Oct 2008 09:51:08 +0100
Message-Id: <1224233468.30790.125.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: xserver-xorg rdepends
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
X-List-Received-Date: Fri, 17 Oct 2008 08:54:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-10-16 at 17:02 -0300, Otavio Salvador wrote:
> Koen Kooi <k.kooi@student.utwente.nl> writes:
> 
> >> Any objections?
> >
> > Yes. Recent xservers need hal for various input systems to work
> > correctly. So instead of crippling the xserver you can keep a crippled
> > version in your personal tree or overlay.
> 
> Fully support to keep hal as rdepends.

This seems like an odd point of view.  There are various other things
that the xserver requires for full operation (fonts, video drivers and
other modules for example), none of which are listed in RDEPENDS.  It
isn't obvious to me that hal is any more important than those.

Historically, the general policy for RDEPENDS has been that it should
list only those packages which are absolutely required for the software
in question to do anything useful.  For example, shared libraries
without which you can't run the binary at all; interpreters without
which you can't invoke the script; supporting datafiles without which
the program will immediately crash, that kind of thing.  If the program
can run and do at least something useful without a given package being
installed, we have not usually considered it to be a hard dependency.
These kinds of "soft dependencies" have traditionally been a matter of
DISTRO and/or MACHINE policy, being handled either through task
packages, PACKAGE_INSTALL, RRECOMMENDS, or some similar mechanism.

p.




