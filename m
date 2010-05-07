Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OAWan-0003OK-Uv
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 01:04:32 +0200
Received: by pwj5 with SMTP id 5so698101pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=YTLyPgWmbvhNYA3NoSO8Wd+rgEx9pIQmhokRsj/dfLI=;
	b=BYYzjXdBpeqKBdKAGVRFNy+myr3ab2+1kpof7I3JVSJmf0OQMQUuSmwiFV8ZUo3TYJ
	ip5W9epPqzCbQyv4GIrvVp8Z4LltndDf81Sk8QkeSAdPyGeS1WLqWdBvv0psYNBV0iDF
	I1wnWc76aKuepGA01cH4hIKHZSRU30cEPGoM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=fwTps5vAwHQ5dxdI8TCcyBzvQbkbRcpsKMtJgGFDxAdHHfBSRwAvQ4qaSUw0iPIvZp
	aSY/3Kux52sGQ4cFdR2OXiqUS6DXnc9Xf6ju8oGGWmowxLNRrIy0Zw234w8Sr+Buj7FR
	JledaQKyKOnrQS66Vefx5it9p08yKUqRKK2vc=
Received: by 10.142.56.8 with SMTP id e8mr463602wfa.117.1273273235130; Fri, 07 
	May 2010 16:00:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.13.14 with HTTP; Fri, 7 May 2010 16:00:15 -0700 (PDT)
In-Reply-To: <z2qbd4a003f1005071539wbd18f0e5w531868565b953e2a@mail.gmail.com>
References: <z2qbd4a003f1005071539wbd18f0e5w531868565b953e2a@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 7 May 2010 16:00:15 -0700
X-Google-Sender-Auth: a6291a5e7f4a0ad0
Message-ID: <u2xb6ebd0a51005071600ra9935d46r8fe294c592c7cebf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Understanding Bitbake Dependencies
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
X-List-Received-Date: Fri, 07 May 2010 23:04:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 7, 2010 at 3:39 PM, Ash Charles <ashcharles@gmail.com> wrote:

> Hi,
>
> When I change a recipe or configuration in OE, I often end up doing a
> 'bitbake <package-name> -c clean; bitbake <package-name>' to ensure
> whatever it is I'm doing it gets rebuilt.  I realize there must be a
> better way to do this in some cases---sometimes just a bitbake
> <package-name> -c rebuild is sufficient though not always---other
> times I can just get away with bitbake <package-name>.
>
> --- What types of changes causes bitbake to rebuild a recipe?
>

It never magically detects changes to recipes or configuration and rebuild.
 It goes by the stamp files, whose file names include the PN, PV, PR
variables. If you change a recipe or config and need something rebuilt, you
need to either bump its PR (revision) or do the -c clean then bitbake.

--- Why is '-c clean, then rebuild' different than '-c rebuild'?
>

It's an artifact of how bitbake's runqueue works.  Strongly advise against
using -c rebuild as it stands today.


> --- If I make changes to the kernel (e.g. enable a module), what else
> do I need to bitbake to get an updated root file system|image?
>

Image recipes rebuild the image from the packages every time you bitbake
them (their tasks are flagged with 'nostamp').  If your question is how to
rebuild the kernel packages that the image recipes can then install, as I
said above, clean and re-bitbake the kernel or bump the recipe revision if
it's a recipe change.

Sorry for the simple questions but the dependencies can seem a little
> magical at times. If anyone could point me to a reference or give me a
> brief explanation of this, that'd be wonderful!


I had thought the behavior of the stamps was documented in the bitbake
manual.. if not, it should be :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

