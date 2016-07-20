Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2A72D606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:34:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1469025273; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=rWGLnTx1AIXEHD0/swHD8VQkVyMWoSFXbDAx7mrKWFY=;
	b=TCENrF1TwB3z+nafNGE+tPGBoJVFzOi+cAlS74jhZomTLX6IYVZ8+kGqtG2+DxlZdr2rDF/X
	9s26k1E+w7IQu4+O46o0xkwS1AzghK3vZGeSmMqbBDd1wEcFS/Lts/63n3tZcrQ04BW762pA
	NFS4yWwbwbVMQXHgoV0AuCPUOas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=Qwnp5yqCIhe0G/rH9S7QZpftzUhL3RzNGb/F8NIOP7uHtYccxB8meOkF+ldnXdoMKTreI1
	PadptHqiYDWQH+ADdY1wv8u/CK2EQN0pU0k03VoIlp6P9cbCQbjFhC6D3TBNC9e6WdmFLr59
	ghXlql2YyB1kRpQNsWncexFRB4wAQ=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mxa.mailgun.org with ESMTP id 578f8bf8.7f6e8b7bfe70-in2;
	Wed, 20 Jul 2016 14:34:32 -0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id f6so116627755ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:34:32 -0700 (PDT)
X-Gm-Message-State: ALyK8tJEuW76L/myeVtLYCQuZyAVCO/CyAHCShQdLJrcnnmm/YEmP/u2vb8rHvrVgT6thVv8AW1zEr+r/TFBPw==
X-Received: by 10.36.87.140 with SMTP id u134mr8926596ita.38.1469025272220;
	Wed, 20 Jul 2016 07:34:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Wed, 20 Jul 2016 07:34:30 -0700 (PDT)
In-Reply-To: <20160720140438.aladpjkzdb2j7jhd@jama>
References: <1468759895-10992-1-git-send-email-derek@asterius.io>
	<20160720140438.aladpjkzdb2j7jhd@jama>
From: Derek Straka <derek@asterius.io>
Date: Wed, 20 Jul 2016 10:34:30 -0400
X-Gmail-Original-Message-ID: <CADNbA1pfR8Pbwq+cFBusPuPoa=JvO-dZfeq3aTr8=LCGzGkTsw@mail.gmail.com>
Message-ID: <CADNbA1pfR8Pbwq+cFBusPuPoa=JvO-dZfeq3aTr8=LCGzGkTsw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-flask-bcrypt: update package RDEPENDS
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
X-List-Received-Date: Wed, 20 Jul 2016 14:34:34 -0000
Content-Type: text/plain; charset=UTF-8

It looks like we need to drop 8fe0ebe6e25b4ca07d179a579aa4272266f69259 while
I work on a better fix.  I didn't notice the BBCLASSEXTEND which will cause
PYTHON_PN to evaluate differently when the native version is built.

I have a v2 for 0720807a482cbad744faee60904da0739ca6d2c1 that moves the
zlib RDEPENDS into the python2.7 version only.

