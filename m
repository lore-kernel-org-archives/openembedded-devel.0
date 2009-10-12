Received: from [209.85.211.178] (helo=mail-yw0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1MxDbM-0004QW-Ai
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Oct 2009 07:37:47 +0200
Received: by ywh8 with SMTP id 8so8900662ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 22:36:50 -0700 (PDT)
Received: by 10.151.20.15 with SMTP id x15mr9405186ybi.126.1255325810593;
	Sun, 11 Oct 2009 22:36:50 -0700 (PDT)
Received: from mail-iw0-f190.google.com (mail-iw0-f190.google.com
	[209.85.223.190])
	by mx.google.com with ESMTPS id 23sm1952270ywh.11.2009.10.11.22.36.49
	(version=SSLv3 cipher=RC4-MD5); Sun, 11 Oct 2009 22:36:49 -0700 (PDT)
Received: by iwn28 with SMTP id 28so4041371iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 22:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.6.164 with SMTP id 36mr7036927ibz.39.1255325808127; Sun, 
	11 Oct 2009 22:36:48 -0700 (PDT)
In-Reply-To: <200910120422.20135.holger+oe@freyther.de>
References: <fd72b8f50910110737u5cf0c64dv2e352feaa2c46e1@mail.gmail.com> 
	<fd72b8f50910110853u46dc80dbr5ba7410e0a6a0840@mail.gmail.com> 
	<fd72b8f50910110914u3b9ddbfcsaea33748a3a68345@mail.gmail.com> 
	<200910120422.20135.holger+oe@freyther.de>
From: derek he <mail@april1985.com>
Date: Mon, 12 Oct 2009 13:36:28 +0800
Message-ID: <8d6d90320910112236h67b0a569qab54464a692a5ea5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: imagemagick-native-6.3.5 compile problems
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
X-List-Received-Date: Mon, 12 Oct 2009 05:37:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK. I'll try it. I'm not very familiar with these things but I'll try my
best! Thank you again for your great help!

2009/10/12 Holger Hans Peter Freyther
<holger+oe@freyther.de<holger%2Boe@freyther.de>
>

> On Sunday 11 October 2009 18:14:07 mail mail wrote:
> > Hi, Holger Hans Peter Freyther
> > Thank you for your direction. I finished compile it and here is my patch:
> >
> > --- delegate.c    2007-09-11 11:20:41.000000000 +0800
> > +++ delegate.c    2009-10-12 00:04:45.000000000 +0800
> > @@ -769,7 +769,7 @@
> >    /*
> >      Copy source file to destination.
> >    */
> > -  destination_file=open(destination,O_WRONLY | O_BINARY | O_CREAT);
> > +  destination_file=open(destination,O_WRONLY | O_BINARY | O_CREAT,
> 0777);
> >    if (destination_file == -1)
> >      return;
> >    source_file=open(source,O_RDONLY | O_BINARY);
>
> great. Could you please do one more thing. Change the image-magick recipe
> to
> apply this patch (e.g. by adding SRC_URI += file://fix-native-
> compile.patch;patch=1) and then use git add on the patch and create a git
> commit which adds the patch, patches image-magick and use git format-patch
> to
> send this to the mailinglist?
>
> With patches coming from git format-patch we can use git am to apply them.
>
>        z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

