Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OIm6g-0000TP-6L
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 19:15:27 +0200
Received: by vws15 with SMTP id 15so629727vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=upLONqSGObZMwFHaFVqEkp93UN8TOkYQwlHMJqH16kw=;
	b=DA560zjKHjPYg9vqmSETJNWIxvAPJLQYsN+LTa9sG4Eg2uR0BsA7RC4DuxagavaJHE
	+K/Zl9VgGVvKBoRbEnkmwGWrrJF9GVuYlmOiU3XCAjq36xZWMVHEZajqPnw9+GKdgjHH
	aOa9wRyIRpa8nX+9uYAzoU7+6WrlFFrS3y3hQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=I0BhhUxNfFxOLBTUwuD80lewF8v4OBz8XDvWsWTBJSjjMOpBf70ScsPWr5atFxU74D
	+S7Rk21BvS4GEt3ExKNqYgXXCA/sTct2LFPM4nSnxSYiXPBSesF0pQOwnbiSPNvt97Mo
	frlusw9U3Q/It8qqrvwgRUNr/g1NpAm1S1AI0=
Received: by 10.224.90.67 with SMTP id h3mr1211432qam.171.1275239473164; Sun, 
	30 May 2010 10:11:13 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Sun, 30 May 2010 10:10:53 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.1005301226590.27172@juice.ott.cti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com> 
	<Pine.LNX.4.64.1005301226590.27172@juice.ott.cti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 30 May 2010 10:10:53 -0700
X-Google-Sender-Auth: on1_CnSXaTRN994UKrf4kh2x3SQ
Message-ID: <AANLkTilDsK7a3tn2fr9bxSiYYS8JbrLgWQuT3btuzcc9@mail.gmail.com>
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
X-List-Received-Date: Sun, 30 May 2010 17:15:27 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 30, 2010 at 9:27 AM, Michael Smith <msmith@cbnco.com> wrote:

> On Sun, 30 May 2010, Ambrose, Martin wrote:
>
> > Are there any recipes/examples which use these classes?
>
> Hi Martin,
>
> I think you'll find srctree used mostly in out-of-tree stuff. Here's a
> sample.
>
> inherit srctree gitver
>
> # Strip off the leading 'v' from the Linux kernel git tags
> GITVER_NO_V = "${@'${GITVER}'[1:]}"
> PV = "${GITVER_NO_V}"
>
> # Clean up between builds for different architectures
> do_configure() {
>    oe_runmake clean
> }
>
> do_compile() {
>    oe_runmake
> }
>
> do_install() {
>    # ...
> }
>

Thanks, glad someone had an example for him handy :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

