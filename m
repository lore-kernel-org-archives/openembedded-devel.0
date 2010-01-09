Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NTfhz-0002tZ-6E
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 19:06:46 +0100
Received: by fxm4 with SMTP id 4so16904930fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 10:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=zB+u8QDeSFCYTQxDNDegq4il1orUzrrQKIxHgLZu64I=;
	b=RJN2z2Aci67NQ605FbHpKhVa8SRWOJ5ru6jUSR4ZOb4J88Glsxnib6XDDXxAj7YL7/
	BvIIw+mGT5pFS+pSQFk3gJpdi+BemoCKHpZT4UnMpcsemctMpubTtFxSM6Y8Qj30KMub
	IWJdjiN5bLTZUq8o7z8C6+X0A9EEiRjGBt8zw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ObTfb+gp5iXtBr6cPmRePjVFrzicRZq4hgTromVgZinlrBeJlqdp2/l6vzj9wdqBMa
	Ql9UftN62e/yGZAz6d4cfmJb19q1GoFR/ZQ80M0n3KCb7J1tgMvdxpHMxlonii2lkUUM
	O12y2Y5OhsNLP0iwRPVN2R0TR/DiZ0JDxz6bY=
MIME-Version: 1.0
Received: by 10.223.5.87 with SMTP id 23mr5402278fau.87.1263060276185; Sat, 09 
	Jan 2010 10:04:36 -0800 (PST)
In-Reply-To: <141020e31001081032o4b1d2fa1qf61607964a136271@mail.gmail.com>
References: <hi7e2e$cda$1@ger.gmane.org>
	<1262965376-16205-1-git-send-email-Martin.Jansa@gmail.com>
	<141020e31001081032o4b1d2fa1qf61607964a136271@mail.gmail.com>
Date: Sat, 9 Jan 2010 19:04:36 +0100
Message-ID: <141020e31001091004u6ec8fa27v2550be57d976e3de@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] update-alternatives-cworth: use /usr/lib/opkg/alternatives directory instead of /usr/lib/ipkg/alternatives
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
X-List-Received-Date: Sat, 09 Jan 2010 18:06:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've already pushed it to shr/merge branch with temporary D_P = -1 in
new busybox. Please review if its good enough for oe.dev.

BTW: same postinst should be added to opkg, to fix the issue also on
systems where u-a-cworth was removed already, or used only for
building image. And if its part of opkg postinst we can remove
-cworth.

Does opkg upgrade itself before upgrading other stuff? As we need to
force "alternatives merge" with opkg or u-a-cworth bump, before ie
busybox upgrade.

Cheers,


