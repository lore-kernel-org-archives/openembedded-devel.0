Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1JgULV-00006O-PG for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 02:27:25 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 216ECE4537
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 20:27:25 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute2.internal (MEProxy); Mon, 31 Mar 2008 20:27:25 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id E870B4F362; Mon, 31 Mar 2008 20:27:24 -0400 (EDT)
Message-Id: <1207009644.9370.1245329833@webmail.messagingengine.com>
X-Sasl-Enc: zFrukR5Z11EkGnPUz8x/GJKgeGitpmL/GDYN6KDWbqIi 1207009644
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1205992995.25920.1243400709@webmail.messagingengine.com>
	<1206017175.4700.8.camel@hammer.suse.cz>
	<1206051256.5975.1243541279@webmail.messagingengine.com>
	<1206295294.6914.7.camel@utx.utx.cz>
	<1206495575.1924.1244289243@webmail.messagingengine.com>
In-Reply-To: <1206495575.1924.1244289243@webmail.messagingengine.com>
Date: Tue, 01 Apr 2008 10:27:24 +1000
Subject: Re: iwmmxt optimization on PXA270 (dejagnu test report)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2008 00:27:25 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"

On Wed, 26 Mar 2008 11:39:35 +1000, "Hasjim Williams"
<openembedded-devel@lists.futaris.org> said:
> 
> On Sun, 23 Mar 2008 19:01:33 +0100, "Stanislav Brabec" <utx@penguin.cz>
> said:
> 
> > I tested gcc-4.2.2-r6 with -march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt on
> > my image compiled for iwmmxt.
> > 
> > Results seems to be promising. 99.99% tests passed. Results for Fortran
> > are invalid (I had not libgfortran in the system). Surprisingly, all
> > g++.dg/eh (exception handling) tests PASSed.
> 
> I was a bit surprised that all the exception handling tests PASSed, but
> then I realised that there is no code to test exceptions on iwmmxt in
> that directory:

Joseph S Myers just replied to my post on the gcc mailing list, about
this:
http://www.nabble.com/Re%3A-wot-to-do-with-the-Maverick-Crunch-patches--p16397272.html

gcc 4.2.2 doesn't have the patch for iwmmxt unwind support applied:
http://gcc.gnu.org/ml/gcc-patches/2007-01/msg00049.html

It should be in gcc 4.3.0.

binutils 2.18 should have this patch applied already:
http://sourceware.org/ml/binutils/2006-08/msg00207.html

binutils 2.17 doesn't have the patch applied.


