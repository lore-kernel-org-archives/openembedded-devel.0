Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6617842F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 18:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6E33520B80;
	Mon, 15 Jan 2018 18:13:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id T9lNUBHx1HVI; Mon, 15 Jan 2018 18:13:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 350F620B53;
	Mon, 15 Jan 2018 18:12:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C069716325F; Mon, 15 Jan 2018 13:12:57 -0500 (EST)
Date: Mon, 15 Jan 2018 13:12:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180115181257.GM9657@denix.org>
References: <1515635126-19293-1-git-send-email-denis@denix.org>
	<CA+chaQcvM9dwu665hiJdV3EYaOYpFa21xB5+G91T5msNvmYi9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQcvM9dwu665hiJdV3EYaOYpFa21xB5+G91T5msNvmYi9w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Jose Lamego <jose.a.lamego@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][rocko][PATCH] qtwebengine: explicitly depend on bison-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 18:13:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 15, 2018 at 07:00:09PM +0100, Martin Jansa wrote:
> Using the same e-mail thread for both patches for master and rocko, caused

Actually, both patches were sent completely separate and independent of each 
other. They were not in a single thread - i.e. none of them had In-Reply-To: 
and References: fields set for threading. So Patchwork must have done all the 
guessing entirely by the contents...


> the one for master being automatically marked as superseded by the rocko
> one, see:
> https://patchwork.openembedded.org/patch/147192/
> 
> This is a system generated Comment: Patch 147192 was automatically
> marked as superseded by patch 147193.
> 
> I don't know if there is something we can change in patchwork to be
> less stupid (other than replacing it with something more clever like
> gerrit). This time I've noticed that there was patch for master as
> well in the e-mail client, but looking just on patchwork I wouldn't
> have noticed at all, not sure how many other patches are lost like
> this.
> 
> 
> On Thu, Jan 11, 2018 at 2:45 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > QtWebEngine uses bison during the build. While normally bison-native gets
> > staged into sysroot indirectly by the toolchain via binutils-cross, it's
> > better to have the dependency listed explicitly for deterministic builds.
> > Otherwise, when using an external toolchain, it fails like this:
> >
> > | FAILED: gen/blink/core/XPathGrammar.cpp gen/blink/core/XPathGrammar.h
> > | .../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/bin/
> > python-native/python2
> > |    ../../../../git/src/3rdparty/chromium/third_party/WebKit/
> > Source/build/scripts/rule_bison.py
> > |    ../../../../git/src/3rdparty/chromium/third_party/WebKit/Source/core/xml/XPathGrammar.y
> > gen/blink/core bison
> > | Traceback (most recent call last):
> > |   File "../../../../git/src/3rdparty/chromium/third_party/WebKit/
> > Source/build/scripts/rule_bison.py", line 83, in <module>
> > |     returnCode = subprocess.call([bisonExe, '-d', '-p', prefix,
> > inputFile, '-o', outputCpp])
> > |   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> > line 168, in call
> > |     return Popen(*popenargs, **kwargs).wait()
> > |   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> > line 390, in __init__
> > |     errread, errwrite)
> > |   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> > line 1024, in _execute_child
> > |     raise child_exception
> > | OSError: [Errno 2] No such file or directory
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-qt/qt5/qtwebengine_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> > qtwebengine_git.bb
> > index 1f53e4a..ed179de 100644
> > --- a/recipes-qt/qt5/qtwebengine_git.bb
> > +++ b/recipes-qt/qt5/qtwebengine_git.bb
> > @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = " \
> >  DEPENDS += " \
> >      ninja-native \
> >      yasm-native \
> > +    bison-native \
> >      qtwebchannel \
> >      qtbase qtdeclarative qtxmlpatterns qtquickcontrols qtquickcontrols2 \
> >      qtlocation \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

