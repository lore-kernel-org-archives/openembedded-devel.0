Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OIlFp-00012S-QN
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 18:20:50 +0200
Received: by vws15 with SMTP id 15so586107vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=twIITH+NAfvBAngB2xn0AmBRQaRsieoUvvv3pfNeOUI=;
	b=qqBaBXOHy8Psl0iveqMdT3BUvaqw8gU2Lb8n9765qpPnyFfatpShm1hC6O1t8Pzj0i
	xoixofMXEYwR/xetxde8nPf1XwlbgyQx4D0gcoG/R9y9yyJoxU/Ja5UdNGHeyX5n6JxW
	V9iBi6OdR6JwVJzAURiLTSenfCDhwyCHStkq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ci9EmQpGZfsJuX54LqbQMQcxb/gE/N6/eFKUAtyeER6v5llC1fr+iyEBYxUvdF7I1l
	EdaXKVPF2jnrBjBK6eEf75/AbdRYCjksJCxqlGTxi1Fa5uWbDaeh6+9YUJF8Me8eWIID
	OyTDGonvMop/8zMnUofZJacj7EvGS9+9cUuyg=
Received: by 10.224.58.74 with SMTP id f10mr1171070qah.317.1275236196975; Sun, 
	30 May 2010 09:16:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Sun, 30 May 2010 09:16:16 -0700 (PDT)
In-Reply-To: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 30 May 2010 09:16:16 -0700
X-Google-Sender-Auth: ZwZz6s03V55F7Kal6ZGVev9Lj5o
Message-ID: <AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Sun, 30 May 2010 16:20:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 30, 2010 at 8:07 AM, Ambrose, Martin <martin@ti.com> wrote:

> Hello.
>
> Are there any recipes/examples which use these classes?
>
> I grep'ed oe mainline/poky/arago/kergoth but no luck.


I expect they'd be most useful in development, so no, I don't know of any
examples in an OE tree today.  It's pretty straightforward.  Add inherit
srctree, point S at your local source tree (or put the recipe inside the
sourcetree, it defaults to the dir the recipe is in), and it'll build from
that local tree rather than doing the fetch+unpack+patch process.  The only
real potential complexity there is the 'clean' task -- how you want to clean
your source tree may vary.  Iirc, the default will run a 'make clean', but
there's a function provided to use git to clean it.  gitver just sets GITVER
with 'git describe' information, to give you a version based on the current
contents of the local git tree, and it attempts to arrange things so it will
automatically be updated if you make any local commits to the tree.  Iirc
there's a hook provided to let you mangle the tags in the git repository
into the GITVER value -- an example of this would be stripping off the
leading 'v' in the tags in the linux kernel repository.

I'll see if I can find some example recipes for you, I know I had an example
repo set up when I was writing the classes.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

