Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkDXQ-0004HO-NR
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 12:37:16 +0100
Received: by lami14 with SMTP id i14so1259778lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 03:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=xQLAxV68rixfZ650xULU9V6gBr1uXu/YHTMnCysl2LM=;
	b=ueBRYN7+SuMoXG24KHt4YANaD3UKjtZlqe297oAlJ3deB0jLcLMT6y9Zf6u1l4nHXx
	gs18LQ6BQoI1/lZtQuFpyl8QgKIIkojl2Jk7leuJmIY8gLPRRw12IQkq3EfV9BEY/iwu
	KYC2urKzyqPHqbOElmcHZaiTsaehh3c7UWH60=
MIME-Version: 1.0
Received: by 10.112.25.74 with SMTP id a10mr3287901lbg.58.1326108587441; Mon,
	09 Jan 2012 03:29:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Mon, 9 Jan 2012 03:29:47 -0800 (PST)
In-Reply-To: <jeeci3$i8k$1@dough.gmane.org>
References: <1325986434-2020-1-git-send-email-schnitzeltony@gmx.de>
	<jeeci3$i8k$1@dough.gmane.org>
Date: Mon, 9 Jan 2012 09:29:47 -0200
X-Google-Sender-Auth: DjqCw6mZ3qBIDYF3F3pyZtwT0xU
Message-ID: <CAP9ODKrgJKaW3EOjBRfXDd0rr+XWRjZTPL4Gx9RFxOASdG6Ccg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] udisks: add sytemd to DEPENDS
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
X-List-Received-Date: Mon, 09 Jan 2012 11:37:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 9, 2012 at 07:38, Koen Kooi <koen@dominion.thruhere.net> wrote:

> I'm not sure this is the right solution, but I'll take the patch if someone
> doesn't come up with a better way to solve this.
>

The right fix is to handle it in systemd.bbclass and bump every package PR
using it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

