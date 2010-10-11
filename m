Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P5Ed0-0007XL-Pk
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 11:25:08 +0200
Received: by iwn7 with SMTP id 7so2437839iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=a5tqF86YV5NQkQkLId5Y9gq6lCo/6KwxNYBrAXgebx8=;
	b=laVG+2JemB+pmn7Ji4Abr4AxBp+wtgLQmKHBveb5ccvqZB4TXBlyzKEEkVcitY653N
	esuwb7nNm91j8KZq5tIMGUvHkwA8gbn436fRc8Yxu/e587EoU6N1qSGxnKneCUjXwAC3
	Biq/iYMvVZgQQftciaslRk3e6rqDscV1oVaVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Zhu+ZweybNyERy36nDWceFeDXgNCN2QLF0q2kL5eYQJBgpGl/DUfu74UYZKMYj+iTd
	cFTvVJQ81cTV7PR/JQboBtrILfu/F7tY32bisbBNLmGgNZdFOdukKKxzGzC8jknvABlA
	obueRmvTu3tuwmliCjSq7d1tPzXa8vAIblFOE=
MIME-Version: 1.0
Received: by 10.42.75.2 with SMTP id y2mr773917icj.334.1286789081844; Mon, 11
	Oct 2010 02:24:41 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Mon, 11 Oct 2010 02:24:41 -0700 (PDT)
In-Reply-To: <AANLkTimPP5f4MtwXSh+JmWAPOK4ufj+u6tB=iv4su0KP@mail.gmail.com>
References: <4CB2AD64.90800@gmail.com>
	<AANLkTimPP5f4MtwXSh+JmWAPOK4ufj+u6tB=iv4su0KP@mail.gmail.com>
Date: Mon, 11 Oct 2010 19:54:41 +1030
Message-ID: <AANLkTikxPN7Oocgh2Xy6dc6=VQ=mxLSYj_xUDKQ7V1Yd@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] prboom_2.5.0.bb: fix compilation failure due to undefined references.
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
X-List-Received-Date: Mon, 11 Oct 2010 09:25:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 11 October 2010 17:04, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Do you feel this is the preferred way?
> I would probably not have made the patch but add -D_GNU_SOURCE to
> CFLAGS. (I like to compile all the sources with the same flags to
> avoid inconsistencies)
>
> Frans

To be honest, I didn't really think about it and don't care either
way. But the glibc manual says the following:
"You should define these macros by using =91#define=92 preprocessor
directives at the top of your source code files. These directives must
come before any #include of a system header file. It is best to make
them the very first thing in the file, preceded only by comments. You
could also use the =91-D=92 option to GCC, but it's better if you make the
source files indicate their own meaning in a self-contained way." [1]

The last sentence is not found in the feature_test_macros(7) man page.

-Graham

[1] http://www.gnu.org/s/libc/manual/html_node/Feature-Test-Macros.html


