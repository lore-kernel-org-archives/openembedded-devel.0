Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPjY9-0001ed-Cm
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 23:56:39 +0200
Received: by iwn5 with SMTP id 5so1546384iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 14:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=vPfvt9eGy2VQ/A2pPoQ/+i1ZMvjbf7tl6LwkyWPkSJ4=;
	b=osSHNEbff9HzQOVt8STBRRkg0/tIxVr7BDy89MbLCkwnV2Pu/EOuQr6YSZhheB2Sgf
	ifP5XYl0hxRedLFiJxHNhJPE+qvLodxDZ4KI7bsPsxPHC7kxrA4vQx2OkocsNClIBk2V
	MQx/YLpZvkjpGOs1z5aRWr5qgVkb2PKSc/M8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=n9yPiodknL5ju90f44kDk0HNOQPv9EBbsVTrizkBTa2KleYjidseTTI6juBFj9y3OJ
	vb9o+wHEwBpN2ohhT07MTaULG45t4syE5dQizLj063/XMv0h4D/cO813LrVlKud+fGdd
	81Ea53EEtZ+7lm7xz9mds9NsNAn/jB3W++sw0=
Received: by 10.42.6.195 with SMTP id b3mr645384icb.14.1276897923201; Fri, 18 
	Jun 2010 14:52:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Fri, 18 Jun 2010 14:51:43 -0700 (PDT)
In-Reply-To: <AANLkTim5TDiBGob1RspY3wjtkO9JkWeJiVkqlRz9YQL0@mail.gmail.com>
References: <AANLkTim5TDiBGob1RspY3wjtkO9JkWeJiVkqlRz9YQL0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jun 2010 14:51:43 -0700
Message-ID: <AANLkTileMuD5Zz8sloB_Jpa2yo3Teoe-G2Iqtx3lo9CM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: -dbg packages
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
X-List-Received-Date: Fri, 18 Jun 2010 21:56:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 16, 2010 at 3:56 PM, C Michael Sundius <msundius@sundius.com> wrote:
> How can I prevent all ${PN}-dbg packages from being added to my image?
>
> does DISTRO_TYPE = "debug" force all debug symbols to be added to RDEPENDS?
> I don't see anywhere where that is done, but I might be missing something.
>
> our team has the DISTRO_TYPE = "debug" turned on because the release version
> does not build, but the entire build too big to fit in our flash if all the

what fails for you which block the release build ?
DISTRO_TYPE debug adds a few extra packages to
the image which are useful for debugging.

its DEBUG_BUILD if set to 1 will choose a different set
of optimizations and options to help debugging code.
and it will also increase the image size if you package
-dbg together.

> symbols are included.
>
> thanks
>
> Mike
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


