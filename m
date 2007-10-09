Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IfCXZ-0003ur-Au
	for openembedded-devel@openembedded.org; Tue, 09 Oct 2007 12:42:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l99AaUs5004681
	for <openembedded-devel@openembedded.org>;
	Tue, 9 Oct 2007 11:36:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04340-08 for <openembedded-devel@openembedded.org>;
	Tue,  9 Oct 2007 11:36:27 +0100 (BST)
Received: from [192.168.3.6] ([192.168.3.6]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l99AaMLh004672
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 9 Oct 2007 11:36:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30710090202i61cdd25n22f3519ebfd9147a@mail.gmail.com>
References: <1191494488.2516.34.camel@toontown>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
	<f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
	<1191918523.470b3bbb10a47@dominion.kabel.utwente.nl>
	<74d0deb30710090202i61cdd25n22f3519ebfd9147a@mail.gmail.com>
Date: Tue, 09 Oct 2007 12:36:22 +0200
Message-Id: <1191926182.20582.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: oe for two target boards at the same time
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
X-List-Received-Date: Tue, 09 Oct 2007 10:42:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-10-09 at 11:02 +0200, pHilipp Zabel wrote:
> On 10/9/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > If you already built binutils you can remove MACHINE=<foo> from conf files and
> > set it in env, e.g. :
> >
> > MACHINE=c7x0 bitbake mono ; MACHINE=fic-gta01 bitbake mono
> >
> > that saves you a complete reparse.
> 
> Isn't the binutils MACHINE environment variable issue fixed by now?
> I only just noticed that I don't know because I have MACHINE?=magician
> somewhere and always seem to do the first build without the MACHINE
> envvar set...

The issue should be fixed. I regularly make builds with a MACHINE ?=
entry but with MACHINE set in the environment too and it all seems to
work.

People keep telling me there is a problem but I've not seen any
reproducible test case...

Cheers,

Richard