On Wed, Jul 20, 2016 at 10:04 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Jul 17, 2016 at 08:51:35AM -0400, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
>
> I'm not sure which recent changes are causing this, but bitbake world
> now shows couple ERROR messages:
>
> ERROR: Nothing RPROVIDES 'python-io-native' (but
> virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-cffi_1.7.0.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python-io-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-io-native']
> NOTE: Runtime target 'python-cryptography-vectors' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['python-cryptography-vectors', 'python-cryptography',
> 'python-cffi-native', 'python-io-native']
> NOTE: Runtime target 'python-cryptography-vectors-dev' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['python-cryptography-vectors-dev', 'python-cryptography',
> 'python-cffi-native', 'python-io-native']
> ERROR: Nothing RPROVIDES 'python-bcrypt' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-bcrypt_3.1.0.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-flask-bcrypt_0.7.1.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python-bcrypt'
> NOTE: Runtime target 'python-bcrypt' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-bcrypt']
> NOTE: Runtime target 'python-flask-bcrypt-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-flask-bcrypt-dev',
> 'python-bcrypt']
> ERROR: Nothing RPROVIDES 'python-bcrypt-dev' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-bcrypt_3.1.0.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python-bcrypt-dev'
> NOTE: Runtime target 'python-bcrypt-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-bcrypt-dev']
> ERROR: Nothing RPROVIDES 'python-cryptography' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-cryptography_1.4.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-pyopenssl_16.0.0.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python-cryptography'
> NOTE: Runtime target 'python-cryptography' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-cryptography']
> ERROR: Nothing RPROVIDES 'python-pyopenssl' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-pyopenssl_16.0.0.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-connectivity/gateone/
> gateone_git.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python-pyopenssl'
> NOTE: Runtime target 'python-pyopenssl' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-pyopenssl']
> NOTE: Runtime target 'gateone' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['gateone',
> 'python-pyopenssl']
> NOTE: Runtime target 'gateone-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['gateone-dev',
> 'python-pyopenssl']
> ERROR: Nothing RPROVIDES 'python3-zlib' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python3-werkzeug_0.11.10.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-zlib' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-zlib']
> NOTE: Runtime target 'python3-werkzeug' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-werkzeug',
> 'python3-zlib']
> NOTE: Runtime target 'python3-flask-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-dev',
> 'python3-werkzeug', 'python3-zlib']
> NOTE: Runtime target 'python3-flask' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask',
> 'python3-werkzeug', 'python3-zlib']
> NOTE: Runtime target 'python3-flask-pymongo-dev' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['python3-flask-pymongo-dev',
> 'python3-flask', 'python3-werkzeug', 'python3-zlib']
> NOTE: Runtime target 'python3-flask-login' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-login',
> 'python3-flask', 'python3-werkzeug', 'python3-zlib']
> NOTE: Runtime target 'python3-flask-login-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-login-dev',
> 'python3-flask', 'python3-werkzeug', 'python3-zlib']
> NOTE: Runtime target 'python3-werkzeug-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-werkzeug-dev',
> 'python3-zlib']
> ERROR: Nothing RPROVIDES 'python-pyopenssl-dev' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-pyopenssl_16.0.0.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python-pyopenssl-dev'
> NOTE: Runtime target 'python-pyopenssl-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-pyopenssl-dev']
> ERROR: Nothing RPROVIDES 'python-cryptography-dev' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-cryptography_1.4.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python-cryptography-dev'
> NOTE: Runtime target 'python-cryptography-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-cryptography-dev']
> ERROR: Nothing RPROVIDES 'python3-flask-pymongo' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python3-flask-pymongo_0.4.1.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python3-flask-pymongo'
> NOTE: Runtime target 'python3-flask-pymongo' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-pymongo']
> ERROR: Nothing RPROVIDES 'python-flask-bcrypt' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-flask-bcrypt_0.7.1.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'python-flask-bcrypt'
> NOTE: Runtime target 'python-flask-bcrypt' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-flask-bcrypt']
>
> Can you please check why?
>
> > ---
> >  meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb | 4
> ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python-flask-bcrypt_0.7.1.bb b/meta-python/recipes-devtools/python/
> python-flask-bcrypt_0.7.1.bb
> > index d08883d..f035862 100644
> > --- a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
> > +++ b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
> > @@ -1,4 +1,4 @@
> > -DESCRIPTION = "Brcrypt hashing for Flask."
> > +DESCRIPTION = "Bcrypt hashing for Flask."
> >  LICENSE = "BSD"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=0ee2ee5bee7fe96597770e92db5719a8"
> >
> > @@ -9,4 +9,4 @@ PYPI_PACKAGE = "Flask-Bcrypt"
> >
> >  inherit pypi setuptools
> >
> > -RDEPENDS_${PN} = "python-bcrypt"
> > +RDEPENDS_${PN} += "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

