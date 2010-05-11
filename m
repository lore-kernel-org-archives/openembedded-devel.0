Received: from smtp-out.google.com ([74.125.121.35])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alees@google.com>) id 1OBpkO-0002TH-2S
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 15:43:49 +0200
Received: from wpaz29.hot.corp.google.com (wpaz29.hot.corp.google.com
	[172.24.198.93]) by smtp-out.google.com with ESMTP id o4BDdqv2015351
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 06:39:52 -0700
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1273585192; bh=xIx4d75dMlA6Rc6LIlTflfVcuM0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	To:Content-Type;
	b=de+7DWL66Wzd+v5lG/riHLLLgB7exzDDRMLBwhIqISuNZXFP1ItaPOaZJIIVh/Q+X
	m2L8RP/ZGYr00/H5/x41w==
DomainKey-Signature: a=rsa-sha1; s=beta; d=google.com; c=nofws; q=dns;
	h=mime-version:in-reply-to:references:from:date:message-id:
	subject:to:content-type:x-system-of-record;
	b=AYspM0AjS0YEC3UhLbcU1N3IkC8M2eE1IRnd0045Dh92v4gxyWCzlL16CSMxmucNK
	RyEZdqoqleB9Lm5FlG6Mg==
Received: from vws4 (vws4.prod.google.com [10.241.21.132])
	by wpaz29.hot.corp.google.com with ESMTP id o4BDdo6n020632
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 06:39:51 -0700
Received: by vws4 with SMTP id 4so863149vws.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 06:39:50 -0700 (PDT)
Received: by 10.220.62.134 with SMTP id x6mr151180vch.188.1273585190306; Tue, 
	11 May 2010 06:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.61.203 with HTTP; Tue, 11 May 2010 06:39:29 -0700 (PDT)
In-Reply-To: <w2v19c1b8a91005081025l9688a5b8wc6eff5bc15496513@mail.gmail.com>
References: <hs0mk7$rst$2@dough.gmane.org>
	<1273330086.23460.11.camel@desktop.maison.net> 
	<w2v19c1b8a91005081025l9688a5b8wc6eff5bc15496513@mail.gmail.com>
From: Angus Lees <alees@google.com>
Date: Tue, 11 May 2010 23:39:29 +1000
Message-ID: <AANLkTimJm8aWxNlkEK0eYJhbjtGwt6ZHWtKhdJ_mipbF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-System-Of-Record: true
X-SA-Exim-Connect-IP: 74.125.121.35
X-SA-Exim-Mail-From: alees@google.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: meta-toolchain doesn't build due to gdb-cross-sdk
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
X-List-Received-Date: Tue, 11 May 2010 13:43:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

It looks like the do_stage() removal was good, but the "inherit cross"
refactor broke task-sdk-host and all the SDKs that depend on it.  I suggest
reverting most of 4cf6a6bf83ccb13e7238927d72e77c4612fe6543 (but I'm hardly
an expert).

 - Gus

On Sun, May 9, 2010 at 03:25, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, May 8, 2010 at 7:48 AM, Thomas Jourdan <thomas.jourdan@yaeld.fr>
> wrote:
> > Hi
> >
> > The problems seems to come from the conversion to new staging mode in
> > GDB.
>
> right
>
> Now, gdb-cross-sdk inherits from sdk and cross whereas before it
> > only inherited from cross.
> >
> > Reverting Khem Raj GDB patches fixes the build for me (meta-toolchain
> > works again).
>
> thats because gdb 7.1 is then not using new staging and hence it builds
> again.
>
> >
> > Regards,
> > Thomas
> >
> > Le vendredi 07 mai 2010 =E0 11:30 +0200, Koen Kooi a =E9crit :
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Hi,
> >>
> >> Currently meta-toolchain is unbuildable:
> >>
> >> Missing or unbuildable dependency chain was: ['gdb-cross-sdk']
> >> NOTE: Runtime target 'task-sdk-host' is unbuildable, removing...
> >> Missing or unbuildable dependency chain was: ['task-sdk-host',
> >> 'gdb-cross-sdk']
> >> ERROR: Required build target 'meta-toolchain' has no buildable
> providers.
> >> Missing or unbuildable dependency chain was: ['meta-toolchain',
> >> 'task-sdk-host', 'gdb-cross-sdk']
> >> Command execution failed: Traceback (most recent call last):
> >>   File "/OE/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
> >>     commandmethod(self.cmds_async, self, options)
> >>   File "/OE/bitbake/lib/bb/command.py", line 174, in buildTargets
> >>     command.cooker.buildTargets(pkgs_to_build, task)
> >>   File "/OE/bitbake/lib/bb/cooker.py", line 757, in buildTargets
> >>     taskdata.add_unresolved(localdata, self.status)
> >>   File "/OE/bitbake/lib/bb/taskdata.py", line 562, in add_unresolved
> >>     self.remove_runtarget(self.getrun_id(target))
> >>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
> >>     self.fail_fnid(fnid, missing_list)
> >>   File "/OE/bitbake/lib/bb/taskdata.py", line 495, in fail_fnid
> >>     self.remove_runtarget(target, missing_list)
> >>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
> >>     self.fail_fnid(fnid, missing_list)
> >>   File "/OE/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
> >>     self.remove_buildtarget(target, missing_list)
> >>   File "/OE/bitbake/lib/bb/taskdata.py", line 519, in remove_buildtarg=
et
> >>     raise bb.providers.NoProvider
> >> NoProvider
> >>
> >> The weird thing is that 'bitbake gdb-cross-sdk' *DOES* work. Any ideas=
?
> >>
> >>
> >> regards,
> >>
> >> Koen
> >> -----BEGIN PGP SIGNATURE-----
> >> Version: GnuPG v1.4.5 (Darwin)
> >>
> >> iD8DBQFL493HMkyGM64RGpERAsfeAJ4+dAGLxl374iYexNPvF7aOl1L9jwCdEvTu
> >> mKxwdYeXXCsZzQ0H8yocaBw=3D
> >> =3Duhtx
> >> -----END PGP SIGNATURE-----
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

