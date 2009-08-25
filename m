Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1Mfusu-0003gS-HM
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 14:12:22 +0200
Received: by bwz21 with SMTP id 21so1846213bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/AgJ+LOVz+TuM+bBykuEeuN9PiIfiviFcMANG7rqevs=;
	b=mogOs9Iqg7wKIedstOcRHDQJsKrhpExeRDBJuN8qR9t1lR5Lj96sLgp/kjHyuFQp+F
	9Zn2Hu2Y8qh8BYvupQPnXYXKYYt7Gv8URTM8YzC03Qle6YH+SkX0QMseUo82VW26Q6xy
	DaGcPiNtUcd+Qj8KeFWgvgdI4Q14rnSx3Dz7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fwS4WfdWht+cnc5N1xH5WqcsTswv/v4ZWPrHElPFZ47+dNJZKiwaVmivIhmyWfLvxX
	d3L61wyDNlLx0ZXLccpojqWcCpYp15CA6niE8ncjgK1xgBdBoqgXwXJVrOPkfHaiOq+j
	Gd6fEBDMz6FDVOLDJMrggaDSyinSeD1TQHvfI=
MIME-Version: 1.0
Received: by 10.103.84.12 with SMTP id m12mr2591200mul.79.1251201266954; Tue, 
	25 Aug 2009 04:54:26 -0700 (PDT)
In-Reply-To: <4A93BC84.7070106@gmail.com>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<20090824183057.GA6369@rhein.zuhause.netz>
	<91283b620908241313y12559faei9c215560c103c508@mail.gmail.com>
	<4A93AA7F.1070804@gmail.com>
	<91283b620908250245t1ab4fde2xef8e9b9344dfb3b7@mail.gmail.com>
	<4A93BC84.7070106@gmail.com>
Date: Tue, 25 Aug 2009 12:54:26 +0100
Message-ID: <91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Aug 2009 12:12:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi we have just solved the problem

within the bitbake file I changed it to

qmake2 "QT_LIBINFIX=E" ${WORKING_DIR}/dockamp.pro


Can you tell me how I fix my include file? I see within run.do_compile
reference to the folder which I have included within the files, but this
does not help to find the include file. Maybe I need to add some other
command on the call to qmake2.

Stuart

2009/8/25 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

> Stuart Gray wrote:
> > Can you show me an example of what you mean please.
> >
> > I know its a mess and that is part of my problem.
> >
> > 2009/8/25 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> >
> > > Stuart Gray wrote:
> > > > Here are the bb files.
> > > >
> > > > qt4-embedded is the standard bb file.
> > > >
> > > > libmusicbrainz is the latest version of this software - to get this
> to
> > > work
> > > > I had to use oe_soinstall to include libstdc++.so.6
> > > >
> > > > dockamp is my own software which is the code written on Fedora Linux.
> I
> > > > chnaged a lot of the include paths as it could not locate the files.
> For
> > > > example:
> > > >
> > > > #include
> > > >
> > >
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkReply>
> > > > #include
> > > >
> > >
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkAccessManager>
> > > > #include
> > > >
> > >
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkRequest>
> > > >
> > > > these were originally
> > > > #include <QNetworkReply>
> > > > etc...
> > > >
> > > > and then for Qt libraries I had to change:
> > > >
> > > > QT += QtDBusE QtNetworkE QtSqlE phononE QtXmlE
> > > >
> > > > from
> > > >
> > > > QT += dbus network sql phonon xml
> > > >
> > > > I have been told that qmake should take care of this.
> > > >
> > > > Thanks,
> > > > Stuart
> > > >
> > > > 2009/8/24 Henning Heinold <heinold@inf.fu-berlin.de>
> > > >
> > > > > Hi,
> > > > >
> > > > > wihtout the recipe there is no chance to help you.
> > > > >
> > > > > Bye Henning
> > > > >
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > >
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > > > >
> > > >
> > > >
> ------------------------------------------------------------------------
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > >
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > > >
> > > You should regenerate your Makefile with oe-staged qmake.
> > > PS: Your full-path includes are dirty hacks which shouldn't be used any
> > > time. It's a mess.
> > >
> >
> Have you tried OpenEmbedded Qt/Embedded SDK [1] for building your software?
>
> [1]: http://docs.openembedded.org/usermanual/usermanual.html#id491630
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

