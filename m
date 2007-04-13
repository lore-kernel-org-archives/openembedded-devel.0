Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HcIaC-0000f4-0s
	for openembedded-devel@openembedded.org; Fri, 13 Apr 2007 12:00:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3DA0hd4007118
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 11:00:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06494-09 for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 11:00:40 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3DA0cZY007107
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 11:00:39 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200704131148.32947.openembedded@hrw.one.pl>
References: <461F4C4A.7010401@whitby.id.au>
	<200704131148.32947.openembedded@hrw.one.pl>
Date: Fri, 13 Apr 2007 11:00:38 +0100
Message-Id: <1176458438.5836.12.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	l3DA0hd4007118
Subject: Re: Where should MACHINE_TASK_PROVIDER be defined?
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
X-List-Received-Date: Fri, 13 Apr 2007 10:00:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2007-04-13 at 11:48 +0200, Marcin Juszkiewicz wrote:
> Dnia pi=C4=85tek, 13 kwietnia 2007, Rod Whitby napisa=C5=82:
> > There seems to be significant inconsistency in the way that
> > MACHINE_TASK_PROVIDER is defined in OE (see the output of a recursive
> > grep command in .../conf at the end of this message).
> >
> > It's defaulted to "task-base" in bitbake.conf, and then every man and
> > his dog forcibly defines it to the same thing in a variety of
> > machine.conf files and distro.conf files.
> >
> > Should all of these instances simply be deleted
>=20
> Yes - most of them are from time when we had task-bootstrap as default.

Agreed.

They're from the transition period when task-bootstrap was default and
each machine had to be tagged as it was converted. All the duplicates
can now be removed since the default has changed.

Cheers,

Richard=20




