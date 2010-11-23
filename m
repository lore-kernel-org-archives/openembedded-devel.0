Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKumL-0003yl-Ec
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 16:27:36 +0100
Received: by ywo32 with SMTP id 32so421210ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 07:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=XaY+dWSHm/6qpk+yXSU3F7IMU2H99i+rtYvMOl9akwg=;
	b=C21hOVO93+kdsQTmBvhIQ6OZBO5yQU07hlJAWCG1aDof9bsYHdG6KyPGQRoxKgXfWM
	om3F4s8dIYSvsvF9ySSctAnCNwNzhJvLyKbLMAxdW8XQk/FSdTcYVRWpHtt2b+a4g1AH
	+a+Qj8EDlDzr1NYNHgBYqUASXIH8z9kCQWylc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=YneiN81xQ3ys+bEtlpkJQVTD3jbeVy+0A7teNTcHDAdUiYXWrqNJW5me3EpCrOEYcR
	SwzZ7to3bu47hfZQ5Ao6PI6PWTyrsW9uxmU9A6w/pCQ2n6C8scLnYhOgh5Bd6Uqy2CL4
	im0Fs2i20Ukue3m0GquDT5EegK89e0NZ2vTo4=
Received: by 10.216.239.199 with SMTP id c49mr6741035wer.12.1290525978348;
	Tue, 23 Nov 2010 07:26:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 23 Nov 2010 07:25:57 -0800 (PST)
In-Reply-To: <AANLkTimVOOQ28E1NfJm5Rim4X+WmvXAtOSJ9W34KH7X-@mail.gmail.com>
References: <AANLkTimVOOQ28E1NfJm5Rim4X+WmvXAtOSJ9W34KH7X-@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Nov 2010 08:25:57 -0700
X-Google-Sender-Auth: 1teSSve2onv7J7NddLBJi2jgbD0
Message-ID: <AANLkTik022J6+49_rQZ5mk2o3x79t6vc5Z6yEiRY8izM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openembedded / dpkg-buildpackage hybrid
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
X-List-Received-Date: Tue, 23 Nov 2010 15:27:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 8:19 AM, Luke Kenneth Casson Leighton
<lkcl@lkcl.net> wrote:
> there's a debian embedded sprint on in february:
> http://wiki.debian.org/Sprints/2011/EmdebianSprint
>
> i came up with the
> mad idea of modifying openembedded so that it understands debian
> archives, debian/control and rules files, and back-ends into
> dpkg-buildpackage and/or dpkg-cross-buildpackage in order to
> recursively build entire debian archives.
>
> so i wanted to ask people here what they think.
>
> in particular, one of the challenges is that bitbake doesn't cope with
> numbered version dependencies, which i know has been discussed before
> (avoiding regex's) - i wanted to run the idea past people here: how
> about doing the same dependency numbering format as debian control
> files? =C2=A0"Depends:" can be "python (>=3D 2.5) " for example or "glibc=
 (>=3D
> 0.0.1, <=3D 1.1.3)" which is a simple enough syntax to not be too
> resource-hungry.
>
> and it would solve the rather awkward situation where you have to
> specify blacklists of absolutely every single other version, but then
> someone adds a new bb recipe for that library and of course breaks
> _your_ build as a result, it's all rather fragile.

There are multiple issues with version specific dependencies.  The
syntax is straightforward, I don't see that being a problem.  The work
would be in teaching bitbake's runqueue to obey it.  The other issue
that immediately comes to mind is handling conflicting version
requirements.  Right now the OE sysroot (where files are shared
between dependencies) is global, rather than per-recipe, and if
multiple versions of something get yanked into a build, they'll step
all over one another in that sysroot.  We've discussed possibly moving
to per-recipe sysroots in the past, constructing them on demand based
upon what that recipe requires, but we're not there yet, so I think
we'd have to, for now, just make bitbake freak out and die if the deps
want multiple versions.

I don't see any major problems preventing what you want, at least when
it comes to the version specific dependencies, it's just a matter of
doing the coding to implement it.  Patches welcome ;)



--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


