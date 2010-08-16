Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Okvvy-0005X7-KI
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 11:24:47 +0200
Received: by iwn38 with SMTP id 38so1452531iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wMNQReIbYNDCgso9S3Jz+kBUxFgy6Vk9fyWP0nrtxqk=;
	b=yF7B89gd+gtoWF0GzfIPzEdq04Vus3W2pa9TtndO/UwCRzmS8bioTycS5mH4BtWEae
	zWa4agx/xREdJu4+4oIfc7Cq+ISWOivp7pbaXIcEMcH131stagX6LIUDk/uLrFZ+ePyS
	JPnVMnlEaFfWCiVxCHRbtKxBaDo4/3O1byGBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=AXZ16t3XsYtY+nn7o2Iorlg/PTRGS83u7EqVtBLwWuLnSwYXvUxKrqoE/SJsUgDS3G
	IhjqkGaI6MRVQJ12OmaJ6+2CvbHBtOYsNMfs/acRChRkuP9Ws4QzsMdwyOaNumdGwMO+
	lBRwkjsm9PQi4UVNICEwyip9cn2VDX1k3QtnM=
MIME-Version: 1.0
Received: by 10.231.12.74 with SMTP id w10mr5505854ibw.189.1281950670908; Mon,
	16 Aug 2010 02:24:30 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 02:24:30 -0700 (PDT)
In-Reply-To: <i4auje$u5g$1@dough.gmane.org>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<i4auje$u5g$1@dough.gmane.org>
Date: Mon, 16 Aug 2010 11:24:30 +0200
Message-ID: <AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 09:24:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> You removed the default openssl version (0.9.8) without bumping PR for
> recipes using that, so now my autobuilder is quite red due to do_rootfs
> failures (among other build errors related to these removals).

I will reinstate openssl 0.9.8
conf did not show any pinning but i missed the DEFAULT_PREFERENCE = "-1' in 1.0
seems a good plan to upgrade to 0.9.8o though as it fixes some
security vulnerabilities

Frans


