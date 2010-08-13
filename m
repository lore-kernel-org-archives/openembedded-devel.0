Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OjkGD-0005fl-7p
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 04:44:47 +0200
Received: by pxi11 with SMTP id 11so659226pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 19:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Nd0oX/kJKs7pt8Rc0rMXr9OrZnlB+7v4YbQ4BDj/pO8=;
	b=vXjmVIqb1mOVKfMRj6fYQg9u5WzPBpizBMbT+6+714+TZXTMuzMqztLqquU3nnSOji
	xNLO3o/QW3TRYkbwhOxtD4vih7baciLXe4FHRAhn5c6PJffv8f+yTdqIqEmEnETt+zzN
	JWWjnXas+N5qQ+z3x04B8SN3E5B8tql8MWpEk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=xJGFHLguu4uBflbUt6/GJqSyWAfpWuG2zDP6FtEbtGvrTtEi0jJ3y2/e+G9e13Y8L2
	8R/hT01H2iVD2d8tRQcOJrbZTh3ojJmpx/b8ld0yk0JwwVS6E7qHxFV+hgTlaRgVyVo6
	jjm8SURBihECE/5ofSpTQUrc4cR3Dm+6t5PNI=
Received: by 10.142.131.20 with SMTP id e20mr804310wfd.83.1281667462059; Thu,
	12 Aug 2010 19:44:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.214.11 with HTTP; Thu, 12 Aug 2010 19:44:02 -0700 (PDT)
In-Reply-To: <13B290A06827324E9ADB71AA314F8189231070@otis.burlington.evertz.tv>
References: <13B290A06827324E9ADB71AA314F8189231070@otis.burlington.evertz.tv>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 12 Aug 2010 19:44:02 -0700
X-Google-Sender-Auth: OV8x4JYLDlF4kcXZ9fE-AIHQ4oI
Message-ID: <AANLkTinGwatijMGZV=tQsUMnnsc=wZr9uWpHthhs-_JW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: python-dir.bbclass question when using multiple versions of Python.
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
X-List-Received-Date: Fri, 13 Aug 2010 02:44:47 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 12, 2010 at 2:29 PM, Rodney Lott <rlott@evertz.com> wrote:

> Hi, there.
>
> I am looking at the latest revision from org.openembedded.dev:
>
> =========================================
> rlott@rlott-desktop:~/git/oe/oe-meta/classes$ git log -1
> commit ad112ee1ce53dfaf3fa2d7a10a79f724c8dd6335
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Thu Aug 12 22:28:35 2010 +0200
>
>    task-shr-feed: add supertux-qvga wesnoth
>
>    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> rlott@rlott-desktop:~/git/oe/oe-meta/classes$ git br
>  master
> * org.openembedded.dev
>  org.openembedded.stable
> ==========================================
>
> I am looking at the classes/python-dir.bbclass function:
>
> ==========================================
> def python_dir(d):
>    import os, bb
>    staging_incdir = bb.data.getVar( "STAGING_INCDIR", d, 1 )
>    for majmin in "2.6 2.5 2.4 2.3".split():
>        if os.path.exists( "%s/python%s" % ( staging_incdir, majmin ) ):
> return "python%s" % majmin
>    if not "python-native" in bb.data.getVar( "DEPENDS", d, 1 ).split():
>        raise Exception("No Python in STAGING_INCDIR. Forgot to build
> python-native?")
>    return "INVALID"
>
> PYTHON_DIR = "${@python_dir(d)}"
> PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
> ==========================================
>
> Now, if I am reading this correctly, it would seem that the logic of this
> function is as follows, "Look for python directories in STAGING_INCDIR,
> starting from 2.6 downward, and use the first one I find."
>
> This works if one is only using one version of Python.  Let's say one is
> using Python 2.5 and Python 2.6 (i.e. for two different applications) and I
> am in the process of building something that I need to work with Python 2.6,
> it will set PYTHON_DIR to point to /usr/lib/python2.6/site-packages, which
> isn't what I want.
>
> So, my question is this:  Is it OE's assumption that one is only to use a
> single version of Python within one build (i.e. one tmp directory), or
> should it work with multiple Pythons per temp directory?  If it is the
> later, then it would seem to me that using STAGING_INCDIR to determine the
> Python version isn't a good idea and that the Python version one is using
> should be derived (somehow) from the PREFERRED_VERSION_python and
> PREFERRED_VERSION_python-native settings


Building multiple versions of *anything* in a single build is prone to
failure and problems.  Headers will step on one another's toes in staging
depending on the build order, etc.  Python is no exception.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

