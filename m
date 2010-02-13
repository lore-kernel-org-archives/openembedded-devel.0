Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NgHwk-0008Is-4B
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 14:22:09 +0100
Received: from [85.210.8.8] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NgHuF-0007CP-LD
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 13:19:31 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100213125146.GJ10632@mx.loc>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc>
Date: Sat, 13 Feb 2010 13:19:29 +0000
Message-ID: <1266067169.5437.18.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.8.8
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 8/8] xz: add xz package
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
X-List-Received-Date: Sat, 13 Feb 2010 13:22:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-02-13 at 13:51 +0100, Bernhard Reutner-Fischer wrote:
> It would indeed. Can i somehow say
> file1: SRC="http:://one.ext/one.tar.xz"
>        SRC[md5sum]=md5
>        SRC[sha256sum]=sha256
>        or, perhaps it's the basename if there was no ;name=
>        SRC[one.tar.xz.md5sum]=md5
>        SRC[one.tar.xz.sha256sum]=sha256
> file2: SRC="git://two"
> inc: FOO_SRC ?= SRC
>      SRC_URI += FOO_SRC

I don't think this needs to be as complicated as you are making it.  You
should be able to simply move your original SRC_URI verbatim to the .inc
file, i.e.:

SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"

and then, in the individual .bb files for each version, write:

SRC_URI[xz.md5sum] = ...

There's no requirement for the two things to be in the same file.  If
you need to add other things like patches to the SRC_URI for a specific
version, you can just write:

SRC_URI += "file://..."

in the .bb file in question.

> Revised patch is attached, but:
> it works for the 4.999beta9 version (literally, since that's how
> upstream calls the tarball; Is this a problem with the version-naming
> like Koon indicates?) 

It rather depends on what upstream are going to do next.  If "4.999" is
the number that they are using for pre-releases leading up to 5.0, and
everything in the 4.999 series is going to be a beta (i.e. they do
4.999.8beta, 4.999.9beta, 4.999.10beta, 5.0) then it is probably fine as
it stands.  But, if there is any risk that "4.999.9beta" might be
followed at some point by a version called just "4.999.9", or even
"4.999", then that would be a problem because the latter version will
sort lower than the former.

> since: $ ls -a ../sources/git/ctrl.tukaani.org.xz.git/
> .  ..  1  .git
> 
> "1" ?!

That is rather weird.  I can't see any obvious cause for that from a
quick inspection of the files you attached.

p.



