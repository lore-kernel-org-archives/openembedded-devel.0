Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvC72-00009y-RA
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 18:42:41 +0200
Received: by pwj1 with SMTP id 1so1759509pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fQVcWt2nhIb3kR3bYBJH1fGU2q+LgrPmVAZEOl1k+js=;
	b=YHx3LFWoEnA1nnYBAbs99oyf/zF/KM7dBzWF4LT5eKX5tobBYfUk/4BrGCQMcDA9mZ
	Wyp3rEYsHKmm3nQvexgeHENB+qca0OhNKHRS5cs1QJZMWCTWYlO9huyP1jz01WA61EXx
	BbkY2DC2Pw/aYaors9DBpHYumTrV5t1RPro14=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WP53F8BbFH6JLqgqy4L3KU5jX44Xs/ZLp+yo9zxWAhN54+HJ/zfW/x+0kxJWxhl/c2
	BQXHg6ljQt+DsUk5clXHDBa0OQ/sKI2bnbCs6Xk63SWFYp3780RcjQthRmCfOaVMJSKd
	Em6nXMQshr46sG6t0MVwJu72OrPkUUEIPPCR8=
MIME-Version: 1.0
Received: by 10.114.13.14 with SMTP id 14mr237750wam.157.1284396101645; Mon,
	13 Sep 2010 09:41:41 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 09:41:41 -0700 (PDT)
In-Reply-To: <1284376645-11610-2-git-send-email-eric@eukrea.com>
References: <4C8E07CD.2000809@eukrea.com>
	<1284376645-11610-1-git-send-email-eric@eukrea.com>
	<1284376645-11610-2-git-send-email-eric@eukrea.com>
Date: Mon, 13 Sep 2010 18:41:41 +0200
Message-ID: <AANLkTim4hXBoB-gbUT09rWHrF7ENA1v4ix3-fMwp4y+8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] util-linux-ng: remove reset
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
X-List-Received-Date: Mon, 13 Sep 2010 16:42:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/13 Eric B=E9nard <eric@eukrea.com>:
> * reset is a script using tput so it rdepends on ncurses-tools
> =A0which also provided reset
> * prefer using the original and remove util-linux-ng's reset
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

If they are functionally identical I have a slight preference for
removing it and use the original.
No strong feelings on it though.

Frans


