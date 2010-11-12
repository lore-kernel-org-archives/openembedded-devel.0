Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luke.leighton@gmail.com>) id 1PH1w3-0001ok-G6
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 23:17:36 +0100
Received: by qyk2 with SMTP id 2so54621qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 14:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type;
	bh=69J/hmjukJO90gL2/sKpWSqbNGrBAA9v1LY6RdWr50c=;
	b=KO0W8pEmyMFGlz11n72ZUTVh0o0n0hJiqrzbyUN3xnOnz/Blx9pR8W7lUO3Nvj8hDK
	pzN2iVNSV1/HzFU6egFLi852OzUtjBrAgJDqdqJ96+MvH7K07AstLurVLQRUkTeChCpH
	/hyd9HJqexsiZRP42bYrAFp3+rVscAbq4Hz54=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	b=E385WxABkMcrcSk6R+zRbmADhXqky+qMWGfnTVMES+xFNS3U2yY/WKh9mBrFfcfs4k
	uKSE7CJFVC4f2uUKgjT3EA/ETIE8X63sewdEzU8/OmY7gezcXVxTFghj0usoqi4QwgXC
	L5LWhx2nA6LzeLfnuTcgik/An57MpNeXDahOE=
MIME-Version: 1.0
Received: by 10.229.224.212 with SMTP id ip20mr2321347qcb.278.1289600184489;
	Fri, 12 Nov 2010 14:16:24 -0800 (PST)
Sender: luke.leighton@gmail.com
Received: by 10.220.112.210 with HTTP; Fri, 12 Nov 2010 14:16:24 -0800 (PST)
In-Reply-To: <201011122021.56362.anarsoul@gmail.com>
References: <AANLkTikm572dcjPRTvF7nGnuVY3uuPryRRGbyyDBS+eg@mail.gmail.com>
	<201011122021.56362.anarsoul@gmail.com>
Date: Fri, 12 Nov 2010 22:16:24 +0000
X-Google-Sender-Auth: mbjjvLymw1e8vJaEmW6pvsH2xT0
Message-ID: <AANLkTinOvOx+pB50Oy0vpo4vO8bpKqNmNROBTGOx6uhP@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
To: Vasily Khoruzhick <anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: luke.leighton@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: multiple virtual/gail on reviving gtk+-directfb
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
X-List-Received-Date: Fri, 12 Nov 2010 22:17:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 12, 2010 at 6:21 PM, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> On Friday 12 November 2010 20:05:19 Luke Kenneth Casson Leighton wrote:
>> [hi please cc me direct because i am subscribed with nomail, thx]
>>
>> folks, hi,
>>
>> i have a requirement to bring gtk+-directfb up-to-date [and also do
>> python-pygtk-directfb, which is gonna be interesting on a 400mhz
>> ARM9... :) have to see how that goes...]
>
> Are you aware that gtk directfb backend is broken since 2.18.0?

 ah?  no.  bugger.  i'll drop back to 2.16 or so, then ( it doesn't
make any odds one way or the other which version is used ).

> And that gtk
> developers will drop it in gtk3?

yes.  this is an "emergency" interim solution, to get product
"out-the-door".  i've already recommended that they move to
qt4-embedded, but that can't happen immediately: i _have_ to get gtk +
directfb up-and-running, for the demo.  and webkit.  and python-cairo.
 and pywebkit-gtk with patches from
http://www.gnu.org/software/pythonwebkit.  and pyjamas desktop.  lots
of packaging to do, lots of new OE bitbake files :)

apparently, i've learned almost all of the embedded products in the
space that i'm doing the work for use directfb, so many of them use
gtk and directfb.  what they _don't_ ****** well do is actually pay
any free software developers any ****** money for making use of gtk
and directfb.  so, it didn't come as any particularly great surprise
to me to learn that directfb is being dropped for gtk3.

 which means, simply, that use of gtk will be entirely dropped from
the embedded market...  eventually :)

 ... so, yeah, right now, i need to get that conflict to disappear!

 l.


