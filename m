Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OJD0i-0002Yz-4l
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 23:59:05 +0200
Received: by wwb34 with SMTP id 34so2342080wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 14:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=G150Bb8NevFt/Q59VK9xc2CnCgknYBcTRbeB0zRt4wY=;
	b=MI3Y/RkMfyBWxEFeK99CMN1N24GEnpGgiLl0j/l0m21UYIsGT3eOss8ZNNupdQUPCQ
	YIGOVygKULSFxemK5xieNGOfuXTQpi9ZWHNuk0jVBtO6OiTyVgEVu/5FEq12zl7NRQiw
	z78urpO9ZrLkfR2L8NOWwi0+rQEypzdpiUKM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gWU0fYp8O/bL3KEJc+PJUbFwlWZqHMabsAyi21GznPGfxn7ZRHaqfcV5DA11pWwkml
	6RB/1HhXn7dYoZFX/zY7uR0DjHnigBoeDwR+T+zmkN5m7LPsLtTR+c8hizOYLfzO7DDK
	CeQ4sbX5gS6ZS6Op0jrX4wYOGLS4gxd1Zihx0=
MIME-Version: 1.0
Received: by 10.216.88.147 with SMTP id a19mr4382724wef.93.1275342890905; Mon, 
	31 May 2010 14:54:50 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 31 May 2010 14:54:50 -0700 (PDT)
In-Reply-To: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
Date: Mon, 31 May 2010 17:54:50 -0400
Message-ID: <AANLkTinfdaWq9aYzYEoDAWztRypqhzOlgnEl4CQCnwq4@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Mon, 31 May 2010 21:59:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

As I continue to ponder this, it seem it makes sense to simple include
the bitbake recipe directly in the application source.  This makes it
very easy and consistent to set the source directory 'S'.  The big
advantage with this is we easily know the location of the source tree
-- its just the same place as the bitbake recipe.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
# recipe to build the autotools-demo in the working tree

inherit srctree autotools gitver

PV =3D "${GITVER}"
S =3D "${FILE_DIRNAME}"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

Now, anyone can add this application to their recipe tree very simply by:

cd <oe>/recipes
git clone git://git.bec-systems.com/autotools-demo
cd -
bitbake autotools-demo

Now, I no longer see the below errors, so that is good.  However, I
see following problem:

cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
NOTE: Handling BitBake files: \ (8385/8385) [100 %]
Parsing of 8385 .bb files complete (7917 cached, 468 parsed). 8306
targets, 333 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 723 of 733 (ID: 0,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotool=
s-demo.bb,
do_populate_sysroot)
NOTE: Running task 724 of 733 (ID: 6,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotool=
s-demo.bb,
do_distribute_sources)
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task
do_populate_sysroot: Started
NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_configure
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_configure: Started
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task
do_distribute_sources: Started
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task
do_distribute_sources: Succeeded
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_configure: Succeede=
d
NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_qa_configure
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_qa_configure: Start=
ed
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_qa_configure: Succe=
eded
NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_compile
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_compile: Started
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_compile: Succeeded
NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_install
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_install: Started
NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_install: Succeeded
FATAL: Unable to start to 'None' UI due to exception: 23634.
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotool=
s-demo.bb
do_qa_staging failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotool=
s-demo.bb
do_package failed

If anyone is interested in reproducing this problem, it should be very
simple by running the above instructions.

This concept seems fairly useful to me in that it allows device
developers to easily add their custom applications to an OE build, and
everything is on one place.  I think the existing separation of recipe
and work tree makes sense for canned stuff that OE provides, but
device developers need an easier way to do iterative target
development, and I think a working srctree/gitver gives us that.  The
git submodule mechanism is very exciting in that it gives us a
standard way to lock down versions of various submodules without
reverting to manually specifying hash values in recipes, etc.

Thanks,
Cliff

On Mon, May 31, 2010 at 5:12 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Hello,
>
> I'm trying to put together some examples of using srctree/gitver, and
> running into a few issues.
>
> My example is in a bitbake overlay:
>
> git://git.bec-systems.com/openembedded.custom
> http://cgit.bec-systems.com/cgit.cgi/openembedded.custom/
>
> This overlay includes a submodule for:
>
> git://git.bec-systems.com/openembedded.custom
> http://cgit.bec-systems.com/cgit.cgi/autotools-demo/
>
> and a recipe to build the above submodule:
>
> http://cgit.bec-systems.com/cgit.cgi/openembedded.custom/tree/recipes/aut=
otools-demo/autotools-demo.bb
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> # recipe to build the ics-test-app in the working tree
>
> inherit srctree gitver autotools
>
> PV =3D "${GITVER}"
> S =3D "${OEDIR}/openembedded.custom/work/autotools-demo"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> When I try 'bitbake autotools-demo', I get the following:
>
> cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
> NOTE: Handling BitBake files: / (4602/8385) [54 %]ERROR: 'NoneType'
> object has no attribute 'startswith' while parsing
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autoto=
ols-demo.bb
> NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute 'startswith' while evaluating:
> ${@get_git_pv('/scratch/oe/oe-build/oe/openembedded.custom/work/autotools=
-demo',
> d)}
> NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute 'startswith' while evaluating:
> ${GITVER}
> NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute 'startswith' while evaluating:
> ${PN}-${EXTENDPE}${PV}-${PR}
> NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute 'startswith' while evaluating:
> ${FILE_DIRNAME}/${PF}/${MACHINE}
> ERROR: 'NoneType' object has no attribute 'startswith' while parsing
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autoto=
ols-demo.bb
> NOTE: Handling BitBake files: \ (8384/8385) [99 %]Command execution
> failed: Traceback (most recent call last):
> =A0File "/scratch/oe/oe-build/oe/bitbake/lib/bb/command.py", line 85,
> in runAsyncCommand
> =A0 =A0self.cooker.updateCache()
> =A0File "/scratch/oe/oe-build/oe/bitbake/lib/bb/cooker.py", line 802,
> in updateCache
> =A0 =A0if not self.parser.parse_next():
> =A0File "/scratch/oe/oe-build/oe/bitbake/lib/bb/cooker.py", line 995,
> in parse_next
> =A0 =A0raise ParsingErrorsFound
> ParsingErrorsFound
>
> Any suggestions as to what might be going wrong with gitver?
>
> Thanks,
> Cliff
>


