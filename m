Received: from [195.135.220.2] (helo=mx1.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Le97a-00032X-1t
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 15:27:54 +0100
Received: from Relay2.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id 5491A43B5B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2009 15:23:59 +0100 (CET)
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 50AA162807F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2009 15:23:59 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <39983.AFRVDw5RXnw=.1235775042.squirrel@webmail.no-log.org>
References: <43954.AFRVDw5RXnw=.1235749389.squirrel@webmail.no-log.org>
	<go9m74$k03$1@ger.gmane.org>
	<39983.AFRVDw5RXnw=.1235775042.squirrel@webmail.no-log.org>
Date: Mon, 02 Mar 2009 15:23:58 +0100
Message-Id: <1236003838.4936.17.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: [patch](or sort of): emacs didn't compile[second part: qemu recipe]
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
X-List-Received-Date: Mon, 02 Mar 2009 14:27:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

GNUtoo wrote in Fri 02/27 2009 at 23:50 +0100:
> > On 27-02-09 16:43, GNUtoo wrote:
> >
> >> +EXTRA_OECONF += "--target-list=arm-linux-user"
> >
> > NACK, OE handles more than ARM

> yes I know...the qemu recipe is very problematic...that's why I asked what
> to do
> I'd like to integrate the necessary arm patches that permit the build of
> emacs...but I don't know which ones of the patches I should integrate...
> Denis.

When I created this recipe few months ago, qemu was working in about 70%
of tries (on x86_64). In the rest qemu semi-randomly failed.

Simple repeating of the bitbake command several times gets emacs built.

I guess that qemu-arm needs fix.

For example with qemu from
http://download.opensuse.org/repositories/openSUSE:/Tools:/Devel/
(binaries for openSUSE, Fedora, Debian, version tested:
0.9.2svn20080829.5107-2.1 (no more available)) and ASSUME_PROVIDED=qemu
I never got a failure.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



