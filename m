Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P28li-0006OJ-2L
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 22:33:20 +0200
Received: by iwn2 with SMTP id 2so5253604iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Oct 2010 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=zsZRybEpeIAnPzguBg8JO14ZICG3SmqoScUCCFyIvMw=;
	b=ifla5j6dHCD2OmyWCjYxH6HpsO2BlS5pIHmwub77FTwHqvw3W9Jzkx1WFNfHqLbWQL
	bK+SvL1wkdDS7AfwX1LO1vChQf1ktthVCSmsb+AXHoYKaBootCQ395P6jVtnL/MKr2PS
	EQOCOr2CFiAjqK7iFg70jIs3XAQ5NaldHIE2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=wjv8hMDQ/+n6zwafcZUmfyl2PhJtodySXHnnZ/N7TikgkTUKltzIo9jCDhf/waPNUz
	EeaQlt3ZYyKT40+GRef0oAP6ZqqCMwih0zKOGKc511ppl/K96FOrdKEUIz8J1dcvSESF
	HsDgQVKHu3OXzy8orLwXUdHzq77Q9j1tWp+Ic=
Received: by 10.231.192.80 with SMTP id dp16mr7736917ibb.39.1286051581723;
	Sat, 02 Oct 2010 13:33:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sat, 2 Oct 2010 13:32:40 -0700 (PDT)
In-Reply-To: <4CA7946D.1030500@freyther.de>
References: <4CA7946D.1030500@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Oct 2010 13:32:40 -0700
Message-ID: <AANLkTikgt4-pXDhummqapb2EQa_x+kR3j_Gj0mRsH7NP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libtool upgrade (2.2.10 and 2.4.0)
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
X-List-Received-Date: Sat, 02 Oct 2010 20:33:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 2, 2010 at 1:22 PM, Holger Freyther <holger+oe@freyther.de> wrote:
> Hi all,
>
> I am testing a libtool upgrade to 2.2.10 (the version poky is using) and so
> far it seems to just work. There is also libtool 2.4 (released on the 22nd of
> September) which has sysroot support (--enable-sysroot). Did anyone try it? Is
> anyone interested in giving it a try?

I have started to look into it since yesterday. I think we should move to 2.4
and skip 2.2.10 to exploit the sysroot support. Do you already have a patch or
should I keep forging ?

>
> holger
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


