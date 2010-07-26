Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ranjithkannikara@gmail.com>) id 1OdL9P-0001tA-8z
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 12:43:16 +0200
Received: by iwn34 with SMTP id 34so2770085iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 03:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=6bE82NJ16dDx15WHlbnn0eLEO8iWUcvWPw7WmhfGilg=;
	b=W3zmn0NG9Dgc3K+/QieBGrFj/Uh6Zc6Zl/dMAN08tDLcCnxHfr+UPnhyyz2YcKbhnR
	Y1InlsxlzQOA01yODn2e95WaMK4rb4BxqLQ/FnvRKHCJvDYsZ0YZ4XYTcqAKJB/LWTV3
	kNLGrvUcn65RR8chJdz0pkkdnQVtkSQUIzSoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=UK4zpCJLm+YG4h5/stEFiPmBu1wFK6rKV2ppgzgJHXWHD0jJJtzXTJnYXLA3/naoq3
	w4RsHZzkhpeiT2E62MyFpLozeL1Uk4I/TinFQAkYc3WsYxQQQeihiLUNCMmfmrBPirwP
	sh3ZdpHb/0BMVVXu7eWFCKU35bYl1HsYjgjzM=
Received: by 10.231.146.134 with SMTP id h6mr8324411ibv.170.1280140980694; 
	Mon, 26 Jul 2010 03:43:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.181.166 with HTTP; Mon, 26 Jul 2010 03:42:40 -0700 (PDT)
In-Reply-To: <201007261215.50344.ml@vdm-design.de>
References: <AANLkTi=9efmk7Ehrfb69H-CFKUg+8X8fUZ90Pje4Fvh7@mail.gmail.com> 
	<201007261215.50344.ml@vdm-design.de>
From: ranjith kannikara <ranjithkannikara@gmail.com>
Date: Mon, 26 Jul 2010 16:12:40 +0530
Message-ID: <AANLkTi=m9=XcZwzQgzFuAcZnqRHzvcrXMEt0iSAXp5ig@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: ranjithkannikara@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake fso-illume-image returns error on gtk+
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
X-List-Received-Date: Mon, 26 Jul 2010 10:43:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 26, 2010 at 3:45 PM, Thomas Zimmermann <ml@vdm-design.de> wrote:

> Am Montag 26 Juli 2010, 11:56:07 schrieb ranjith kannikara:
> > Hi,
> > I am a newbie in openembedded. I tried bitbake helloworld and it worked.
> > But when i was running "bitbake fso-illume-image" . It returned an error
> > that do_compile for gtk+ failed.
> >
> > The respective error log entry was
> >
> >
> ../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2
> > : ignoring invalid character `\001' in script
> > and
> >
> ../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2
> > : syntax error in VERSION script
> >
> > I tried googling and even asked in the irc channel #oe but dint get any
> > useful information.
> >
> > Can any one tell me how to get this error cleared.
> >
> > I ran bitbake -crebuild gtk+ also , which ran succesfully at first and
> when
> > again i run bitbate fso-illume-image it gave the same error
> > And now when i run bitbake -crebuild gtk+ that too shows the same error.
> >
> > Regards,
> > Ranjith
>
> There is sth strange in the VERSION file of gtk+.
> You have 2 alternatives:
> 1) use bash

2) clean the VERSION file
>

I am already using bash, Anyway i shall try the next alternative you have
given.
Thanks for  your response
Regards,
Ranjith

>
> Greets
> Thomas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Ranjith Babu Kannikara
0091 9809215273
Student, Computer science and engg, GEC Thrissur...
Student developer google ( 2008 GSOC ).
http://sourceforge.net/users/kannikara
http://www.ranjithkannikara.blogspot.com/

