Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Otl1b-0003vG-Tz
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 19:35:04 +0200
Received: by wwi14 with SMTP id 14so1908745wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qwiym24LD6pOL3F01Gd9X8KsQH8Z5xvXCZvvhbZTZzY=;
	b=kX/UTWSJW1SIUoRI728daAul6KEM+Y3L8eaCtd+aiKcXPl9BrtiVJkw9Enju8Jy3gM
	rrPtNyqd7GnG7SzBDBNqkkUYE8+3Y7vNtToriY+civfO9+m6uofIFTximWXYu1P23mGl
	qW+jXNq5vBSNJgr6/0xhL0RLTz5y1bTkEfgHg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AexGNYFnzYNzThsX5hBBk8F0UGTWN/xvLqSoDDVvHgLm7QMHLBLIeRDhTK4EX5NW58
	LN00kIyQtF2DdZ05jaAiXyPM9bmVdzWDTU+iavy6QRHRfJkJWI9Lw8gnVEiMEqh9StT+
	efyN56zoPRPK/UYEtTlDnLGXh7Dhb9VOFzB8k=
MIME-Version: 1.0
Received: by 10.216.158.18 with SMTP id p18mr597110wek.2.1284053659104; Thu,
	09 Sep 2010 10:34:19 -0700 (PDT)
Received: by 10.216.58.197 with HTTP; Thu, 9 Sep 2010 10:34:19 -0700 (PDT)
In-Reply-To: <1284048433-20991-1-git-send-email-eric@eukrea.com>
References: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>
	<1284048433-20991-1-git-send-email-eric@eukrea.com>
Date: Thu, 9 Sep 2010 10:34:19 -0700
Message-ID: <AANLkTike7kmRPU9iw8wyC3v5=rLrr+DqiyskkoGC5H30@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] generate-manifest-2.6.py: tune python-modules' RDEPENDS
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
X-List-Received-Date: Thu, 09 Sep 2010 17:35:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2010 at 9:07 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> * python-dev: pulls several dev packages leading to a >256MB image instea=
d
> of a 60MB image without this packages
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
> =A0contrib/python/generate-manifest-2.6.py | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/gen=
erate-manifest-2.6.py
> index 1a0f1d3..5ebafb8 100755
> --- a/contrib/python/generate-manifest-2.6.py
> +++ b/contrib/python/generate-manifest-2.6.py
> @@ -12,7 +12,7 @@ import time
> =A0VERSION =3D "2.6.4"
>
> =A0__author__ =3D "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
> -__version__ =3D "20100711"
> +__version__ =3D "20100908"
>
> =A0class MakefileMaker:
>
> @@ -123,7 +123,7 @@ class MakefileMaker:
> =A0 =A0 =A0 =A0 line =3D 'RDEPENDS_python-modules=3D"'
>
> =A0 =A0 =A0 =A0 for name, data in self.packages.iteritems():
> - =A0 =A0 =A0 =A0 =A0 =A0if name !=3D 'python-core-dbg':
> + =A0 =A0 =A0 =A0 =A0 =A0if name not in ['python-core-dbg', 'python-dev']=
:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 line +=3D "%s " % name
>
> =A0 =A0 =A0 =A0 self.out( "%s \"" % line )
> @@ -164,7 +164,7 @@ if __name__ =3D=3D "__main__":
> =A0 =A0 m.addPackage( "python-core-dbg", "Python core module debug inform=
ation", "python-core",
> =A0 =A0 "config/.debug lib-dynload/.debug ${bindir}/.debug ${libdir}/.deb=
ug" )
>
> - =A0 =A0m.addPackage( "python-devel", "Python Development Package", "pyt=
hon-core",
> + =A0 =A0m.addPackage( "python-dev", "Python Development Package", "pytho=
n-core",
> =A0 =A0 "${includedir} ${libdir}/libpython2.6.so config" ) # package
>
> =A0 =A0 m.addPackage( "python-idle", "Python Integrated Development Envir=
onment", "python-core python-tkinter",
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Dumb comment time: Wouldnt it be better to make maybe a few different
python module packages installs instead of thining out the
python-module? I know I personally use all the modules for python
available here plus some other modules as well. I know not everyone is
concerned with making their images as small as possible. Probably just
not getting the reasoning or point but just thought I would make the
statement there are those that use python-dev as is

JL


