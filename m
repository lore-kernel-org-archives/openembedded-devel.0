Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RgMxZ-00075c-Sn for openembedded-devel@lists.openembedded.org;
	Thu, 29 Dec 2011 21:52:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RgMqa-00032J-Qy for openembedded-devel@lists.openembedded.org;
	Thu, 29 Dec 2011 21:45:08 +0100
Received: from 65.127.220.136 ([65.127.220.136])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2011 21:45:08 +0100
Received: from chris.sarra by 65.127.220.136 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2011 21:45:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Chris <chris.sarra@gmail.com>
Date: Thu, 29 Dec 2011 20:40:39 +0000 (UTC)
Message-ID: <loom.20111229T213918-600@post.gmane.org>
References: <BANLkTimPVgqbjMhJnBcniZgJBbRd_1D8yQ@mail.gmail.com>
	<4DA1189E.5050703@gmail.com>
	<BANLkTimu9ty9mvC7YLfGTh0K92PUVXq4Mg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 65.127.220.136 (Mozilla/5.0 (Ubuntu; X11; Linux i686;
	rv:8.0) Gecko/20100101 Firefox/8.0)
Subject: Re: python-distutils_2.6.6: config/Makefile contains sysroot
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
X-List-Received-Date: Thu, 29 Dec 2011 20:52:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Kartik Mohta <kartikmohta <at> gmail.com> writes:

> 
> On Sat, Apr 9, 2011 at 10:40 PM, Khem Raj <raj.khem <at> gmail.com> wrote:
> > you should try to figure out why binutils was build without sysroot. Check
> > the configure args for binutils-cross
> 
> I guess there was some misunderstanding, the problem is that the
> Makefile on the target contains references to the sysroot on the host.
> 


Did you ever get this issue resolved? I'm having a similar problem now trying to
build matplotlib on an embedded processor running angstrom linux (python 2.6):

<<
/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-
gnueabi/bin/ld:
this linker was not configured to use sysroots
collect2: ld returned 1 exit status
error: command 'arm-angstrom-linux-gnueabi-g++' failed with exit status 1
<<





