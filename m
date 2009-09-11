Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1Mm3jM-0000AH-U1
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 12:51:56 +0200
Received: by bwz6 with SMTP id 6so656854bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=o3CNB49S5PQuVJzoi4FjYfdOSboicdT70Nlo4MZCCas=;
	b=rM+ly1kaFt+4+MgesWJm5CgqAwCdbhtGQM3gvn0f1sUy6Ays5oHrtLBYN2Q5qfsg1Z
	T6tzh4b4SGns9f/qepKyad4uMD+vlqTYHyk+l+QT9HDDyraIwdSWhUvqnhTRp+N0hpY+
	vNV/HmrFVUE28m61nhrXSq8yuVjWp+ML81jFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B+RJgcZWMEuzcVIRnfLTn3GVF2XUYhJciUsCYQzn9gU39QWEFgffwVOcRLblXT2GpN
	iQppecK8b0ATVuzPJvU4VTQNIcZt10DhlBwcqq9Jh8mv0nn+EozpnHy4wRbNRQK0h0CA
	eRPdYPWor/iI199/UFtSR9VecRAZH2DXY3frk=
MIME-Version: 1.0
Received: by 10.204.23.193 with SMTP id s1mr1930993bkb.25.1252666283554; Fri, 
	11 Sep 2009 03:51:23 -0700 (PDT)
In-Reply-To: <20090911081303.GA18964@localhost.minsk.epam.com>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<4A93BC84.7070106@gmail.com>
	<91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
	<200908251609.25008.holger+oe@freyther.de>
	<91283b620909102232me9db8dck490abb53a8ba8fff@mail.gmail.com>
	<20090911081303.GA18964@localhost.minsk.epam.com>
Date: Fri, 11 Sep 2009 11:51:23 +0100
Message-ID: <91283b620909110351r2d9758b4n20f0f02dfed4b058@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Sep 2009 10:51:56 -0000
X-Groupsio-MsgNum: 13060
Content-Type: multipart/mixed; boundary=00032555a9cada793a04734b18d2

--00032555a9cada793a04734b18d2
Content-Type: text/plain; charset=ISO-8859-1

Ok,

I have attached several files showing the bb files and some of the pro
files. To give an idea of my problem, when I run the image I have no
libraries installed that are pulled in by our Qt code.

Some of them are:

libphonon-gstreamer  and
libqsqlite

Now when the image builds I can see these files being created under my tmp,
the problem would as I understand it is that they are never installed with
the image.

When I run my code I get:

DatabasePrivate::init
QSqlDatabase: QSQLITE driver not loaded
QSqlDatabase: available drivers:
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded
WARNING: Phonon::createPath: Cannot connect  Phonon::MediaObject ( no
objectName ) to  Phonon::AudioOutput ( no objectName ).
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded


When I search the SD card I cannot find libphonon-gstreamer or libqsqlite.

Any help you can provide would be great.

Regards,
Stuart


2009/9/11 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

