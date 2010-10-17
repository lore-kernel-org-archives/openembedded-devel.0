Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P7JMz-0002Qe-LH
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 04:53:10 +0200
Received: by wyb40 with SMTP id 40so2141563wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 19:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=f+sPlX9g/4VfJM1+A3ZNSSGLJj9Sb+RP6+Oca8GGwfI=;
	b=TzRnSbEXuID7WCEOe0iEDaJ59/TiUX1BnDv0MutL5f5ZVX0H9Ah7Bvdl2koo9c8YN4
	ACWXt5iVdQtgchL/9DE4zwNBgD4xx3TxY6tURgUq0M4J+kSQjFXugM2hq8xjm29XakX+
	L6Te30MhKaRh6AaB1s0d+HAzx7G14DyoXLaww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=qpfstpCMqha1m5HK1RHsSE/H5NZZcmBWyTtIZ73HpFO40rzT7CddZEPN69BqChuZMg
	zY72NHtj9Tfreard6nmwyIUQ0KMdn12L9LNvA0+spjK3vcKdbcjf/2F8qVvodD0KYiED
	CjvfQZpJgCJgSPfEn2jd1IvwgPCxdOOULWZBI=
Received: by 10.216.255.199 with SMTP id j49mr1476724wes.110.1287283956174;
	Sat, 16 Oct 2010 19:52:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sat, 16 Oct 2010 19:52:15 -0700 (PDT)
In-Reply-To: <AANLkTin7HZsmGcRS95BCBCGrZYB8Ut1qB9TuSC6K0uk_@mail.gmail.com>
References: <AANLkTin7HZsmGcRS95BCBCGrZYB8Ut1qB9TuSC6K0uk_@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 16 Oct 2010 19:52:15 -0700
X-Google-Sender-Auth: 5wL2QHVTKaAXghpNHQjSpSdA_fY
Message-ID: <AANLkTikPHQf_hZtE8Pp-d0Q_8ofCeVCC3G0ApGD1RzNo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev@lists.berlios.de
Subject: Re: added task nr to NOTE and error messages
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
X-List-Received-Date: Sun, 17 Oct 2010 02:53:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 16, 2010 at 12:55 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> NOTE: Running task 742 of 995 (ID: 170,
> /home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/gcc/
> gcc-cross_4.4.4.bb,
> do_compile)
> NOTE: package gcc-cross-4.4.4-r6.0: task do_compile: Started
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /etc/localtime
> NOTE:   /etc/ld.so.conf
> NOTE: Multiple libraries (libnss_hesiod.so.2, libnss_nisplus.so.2,
> libnss_nis.so.2) found, but LEAD_SONAME 'libc.so' doesn't match any of
> them
> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>
>
> Obivously the notes are not from the gcc-cross do_compile just above it.
>
> Suggestion is to add the task number to the NOTE.
>
> e.g.
> NOTE (task 730):
>
> or, if more compactness is desired:
> NOTE (730)
> or even
> NOTE_730
>
> Guess the same would apply to error messages etc.
>
> I guess this is not too difficult, but my knowledge of the system and
> python is not good enough to come up with a patch.
>
> Frans
>
> PS: it might also be nice to have a mechanism to throttle the notes
> (or supporess some or all of them).
> When doing a build of the testing branch I am not really interested in
> task started/succeeded messages, not creating empty archive, packaged
> contents of ... etc etc)
> It would be nice if there was a way to (selectively?) suppress these.
> (btw:  i know some of these are from oe, and others are from bb)
>

Note that in bitbake master, we're using the python logging module, which
makes it extremely easy to inject extra metadata into messages, etc.  Worth
playing with.  Not sure what would be best to handle messages you are/aren't
interested in.  Some of those could eventually be switched to their own
loggers, e.g. domain BitBake.Task.Status or something -- alternatively, some
sort of messages classes implementation, or a pattern based message
identification, or add localization and go based on the pattern there, or...
*ponders*
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

