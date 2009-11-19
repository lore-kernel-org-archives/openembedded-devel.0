Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NB5Uy-0002Zn-Q5
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 12:48:33 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NB5TX-00081M-Lr
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 11:46:59 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NB5TW-0002HC-17
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 11:46:58 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0911190303v66fe7aa9he03d5d81f14400cc@mail.gmail.com>
References: <818ccfc40911182327t686578acn565645806bcf280e@mail.gmail.com>
	<c384c5ea0911190303v66fe7aa9he03d5d81f14400cc@mail.gmail.com>
Date: Thu, 19 Nov 2009 11:46:54 +0000
Message-Id: <1258631214.23826.59.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: do staging failed while building eglibc
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
X-List-Received-Date: Thu, 19 Nov 2009 11:48:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 12:03 +0100, Leon Woestenberg wrote:
> Hmm, do we support building a bare metal (i.e. no target operating
> system) toolchain?
> 
> Also, I doubt (e)glibc supports that at all.
> 
> Maybe someone can confirm/correct me.

I don't think there is a great deal of specific support for bare metal
environments in OE right now, but there is no reason you couldn't use OE
to build either the toolchains or indeed the complete binary images for
such environments.  In some ways it would be nice to see OE become a
little bit Linux-centric.

As for glibc itself, it did use to support ARM bare metal back in the
day and, if glibc is not rejecting that target at configure time, it
probably is still supported to at least some extent today.  That said,
this is certainly not one of glibc's core competencies and I personally
would probably use something like newlib in a bare metal environment.

p.




