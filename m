Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PNlVE-0008W2-PN
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 13:09:41 +0100
Received: by wwi17 with SMTP id 17so1424351wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 04:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sTXDy0nrWEK0ZMpgy/QfkhiR4Q7y319OeE3YySl+2v0=;
	b=TotbRMqwYcn6Xg0unISf8yPicEHpipnUzMAOx9FdijeBOpJiMIlBhJHbmo6K4QIrrj
	smJo5CsJz0qM3VTyWyikIRw1lcys5a78IkexGqcvHHC25zxEoyRrqPOHd1vXp+KRoAlg
	me/UvJxb1bCO/F8RI/ywogzUZlyB5ewBbIADQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MIdUXNWDABwKt0jheKxt7t2vB7DB71xe2Phw+aKgWhqP9VBAzc4yVaEqDp3SGb1FgY
	tQV8uIW3a/tibMCLxn/47pi2rLXYrXiw56L55hFkDBiAIy634a7ZI7DkrFb0ez3K3Gxe
	KVJOOWn0uiXYnaDR7PzLuRXeCztv4kseegd5k=
MIME-Version: 1.0
Received: by 10.216.36.146 with SMTP id w18mr7577191wea.70.1291205299294; Wed,
	01 Dec 2010 04:08:19 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Wed, 1 Dec 2010 04:08:19 -0800 (PST)
In-Reply-To: <20101201115806.GQ10755@ibawizard.net>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
	<ico56o$f8$2@dough.gmane.org>
	<20101127140200.GH10755@ibawizard.net>
	<AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>
	<AANLkTinrTnrTXsLVFFxpnUWt1ivwn_V2xS=V8dsej97u@mail.gmail.com>
	<4CF6346B.2060407@opensimpad.org>
	<20101201115806.GQ10755@ibawizard.net>
Date: Wed, 1 Dec 2010 13:08:19 +0100
Message-ID: <AANLkTi=yh=EwSSbN9YNriry779YdOrA0+EvfNJR=YP=W@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Wed, 01 Dec 2010 12:09:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 1, 2010 at 12:58 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Bernhard Guillon <Bernhard.Guillon@opensimpad.org> [2010-12-01 12:41:31]:
>
>> This is true. We could add some python foo and check for angstrom? In my
>> opinion the log2f patch is of no real harm. The tls support might be a
>> problem.

it seems so, khem hinted about git needing tls

>
> Why to not move to some newer version of uClibc directly, without that pa=
tch
> at all?
>
> -- ynezz

uclibc-0.9.30.3 needs binutils 2.20.1

>Koen:
>An upgrade of binutils is out of the question for angstrom 2008.

so here we stay


Andrea


