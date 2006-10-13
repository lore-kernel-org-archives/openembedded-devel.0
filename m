Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GYKel-0004oX-33 for openembedded-devel@lists.openembedded.org;
	Fri, 13 Oct 2006 12:52:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 15189D3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 12:46:20 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 10086-05 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 12:46:15 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id B9841D3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 12:46:15 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <b9481e140610100631u25d9bc4dm7f6483c20e3c482d@mail.gmail.com>
References: <b9481e140610100631u25d9bc4dm7f6483c20e3c482d@mail.gmail.com>
Organization: VanilleMedia
Date: Fri, 13 Oct 2006 12:46:15 +0200
Message-Id: <1160736375.21755.86.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: Bitbaking a recipe which refers to a missing bbclass
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
X-List-Received-Date: Fri, 13 Oct 2006 10:52:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Dienstag, den 10.10.2006, 15:31 +0200 schrieb Nicolas FR:
> I have noticed that when bitbaking a recipe which refers to a missing
> .bbclass definition, there where no warning / error.
> 
> For example let's say I try to bitbake example.bb which has:
> "inherits qt3x11"
> 
> if qt3x11 is missing in my /opt/OE/mybranch/classes/
> then no warning / error is isued.

This is probably an artifact of the 'inherit' and the 'include'
statement sharing code.
I would like to propose 'inherit' to behave like 'require'.

> Should I submit a bug for this?

Yes, please.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




