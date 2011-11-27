Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RUh8N-0002zW-43
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 16:59:15 +0100
Received: by wwf22 with SMTP id 22so5915289wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=zVL4ce3FcuLmyrl0t/iI98mYH9DiWNvpv+/lSieOFOw=;
	b=PyzNotJi8cgoEFjc/Wcp7/g7L3upTnFEfat0hIC6qGPyJJ0D2kXrKRw1S8Y9ItfufS
	Vn802uVVCDRijBAbA9QeLdRa5U8a/4OCt/750626Nh3pnqq2ixPlViJHLpLcI13xUelP
	i181GdSDg2eh/yQ90yHJsDlMxhrnix881EDAg=
Received: by 10.216.166.212 with SMTP id g62mr1134291wel.29.1322409133080;
	Sun, 27 Nov 2011 07:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.167.79 with HTTP; Sun, 27 Nov 2011 07:51:52 -0800 (PST)
In-Reply-To: <1322387906.7998.20.camel@mattotaupa>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322387906.7998.20.camel@mattotaupa>
From: Chris Larson <kergoth@gmail.com>
Date: Sun, 27 Nov 2011 08:51:52 -0700
Message-ID: <CABcZANnceMUSUjQE26YYp8hr8CYbBFVX+9VfgKFBBfvOYkBXcg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Documentation problems and future plans
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
X-List-Received-Date: Sun, 27 Nov 2011 15:59:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2011 at 2:58 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Samstag, den 26.11.2011, 19:40 -0700 schrieb Tom Rini:
>
>> As things stand today, the wiki is out of date and a number of folks
>> refuse to work on it. =C2=A0Using things like "It's all text!" for firef=
ox
>> only go so far and don't solve problems like people just avoiding
>> documentation anyhow.
>
> the Special Pages page [1] has interesting information. For example you
> can get an overview of the recent changes in the Wiki [2].
>
>> Paul Menzel has mentioned that ikiwiki has been mentioned before and
>> that lets us have the website in a repository. =C2=A0Do folks have other
>> ideas?
>
> Before the implementation is discussed, could we decide what
> documentation we need and what is possible to maintain in the long run?
> Avoiding maintenance and duplicate efforts should be the objective.

This is a very good idea.

> 1. User manual
> 2. FAQ
> 3. README
> 4. Guidelines (Commit, patch, style)
> 5. Getting started document (could be included in 1.)
> 6. Git usage (a lot of existing documentation for that one elsewhere) or
> can be put in a file `HACKING`.

This is a good idea. I think we should extend this beyond just git
command info and references to existing git documentation, by adding
actual snippets of shell showing what to do to accomplish several
common development tasks -- example workflows.

> 7. =E2=80=A6

7. Troubleshooting Guide

8. Tips & Tricks - these could be more advanced and unusual things
which aren't suitable for an FAQ, but which nonetheless can be quite
helpful if you're in particular situations.

> Formatted in a markup language like Markdown those could be converted to
> HTML easily.

Agreed, Markdown or RST would lovely.

> The second question is, is OE-core documented in the OE wiki or for
> example at the Yocto project?
>
> To get users started we could also recommend to use the =C8=A6ngstr=C3=B6=
m scripts
> or to take a look at the Yocto project, i. e. just point to
> distributions being well documented.
>
> They have a Wiki already [3] and we could decide to use that instead. Or
> we could say to use use the Wiki at eLinux.org [4].
--=20
Christopher Larson
clarson at kergoth dot com
Senior Software Engineer, Mentor Graphics


