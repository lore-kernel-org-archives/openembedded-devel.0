Received: from mail-qy0-f193.google.com ([209.85.221.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OGC87-0001Dc-Np
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 16:27:10 +0200
Received: by qyk31 with SMTP id 31so4489847qyk.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=kKjddTYr+i5kcOGeeJ+iIDqHACyWV9IvzJ/DD2s0jiU=;
	b=caQkaD94pwu3lh9Ai6xb+9W80QB3/3CQQPwOJdhmLlY7zL3yZScUS4bXUSu0Idpqrv
	RtjEpun2HiVnakovkBNLRk0n+bvC/+LAmc9hve3H7XHdFuQXnQ+5w9J0bJs+PPpkMJeS
	4AS2W8Ddre+cQvwFDvfqO5Mo1CIIYLRr6rHEs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=Jo6MMHCavEvl6TyxhSuO/Tc+hRdzM8EzmO00Y0XPSZeFrcDUwG5NKu0ekX6Q+Fz1W+
	8nvzNOpXia2I3hvzJBurKW5QpCzgUPPCLeI0RKS6IGG7kgZtft01PWSjPbjLVotZRcR0
	nxC9+28wvq3v8b/SrkAsDI3KpEbQhF1TgouE0=
Received: by 10.229.225.19 with SMTP id iq19mr853654qcb.188.1274624530277; 
	Sun, 23 May 2010 07:22:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.215.15 with HTTP; Sun, 23 May 2010 07:21:50 -0700 (PDT)
In-Reply-To: <1274619132-32390-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1274619132-32390-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 23 May 2010 07:21:50 -0700
X-Google-Sender-Auth: Hc3lEiwPGPhrnoaTXCKItvoSv0s
Message-ID: <AANLkTimyqUYuSfWUQZdwn1Q2KrojnjvsUqLSCX9H_FMa@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.193
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH (updated)] autotools.bbclass: enhanced oe_runconf() to accept quoted arguments
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
X-List-Received-Date: Sun, 23 May 2010 14:28:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 23, 2010 at 5:52 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> This patch allows to pass quoted strings in EXTRA_OECONF.  E.g. with
> this patch, it is possible to do
>
> | EXTRA_OECONF = "--with-build-cflags='${BUILD_CFLAGS}'"
>
> where 'BUILD_CFLAGS' contains multiple, whitespace separated arguments.
>

I don't think that doing EXTRA_OECONF =
"'--with-build-cflags=${BUILD_CFLAGS}'"

is that much more difficult, and works today, unless I'm missing something?

 As a sideeffect, 'set -x' debug output is now much nicer because
> superflous whitespaces in the configure call are removed.
>

That's certainly a nice feature.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

