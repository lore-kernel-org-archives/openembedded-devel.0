Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7udE-0004HB-II
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:40:25 +0200
Received: by ywl5 with SMTP id 5so677953ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=X/GgKHq7qdhqDlwU8EXDCrFPv1zunGlrtbsmdwbZlaw=;
	b=XOQjKmmB4NQvl7Xw0YDDnL4optfFbXyZmjJaOb8zlLalNnyaU02x8BUWzYPEAnyFYT
	zwSmlOy4BaLpDp0kdrd9bI99iYHJ/kzCXm/+azriKUGAKGJhTJsu3nA5YqV8MPubb58K
	3kxJw1BbxldOFX5z9yU5bDWGLONielsMf+5RA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Z8OTeud2i19y6Kq8yZIV1w5pQlA8mUSaA+G8o4yvcw3Fg7HWHpW+R4xM7oa2CjxpiF
	LfHERYYCoEc/DFFde4b4/4OgW/Vk36dq0HNedInBSfnSKEJwDG5Wr0x4Dnvj8bGiU6FU
	HBzH3WGqWoqDcpmGY1z+avnk6dcPd4NLcAiDg=
Received: by 10.90.68.16 with SMTP id q16mr2137681aga.17.1287427185798; Mon,
	18 Oct 2010 11:39:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Mon, 18 Oct 2010 11:39:25 -0700 (PDT)
In-Reply-To: <1287405781.3928.22.camel@mattotaupa>
References: <1287405781.3928.22.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2010 11:39:25 -0700
Message-ID: <AANLkTinTuHWBgzbTcZdnrsSGuGmiqgs2fgPc3koE1fCJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opensp_1.5: `do_compile` fails with for example `RastEventHandler.cxx:(.text+0x7f0): undefined reference to `OpenSP::Sd::execToInternal(char const*) const'`
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
X-List-Received-Date: Mon, 18 Oct 2010 18:40:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 18, 2010 at 5:43 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> trying to build openjade to test ab83ea [1], task `do_compile` of
> `opensp_1.5.bb` [2] fails with the following error with `minimal`
> (eglibc) for `MACHINE = "beagleboard"`.
>

is it a regression ? did it built ok without this patch ?

-khem


