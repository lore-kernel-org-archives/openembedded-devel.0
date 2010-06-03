Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OKBsR-0004Kx-7E
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 16:58:37 +0200
Received: by pwj4 with SMTP id 4so80042pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=lWP6ZDp1nZvPhJq+NKKTYJKzRieFZPOAOqVwZNMQVog=;
	b=vutuKmAQ9hRp5XMEgEYM3iefPCyUR+cVtH4A2YfwSM8IvOpQ0blVBpFHywp9r7C7EX
	KGAI3UkjMnEiLF9yb2jSvAmMvC+jMDFpTgChXQCiSEb0nWmVZDE7yKV32jOZJD87wyKR
	WNWkJKera8Z2ajSfN7eOjAoVUhAVO2xzQjpFQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=DAZUyXQVBD4f0Lhp5Ux7Q2MoQyIYNvOJ/9ygzw7VsrJ2NSsH2XW0g/qvHaKn74i0C9
	8Rm96xlFlV8UOcPArL77xNQXrWgxh23TCHnzG2HQje36YVrxyAEoWdreS3autjEhmkGO
	7bDD3wG/1AFM3SEps6hy0++Fzr2Fmne8XV840=
Received: by 10.142.151.38 with SMTP id y38mr6867420wfd.219.1275576858182; 
	Thu, 03 Jun 2010 07:54:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.211.2 with HTTP; Thu, 3 Jun 2010 07:53:58 -0700 (PDT)
In-Reply-To: <AANLkTinfALcc7SfhQ04fED06C2EE_WJUCWTmlDB98zYM@mail.gmail.com>
References: <AANLkTinfALcc7SfhQ04fED06C2EE_WJUCWTmlDB98zYM@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 3 Jun 2010 07:53:58 -0700
X-Google-Sender-Auth: zhJjnAl0i974LodpqFdeBn1JKE4
Message-ID: <AANLkTimJBs7SJNhllCgOsnrDAat3p78i2ixW0QtKQT5r@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Programtically setting TMPDIR in bitbake.conf
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
X-List-Received-Date: Thu, 03 Jun 2010 14:58:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 3, 2010 at 7:08 AM, Alex Bennee <kernel-hacker@bennee.com>wrote:

> I'd like tweak the OpenEmbedded TMPDIR variable so it can optionally
> build into a sub-directory of ${TOPDIR} based on the current git
> status of the OE tree. The usage I envisage would be something like:
>
> bitbake my-image
> =>
> builds to /path/to/build/current/[deploy/staging/etc...]
>
> RELEASE=1 bitbake my-image
> =>
> builds to /path/to/build/build-12345ab/[deploy/staging/etc...]
>
> Which would be based on the GIT commit ID. I'd probably want to
> support the "dirty" semantics similar to the kernels versioning to
> indicate the tree had uncommitted changes.
>
> I know bitbake.conf can use arbitrary python to fill in the variables
> but I'm unclear where these fragments can be put. A lot of python
> snippets seem to refer to things like bb.data.getVar() which I assume
> is part of bitbake itself. Is it possible to define some python in the
> OE tree I can call from bitbake.conf? Is this functionality that has
> to be added to bitbake itself?
>

It supports this just fine today, and I'd bet there are hundreds of examples
in the conf/ and classes/ directories today, as well as in many recipes.


> I assume the change has to be made to bitbake.conf as other variables
> are derived from TMPDIR at that point?
>

That's incorrect.  Bitbake variables are like make variables - they're
evaluated when they're used, lazily, not immediately, unless you use :=
(immediately evaluate).  Anything set in bitbake.conf can be set just as
well in your local.conf.


> Basically I want to avoid writing an overly complex python one-liner
> directly in bitbake.conf, that would seem to perl-ish ;-)
>

If you don't want the entire thing in the variable, define it in a python
function in a .inc and include it from a .conf, and use it in the snippet.

I.e. conf/foo.inc:
def myfunction(d):
    return d.getVar("foo", True) + "bar"

conf/local.conf:
require conf/foo.inc
TMPDIR = "${@myfunction(d)}"
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

