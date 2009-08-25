Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MfsL3-0004GS-5D
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 11:29:13 +0200
Received: by ewy21 with SMTP id 21so4218907ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=IaqHRPnrfpBna98RBdYsMF8zAEunJHsnSI4juVB1nig=;
	b=PXDBuUMGNKolH5ABxxdHhxn+1+X+eVk6Q91DCqICTbjUcLQgkPWxKfIr3NlupubcW+
	seA6UK3M+o0dnlhoikKfpb6uMPGamqD0mHgTeo+N7NAo0pEz/Q96M230JfHznwa718hm
	mHJxt9/rFZNgfy0TiasUZpi12/uaRQwGAd/EU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=rjJpk+R+H2s3/aJOwoJ+D386eTWmUJRKlWXk8oQRGVCpMxXGopPRL3EI/MeGpztmji
	wGZy5CnEY7+IT1FceSG6vLhCfgMSDr9/zUKZBMr2ZyGjgK3P/7abT3/AkOCFWdFJqEtE
	FA/sLjfxIEVhZnBvMEUt5OngtTszKKlrpXuKs=
Received: by 10.216.37.6 with SMTP id x6mr1244445wea.25.1251191481581;
	Tue, 25 Aug 2009 02:11:21 -0700 (PDT)
Received: from ?10.6.26.107? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id p37sm30133748gvf.12.2009.08.25.02.11.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Aug 2009 02:11:20 -0700 (PDT)
Message-ID: <4A93AA7F.1070804@gmail.com>
Date: Tue, 25 Aug 2009 12:10:23 +0300
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>	<20090824183057.GA6369@rhein.zuhause.netz>
	<91283b620908241313y12559faei9c215560c103c508@mail.gmail.com>
In-Reply-To: <91283b620908241313y12559faei9c215560c103c508@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Aug 2009 09:29:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stuart Gray wrote:
> Here are the bb files.
>
> qt4-embedded is the standard bb file.
>
> libmusicbrainz is the latest version of this software - to get this to work
> I had to use oe_soinstall to include libstdc++.so.6
>
> dockamp is my own software which is the code written on Fedora Linux. I
> chnaged a lot of the include paths as it could not locate the files. For
> example:
>
> #include
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkReply>
> #include
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkAccessManager>
> #include
> </home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/include/QtNetwork/QNetworkRequest>
>
> these were originally
> #include <QNetworkReply>
> etc...
>
> and then for Qt libraries I had to change:
>
> QT += QtDBusE QtNetworkE QtSqlE phononE QtXmlE
>
> from
>
> QT += dbus network sql phonon xml
>
> I have been told that qmake should take care of this.
>
> Thanks,
> Stuart
>
> 2009/8/24 Henning Heinold <heinold@inf.fu-berlin.de>
>
> > Hi,
> >
> > wihtout the recipe there is no chance to help you.
> >
> > Bye Henning
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   
You should regenerate your Makefile with oe-staged qmake.
PS: Your full-path includes are dirty hacks which shouldn't be used any
time. It's a mess.


