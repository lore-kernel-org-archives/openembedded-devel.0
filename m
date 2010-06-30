Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1OTsYR-00048p-Ti
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 10:22:01 +0200
Received: by gyc15 with SMTP id 15so268990gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ce+M3Zb6Dsvp8PI8raUISRR4c8fnYQri2ZEUR6UuO5I=;
	b=LhSqaS9QhYohBn+ITG55qtR+lchUBr/ZoSay5+enuNTl4r/VtGXTzaugOVUJodbG3R
	PoJW++fJMdRiEYlzxztbg0T4EluLeLxP1Wof55MxLWIyMz1/5jHVVQ6t8xUwdd9ffozC
	Xx9Up6PKQPmaG7VRMeTHSvKlvBvQARC083vA0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TZmFPBNzfWAA2ZxPZpfpMOnK3W7U7DscFjr4n/lMa9AnBnw19HcHau21lkXuGzN0Fm
	OrcWYqyNQk1sC26QoLN9eDRFN9/tF+TmnJB1GeXM5EYBPYV1yHguqXYh1WEh6bHo49Na
	BYALzpULP2Zg86dTc3mff3EENmdv7Ek4r9B50=
MIME-Version: 1.0
Received: by 10.90.233.2 with SMTP id f2mr6711924agh.38.1277885835562; Wed, 30 
	Jun 2010 01:17:15 -0700 (PDT)
Received: by 10.90.34.8 with HTTP; Wed, 30 Jun 2010 01:17:15 -0700 (PDT)
In-Reply-To: <AANLkTimvW1gNNl6n2Qogc5Z6Di1ALEvRxF_7F10QGHx9@mail.gmail.com>
References: <AANLkTimtQogqYVnJvtD2BQInWujKyXs3ecFTptF6ZlBf@mail.gmail.com>
	<AANLkTimvW1gNNl6n2Qogc5Z6Di1ALEvRxF_7F10QGHx9@mail.gmail.com>
Date: Wed, 30 Jun 2010 13:47:15 +0530
Message-ID: <AANLkTim0aXItWXsOIEmMh9tGulfA35zBZ5Wskxf4qg2y@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake: environments getting lost inside python callback function
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
X-List-Received-Date: Wed, 30 Jun 2010 08:22:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks.  I will take a look.

On Tue, Jun 29, 2010 at 23:10, Chris Larson <clarson@kergoth.com> wrote:

> exported bitbake variables are emitted into the run. shell script when the
> task is executed.  They are not exported into the actual environment of the
> bitbake process, so they do not end up in the child processes spawned by
> os.system().  See the oe_popen/oe_system wrapper functions.
>
> On Mon, Jun 28, 2010 at 5:02 AM, Anand Sivaram <aspnair@gmail.com> wrote:
>
> > Dear All,
> >
> > I am using OE to make a davinci dm6446 build.  The build machine is an
> > Athlon X4 with Ubuntu 10.04 amd64 installed.  Everything is building fine
> > (palmtop-image, x11-gpe-image etc.), now I am moving onto gstreamer-ti
> > related recipes.
> >
> > As a part of that I tried the following
> > bitbake -v -b ./recipes/ti/ti-dspbios_5.41.00.06.bb -f
> > This downloads bios_setuplinux_5_41_00_06.bin from TI site and trying to
> > unpack it for which it uses recipes/ti/ti-eula-unpack.inc
> >
> > Since it was not working, I tried to understand
> > recipes/ti/ti-eula-unpack.inc, used the following debug code snippets.
> >
> > Updated the first python callback "python do_unpack" to the following to
> > get
> > the list of environments
> > python do_unpack () {
> >    os.system("/usr/bin/env > /tmp/env_py.txt 2>&1")
> >    os.system("/bin/echo env complete >> /tmp/env.txt")
> >    bb.build.exec_func('base_do_unpack', d)
> >    bb.build.exec_func('ti_bin_do_unpack', d)
> > }
> >
> > Now going through the output of "cat /tmp/env_py.txt" from a shell.
> > *Every* *environment* *is* *lost* *with* *the* *exception* of PWD,
> > SHLVwhere PWD is showing the complete path of workdir,SHLV=1 (like a
> > top level shell)
> > This was causing the rest of the script file to give errors.
> >
> > Next I commented out the whole python do_unpack() callback put a new
> custom
> > do_unpack() shell callback, just for finding the environment list.
> > do_unpack() {
> >   echo unpacking..................
> >   env > /tmp/env_shell.txt 2>&1
> >   sleep 100
> > }
> > Now cat /tmp/env_shell.txt is showing proper environments.
> >
> > Could anyone throw some light on this?
> >
> > Thanks and Regards
> >
> > Anand
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
>
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

