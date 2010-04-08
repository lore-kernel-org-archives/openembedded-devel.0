Received: from mail-qy0-f201.google.com ([209.85.221.201])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nzur4-00052K-5K
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 18:45:23 +0200
Received: by qyk39 with SMTP id 39so1226454qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=v7hZLdFxxgXAOLudpWaW+N3V1Y11PawCb6GG/p6mNsw=;
	b=DVC12DRkqRyC+ZEjkd/mxuZDJl2n7sKgynsuMlzwoGhs/wE0JahIM9ZYnaJ1kebB3H
	cTjzxR4XSIRiGNkV8/ILgWsXhKgcEX9vHqlMR8z08/jt42ZUv8cvOkgi5bd0maCZn/xi
	HnxWJg2BGDeS1zJ4PoahcEfUd95WlMEjHhg/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=bQQc2QuJ4w9l6iFpH0H7jB/VyKFIud1z1WfBh4fqeBBBPHbwUjM/76aVh0OGnFH4Mh
	qQimLTPAs8XNtgNxNN8K0vVHFFSUWtRVoW5eQeWwd4CReZvPRh0zZh8SPe+pqjyi0CdK
	+qlR6zE0OKTCsFA8ogiL14bv/qLpnp7jfH28Y=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.232.131 with HTTP; Thu, 8 Apr 2010 09:41:37 -0700 (PDT)
In-Reply-To: <1270734047-11286-1-git-send-email-Martin.Jansa@gmail.com>
References: <1270734047-11286-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 8 Apr 2010 09:41:37 -0700
X-Google-Sender-Auth: dab1415bfb2c95b1
Received: by 10.229.131.39 with SMTP id v39mr559163qcs.66.1270744917560; Thu, 
	08 Apr 2010 09:41:57 -0700 (PDT)
Message-ID: <u2mb6ebd0a51004080941u2b296467h23c7e017a88b8d08@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.201
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] [PATCH] utils.bbclass: simplify checksum check, prepare for checksums.ini removal
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
X-List-Received-Date: Thu, 08 Apr 2010 16:45:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 8, 2010 at 6:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * unify OE_STRICT_CHECKSUMS and OE_ALLOW_INSECURE_DOWNLOADS, one option
>  for insane people should be enough, when the later is enabled, don't
>  raise Exception even for missing md5sum/oe_sha256sum command or
>  different checksums
>

I find it very useful to distinguish between the missing checksum and
invalid checksum cases.  The latter should really never be allowed, at all,
period, imo, but the missing checksum should have an option.  If we aren't
ready to remove the ability to allow invalid, then we need to be able to
control the two cases independently, or via two different values in the
variable that controls the behavior.

* show note, when there are checksums only in checksums.ini (prepare for
>  script for moving all to recipes)
>

This sounds good, though it may be something best relegated to an explicit
sanity check, depending on how much it clutters the output.  May want to log
it to a file like tmp/legacy-staging.log, also.


> * parse checksums.ini only when there is no checksum in recipe (could be
>  faster, but for more checked items in SRC_URI it is parsed repeatedly)
>

"Could be" .. sounds like this isn't ready to go in yet, need to do
profiling.  Changing something because it "could" be good is best done in
proof of concept code, not as a part of a single patch like this one.


> * if one checksum doesn't match then count and show both (md5 as well as
>  sha256) - usefull for copy&paste checksums for new recipe.


This sounds good.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

