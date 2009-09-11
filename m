Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1Mlyl3-0000gL-O9
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 07:33:20 +0200
Received: by bwz6 with SMTP id 6so529978bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 22:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=LeGjuydKS9beJzqOB4RvvWuZt3+FKQEiuQdnmw5G3Wg=;
	b=orVgHVvcDZ/F8asQxcd00RcNy1GBtzkmTFi2osx1H5EYJVxLTbOiGkTl31w3w0IXWV
	t9rSTvzEnrDz1eGKjAu7oYCCg55IZba0XcJ7whRmnzhF3JNvFaUAWf4V9Iwg0IurEB5v
	ADxkWxsc3cCNRouk7yE9KgvAVFNy8q1AonsW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=H4NIq+5Kmob7QfAfRTb/SE6ZGlOmN1Bmetub3rmqcDQ/YYTwQHzbTCeHIuo8P/HA9A
	iXt5eDtuXGIghYDmvJmmsJkH2EXLzr5qF3EgUVkGpP+f0C/EL/VZAz67e2ioTjl5fHkf
	DchhenG78lD3J2NaBcxIfwYO+UkKxX/ajVnVY=
MIME-Version: 1.0
Received: by 10.204.152.23 with SMTP id e23mr1674537bkw.127.1252647168826; 
	Thu, 10 Sep 2009 22:32:48 -0700 (PDT)
In-Reply-To: <200908251609.25008.holger+oe@freyther.de>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<4A93BC84.7070106@gmail.com>
	<91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
	<200908251609.25008.holger+oe@freyther.de>
Date: Fri, 11 Sep 2009 06:32:48 +0100
Message-ID: <91283b620909102232me9db8dck490abb53a8ba8fff@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.210
X-SA-Exim-Mail-From: stuart68@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Qt problems
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
X-List-Received-Date: Fri, 11 Sep 2009 05:33:21 -0000
X-Groupsio-MsgNum: 13057
Content-Type: multipart/mixed; boundary=0015175cd07886de83047346a523

--0015175cd07886de83047346a523
Content-Type: text/plain; charset=ISO-8859-1

Right. I took your advice and recoded my bb file. As suggested it uses the
standard do_compile and it is only the do_unpack that I have overridden. I
have attached my latest .inc file.

I have posted my latest problem that is very close to working, but I have
found libraries that are not installed. The debug output basically states
that it cannot find directory /usr/lib/qtopia. The output is shown below.

NOTE: Running task 2663 of 3643 (ID: 117, /home/stuart/overo-oe/org.
openembedded.dev/recipes/x-load/x-load_git.bb, do_compile)
NOTE: Running task 2664 of 3643 (ID: 718,
/home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
do_populate_staging)
NOTE: Running task 2665 of 3643 (ID: 720,
/home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
do_package)
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/accessible/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/codecs/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/graphicssystems/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/inputmethods/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/styles/
NOTE: Running task 2666 of 3643 (ID: 118,
/home/stuart/overo-oe/org.openembedded.dev/recipes/x-load/x-load_git.bb,
do_install)
NOTE: Running task 2673 of 3643 (ID: 9,
/home/stuart/overo-oe/user.collection/recipes/images/omap3-console-image.bb,
do_populate_staging)

Can  you please tell me how I instruct bitbake to install these directories.

Regards,
Stuart



2009/8/25 Holger Hans Peter Freyther
<holger+oe@freyther.de<holger%2Boe@freyther.de>
>

