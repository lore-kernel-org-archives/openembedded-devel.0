Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1M1p07-0004xv-9J
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 23:50:03 +0200
Received: by wf-out-1314.google.com with SMTP id 25so297720wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2009 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=moI+cbOimPDOOvCNeRwKxj4L6jC9iBCNYV/uPdX8QGo=;
	b=iWW6EpHKn5eM8Huj3C4GULV7Z2T/UMfCnn0tSe7F3dFgyFaHKbOZfkNRUe6KdSie33
	80NfnOAgZ6L58xfbcu8Y77pLAwenfUx7NQFKClZm1upy4CBgojuJ4pdd2/OcI+7P4SDT
	jQLGHvjYxEvN4j2xzBST0OGRD8DM/9mOwIHWg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=aFWIsGLOSn8szvmxXPNIJw++rUnzV7WC3bG0wyf+Ba4AENmkfjXSXC9BNUAIXzql0Q
	5eO/a/WXzNHGApHqMZ5ZBU4kX3CKj+B9ZdImsVcdKC5QY/iVCJUfz/k8r5a+29g16SWe
	QypiU0WDsrxv13dPLUqt+0IMFm/DNlzKPrQvU=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.158.3 with SMTP id g3mr681872wfe.221.1241646240662; Wed, 
	06 May 2009 14:44:00 -0700 (PDT)
In-Reply-To: <loom.20090506T211326-740@post.gmane.org>
References: <loom.20090506T211326-740@post.gmane.org>
Date: Wed, 6 May 2009 14:44:00 -0700
X-Google-Sender-Auth: 8c3fdf8f012b62bc
Message-ID: <b6ebd0a50905061444r2d012f65t67fe8af4663a6ae5@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Development and Open Embedded
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
X-List-Received-Date: Wed, 06 May 2009 21:50:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2009 at 2:33 PM, Michael Sundius <msundius@sundius.com> wrot=
e:
> Hi,
>
> I'm helping my organization move our platform build
> infrastructure to better than the complicated and
> disparate make jumble of make files and tarballs
> that we currently use. I've integrated much of it
> to Open Embedded (basic root fs image, kernel, tools).
>
> This all works well, but it seems to me (a kernel hacker
> mostly) that the hacking cycle of code, compile, run
> is a bit difficult if you are working within the confines
> of source control systems.
>
> that is, say I modify a file within my kernel development (git)
> tree and then want to compile it. under OE, the whole tree is
> going to be copied to the sources dir, tarballed, and then
> extracted into the ${S} directory. =C2=A0Further, when compiling,
> all the output files are left in the ${S} dir, instead of
> directing them to an output directory.
>
> I find that most of the engineers I know start to grumble when
> the have to wait any longer than status quo in any one of the
> steps for turning around a small change to their source. My
> experience is mostly inside the kernel, but I suppose other
> projects are similar on embedded systems.
>
> I'm wondering if anyone has done such a thing as creating a
> recipe that forgoes the "fetch" task and point the ${S} to
> a local devel tree.. then adds an extra onto the make command
> to place the object in another directory (maybe ${O})...
>
> Maybe people have solved this problem in other ways or a similar
> way. I'd love to get some insight into how this is done in
> other organizations... It would be great to beable to inherit
> a class that allows use of an efficient dev cycle.

I have a little class somewhere around here that did that.  Killed
fetch/unpack/patch, set S to ${TOPDIR}, set O to
${TOPDIR}/obj-${HOST_SYS} or so, redirect WORKDIR to
${TOPDIR}/somethingorother, etc.  It works very well.  You can then
add the recipe from the source tree to your BBFILES, or add your
development area to COLLECTIONS or so, and it mostly just works.
Cleaning up something like that would be a huge boon to the
application and kernel developer use cases, which are sadly not well
satisfied in current openembedded.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


