Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NZsp4-0007cV-Bc
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 22:19:47 +0100
Received: by pzk30 with SMTP id 30so3724671pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 13:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=gSdaLYUAO6dIc/oGiWnDlBAIeTuZRDy5/PbiQU9tViE=;
	b=nToVUEYo25B45hAAoGcEwSXwHGMCObrn+mlo2DVn/MJ51yFp5lqyiJukg4SyLdMPLL
	5vuo6GdOY3QQ9ewjWWHZtuiIAk5MfRmN4RmDO2u0oaGdu9SZChq0IlN+ADvSO7cNPaED
	55Sf/pNU9xfD+RnxCRH6tknIW2zumWYkLHYGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=i+xzbxqQa9KYa0G9EOEQSU42fcyj9JVUI4qq1TqP8wqpRIqZlZGXJmFefBxVVlMh8w
	u1CpGGSx7nvlQidcfZ5tD0c0eH8s7tZmUUxOIoJomCAfTKA30nWfvBlmrebKl5Sd5dCV
	bwpUDs3riwlA5lAWodpwizecADnULW2N1fmuM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.21.9 with SMTP id y9mr5826898wfi.229.1264540640157; Tue, 
	26 Jan 2010 13:17:20 -0800 (PST)
In-Reply-To: <201001241148.25185.holger+oe@freyther.de>
References: <1263931267-18470-1-git-send-email-clarson@mvista.com> 
	<201001241148.25185.holger+oe@freyther.de>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 26 Jan 2010 14:17:00 -0700
X-Google-Sender-Auth: 20066277ee312c86
Message-ID: <b6ebd0a51001261317l2b3d4332ncd88f1cc555ea7c0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] base.bbclass: add 'any' and 'all' functions.
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
X-List-Received-Date: Tue, 26 Jan 2010 21:19:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 24, 2010 at 3:48 AM, Holger Hans Peter Freyther <
holger+oe@freyther.de <holger%2Boe@freyther.de>> wrote:

> On Tuesday 19 January 2010 21:01:07 Chris Larson wrote:
> > Python 2.5+ has these functions built-in, but we don't yet require 2.5+.
> >
>
> do we use all/any in the metadata? or is MVista using? If the answer is yes
> then... I'm acking the patch.
>

We don't yet.  I've used it in some classes and .inc files in MVL6 that I
plan on pushing to OE.  They're much more useful than you'd think.  As an
example, I had some code where I had a list of path prefixes which were
allowed, and wanted to check a filename against them:

if any(path.startswith(prefix + "/") for prefix in allowedpaths):
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

