Received: from [209.85.216.196] (helo=mail-px0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MlmMV-0005cX-JN
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 18:19:10 +0200
Received: by pxi34 with SMTP id 34so211602pxi.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 09:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=e/uYsaeDzhLyAf+/7qI5BpiFUDHonUY/2/BOYv0sDH8=;
	b=e2F+zZHzcn6iFDkq/3jz5WPVIuQsefl5iTF8766klmAmPIccRO9B2N4xBgwdM/ZjMG
	rQF9St0gV4XRQwWPaJiM9VUTXohPIU1wMO8y5oo0ir+xpCdSyqp8aL8QaEwZ0XgtfWQk
	plHytYh8XukK22jjMXn0Alc/7qldC667ALLYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=bibZbJHyhKMwS/X4DxFE7PywLvKfm4IMmeNDgc0xt3Ioom22zOp4RO+SxryQOJx6PR
	En9qo5sr1M3cvXQb0ZNRHG0untdei2kf+e+kC07F3tbdes+5pChprNGdRKMiP41igXNw
	IO2wNzOz/G96vFDwN8m9Prbze30sBV1xS+wC4=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.8.2 with SMTP id 2mr167532wfh.316.1252599519069; Thu, 10 
	Sep 2009 09:18:39 -0700 (PDT)
In-Reply-To: <826a2b270909100609q3055ac48m1ab7d6ea76f7f0e3@mail.gmail.com>
References: <826a2b270909100609q3055ac48m1ab7d6ea76f7f0e3@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Sep 2009 09:18:19 -0700
X-Google-Sender-Auth: 4571cef33c30e02d
Message-ID: <b6ebd0a50909100918s42444099pf96f3d0595fbfdae@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.196
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: srctree and gitver
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
X-List-Received-Date: Thu, 10 Sep 2009 16:19:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2009 at 6:09 AM, Pierre Tardy <tardyp@gmail.com> wrote:
> Hello,
> Working on clutter, I want oe to build it easily, without making another
> recipe.
> I found out that adding those lines to local.conf will do the magic.
>
> INHERIT_pn-clutter-1.0 += "srctree"
> S_pn-clutter-1.0 = "/local/oe/localforks/clutter"
> PV_pn-clutter-1.0 = "local"
>
> The thing is I'd like to write:
> INHERIT_pn-clutter-1.0 += "srctree gitver"
> S_pn-clutter-1.0 = "/local/oe/localforks/clutter"
> PV_pn-clutter-1.0 = "${GITVER}"
>
> but GITVER wont get expanded:
>
> NOTE: Running task 1 of 16 (ID: 1, /local/oe/poky/meta/packages/clutter/
> clutter-1.0_git.bb, do_setscene)
> NOTE: package clutter-1.0-${GITVER}: started
> NOTE: package clutter-1.0-${GITVER}-r2: task do_setscene: started

Before I explain why it's behaving this way, I want to point out that
I think what you intended is not what those lines your local.conf are
doing.

INHERIT_pn-clutter += "foo"

This appends " foo" to the "INHERIT_pn-clutter" variable, then at the
end of parse time, if pn-bitbake is in OVERRIDES, INHERIT_pn-clutter
will overwrite INHERIT, so you'd lose such necessary inherits as
package_ipk (or deb, rpm..).  This appends to a conditional variable,
as opposed to conditionally appending to a variable.

INHERIT_append_pn-clutter = " foo" will append to "INHERIT" only if
"pn-clutter" is in OVERRIDES, which is I think what you intended.

Now, to the real problem.  Unfortunately, here we have to be aware of
an implementation detail within BitBake itself.  All of the classes in
INHERIT are parsed into the configuration metadata after parsing
bitbake.conf (and the other .conf's as a result).  It's done this way
because items in INHERIT are generally global, and this avoids having
to parse them for each recipe.  So, changing INHERIT for one recipe
isn't likely to do anything at all, hence the unexpanded GITVER.

This is what I'd advise for your situation, assuming you want to avoid
modifying the recipe (which it seems is the case):

Add these lines to conf/local.conf:
require conf/amend-recipes.inc
FILESPATHBASE =. "${TOPDIR}/files:"

Now in TOPDIR, run:
mkdir -p files/clutter

And create files/clutter/amend.inc containing:
inherit srctree gitver

S = "/local/oe/localforks/clutter"
PV = "${GITVER}"

amend-recipes.inc allows you to append a chunk of metadata to a given
recipe by placing an amend.inc in the recipe's FILESPATH.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


