Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MftXS-0003nC-Gn
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 12:46:10 +0200
Received: by ewy21 with SMTP id 21so4324113ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 03:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=a5dW8yA0Hscrb4ZwpVzWMZLw7t3iFNcu/jHml2J+/L8=;
	b=xq55cUZS8Tg6xy1v2J1bSTD+icfoQmT50lzaHiuI41bzYrEsUsrhD8ILiiKd8Sl5j+
	lS4O3sRJ0iPU91mSSeObQb9sMH62hZWDADdr8QLC7gP1TTybYthwM6qc3IxgG72kdOeE
	K/fccJE0PQF5ExWdo7ZWq4HnB8PmY9KC70fO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=VIIz9tPFhMx3QqmKAow3J/OSx3NVBLS2C1u5L8JMnAX+yznrpNJvOCwUilsrsR08uA
	zk+hbfcAr1kEZgZs/Hd9QpSTItfyMluMtdexsQlxjn73moDUIniGbJ51wzOT0hrzOLDf
	45N50SAzAgU+XFXRRCr56VIoNEl6SN6JNfBxc=
Received: by 10.216.39.80 with SMTP id c58mr1214570web.122.1251196095102;
	Tue, 25 Aug 2009 03:28:15 -0700 (PDT)
Received: from ?10.6.26.107? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id t12sm436319gvd.16.2009.08.25.03.28.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Aug 2009 03:28:14 -0700 (PDT)
Message-ID: <4A93BC84.7070106@gmail.com>
Date: Tue, 25 Aug 2009 13:27:16 +0300
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>	<20090824183057.GA6369@rhein.zuhause.netz>	<91283b620908241313y12559faei9c215560c103c508@mail.gmail.com>	<4A93AA7F.1070804@gmail.com>
	<91283b620908250245t1ab4fde2xef8e9b9344dfb3b7@mail.gmail.com>
In-Reply-To: <91283b620908250245t1ab4fde2xef8e9b9344dfb3b7@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Aug 2009 10:46:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stuart Gray wrote:
> Can you show me an example of what you mean please.
>
> I know its a mess and that is part of my problem.
>
> 2009/8/25 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
>
> > Stuart Gray wrote:
> > > Here are the bb files.
> > >
> > > qt4-embedded is the standard bb file.
> > >
> > > libmusicbrainz is the latest version of this software - to get this to
> > work
> > > I had to use oe_soinstall to include libstdc++.so.6
> > >
> > > dockamp is my own software which is the code written on Fedora Linux. I
> > > chnaged a lot of the include paths as it could not locate the files. For
> > > example:
> > >
> > > #include
> > >
> > </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkReply>
> > > #include
> > >
> > </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkAccessManager>
> > > #include
> > >
> > </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkRequest>
> > >
> > > these were originally
> > > #include <QNetworkReply>
> > > etc...
> > >
> > > and then for Qt libraries I had to change:
> > >
> > > QT += QtDBusE QtNetworkE QtSqlE phononE QtXmlE
> > >
> > > from
> > >
> > > QT += dbus network sql phonon xml
> > >
> > > I have been told that qmake should take care of this.
> > >
> > > Thanks,
> > > Stuart
> > >
> > > 2009/8/24 Henning Heinold <heinold@inf.fu-berlin.de>
> > >
> > > > Hi,
> > > >
> > > > wihtout the recipe there is no chance to help you.
> > > >
> > > > Bye Henning
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > > >
> > >
> > > ------------------------------------------------------------------------
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> > You should regenerate your Makefile with oe-staged qmake.
> > PS: Your full-path includes are dirty hacks which shouldn't be used any
> > time. It's a mess.
> >
>   
Have you tried OpenEmbedded Qt/Embedded SDK [1] for building your software?

[1]: http://docs.openembedded.org/usermanual/usermanual.html#id491630


