Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PBV6A-00059v-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 18:13:07 +0200
Received: from [82.113.106.5] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PBV5O-0001xw-VB by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 18:12:24 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PBT17-00019M-2V
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 15:59:45 +0200
Date: Thu, 28 Oct 2010 15:59:44 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101028135944.GL3311@excalibur.local>
References: <4CC14738.9070309@nedap.com>
	<lyfwvvaftm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTinMHO=XRv=EDuVVmLcfjJoLETgW8rv96jEus_YE@mail.gmail.com>
	<lyd3qy5ysk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTi=aXZP1fhpW4Cj9yQLgbzhzKt9wwiac2_hJdvyO@mail.gmail.com>
	<lyy69l5nvj.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyy69l5nvj.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_WEB,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Thu, 28 Oct 2010 16:13:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-10-26 at 11:01, Enrico Scholz wrote:
> Khem Raj <raj.khem@gmail.com> writes:
> 
> >>>>> -    install -m 0755 src/cacaoh/.libs/cacaoh ${STAGING_BINDIR}/cacaoh-cldc-${PV}
> >>>>> +    install -m 0755 src/cacaoh/cacaoh ${STAGING_BINDIR}/cacaoh-cldc-${PV}
> >>
> >> * libtool creates sometimes a wrapper script for executables (e.g. when
> >>   they are linked against local libraries) and places the real executable
> >>   in .libs/.  Manually installing one of them is error prone and it might
> >>   break with other linker flags or libtool versions.
> >
> > the binary in .libs do not exist so the link is final in this case.
> 
> Really?  The author of the original recipe had an environment where the
> executable was in .libs/.  Are you really sure that such an environment
> does not exist anymore? Or will the recipe now silently fail by installing
> the shell wrapper sometimes?

For me it did silently fail. :)

The openjdk-6 build failed due to missing header files like
 exceptions.c:44:45: error: native/include/java_lang_String.h: No such file or directory

> > but in any case If you can come up with a patch to install it using
> > libtool that would be nice.
> 
> Sorry; providing a patch means testing it (regardless whether it is
> trivial).  Here, I am not sure whether 'libtool' or the platform
> prefixed '<arch>-libtool' is required and how to express
> '<arch>-libtool' in oe.
> 
> I gave my comment to a patch which fixed a broken recipe by replacing it
> with another broken recipe.  So I expect that the author of this patch
> fixes and tests his work.
> 
> For completeness; install command should be
> 
> | libtool --mode=install install -m 0755 src/cacaoh/cacaoh ${STAGING_BINDIR}/cacaoh-cldc-${PV}

Thanks. I implemented this and the build works fine again. Thanks for letting us
know. Will push it in when I have network connectivity again.

regards
Stefan Schmidt


