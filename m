Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PFy75-0001X6-Bp
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 01:00:32 +0100
Received: by wwb34 with SMTP id 34so55668wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 15:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=PoUbcvcUcQquy4piKq3M6JFVHKMfP6G582oFO2/CaY4=;
	b=SHRBB3L+bDHh4vzcVJ9LOnZJX15q4Hpwo7PGQAE5ErpUHjIZw036deYYVX5OfUnbRg
	Yspj5gZHrCUgVWHHeb6MiQFR1onfZOe9Hc+llCjyosuqQ653PbhSs4yEwcytSNdK7NCO
	j417OUJDQhlVHook3e88IEieKsiMm63nAwjUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=L4YrMZL7wFgsja67rDLcEmKGd5mlEKFx8KKl0YFcTrq1iIHf3/G6qDKNU2v8riXKXA
	BBs+ImHqqfaMfaLGPK0j2QR0PG0/wK4rHS7hAwqHdqwrXezMcORFdeM779tPY6H5oY8F
	NM1NBeynW8qV/9Y+/u9Qe4mw5PIbpjH0grVg4=
Received: by 10.216.239.199 with SMTP id c49mr5118469wer.12.1289347173291;
	Tue, 09 Nov 2010 15:59:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Tue, 9 Nov 2010 15:59:13 -0800 (PST)
In-Reply-To: <1289344708-26165-1-git-send-email-kergoth@gmail.com>
References: <1289344708-26165-1-git-send-email-kergoth@gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 9 Nov 2010 16:59:13 -0700
Message-ID: <AANLkTinL42CzA6aa3zSfAfHOz9NUGh+ExnfNZL5=bthP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] [PATCH 1/2] Implement variable typing
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
X-List-Received-Date: Wed, 10 Nov 2010 00:00:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 9, 2010 at 4:18 PM, Chris Larson <kergoth@gmail.com> wrote:

> This implementation consists of two components:
>
> - oe.types python module, whose job it is to construct objects of the
> defined
>  type for a given variable in the metadata
> - typecheck.bbclass, which iterates over all configuration variables with a
>  type defined and uses oe.types to check the validity of the values
>
> This gives us a few benefits:
>
> - Automatic sanity checking of all configuration variables with a defined
> type
> - Avoid duplicating the "how do I make use of the value of this variable"
>  logic between its users.  For variables like PATH, this is simply a
> split(),
>  for boolean variables, the duplication can result in confusing, or even
>  mismatched semantics (is this 0/1, empty/nonempty, what?)
> - Make it easier to create a configuration UI, as the type information
> could
>  be used to provide a better interface than a text edit box (e.g checkbox
> for
>  'boolean', dropdown for 'choice')
>
> This functionality is entirely opt-in right now.  To enable the
> configuration
> variable type checking, simply INHERIT += "typecheck".  Example of a
> failing
> type check:
>
> BAZ = "foo"
> BAZ[type] = "boolean"
>
> $ bitbake -p
> FATAL: BAZ: Invalid boolean value 'foo'
> $
>
> Examples of leveraging oe.types in a python snippet:
>
> PACKAGES[type] = "list"
>
> python () {
>    import oe.types
>    for pkg in oe.types.value("PACKAGES", d):
>        bb.note("package: %s" % pkg)
> }
>
> LIBTOOL_HAS_SYSROOT = "yes"
> LIBTOOL_HAS_SYSROOT[type] = "boolean"
>
> python () {
>    import oe.types
>    assert(oe.types.value("LIBTOOL_HAS_SYSROOT", d) == True)
> }
>

See https://github.com/kergoth/openembedded/compare/master...typing for the
current version, just reworked to decouple the types from the metadata to
make their unit testing a bit cleaner.  Note that the __new__ use for Choice
and Regex is pretty ugly, really only using those classes as a container to
make setting the name and flags attributes on the callable less ugly :P
 Comments welcome.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

