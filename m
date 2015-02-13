Return-Path: <pespin.shar@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9FA733C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 12:47:42 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id z107so12923408qgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 04:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZjEgluS+mKU3Tv2c8fUDav6inhgbFEkxVD3yfIWCZOE=;
	b=f62bpjcfZ1dPu1a5ihWOs5KrWa08VoGODLsLK3OeYvwbRU6tBjf5wu78mmOK5FvVZa
	mZdjj9jkPlyMsZLjiImHtUxwmOOYHyznELsIdvpdJXJIaGTd6Re+SiFG4CKug+vOecXh
	qH7wiQCDGCvWFsbxS7CEHO44L2UIYIPBz/H50Sv0AiPII6KASVbjugN9KVaLAO2YknbP
	0cjqcwSJjO7QYyXoqqDQNUeg4++rEXlnUSb/ZtXPiHGPekozH2WNY4IxgNKPVE4EKoq9
	+0pd+JUoRbeyapFyg0908XZRR1MfIp6vXL+FJnSH/IXfv6GTwHAU8rOHp5AQgSC0hhbN
	kuyA==
MIME-Version: 1.0
X-Received: by 10.140.194.139 with SMTP id p133mr2254992qha.21.1423831663769; 
	Fri, 13 Feb 2015 04:47:43 -0800 (PST)
Received: by 10.229.221.66 with HTTP; Fri, 13 Feb 2015 04:47:43 -0800 (PST)
In-Reply-To: <CAP9ODKpzYyVB+K6XZ=oQtYZ_TSce19D0r=_bk5RPxxtvVUgxhw@mail.gmail.com>
References: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
	<CAP9ODKpzYyVB+K6XZ=oQtYZ_TSce19D0r=_bk5RPxxtvVUgxhw@mail.gmail.com>
Date: Fri, 13 Feb 2015 13:47:43 +0100
Message-ID: <CAEGpDubcHDv+PYTukYV=N+va3837GwvioesHMgKO7nCenQSDiQ@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtmultimedia: Enable building of package qtmultimedia-examples
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 12:47:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
I did that patch several weeks ago but actually I didn't have the
occasion to sent it till recently.

I remember I had to add those lines in order to get the -examples
package being built at the time I did it. Maybe it has been fixed in
HEAD somehow with other commits in the meantime...

Indeed, I checked: I'm using meta-qt rev
adeaa6128b665920eb98eb7c064f4aacbd74b873 and if I remove the lines
added by the patch then I get no qtmultimedia-examples .deb package.

In packages-split directory I get these dirs but they are empty:
qtmultimedia-examples
qtmultimedia-examples-dbg
qtmultimedia-examples-dev
qtmultimedia-examples-staticdev

I will try to let you know if the problem persists for me when we
upgrade to newer meta-qt.

Thanks for reviewing it!

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net


2015-02-11 23:36 GMT+01:00 Otavio Salvador <otavio@ossystems.com.br>:
> On Wed, Feb 11, 2015 at 8:06 AM, Pau Espin Pedrol <pespin.shar@gmail.com> wrote:
>> From: Pau Espin Pedrol <pau.espin@essensium.com>
>>
>> Signed-off-by: Pau Espin Pedrol <pau.espin@essensium.com>
>
> I am wondering why your examples were not build. Mine were build.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

