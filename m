Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P28nR-0006fk-71
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 22:35:11 +0200
Received: by iwn2 with SMTP id 2so5254605iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Oct 2010 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=la8VppWQtfSTd09OJ280vq3HN5UUq71J3OqZjogr+l8=;
	b=rcd/qTFkKfSPp9Nc7bqRpLJR7/PDGvt4AjEeIYUGtfQJJudtIZ2eSSHdgoQoNdB38O
	maCuriEO8MbDr9S11WM3owR+8NnPrveRhzbt78EFZOTh05y6mctBK60fE/ZCJElABnyx
	O86T7fPusffmnzgLDXMN3VJFNG88ricdkheWc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=UW3BPmctWcFj0TXtNoI0+e74cN0lBhhzzjtmvft4MK68YXCFdu9T2H5AmYKauJY4Kj
	uzIxWy5gupoU0DLs67VG4UxOJF1Au8uIRmVRv38gi7Eh/tEYYRyWIvsxhpJvEO6usyvS
	d62Sd5Kc7kdA1fXdgOuMywsspijA62Iztq1xc=
Received: by 10.231.148.195 with SMTP id q3mr7655247ibv.199.1286051685755;
	Sat, 02 Oct 2010 13:34:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sat, 2 Oct 2010 13:34:25 -0700 (PDT)
In-Reply-To: <4CA719E0.7050409@freyther.de>
References: <4CA719E0.7050409@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Oct 2010 13:34:25 -0700
Message-ID: <AANLkTi=e0PuBjz1o-FhmaE7Mh_+JOLOau7ZhC0G9WOBn@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RPATH in many modules
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
X-List-Received-Date: Sat, 02 Oct 2010 20:35:14 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 2, 2010 at 4:39 AM, Holger Freyther <holger+oe@freyther.de> wrote:
> Hi all,
>
> today I wanted to make the generated toolchain free of RPATH and I was a bit
> surprised to see that even the target libraries contain the rpath and that it
> is not caught by insane.bbclass.
>
> I have added a more strict check to insane.bbclass to uncover the issue and I
> am fighting neon and its manual libtool usage right now... it might be just
> easier to use chrpath to fix the resulting libraries.
>
> any opinion?

I think we should try to get the rpaths right without chrpath. so your
insane patch
seems ok. May be to avoid lot of packages failing this could be turned
on as a warning
and once we fix the packages failing this then we could turn it into error.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


