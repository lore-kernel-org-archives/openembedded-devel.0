Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkimL-0003DI-2w
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 21:58:45 +0100
Received: by lami14 with SMTP id i14so1754lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2012 12:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=U+kJYF/1D9XlcUH3BofcDFzMVhA3kWxB0VSpFW+BkHY=;
	b=KaEHI8cj9AvZpQHIj4MdOcJdTSaHb9Vtg1N2IAT6mKRH1vqCbCSvI40pBdbXuR/rz0
	uqYPFc7Ny3kjTLij2n4IRjWCbxuy1GJr5lYG1QpToH1XotHQ+z+Tr7d1pub0DrffCLcy
	zBMXRTHcGsx8oP217txQkkVosrTN+ZAX15aX0=
MIME-Version: 1.0
Received: by 10.112.25.74 with SMTP id a10mr4690661lbg.58.1326228674716; Tue,
	10 Jan 2012 12:51:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Tue, 10 Jan 2012 12:51:14 -0800 (PST)
In-Reply-To: <jei7qo$gvl$1@dough.gmane.org>
References: <cover.1326196151.git.anders@chargestorm.se>
	<5dd3bb213c6027bdde9de0394b5dbbd0aeedaac7.1326196151.git.anders@chargestorm.se>
	<jei7qo$gvl$1@dough.gmane.org>
Date: Tue, 10 Jan 2012 18:51:14 -0200
X-Google-Sender-Auth: h7KGyqgPRU9fB4fMkIqO1AcEABw
Message-ID: <CAP9ODKou4VHCJrKOv6vQmqibprS3YRVzUJy6OCqaXbKBkwiiVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v3 3/3] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Tue, 10 Jan 2012 20:58:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 18:42, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Op 10-01-12 12:52, Anders Darander schreef:
> > If the machine lacks keyboard support, there is no need for
> > kbd*-packages.
>
> NAK, this would make the complete systemd machine specific, which we do not
> want.
>

IMO the keyboard support ought to be handled, in systemd case, as a distro
feature so allowing it to be machine independent but allowing for the
flexibility of removing its recommendations if need.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