> On Tuesday 25 August 2009 13:54:26 Stuart Gray wrote:
> > Hi we have just solved the problem
> .
> No, you have not "solved" the problem. Your next problems will be uic, moc,
> etc. not working...
>
>
> >do_compile() {
> >   oenote Running our qmake work dir is $WORKING_DIR
> >    cd ${WORKING_DIR}
> >   qmake2 ${WORKING_DIR}/dockamp.pro
> >    oenote Running our libinstall SGNOTE
> >   oe_libinstall -s libQtGuiE ${OVEROTOP}/tmp/work/armv7a-angstrom-linux-
> gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/lib
> >    oenote Running our make current dir is $PWD
> >    cd ${WORKING_DIR}
> >   make
> >   oenote Finished our qmake
>
>
> Comments:
>        - Using oe_libinstall in do_compile is never ever the right thing..
> there is
>          no need for that. Forget about the existance of oe_libinstall...
> you
>          are just increasing the hole you are sitting in.
>        - You should add a separate recipe for the statemachine framework,
> stage it..
>          and build a package. I might just do that now...
>
> Some remarks on tasks:
>        - In do_configure you configure
>        - In do_compile one is compiling
>        - In do_install one is installing to ${D}
>        - In do_stage one is staging
>
> The good:
>        - You are already doing "Inherit qmake2" and "inherit qt4e"... this
> should
>          setup things correctly.
>
> The bad:
>        - You are invoking qmake yourself.. You should at least invoke:
>            qmake_base_do_configure... this will have QMAKESPEC set
>
> The ugly:
>        - I don't understand why stock do_configure is not good enough...
> you have
>          copied everything to ${S} anyway. So the stock do_configure should
>          find your pro file? Is that not the case? Which initial problem
> did
>          you try to solve?
>
>
> do you hang out on irc? it might be more easy to go through all these in
> real
> time.
>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

--0015175cd07886de83047346a523
Content-Type: application/octet-stream; name="source.inc"
Content-Disposition: attachment; filename="source.inc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzgho4ph0

REVTQ1JJUFRJT04gPSAic291cmNlIGFwcGxpY2F0aW9uIGZvciBTaW1wbGUgQXVkaW8iCkxJQ0VO
U0UgPSAiSVAiCkRFUEVORFMgPSAicXQ0LWVtYmVkZGVkIGNkcGFyYW5vaWEgbGlibXVzaWNicmFp
bnoiCgppbmhlcml0IHFtYWtlMgoKUyA9ICIke1dPUktESVJ9LyR7UE59IgoKZG9fdW5wYWNrICgp
IHsKICAgICNjb3B5IGV2ZXJ5dGhpbmcgaW50byB0aGUgc291cmNlLTEuMC9zb3VyY2UgZGlyZWN0
b3J5CiAgICBjcCAtciB+L292ZXJvLW9lL3NvdXJjZSAke1N9ICAgCn0KZG9fY29tcGlsZV9wcmVw
ZW5kKCkgewogICAgZXhwb3J0IFdPUktJTkdfRElSPSR7U30KICAgIGV4cG9ydCBKU09OSE9NRT0k
V09SS0lOR19ESVIvSlNPTgogICAgZXhwb3J0IFFUU1RBVEVfRElSPSRXT1JLSU5HX0RJUi9idWls
ZF9kZXBlbmRlbmNpZXMvcXRzdGF0ZW1hY2hpbmUtMS4xLW9wZW5zb3VyY2UKICAgIG9lbm90ZSBS
dW5uaW5nIG91ciBjb21waWxlIHByZXBlbmQgd29ya2luZ19kaXIgaXMgJHtXT1JLSU5HX0RJUn0g
U0dOT1RFCn0KZG9faW5zdGFsbCgpIHsKICAgICAgICBpbnN0YWxsIC1kICR7RH0vb3B0L1NpbXBs
ZUF1ZGlvL2JpbgogICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L3NvdXJjZS9zb3Vy
Y2Uvc291cmNlICR7RH0vb3B0L1NpbXBsZUF1ZGlvL2Jpbgp9CgpQQUNLQUdFX0FSQ0ggPSAiYWxs
IgoKRklMRVNfJHtQTn0gPSAiL29wdC9TaW1wbGVBdWRpby9iaW4iCg==

--0015175cd07886de83047346a523--
