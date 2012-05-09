Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRvD4-0000zT-I8
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 02:56:54 +0200
Received: by eaae1 with SMTP id e1so1716471eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2012 17:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qXvN9HgOt2WLGAvlhHmBDeh0BPVaYPgSCFnfIwj6NhQ=;
	b=nj5PpNu1ozSJOwUicWuHbRQO/2Mp41plLFJgsqmgANoiuCFyThbzBevbH3MFdXX9BK
	OcbsE2AgY+ghA/K37jAkMBgRPj6UI3MNGbwLVsgHdrqlkMnEJj1OFmFYaNK+IVaZzknc
	d9OleDTLU39hV4ToFWg20pl7HtJ2igxFmGyfWoQbFPmSlLQ8ac5gIe+0vJoasygRsvVX
	NXRzEYJghFrACNJeA3wL7GWNxuNTNYLPjPPEwqwdLNRSL1P66nmnTPOQFCbnCwI8Hy8p
	CmQWleMVjYnfpk28QPimZy6Em+zDJfU+hRpB2oasY9kGEzPS6snAvkdE8Ahzwx+Sshe/
	RAKQ==
Received: by 10.14.187.1 with SMTP id x1mr3816651eem.101.1336524422501; Tue,
	08 May 2012 17:47:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 8 May 2012 17:46:31 -0700 (PDT)
In-Reply-To: <4FA98B43.3090200@emagii.com>
References: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
	<20120305225422.GD2030@denix.org>
	<0C757E680E33864AB113392C7E83F910BE52D2@GSX300A.mxchg.m.corp>
	<4FA98B43.3090200@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2012 17:46:31 -0700
Message-ID: <CAMKF1sod9Lrh1LL_JQDuLTB655Np4sTvKpHTYhfZnHgc7KuReA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Disable GNU Hash check ?
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
X-List-Received-Date: Wed, 09 May 2012 00:56:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 8, 2012 at 2:08 PM, Ulf Samuelsson <openembedded@emagii.com> wrote:
>
> I'd rather fix the root cause than do the workaround,
> but splitting up the build into two steps is really not supported by the
> package.
>
> Would appreciate some comments.

in OE-Core the default hash style is now gnu hash for toolchain on all
except mips
since mips can not support gnu hash. you should not need to add
commandline parameters to indicate it.


