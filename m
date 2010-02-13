Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NgN3i-0005x5-TE
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 19:49:41 +0100
Received: from [85.210.8.8] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NgN1B-00013n-7B
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 18:47:03 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100213143725.GP10632@mx.loc>
References: <1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc>
	<1266067169.5437.18.camel@lenovo.internal.reciva.com>
	<20100213143725.GP10632@mx.loc>
Date: Sat, 13 Feb 2010 18:46:59 +0000
Message-ID: <1266086819.5437.25.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sat, 13 Feb 2010 18:49:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-02-13 at 15:37 +0100, Bernhard Reutner-Fischer wrote:
> But that would clash with _git, wouldn't it, unless, and only if this
> exact sequence would be used:
> .inc:=S ?= ${WORKDIR}/xz-${PV}
> .inc:=SRC_URI=http
> 0815.bb:PV=0814+0815foo
> 0815.bb:require .inc
> 0815.bb:SRC_URI+=patch1
> git.bb:S=${WORKDIR}/git
> git.bb:require .inc
> git.bb:SRC_URI=git

It would be more traditional to set S with a hard assignment in the .inc
file, and simply override it (the same as SRC_URI) in the _git.bb file.
But, essentially, yes, what you are describing there is basically what
you'd have to do.  There is plenty of precedent in OE for the general
approach of using an .inc file to set generic defaults and then allowing
particular .bb files to override the parts they don't want.

I'll have a look at your git checkout issue later today.

p.




