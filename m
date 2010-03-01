Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nm5wM-0006oJ-Ry
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 14:45:50 +0100
Received: by pwi5 with SMTP id 5so1621411pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 05:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=WXE8FJoU3MvNpFEdmQDq1Qg05IwGyXXhQZoY0KJvclM=;
	b=hT94+FBNYY3q0gWhzqkCQEFs5v2FZwi4Sf2TqIqcWWrEqp/F7dyqinSHt4PIH49zSE
	dZpqsStrgb25pgbOl9IfzB+AoU4c5sqtv92bW+LGvXuBSBCF0Ry71DIGlyTWkDGAdrV8
	3CjWG+JHQVYb2FiDvhgnYap0xd1hlxC7UheEM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=PZmaYdyk/xJb20+QVDNEKnQJFdN63sVz4QUkMc07x2cvperjuUY4Zk86gpv7rZNWaL
	07rkDy/iYTikwizqKndlCkGEnkqLJQcBrUrmMTVE4/ket3xclPvd+0Cynwo1Lz+lB/E6
	GkYI03v+gxna0BYvsdm/eVE+c4hZLY7/dTwcg=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.25.27 with SMTP id c27mr2572836wfj.249.1267450972128; Mon, 
	01 Mar 2010 05:42:52 -0800 (PST)
In-Reply-To: <hmg2f8$usj$1@dough.gmane.org>
References: <1266605268-5957-1-git-send-email-clarson@kergoth.com> 
	<hmg0mh$ou0$1@dough.gmane.org> <hmg1p8$suj$1@dough.gmane.org> 
	<20100301094515.GI30145@xora-desktop.xora.org.uk>
	<hmg2f8$usj$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 1 Mar 2010 06:42:32 -0700
X-Google-Sender-Auth: e5f2528baf1dd203
Message-ID: <b6ebd0a51003010542r136a7572n1a947161c196fff8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] package.bbclass: when running 'file', be explicit 	about the path to the magic
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
X-List-Received-Date: Mon, 01 Mar 2010 13:45:50 -0000
Content-Type: text/plain; charset=UTF-8

Ugh, lovely.  Okay, I'll take care of it today, sorry for the hassle.

On Mon, Mar 1, 2010 at 2:47 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-03-10 10:45, Graeme Gregory wrote:
> > On Mon, Mar 01, 2010 at 10:35:36AM +0100, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> I think I know what's happening.
> >>
> >> On my (debian) buildhost I have file 4.26. (Re)building file-native 5.04
> >> gives me:
> >>
> >> ./staging/x86_64-linux/usr/share/misc/magic.mgc
> >>
> >> Graeme has file 5.03 on his buildhost and has
> >>
> >> ./staging/x86_64-linux/usr/share/file/magic
> >>
> >> So it seems that the buildhost contamination also affects file-native :(
> >>
> > Its not contamination, its just simply that file 5.XX moved its magic
> > file to /usr/share/misc/
> >
> > Im still building 4.21 for some reason so dont see this.
>
> Bitbake 1.8.x? I'm using bitbake master from git, that has a different
> sorting algo AIUI.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLi40oMkyGM64RGpERAjEIAJ4+rW+07FQBjx9std0w7ZE1tYcdtQCgtgI6
> X6RRtXw6ttRVlMSfzyUAUBk=
> =QSlm
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

