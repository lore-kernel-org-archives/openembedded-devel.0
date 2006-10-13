Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GYKtB-0005DA-9M for openembedded-devel@lists.openembedded.org;
	Fri, 13 Oct 2006 13:07:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 38E94D3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 13:01:14 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 10385-02 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 13:01:08 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 9694FD40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 13:01:07 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <b9481e140610111346xc062befs848d9e1c3bd35075@mail.gmail.com>
References: <b9481e140610111346xc062befs848d9e1c3bd35075@mail.gmail.com>
Organization: VanilleMedia
Date: Fri, 13 Oct 2006 13:01:07 +0200
Message-Id: <1160737267.21755.92.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: Help with bitebaking latest python-dbus
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
X-List-Received-Date: Fri, 13 Oct 2006 11:07:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 11.10.2006, 22:46 +0200 schrieb Nicolas FR:
> I am trying to bitbake python-dbus_0.71 with a simple bb, but I am
> stuck on a cryptic error (seems to lie in how distutils tries to
> compile the package). Could someone help me building this new version?

Add a bug and I'll have a look over the weekend. (pretty busy atm.)
>     sources = self.swig_sources(sources, ext)
> TypeError: swig_sources() takes exactly 2 arguments (3 given)

This is a mismatch of swig and Distutils -- perhaps we need to upgrade
(or downgrade) either one. It might be worth checking in the swig
changelog whether something changed.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




