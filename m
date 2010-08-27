Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OoqBv-00025l-Jx
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 06:05:25 +0200
Received: by gya6 with SMTP id 6so1030020gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 21:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=vc7T6lLlvVHAgEXTsLzN+veCoGIRS7VZO8wuyI4x5hY=;
	b=wwL4pDTQwKQaQRhxKbcexW05eD18vumLc4/PlowY2ghqYKdbzg8ROxmgIKGqO69cKF
	7WQE6lPkAcgZtvjN+UFPpWlRRRyPEYZNZVTWI35pPmd3Y3wepzxu7VZ2AEesNk24uR+T
	epXAn9tdR5k8jzxIIVF1t9cV/D6DOBdN1CeM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=TwspYfv0NUhqLaF1TrlLQ4Uu5BucZspUzydC0ljYsksfQ2znK0ObS/lxaE8OG2HsRF
	e9AzIr4ddIJuklsoDV7/uvf+pYqD1QaLptoVrc89YMSXAaMoenrFfzAC/pVJpuExoOH4
	thoB58iFNrpN+jAW5WDEJrxQBI0Z9vxjadoho=
Received: by 10.100.49.28 with SMTP id w28mr210239anw.75.1282881894708;
	Thu, 26 Aug 2010 21:04:54 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id h5sm5359227anb.28.2010.08.26.21.04.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Aug 2010 21:04:53 -0700 (PDT)
