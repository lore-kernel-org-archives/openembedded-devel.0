Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <alain2210@free.fr>) id 1GJ5Yk-0000RJ-KP
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Sep 2006 11:43:34 +0200
Received: from imp8-g19.free.fr (imp8-g19.free.fr [212.27.42.39])
	by smtp4-g19.free.fr (Postfix) with ESMTP id D43E5545CB;
	Fri,  1 Sep 2006 11:41:13 +0200 (CEST)
Received: by imp8-g19.free.fr (Postfix, from userid 33)
	id CFC4C8383; Fri,  1 Sep 2006 12:01:45 +0200 (CEST)
Received: from AMontsouris-153-1-27-129.w86-212.abo.wanadoo.fr
	(AMontsouris-153-1-27-129.w86-212.abo.wanadoo.fr [86.212.82.129]) 
	by imp8-g19.free.fr (IMP) with HTTP 
	for <alain2210@127.0.0.1>; Fri, 01 Sep 2006 12:01:45 +0200
Message-ID: <1157104905.44f80509b9320@imp8-g19.free.fr>
Date: Fri, 01 Sep 2006 12:01:45 +0200
From: Alain2210 <alain2210@free.fr>
To: Jamie Lenehan <lenehan@twibble.org>
References: <1156967236.44f5eb4411b36@imp5-g19.free.fr>
	<20060901013235.GA12885@twibble.org>
In-Reply-To: <20060901013235.GA12885@twibble.org>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 86.212.82.129
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: gd package and cross compile badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2006 09:43:34 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

thnaks for this answer :

Quoting Jamie Lenehan <lenehan@twibble.org>:

> On Wed, Aug 30, 2006 at 09:47:16PM +0200, Alain2210 wrote:
> > I'm trying to compile tetex with org.openembedded.dev but it needs to
> compile gd
> > (gd_2.0.33) but it does not work. It seems to be a problem in configu=
re. In
> the
> > config.log
> > I can see
> > CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
> > cc1: internal compiler error: Aborted
>
> The configure script is looking in /usr/include for headers, but
> those headers are for your host system and not for the target system.

Yes, I understand that.

> I suspect you have one of those distro's that include the X header in
> /usr/include only and not in /usr/X11R6/include and so it's the
> search for the X headers that is the issue.

I have forgotten to say that I was using familiar-unstable.

>
> It looks for the X headers because they are needed if freetype or xpm
> is support is being included in gd. It looks like neither of these
> are included, so disabling the check for X is probably the correct
> fix:

Yes, this corrects the problem.

I get an analogous problem in tetex. And will try to solve it with the sa=
me
technic.

Thanks,

Alain


