Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0VH1-0000eG-Of
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 10:10:52 +0200
Received: by iwn2 with SMTP id 2so3846472iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KApl6y7Za4rFuVZbmJXgmrWLEObDzt1ik/USkZueZwg=;
	b=gVrjFFJIEHXCIcnwX2RjuNTFg2ORxwe2SsAN2AF0Vlw2nzQLwGoia2x8gbjKa+Rj/d
	bQ+VBeMVS2albabjhu7HguNbW10yQn9hcQD2DSp6YdsuKUalvK7604Ls9zjjzvgcoCeH
	CROBHyEDPaqIu3Ids8FPK3BRi3wOJ5AYdP3dw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WXOY7vWHQP4Vfx5IXJwjGBdoupvM2a9YGpCXdCt8KO9F1DEusUmib/43/qko0EtjU/
	HqkoBB7diTg9vpBwzFOePq1uUfWf6h2bmZllCeXWJzQD3GjjozTDX+bnRm45rFaiQ+GM
	Xqz+QuoSfhYTlwAC14qBZQbfCQ/tpS8KBFIf0=
MIME-Version: 1.0
Received: by 10.231.59.212 with SMTP id m20mr10323872ibh.130.1285661436109;
	Tue, 28 Sep 2010 01:10:36 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 28 Sep 2010 01:10:36 -0700 (PDT)
In-Reply-To: <1285658920-15596-1-git-send-email-t.fromm@dresearch.de>
References: <1285658920-15596-1-git-send-email-t.fromm@dresearch.de>
Date: Tue, 28 Sep 2010 10:10:36 +0200
Message-ID: <AANLkTinAZPimHtcKhmcFZeaDmuArR9yDtezq_5RjfEus@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove dbus support from wvstreams-4.6 because it breaks the build
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
X-List-Received-Date: Tue, 28 Sep 2010 08:10:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/28 Thilo Fromm <t.fromm@dresearch.de>:

I'd say it is either this

> -DEPENDS = "zlib openssl (>= 0.9.8)"
> +DEPENDS = "zlib openssl (>= 0.9.8) dbus (> 1.2.14)"

which makes sure dbus is build and available.

Or this:

> -EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
> +# tfm: dbus build currently broken
> +EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-dbus"

but not both.
If wvstreams should be build with dbus support you should use the
former, it is should be build without it, it should be the latter.

Frans


