Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4zPE-0002zp-MT
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 19:09:53 +0200
Received: by wyf23 with SMTP id 23so2165560wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 10:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=6yqdWbM9yqCufvoAkCNr07/P29yQutaKPI7xPr1mxZc=;
	b=xVz/Pikc/Fg5ZrbkKRDkSPbHXV1MadfkPi2MdWiI6hTT8gEeVkHZVehfDrkm4r2LKL
	E6c1ABwlpLw1Af34rMyLmzqj06+L6YXyQXLIBdQj+6NReOcEcAGkLyinmu0P1VTmJ6Lb
	xwcD32jw9Rps7dtiS9AE/O/j+fj4NTYUlGfPw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Z2zcxf0NF1Uj/kjeZL/vee7Usyc9YqO0ey5rB1ywGnRtZccyODHO6LsVWSOBbye5fw
	KmZJ4cTpcEM0kLOt/WfikSKtmD/NV/7ugsVNZ+iWehsw5zWMw/7yQvMtC27p08lbM6AV
	bWYuAdEkdLM3eJBGywqTuE9qbSx/ZFAzYSqRE=
Received: by 10.216.17.130 with SMTP id j2mr2892746wej.47.1286730567927; Sun,
	10 Oct 2010 10:09:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sun, 10 Oct 2010 10:09:07 -0700 (PDT)
In-Reply-To: <1286730309.3808.88.camel@mattotaupa>
References: <1286730309.3808.88.camel@mattotaupa>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 10 Oct 2010 10:09:07 -0700
X-Google-Sender-Auth: TWMa9B6yYacB01_wbXtVkVmlTxk
Message-ID: <AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Preferred handling of pkg-config in cross compile environments.
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
X-List-Received-Date: Sun, 10 Oct 2010 17:09:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> I stumbled upon several programs who call plain `pkg-config` [1][2].
>
> Is the following statement correct?
>
> To be able to cross compile programs correctly, the build files are
> supposed to use the environment variable `PKG_CONFIG` and only call
> pkg-config directly if `PKG_CONFIG` is empty.
>
>        if test -z "${PKG_CONFIG}"; then
>            PKG_CONFIG="pkg-config"
>
> If you agree I would note that somewhere in the Wiki, so that upstream
> can be pointed to some documentation and search the Web will result in
> some useful results.
>

Can you explain why running just 'pkg-config' is a problem?  It seems to
work just fine..
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

