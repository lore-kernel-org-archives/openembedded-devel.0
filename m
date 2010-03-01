Received: from mail-px0-f178.google.com ([209.85.216.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NmFXY-0001Nz-4m
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 01:00:44 +0100
Received: by pxi8 with SMTP id 8so818224pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 15:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=WKnz8xxSjfOXFJtAFS3WJ99ZrSZimS16SWsxwj5oodg=;
	b=Ra5p8MXyumZiBoX+6ifb2oZqTkR2J5N85Y6qa8MMY7SMacyR4gTX+HVrCU8J+xbMZt
	RiO1t4eDOeVvoi9ljX8drUhL9vb0oHmXl68bficxiTIvjVqx1KRjfYIG/8VW1mR9xQs1
	27HnEHKSqX6KLrtRK9nTLn8oH87poUyExJ4Vw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=AjxPCigT+h4MnUHGg5iWMH/RlLvuH+q9c6/XPdfZI62kehTPnaaUKrvsFnLI91donW
	6J2NvDBLz6hSUzc3jK7Z/jvdgYNiRQctRasWlCNFZzaZNc1SN5/pugwgGTtynzNBruGz
	QyqRiCv9EUNnNkDgTKE2aBahUT41xdVxXkBKM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.25.27 with SMTP id c27mr2997092wfj.249.1267487873233; Mon, 
	01 Mar 2010 15:57:53 -0800 (PST)
In-Reply-To: <20100301222252.GE15391@denix.org>
References: <1267478308.4739.245.camel@trini-m4400>
	<20100301222252.GE15391@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 1 Mar 2010 16:57:33 -0700
X-Google-Sender-Auth: e1bcbf01ce7348a3
Message-ID: <b6ebd0a51003011557q53930ddax5fac9e9828560fbd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.178
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH, RFC] Cleanup / update QEMU related checks
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
X-List-Received-Date: Tue, 02 Mar 2010 00:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 1, 2010 at 3:22 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Mar 01, 2010 at 02:18:28PM -0700, Tom Rini wrote:
> > First, we should be performing qemu-native related checks not on ARM,
> > but on ENABLE_BINARY_LOCALE_GENERATION (for both the ARM but no
> > generation and not ARM but generation) cases.  This clarifies what we do
> > in the first sub-check (aside: When can qemu-0.9.x die?).  This changes
> > the assume provided check to make sure that at least 'qemu' exists
> > (afaict this will exist for distribution packages as well as from-source
> > ones where we might not have qemu-arm, if the developer isn't doing arm)
> > using the standard check.  Finally (how I wrote it, not how it's in the
> > patch), correct (grammar and content) the comment about what GCC
> > versions are allowed.  My fault initially for not noticing the gcc
> > 3.3.x / 3.2.x stuff in the list.
>
> Heh, I have a local similar change to avoid unnecessary QEMU sanity check,
> when not doing binary locale generation. I wanted to push it later, but
> your
> fix looks better :)
>
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
>
> Acked-by: Denys Dmytriyenko <denis@denix.org>
>

Looks sane to me.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