Date: Thu, 26 Aug 2010 21:04:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100827040432.GA8857@gmail.com>
References: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
	<AANLkTinbVA1Cj2arRmrANWQH_VFMnhZ2x7i=LHdnNWp7@mail.gmail.com>
	<1282607876.3775.33.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1282607876.3775.33.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] [v2] added recipe for nodejs
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
X-List-Received-Date: Fri, 27 Aug 2010 04:05:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (24/08/10 01:57), Paul Menzel wrote:
> Dear AJ,
> 
> 
> sorry I overlooked that message. I will reply to your other message
> tomorrow.
> 
> 
> Am Montag, den 23.08.2010, 17:22 -0600 schrieb AJ ONeal:
> > bump
> > 
> > AJ ONeal
> > 
> > On Sat, Aug 21, 2010 at 9:28 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> > 
> > > ---
> 
> After this line a short summary of the changes compared to previous
> iterations would be great. Git will ignore this when applying the patch
> but it eases the work of the reviewers.
> 
> > >  recipes/nodejs/files/libev-cross-cc.patch          |   18 ++++++++++++
> > >  recipes/nodejs/files/node-cross-cc.patch           |   14 ++++++++++
> > >  .../node-dont-include-hosts-usr-include.patch      |   22 +++++++++++++++
> > >  recipes/nodejs/nodejs_0.2.0.bb                     |   28
> > > ++++++++++++++++++++
> > >  4 files changed, 82 insertions(+), 0 deletions(-)
> > >  create mode 100644 recipes/nodejs/files/libev-cross-cc.patch
> > >  create mode 100644 recipes/nodejs/files/node-cross-cc.patch
> > >  create mode 100644
> > > recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> > >  create mode 100644 recipes/nodejs/nodejs_0.2.0.bb
> > >
> > > diff --git a/recipes/nodejs/files/libev-cross-cc.patch
> > > b/recipes/nodejs/files/libev-cross-cc.patch
> > > new file mode 100644
> > > index 0000000..446015b
> > > --- /dev/null
> > > +++ b/recipes/nodejs/files/libev-cross-cc.patch
> > > @@ -0,0 +1,18 @@
> > > +diff --git node-v0.2.0/deps/libev/wscript.orig
> > > node-v0.2.0/deps/libev/wscript
> > > +index 19e7bb2..f0a3d3b 100644
> > > +--- node-v0.2.0/deps/libev/wscript.orig
> > > ++++ node-v0.2.0/deps/libev/wscript
> > > +@@ -52,7 +52,12 @@ def configure(conf):
> > > +           return 0;
> > > +       }
> > > +   """
> > > +-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> > > execute=True,
> > > ++  # TODO determine this dynamically
> > > ++  CROSS = True
> > > ++  execute = True
> > > ++  if CROSS:
> > > ++    execute = False
> > > ++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> > > execute=execute,
> > > +                 msg="Checking for SYS_clock_gettime")
> > > +
> > > +   have_librt = conf.check(lib='rt', uselib_store='RT')
> > > diff --git a/recipes/nodejs/files/node-cross-cc.patch
> > > b/recipes/nodejs/files/node-cross-cc.patch
> > > new file mode 100644
> > > index 0000000..48a6226
> > > --- /dev/null
> > > +++ b/recipes/nodejs/files/node-cross-cc.patch
> > > @@ -0,0 +1,14 @@
> > > +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> > > +index df9ef53..a55d464 100644
> > > +--- node-v0.2.0/wscript.orig
> > > ++++ node-v0.2.0/wscript
> > > +@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
> > > +   arch = ""
> > > +   if bld.env['DEST_CPU'] == 'x86_64':
> > > +     arch = "arch=x64"
> > > ++  # XXX Better support cross-compilation
> > > ++  else:
> > > ++    arch = "arch=" + bld.env['DEST_CPU']
> > > +
> > > +   if variant == "default":
> > > +     mode = "release"
> > > diff --git a/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> > > b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> > > new file mode 100644
> > > index 0000000..edbf7c4
> > > --- /dev/null
> > > +++ b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> > > @@ -0,0 +1,22 @@
> > > +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> > > +index 3c5ebc5..905bd58 100644
> > > +--- node-v0.2.0/wscript.orig
> > > ++++ node-v0.2.0/wscript
> > > +@@ -162,11 +162,12 @@ def configure(conf):
> > > +   if Options.options.efence:
> > > +     conf.check(lib='efence', libpath=['/usr/lib', '/usr/local/lib'],
> > > uselib_store='EFENCE')
> > > +
> > > +-  if not conf.check(lib="execinfo", includes=['/usr/include',
> > > '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'],
> > > uselib_store="EXECINFO"):
> > > +-    # Note on Darwin/OS X: This will fail, but will still be used as the
> > > +-    # execinfo stuff are part of the standard library.
> > > +-    if sys.platform.startswith("freebsd"):
> > > +-      conf.fatal("Install the libexecinfo port from
> > > /usr/ports/devel/libexecinfo.")
> > > ++  # OpenEmbedded doesn't like us checking here
> > > ++  #if not conf.check(lib="execinfo", includes=['/usr/include',
> > > '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'],
> > > uselib_store="EXECINFO"):
> > > ++  #  # Note on Darwin/OS X: This will fail, but will still be used as the
> > > ++  #  # execinfo stuff are part of the standard library.
> > > ++  #  if sys.platform.startswith("freebsd"):
> > > ++  #    conf.fatal("Install the libexecinfo port from
> > > /usr/ports/devel/libexecinfo.")
> > > +
> > > +   if not Options.options.without_ssl:
> > > +     if conf.check_cfg(package='openssl',
> 
> Did you sent these patches upstream? Maybe document that in the patch
> headers. There is also a page in the Wiki regarding this.
> 
> > > diff --git a/recipes/nodejs/nodejs_0.2.0.bb b/recipes/nodejs/
> > > nodejs_0.2.0.bb
> > > new file mode 100644
> > > index 0000000..83bfa2e
> > > --- /dev/null
> > > +++ b/recipes/nodejs/nodejs_0.2.0.bb
> > > @@ -0,0 +1,28 @@
> > > +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> > > +HOMEPAGE = "http://nodejs.org"
> > > +LICENSE = "MIT"
> > > +DEPENDS = "openssl"
> > > +SRC_URI = " \
> > > +  http://nodejs.org/dist/node-v${PV}.tar.gz \
> > > +  file://node-cross-cc.patch \
> > > +  file://libev-cross-cc.patch \
> > > +  file://node-dont-include-hosts-usr-include.patch \
> > > +"
> > > +#file://libev-arm-cross.patch \
> 
> Is that commented line needed?
> 
> > > +SRC_URI[md5sum] = "99a6dacc44b3f9c6ec376ccb446dd0b8"
> > > +SRC_URI[sha256sum] =
> > > "3d3eff9287c9917af4044f3cef99ae5b17946710a71e83039de4fcb4b0a26631"
> > > +S = "${WORKDIR}/node-v${PV}"
> > > +do_configure () {
> > > +  ./configure --prefix=${D} --without-snapshot
> > > +}
> 
> Can you use `EXTRA_OECONF` (Do `git grep EXTRA_OECONF` in the repository
> to get examples.)

its ok. Since its override the do_configure

> 
> I think you might need `inherit autotools`, but I am not sure.


no this package does not use autotools it not needed.

> 
> > > +do_compile () {
> > > +  make
> > > +}
> 
> Is that needed? What about Frans’ suggestion?

should use oe_runmake instea of bare make to exploit parallelism.

> 
> > > +do_install () {
> > > +  #oe_runmake install # doesn't install to correct location
> > > +
> > > +  # This works
> > > +  install -d ${D}${bindir}/
> > > +  install -m 0755 ${S}/node ${D}${bindir}/
> > > +}
> > > +FILES_${PN} = "${bindir}/node"
> 
> Why is that needed?
> 
> I am a beginner, so I hope my comments are correct. If so please submit
> a v3 and do not forget your Signed-off-by line.

right.
> 
> 
> Thanks,
> 
> Paul



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



