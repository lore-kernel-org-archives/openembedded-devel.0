Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Njzho-000536-4D
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:42:03 +0100
Received: by iwn9 with SMTP id 9so3581916iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=NWG+AjWTd3w38zy3qu60xPq9C9+JnAx7DjH6pkNBfJc=;
	b=Zkxc89vPWHeUxYBqQUpHpheLAx09uDm6x0qX4FN8MxruO1t0sMSO4JoO56tpQXWE4n
	4seVE0qkBTsUpWmGglIMngunNOJ8WxXM8Je1ePkuxfAHQAF8l7OR8FnCh1ppYOdVgJcM
	3T9a1Wh3sKSPyB2ymqX2QI4U5kAlLA/VcFkl4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HAOtTjW9ZR1PDKBKvRA+LzVyDf8eNNvIoMNLtTVXQ6nHp4iiqDC1IQyc/vPjmLleHg
	yjqjbYjlrbaPGY6qbTyLh9YiQn7QI/VUVFeda2TeWpVVOcSOAiL8L3HqbbjKeJJPgxV1
	Ci+pTlK9yJmvQizsgyeO3vp11r95CjVpU9oSw=
MIME-Version: 1.0
Received: by 10.231.154.77 with SMTP id n13mr1835271ibw.11.1266950354773; Tue, 
	23 Feb 2010 10:39:14 -0800 (PST)
In-Reply-To: <b6ebd0a51002231019h1d5f8b04q3af0b5300444ddc2@mail.gmail.com>
References: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>
	<4B83DC88.7070705@tycoelectronics.com>
	<19c1b8a91002231015l1847354cle068bda32347bd29@mail.gmail.com>
	<b6ebd0a51002231019h1d5f8b04q3af0b5300444ddc2@mail.gmail.com>
Date: Tue, 23 Feb 2010 10:39:14 -0800
Message-ID: <19c1b8a91002231039s1f790d4aqb4d6c1b61deb7837@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 98
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
X-List-Received-Date: Tue, 23 Feb 2010 18:42:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 23, 2010 at 10:19 AM, Chris Larson <clarson@kergoth.com> wrote:
> It's worth noting here that TARGET_CC_ARCH += "${LDFLAGS}" is a hack,
> not an ideal solution.

right.

The preferred way of solving this is
> reviewing the buildsystem in question to determine how best to make it
> obey all of our bitbake variables, rather than injecting one into
> another that it happens to already obey.

We (OE) are the one's who will suffer this most because other
distributions force gcc to implicitly
emit this option while invoking linker so they bypass the problem in
bulk of packages.


