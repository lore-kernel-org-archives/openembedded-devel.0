Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwhoosier@gmail.com>) id 1Ixt6x-00036I-SB
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 00:48:04 +0100
Received: by py-out-1112.google.com with SMTP id a25so4608946pyi
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2007 15:44:58 -0800 (PST)
Received: by 10.35.41.12 with SMTP id t12mr8180607pyj.1196379897393;
	Thu, 29 Nov 2007 15:44:57 -0800 (PST)
Received: by 10.35.15.5 with HTTP; Thu, 29 Nov 2007 15:44:56 -0800 (PST)
Message-ID: <d543f5920711291544r1413c190uffb4dce83b2accf8@mail.gmail.com>
Date: Thu, 29 Nov 2007 17:44:56 -0600
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <474F1943.50308@student.utwente.nl>
MIME-Version: 1.0
References: <d543f5920711290953x75c79b84gbb5bfdce83bfc324@mail.gmail.com>
	<1196363431.6917.29.camel@localhost.localdomain>
	<474F1943.50308@student.utwente.nl>
X-Google-Sender-Auth: 7021a8b297e9d0d4
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>, poky@o-hand.com
Subject: Re: [poky] Syntax for requiring a dependency task's deploy phase to be finished
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2007 23:48:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 29, 2007 1:55 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Richard Purdie schreef:
> > On Thu, 2007-11-29 at 11:53 -0600, Matt Hoosier wrote:
> >> I'm trying to build a kernel containing an initramfs linked directly
> >> into the kernel binary. This is inspired by the recent discussion
> >> here: building a minimal image with IMAGE_FSTYPE set to cpio.
> >>
> >> I need to be sure that by the time the kernel's do_compile task
> >> executes, the minimal image has been deploy to ${DEPLOY_DIR}/image.
> >> What's the right way to write this dependency?
> >
> > If I understand correctly you want something like
> >
> > do_compile[depends] += "minimal-image:do_deploy"
> >
> > inside the kernel recipe where "minimal-image" is the name of the image
> > recipe.
>
> And make sure *nothing* in that image depends on a kernel at buildtime,
> otherwise bitbake will start spewing incomprehensible backtraces :)
> A better approach would be to write a bbclass that takes a kernel image
> and initramfs and glues those together.

Okay, thanks to both. Richard's suggestion solves the immediate need.