> On Fri, Sep 11, 2009 at 06:32:48AM +0100, Stuart Gray wrote:
> > Right. I took your advice and recoded my bb file. As suggested it uses
> the
> > standard do_compile and it is only the do_unpack that I have overridden.
> I
> > have attached my latest .inc file.
> >
> > I have posted my latest problem that is very close to working, but I have
> > found libraries that are not installed. The debug output basically states
> > that it cannot find directory /usr/lib/qtopia. The output is shown below.
> >
> > NOTE: Running task 2663 of 3643 (ID: 117, /home/stuart/overo-oe/org.
> > openembedded.dev/recipes/x-load/x-load_git.bb, do_compile)
> > NOTE: Running task 2664 of 3643 (ID: 718,
> > /home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
> > do_populate_staging)
> > NOTE: Running task 2665 of 3643 (ID: 720,
> > /home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
> > do_package)
> > NOTE: The path does not
> >
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/accessible/
> > NOTE: The path does not
> >
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/codecs/
> > NOTE: The path does not
> >
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/graphicssystems/
> > NOTE: The path does not
> >
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/inputmethods/
> > NOTE: The path does not
> >
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/styles/
> > NOTE: Running task 2666 of 3643 (ID: 118,
> > /home/stuart/overo-oe/org.openembedded.dev/recipes/x-load/x-load_git.bb,
> > do_install)
> > NOTE: Running task 2673 of 3643 (ID: 9,
> > /home/stuart/overo-oe/user.collection/recipes/images/
> omap3-console-image.bb,
> > do_populate_staging)
> >
> > Can  you please tell me how I instruct bitbake to install these
> directories.
> >
> > Regards,
> > Stuart
> >
> >
> >
> > 2009/8/25 Holger Hans Peter Freyther
> > <holger+oe@freyther.de <holger%2Boe@freyther.de><holger%2Boe@freyther.de<holger%252Boe@freyther.de>
> >
> > >
> >
> > > On Tuesday 25 August 2009 13:54:26 Stuart Gray wrote:
> > > > Hi we have just solved the problem
> > > .
> > > No, you have not "solved" the problem. Your next problems will be uic,
> moc,
> > > etc. not working...
> > >
> > >
> > > >do_compile() {
> > > >   oenote Running our qmake work dir is $WORKING_DIR
> > > >    cd ${WORKING_DIR}
> > > >   qmake2 ${WORKING_DIR}/dockamp.pro
> > > >    oenote Running our libinstall SGNOTE
> > > >   oe_libinstall -s libQtGuiE
> ${OVEROTOP}/tmp/work/armv7a-angstrom-linux-
> > >
> gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/lib
> > > >    oenote Running our make current dir is $PWD
> > > >    cd ${WORKING_DIR}
> > > >   make
> > > >   oenote Finished our qmake
> > >
> > >
> > > Comments:
> > >        - Using oe_libinstall in do_compile is never ever the right
> thing..
> > > there is
> > >          no need for that. Forget about the existance of
> oe_libinstall...
> > > you
> > >          are just increasing the hole you are sitting in.
> > >        - You should add a separate recipe for the statemachine
> framework,
> > > stage it..
> > >          and build a package. I might just do that now...
> > >
> > > Some remarks on tasks:
> > >        - In do_configure you configure
> > >        - In do_compile one is compiling
> > >        - In do_install one is installing to ${D}
> > >        - In do_stage one is staging
> > >
> > > The good:
> > >        - You are already doing "Inherit qmake2" and "inherit qt4e"...
> this
> > > should
> > >          setup things correctly.
> > >
> > > The bad:
> > >        - You are invoking qmake yourself.. You should at least invoke:
> > >            qmake_base_do_configure... this will have QMAKESPEC set
> > >
> > > The ugly:
> > >        - I don't understand why stock do_configure is not good
> enough...
> > > you have
> > >          copied everything to ${S} anyway. So the stock do_configure
> should
> > >          find your pro file? Is that not the case? Which initial
> problem
> > > did
> > >          you try to solve?
> > >
> > >
> > > do you hang out on irc? it might be more easy to go through all these
> in
> > > real
> > > time.
> > >
> > > z.
> > >
>
> There is nothing wrong in log snipper you've shown us. Describe your
> problem correctly and show us the code (.bb I mean).
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

--00032555a9cada793a04734b18d2
Content-Type: application/octet-stream; name="source.pro"
Content-Disposition: attachment; filename="source.pro"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzgrk6e80

ClRFTVBMQVRFID0gYXBwClRBUkdFVCA9IHNvdXJjZQpVVElMUyA9IGNvbW1vbiBkZXZpY2VzIGF1
ZGlvIGRhdGFiYXNlCgojIGRhbW4gUUltYWdlLi4uCiNRVCAtPSBndWkKUVQgKz0gcGhvbm9uCgpp
bmNsdWRlKCAkJChXT1JLSU5HX0RJUikvc2V0dGluZ3MucHJpICkKaW5jbHVkZSggJCQoV09SS0lO
R19ESVIpL3V0aWwvdXRpbC5wcmkgKQppbmNsdWRlKCAkJChXT1JLSU5HX0RJUikvc2V0dGluZ3Mu
cHJpICkKCkRFUEVORFBBVEggKz0gXAogICAgLiBcCiAgICAkJChXT1JLSU5HX0RJUikKCklOQ0xV
REVQQVRIICs9IFwKICAgIC4gXAogICAgJCQoV09SS0lOR19ESVIpCgojIElucHV0CkhFQURFUlMg
Kz0gXAogICAgU291cmNlLmhwcCBcCiAgICBGYWNhZGUuaHBwCgpTT1VSQ0VTICs9IFwKICAgIFNv
dXJjZS5jcHAgXAogICAgRmFjYWRlLmNwcCBcCiAgICBtYWluLmNwcAo=

--00032555a9cada793a04734b18d2
Content-Type: application/octet-stream; name="util.pri"
Content-Disposition: attachment; filename="util.pri"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzgrkomn1

Cm1lc3NhZ2UoICJ1dGlsLnByaSIgKQoKaXNFbXB0eSggVVRJTFMgKSB7CiAgICAgbWVzc2FnZSgg
InlvdSd2ZSBmb3Jnb3R0ZW4gdG8gYWRkIGl0ZW1zIHRvIFVUSUxTIiApCn0KCmluY2x1ZGUoICQk
KFdPUktJTkdfRElSKS9pbnRlcmZhY2VzL2ludGVyZmFjZXMucHJpICkKClZQQVRIICs9ICQkKFdP
UktJTkdfRElSKS91dGlsCkRFUEVORFBBVEggKz0gJCQoV09SS0lOR19ESVIpL3V0aWwKSU5DTFVE
RVBBVEggKz0gJCQoV09SS0lOR19ESVIpL3V0aWwKCmNvbnRhaW5zICggVVRJTFMsIGNsaWVudCAp
IHsKClNPVVJDRVMgKz0gXAogICAgR3JhcGhpY3NJdGVtVXRpbHMuY3BwCgpIRUFERVJTICs9IFwK
ICAgIEdyYXBoaWNzSXRlbVV0aWxzLmhwcAoKfQoKY29udGFpbnMoIFVUSUxTLCBjb21tb24gKSB7
CgpRVCArPSBuZXR3b3JrIHhtbAoKaW5jbHVkZSggJCQoSlNPTkhPTUUpL0pTT04ucHJpICkKClNP
VVJDRVMgKz0gXAogICAgT3B0aW9uUGFyc2VyLmNwcCBcCiAgICBPcHRpb25JdGVtRGVzY3JpcHRp
b24uY3BwIFwKICAgIENvbW1hbmRMaW5lUGFyc2VyLmNwcCBcCiAgICBTZXR0aW5ncy5jcHAgXAog
ICAgSlNPTlJQQ1NlcnZlci5jcHAgXAogICAgSlNPTlJQQ0FkYXB0ZXIuY3BwIFwKICAgIEpTT05S
UENDbGllbnQuY3BwIFwKICAgIFJlc291cmNlVXRpbC5jcHAgXAogICAgQVdTUXVlcnkuY3BwIFwK
ICAgIEJyb2FkY2FzdC5jcHAgXAogICAgQXBwbGljYXRpb24uY3BwIFwKICAgIFNIQTI1Ni5jcHAg
XAogICAgQnJvYWRjYXN0TGlzdGVuZXIuY3BwIFwKICAgIE5vZGUuY3BwIFwKICAgIE5vZGVGYWN0
b3J5LmNwcAoKSEVBREVSUyArPSBcCiAgICBUeXBlcy5ocHAgXAogICAgT3B0aW9uUGFyc2VyLmhw
cCBcCiAgICBPcHRpb25JdGVtRGVzY3JpcHRpb24uaHBwIFwKICAgIENvbW1hbmRMaW5lUGFyc2Vy
LmhwcCBcCiAgICBNYXliZS5ocHAgXAogICAgU2V0dGluZ3MuaHBwIFwKICAgIEpTT05SUEMuaHBw
IFwKICAgIEpTT05SUENTZXJ2ZXIuaHBwIFwKICAgIEpTT05SUENBZGFwdGVyLmhwcCBcCiAgICBK
U09OUlBDQ2xpZW50LmhwcCBcCiAgICBSZXNvdXJjZVV0aWwuaHBwIFwKICAgIEFXU1F1ZXJ5Lmhw
cCBcCiAgICBCcm9hZGNhc3QuaHBwIFwKICAgIEFwcGxpY2F0aW9uLmhwcCBcCiAgICBTSEEyNTYu
aHBwIFwKICAgIEJyb2FkY2FzdExpc3RlbmVyLmhwcCBcCiAgICBOb2RlLmhwcCBcCiAgICBOb2Rl
RmFjdG9yeS5ocHAKCn0KCmNvbnRhaW5zKCBVVElMUywgZGV2aWNlcyApIHsKClFUICs9IGRidXMK
CiMgaW5jbHVkZSBjZHBhcmFub2lhCkxJQlMgKz0gLUwvdXNyL2xpYi8gLWxjZGRhX2ludGVyZmFj
ZQpJTkNMVURFUEFUSCArPSAvaG9tZS9zdHVhcnQvb3Zlcm8tb2UvdG1wL3dvcmsvYXJtdjdhLWFu
Z3N0cm9tLWxpbnV4LWdudWVhYmkvY2RwYXJhbm9pYS0xMC4yLXIwL2ltYWdlL3Vzci9pbmNsdWRl
LwojIElOQ0xVREVQQVRIICs9IC91c3IvaW5jbHVkZS8KCiMgaW5jbHVkZSBtdXNpY2JyYWluegpM
SUJTICs9IC1ML3Vzci9saWIvIC1sbXVzaWNicmFpbnozCklOQ0xVREVQQVRIICs9IC9ob21lL3N0
dWFydC9vdmVyby1vZS90bXAvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9saWJt
dXNpY2JyYWluei0zLjAuMS1yMC9pbWFnZS91c3IvaW5jbHVkZS8KIyBJTkNMVURFUEFUSCArPSAv
dXNyL2luY2x1ZGUvCgpTT1VSQ0VTICs9IFwKICAgIERldmljZU1hbmFnZXIuY3BwIFwKICAgIERC
dXNPcHRpY2FsRHJpdmUuY3BwIFwKICAgIENESW5mby5jcHAgXAogICAgQ0RQYXJhbm9pYVJpcHBl
ci5jcHAgXAogICAgQ0RMb29rdXAuY3BwCgpIRUFERVJTICs9IFwKICAgIERldmljZU1hbmFnZXIu
aHBwIFwKICAgIERCdXNPcHRpY2FsRHJpdmUuaHBwIFwKICAgIENESW5mby5ocHAgXAogICAgQ0RQ
YXJhbm9pYVJpcHBlci5ocHAgXAogICAgQ0RMb29rdXAuaHBwCgp9Cgpjb250YWlucyggVVRJTFMs
IGF1ZGlvICkgewoKUVQgKz0gcGhvbm9uCgpTT1VSQ0VTICs9IFwKICAgIFBob25vbkF1ZGlvUGxh
eWVyLmNwcAoKSEVBREVSUyArPSBcCiAgICBQaG9ub25BdWRpb1BsYXllci5ocHAKCn0KCmNvbnRh
aW5zKCBVVElMUywgZGF0YWJhc2UgKSB7CgpRVCArPSBzcWwKClNPVVJDRVMgKz0gXAogICAgZGF0
YWJhc2UvRGF0YWJhc2UuY3BwIFwKICAgIGRhdGFiYXNlL1BsYXlsaXN0LmNwcCBcCiAgICBkYXRh
YmFzZS9UcmFjay5jcHAgXAogICAgZGF0YWJhc2UvVXNlci5jcHAgXAogICAgZGF0YWJhc2UvQXJ0
aXN0LmNwcCBcCiAgICBkYXRhYmFzZS9BbGJ1bS5jcHAKCkhFQURFUlMgKz0gXAogICAgZGF0YWJh
c2UvRGF0YWJhc2UuaHBwIFwKICAgIGRhdGFiYXNlL1BsYXlsaXN0LmhwcCBcCiAgICBkYXRhYmFz
ZS9UcmFjay5ocHAgXAogICAgZGF0YWJhc2UvVXNlci5ocHAgXAogICAgZGF0YWJhc2UvQXJ0aXN0
LmhwcCBcCiAgICBkYXRhYmFzZS9BbGJ1bS5ocHAKCn0K

--00032555a9cada793a04734b18d2
Content-Type: application/octet-stream; name="source.inc"
Content-Disposition: attachment; filename="source.inc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzgrlbtu2

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
ZUF1ZGlvL2JpbgogICAgICAgIGluc3RhbGwgLWQgJHtEfS9vcHQvU2ltcGxlQXVkaW8vbWVkaWEK
ICAgICAgICBpbnN0YWxsIC1kICR7RH0vb3B0L1NpbXBsZUF1ZGlvL2xvZ3MKICAgICAgICBpbnN0
YWxsIC1tIDA3NDQgJHtXT1JLRElSfS9zb3VyY2Uvc291cmNlL3NvdXJjZSAke0R9L29wdC9TaW1w
bGVBdWRpby9iaW4KfQoKUEFDS0FHRV9BUkNIID0gImFsbCIKCkZJTEVTXyR7UE59ID0gIi9vcHQv
U2ltcGxlQXVkaW8vYmluIgpGSUxFU18ke1BOfS1kYmcgPSAiL29wdC9TaW1wbGVBdWRpby9iaW4v
LmRlYnVnIgo=

--00032555a9cada793a04734b18d2
Content-Type: application/octet-stream; name="source_1.0.bb"
Content-Disposition: attachment; filename="source_1.0.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzgrlh293

cmVxdWlyZSBzb3VyY2UuaW5jCmluaGVyaXQgcXQ0ZQoK

--00032555a9cada793a04734b18d2
Content-Type: application/octet-stream; name="omap3-console-image.bb"
Content-Disposition: attachment; filename="omap3-console-image.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzgrly394

IyBjb25zb2xlIGltYWdlIGZvciBvbWFwMyB3aXRoIFNpbXBsZSBBdWRpbyBhZGRpdGlvbnMKCiMg
c2VlIGNsYXNzZXMgZGlyZWN0b3J5IHRvIHNlZSB3aGF0IHdlIGNhbiBpbmhlcml0CmluaGVyaXQg
aW1hZ2UgCgojIHRoaXMgY2FuIGJlIGNoYW5nZWQgdG8gYmUgdGFzay1iYXNlLXNhCkRFUEVORFMg
PSAidGFzay1iYXNlIgoKSU1BR0VfRVhUUkFfSU5TVEFMTCA/PSAiIgoKQVVESU9fSU5TVEFMTCA9
ICIgXAogIGFsc2EtdXRpbHMgXAogIGFsc2EtdXRpbHMtYXBsYXkgXAogIGFsc2EtdXRpbHMtYW1p
eGVyIFwKICBhbmdzdHJvbS16ZXJvY29uZi1hdWRpbyBcCiAiCQoKQkFTRV9JTlNUQUxMID0gIiBc
CiAgdGFzay1iYXNlLWV4dGVuZGVkIFwKICIKCkZJUk1XQVJFX0lOU1RBTEwgPSAiIFwKIyAgbGlu
dXgtZmlybXdhcmUgXAogIGxpYmVydGFzLXNkLWZpcm13YXJlIFwKICBydDczLWZpcm13YXJlIFwK
ICB6ZDEyMTEtZmlybXdhcmUgXAogIGRpYjA3MDAtZmlybXdhcmUgXAogIgoKR0xFU19JTlNUQUxM
ID0gIiIKR0xFU19JTlNUQUxMX2FwcGVuZF9iZWFnbGVib2FyZCAgPSAiIGxpYmdsZXMtb21hcDMi
CgpUT09MU19JTlNUQUxMID0gIiBcCiAgYmFzaCBcCiAgYnppcDIgXAogIGRldm1lbTIgXAogIGRo
Y3AtY2xpZW50IFwKICBkb3Nmc3Rvb2xzIFwKICBmYmdyYWIgXAogIGZic2V0IFwKICBmYnNldC1t
b2RlcyBcCiAga3N5bW9vcHMgXAogIG1rZnMtamZmczIgXAogIG10ZC11dGlscyBcCiAgbmFubyBc
CiAgbnRwIG50cGRhdGUgXAogIG9wZW5zc2gtbWlzYyBcCiAgb3BlbnNzaC1zY3AgXAogIG9wZW5z
c2gtc3NoIFwKICBwcm9jcHMgXAogIHNvY2F0IFwKICBzdHJhY2UgXAogIHN1ZG8gXAogIHRhc2st
cHJvcGVyLXRvb2xzIFwKICB1LWJvb3QtdG9vbHMtZW52IFwKICIKCiMgSGVyZSB3ZSBjYW4gYWRk
IGFueXRoaW5nIHRoYXQgaXMgcmVxdWlyZWQgZm9yIHRoZSBTaW1wbGUgQXVkaW8gTGludXggY2hh
bmdlcwoKIyBUbyBhZGQgdGhlIGxpYnN0ZGMrKyB0byB0aGUgZGlzdHJvIHdlIHNob3VsZCBhZGQg
YSByZWNpcGUgZm9yIG91ciBDKysgYXBwbGljYXRpb24KIyBhbmQgdGhlbiBhZGQgdGhpcyB0byB0
aGUgSU1BR0VfSU5TVEFMTCwgT0Ugd2lsbCB0aGVuIGF1dG9tYXRpY2FsbHkgaW5jbHVkZSB0aGUg
bGlic3RkYysrClNJTVBMRV9BVURJTyA9ICIgXAogIGF1ZGlvZmlsZSBcCiAgZXNvdW5kIFwKICBj
ZHBhcmFub2lhIFwKICBkYnVzIFwKICBkb2NrYW1wIFwKICBmbGFjIFwKICBmZm1wZWcgXAogIGdz
dHJlYW1lciBcCiAgZ3N0LWZmbXBlZyBcCiAgZ3N0LXBsdWdpbnMtYmFkIFwKICBnc3QtcGx1Z2lu
cy1nb29kIFwKICBnc3QtcGx1Z2lucy11Z2x5IFwKICBoYWwgXAogIGxpZ2h0dHBkIFwKICBsaWdo
dHRwZC1tb2R1bGUtYWNjZXNzIFwKICBsaWdodHRwZC1tb2R1bGUtYWNjZXNzbG9nIFwKICBsaWdo
dHRwZC1tb2R1bGUtaW5kZXhmaWxlIFwKICBsaWdodHRwZC1tb2R1bGUtZGlybGlzdGluZyBcCiAg
bGlnaHR0cGQtbW9kdWxlLXN0YXRpY2ZpbGUgXAogIGxpYm1hZCBcCiAgbWFkcGxheSBcCiAgbGli
bXVzaWNicmFpbnogXAogIHF0NC1lbWJlZGRlZCBcCiAgc3FsaXRlMyBcCiAgd3NjYW4gXAogIHNv
dXJjZSBcCiIKSU1BR0VfSU5TVEFMTCArPSAiIFwKICAke0JBU0VfSU5TVEFMTH0gXAogICR7QVVE
SU9fSU5TVEFMTH0gXAogICR7RklSTVdBUkVfSU5TVEFMTH0gXAogICR7R0xFU19JTlNUQUxMfSBc
CiAgJHtJTUFHRV9FWFRSQV9JTlNUQUxMfSBcCiAgJHtUT09MU19JTlNUQUxMfSBcCiAgJHtTSU1Q
TEVfQVVESU99IFwKICIKCklNQUdFX1BSRVBST0NFU1NfQ09NTUFORCA9ICJjcmVhdGVfZXRjX3Rp
bWVzdGFtcCIKCiNST09URlNfUE9TVFBST0NFU1NfQ09NTUFORCArPSAnJHtAYmFzZV9jb25kaXRp
b25hbCgiRElTVFJPX1RZUEUiLCAicmVsZWFzZSIsICJ6YXBfcm9vdF9wYXNzd29yZDsgIiwgIiIs
ZCl9JwoKCg==

--00032555a9cada793a04734b18d2--
