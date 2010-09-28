Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0eSe-0001V5-2T
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 19:59:28 +0200
Received: by iwn2 with SMTP id 2so4448965iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CZX7jpGsrhwJw9KVU9TJCzsH2Qlx/5poqJWxmxnz0l8=;
	b=btXk9kJinwuvlRcBwylBr798q9QfSeE2t5l/DWsTHwVq1KZsS7HyKCOIUahz6iZ3sy
	Nq6zmFQjdxRmQXIm982rhLHwckj4eyM80LMaV1xakhmI8Z4EzUE6WpeEyWF3MLwFQIxd
	cyjyxcMAVwbm9HFT99o1Nfbwndoga1IVDn2og=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CSCMaxZuDfKRh/pdsjdHKj+FyyxVxh4bN6vTWFRJewb1iFwMBV/JfGmYsqjZmQsTDk
	TofMtNwgdBNkxHX7KnYB73W0KX7PifV9gmvR6C42EFYeLoSE6P+W6mttlwbDnRKkt1oh
	rHhJ9YHmWz5aHEiBJNAS4WxIji48xfaif//E8=
MIME-Version: 1.0
Received: by 10.231.33.71 with SMTP id g7mr308147ibd.54.1285696757652; Tue, 28
	Sep 2010 10:59:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 28 Sep 2010 10:59:17 -0700 (PDT)
In-Reply-To: <20100928172037.GE12985@denix.org>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<20100928172037.GE12985@denix.org>
Date: Tue, 28 Sep 2010 19:59:17 +0200
Message-ID: <AANLkTin45cu-zY--b_-csN5GR+L-Q7GWTbvz_k-a5Sze@mail.gmail.com>
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
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Tue, 28 Sep 2010 17:59:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/28 Denys Dmytriyenko <denis@denix.org>:

>
> Frans,
>
> May I suggest you to look at the existing multi-kernel.inc implementation[1]
> for building multiple versions of the same kernel with slightly different
> defconfigs and slightly different resulting names in the deploy. I use it in
> Arago[2][3] for linux-davinci machines, while Koen uses it in OE with
> linux-omap-psp for beagleboard[4][5]...
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/multi-kernel.inc
> [2] http://arago-project.org/git/?p=arago.git;a=blob;f=recipes/linux/linux-davinci-staging_git.bb;hb=HEAD
> [3] http://arago-project.org/git/?p=arago.git;a=tree;f=recipes/linux/linux-davinci-staging/dm355-evm;hb=HEAD
> [4] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-psp_2.6.32.bb
> [5] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-psp-2.6.32/beagleboard
>
> --
> Denys
>
Denys, thanks for the pointers.
I did peek into multi-kernel (although I didn't test it).
Apparently I missed the fact that it copies the generated images to
the deploy dir, but your message triggered me to reread the file and I
now found that it *does* copy to deploy.
I'll give multikernel a try tomorrow or so.

Thanks again, Frans.

PS: what caused the misinterpretation at my side was the comment in
the beginning that said:
# Note that this include will NOT stage anything nor create packages
Guess I interpreted this as does not put anything in deploy and did
not search for evidence.
Maybe the comment could be made slightly more explicit that the image
*is* put in deploy.


