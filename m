Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NbvDH-0001S5-Sz
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 13:17:10 +0100
Received: by fxm4 with SMTP id 4so5913fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=8jAJxIkThl6LhMxDF5/A2TGo4KCOgdKLSyShTEnFmek=;
	b=iQ/MqL7bb9ns35kOPkP98+pKQTrQl3601ucqp4umEDEeTpp0rAXj9XJVBNqQevF1Lg
	eNbP+VQZKqJCX0dS7g9yQ6oBX5ngBDBumZoprd9RDND6YwWzrscpBWsrO472nqKhlY4a
	qN2IvOxAFwLihz6CYqA1tbOSYKEHummiY1tZ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=aB5Lpm80kTm7XOfnFNZsuxI8cnpIDcZuEI29EB+S7OaVhzyEDvS73l+FNTEHqurppG
	h2XfRrWqf/GKtk0dWESXAm1SXqMVPLbLM5VBX37ZnRjcN9LskrzHCEU5o6rF6N+E+IaE
	5kjZ0FSwGmw0ykboSwnzWra+usDO2MwUjq+qE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.181.81 with SMTP id l17mr551594hbg.175.1265026481925; Mon, 
	01 Feb 2010 04:14:41 -0800 (PST)
In-Reply-To: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
References: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 1 Feb 2010 10:14:41 -0200
X-Google-Sender-Auth: cc7e371987e27210
Message-ID: <be7a9f3d1002010414g1e06bba6hcae99407706703bb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][RFC] gcc: Restructure package creation.
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
X-List-Received-Date: Mon, 01 Feb 2010 12:17:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 1, 2010 at 5:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi,
>
> Inspired by a discussion with RP on IRC this patch does following.
>
> * Package most of target libraries during gcc-cross recipes
> =A0and not during gcc target recipe.

Can you explain this a bit more?

GCC recipes are like black magic for me but I'd like to understand the
idea at least ;-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


