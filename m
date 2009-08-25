Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1Mfsro-0005Ry-GB
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 12:03:05 +0200
Received: by bwz21 with SMTP id 21so1782657bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=I2daSUlSvuHK0A8mCgZ59FINzhAZul492QoUKZ7IkCU=;
	b=H0x/oJYLvIB1aShdpMLznQhythaAWpGLI4k7e2lSX/MI4NtXw7Duhj22lByQrZuAp2
	f7mZaFQkK+hOaksoLhNrSwXFSxfQ9XMozO+oPWmd3RmVdh/d9nxNqJGo92iMNK0ccc21
	xLeKESXWsxhu9eMVE7htrCGagrExQdHg0WDbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Vvqnd+clXk7ag3ZU8FXEKXir8fmROXXRoxWhkvcBIJd2e1TdlugecbZKNcwkrTgiOZ
	ZdCNnWYvGCrq1rEqnDlxo+UqDMuZ7sRHDC+IUjXHSTMtS6buHJur1hYtHAIHOPUJB29T
	j0O0apnLdVtud7k9dMMkFxs7dEAsHDZE2sJG4=
MIME-Version: 1.0
Received: by 10.103.50.32 with SMTP id c32mr2550286muk.1.1251193513148; Tue, 
	25 Aug 2009 02:45:13 -0700 (PDT)
In-Reply-To: <4A93AA7F.1070804@gmail.com>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<20090824183057.GA6369@rhein.zuhause.netz>
	<91283b620908241313y12559faei9c215560c103c508@mail.gmail.com>
	<4A93AA7F.1070804@gmail.com>
Date: Tue, 25 Aug 2009 10:45:13 +0100
Message-ID: <91283b620908250245t1ab4fde2xef8e9b9344dfb3b7@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Qt problems
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
X-List-Received-Date: Tue, 25 Aug 2009 10:03:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Can you show me an example of what you mean please.

I know its a mess and that is part of my problem.

2009/8/25 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

> Stuart Gray wrote:
> > Here are the bb files.
> >
> > qt4-embedded is the standard bb file.
> >
> > libmusicbrainz is the latest version of this software - to get this to
> work
> > I had to use oe_soinstall to include libstdc++.so.6
> >
> > dockamp is my own software which is the code written on Fedora Linux. I
> > chnaged a lot of the include paths as it could not locate the files. For
> > example:
> >
> > #include
> >
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkReply>
> > #include
> >
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkAccessManager>
> > #include
> >
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkRequest>
> >
> > these were originally
> > #include <QNetworkReply>
> > etc...
> >
> > and then for Qt libraries I had to change:
> >
> > QT += QtDBusE QtNetworkE QtSqlE phononE QtXmlE
> >
> > from
> >
> > QT += dbus network sql phonon xml
> >
> > I have been told that qmake should take care of this.
> >
> > Thanks,
> > Stuart
> >
> > 2009/8/24 Henning Heinold <heinold@inf.fu-berlin.de>
> >
> > > Hi,
> > >
> > > wihtout the recipe there is no chance to help you.
> > >
> > > Bye Henning
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> >
> > ------------------------------------------------------------------------
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> You should regenerate your Makefile with oe-staged qmake.
> PS: Your full-path includes are dirty hacks which shouldn't be used any
> time. It's a mess.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

