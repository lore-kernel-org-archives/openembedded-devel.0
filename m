Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Og2VH-0000E6-2D
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 23:25:02 +0200
Received: by bwz10 with SMTP id 10so2061724bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 14:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zim/hmJ7yspuDT5/KpFmPBjQw50ZQIlctksLc43CfZ4=;
	b=Z9uk9Bg4XHFP2NaYz2wX0GgqYZ7Ww+z16nbIiF9tjxpgnsOZ8f8FhwbmtQhLLhRuy7
	FOuNRJwb2Y4uj31E/tcsTBmBay/Y9Gq2OVmwdCP66+ArP7TH1VnWbfgjFtNz59HpuhqR
	Nz7wULGBd/f5HCy49OrFG43TjC3NWoK9S9Cgs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KxHKf9eIyknk3TogQTCZ9VO5DopzAsnVe8Hxz3Dnpgi50jQYXtstKWlV6EvT5XNTAr
	HRhruTebmKRxbPB+EMx5wr7N+gYzChTXvmvWeKLo7Nfu7waB95h4rtFmAm1oPLj+2T9K
	R4nOQfnA1pvrZULJdrthJ7cs3FAmwKdSsBG7s=
MIME-Version: 1.0
Received: by 10.204.79.147 with SMTP id p19mr4493745bkk.129.1280784277227; 
	Mon, 02 Aug 2010 14:24:37 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Mon, 2 Aug 2010 14:24:37 -0700 (PDT)
In-Reply-To: <4C572F47.7090800@tycoelectronics.com>
References: <mailman.416.1280780917.17151.openembedded-devel@lists.openembedded.org>
	<4C572F47.7090800@tycoelectronics.com>
Date: Mon, 2 Aug 2010 23:24:37 +0200
Message-ID: <AANLkTimmfdKf+wFa8+gKcZzXgmg87c+QvipG5f7qXSex@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: getting ride of native recipes
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
X-List-Received-Date: Mon, 02 Aug 2010 21:25:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/2 Jay Snyder <jay.snyder@tycoelectronics.com>

> What is going to replace native recipes?
>
>
> Mostly the non-native recipes with a clause
BBCLASSEXTEND = "native" added to it.
That will generate both the native and target code from the same recipe.

Frans

