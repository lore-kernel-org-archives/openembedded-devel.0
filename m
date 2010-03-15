Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NrBEM-0007Vo-ID
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 15:25:20 +0100
Received: by qw-out-1920.google.com with SMTP id 5so759695qwc.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=YTRfns6im1ouxVn7F3ONW8RaVpQGhNS17U/m3lAFvX4=;
	b=Fp3be0ODnVbbC9PQD/fQeKywMaio47XMQnuX2Eg+/Uk29+DMS7oBA3kyhOds+KJMYF
	7e7NsZGMmfK5XmTUWrvELGZTVTEbGPGn8RrFF7dqfTp/dZkLKvbRY0Zp+4ewz4cfWIOp
	WRP2f4Bi6Ln5t/yNgKAxZjRC3LtVKL6qIroMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=kxmHvoRhnNRgCcx6ZVGhDp/N0fh4lbQE/+HjmmCA6PQlLJZEe9GUYmMdqjulEZ/idw
	LE4rBAXO1I1q/pFJUW+t1cro5JGwqBKvZYYC83d3UwBa+YK/HgMCYZ8FJV0j0ccvA4l4
	cjlQARm8VaaD8fwLf2M/pmgU7fckwBt6XlX1Q=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.228.83 with SMTP id jd19mr5033922qcb.72.1268662932220; 
	Mon, 15 Mar 2010 07:22:12 -0700 (PDT)
In-Reply-To: <hnl0m8$3al$1@dough.gmane.org>
References: <hnl0m8$3al$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 15 Mar 2010 07:21:52 -0700
X-Google-Sender-Auth: e91d918c2c7b76f8
Message-ID: <b6ebd0a51003150721x4378f839raf86d53e82d3b891@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] Make autotools.bbclass warn and fixup for "needs newer autoconf" breakage
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
X-List-Received-Date: Mon, 15 Mar 2010 14:25:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 15, 2010 at 3:03 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Every now and then the world moves to a more recent autoconf (2.64 is
> popular nowadays) and distros in OE have to to through a lengthy
> test-fix-bump cycle to keep up. The workaround for such a problem
> usually is:
>
> do_configure() {
>        gnu-configize
>        oe_runconf
> }
>
> That gets us the config.guess for exotic targets (e.g. avr32) and runs
> the in-tree configure script. What are your opinions on adding something
> like this to autotools.bbclass:
>
> if ((needed autoconf > installed autoconf) && configure exists)
>        BIG FAT WARNING
>        skip libtoolize + reconf
>
> The biggest problem with that is that is "silently" degrades when using
> the "wrong autoconf" and the possibility for mismatched
> do_configure_prepend/append  methods.
>

It doesn't *necessarily* have to degrade silently -- you could do a check
from python, either in the task or in the taskstarted event handler for
do_configure.  (Aside: now that bitbake master can split into client/server,
bbnote/bberror/etc scripts that actually output stuff via bitbake rather
than in the logs should be a real possibility for that branch..)

Do the benefits (not littering recipes with global shortcuts) outweigh
> the downsides?


On the one hand, I like the idea, particularly if we can arrange some sort
of warning (or, alternatively, add a message to a sanity check task, so its
explicit).  The only minor concern I have with this is the fact that minimum
autoconf versions actually rarely reflect real dependency by upstream.  Most
commonly, they just injected the version number they use, not the one they
actually require.. of course, trying to catch those is a bit of a pain in
the ass, so it may be that this is best.  *shrug*

On a related note, I too dislike the recipe 'litter', and think that we need
a way to toggle non-autoreconf behavior from the recipe easily.  In the
autotools branch I started on but never completed, I pushed the common
autoconf bits into autotools_base.bbclass, and inheriting that rather than
autotools resulted in gnu-config update + oe_runconf, but an alternative
would be to just add a variable for it.  Thoughts on that?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

