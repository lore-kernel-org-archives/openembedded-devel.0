Received: from cpdesign.com.au ([128.121.81.250])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc@cpdesign.com.au>) id 1T5XWa-00006S-9e
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Aug 2012 09:44:48 +0200
Received: (qmail 15940 invoked by uid 20986); 26 Aug 2012 07:25:58 -0000
Received: from unknown (HELO MARCVAIO) ([220.244.174.13])
	(envelope-sender <marc@cpdesign.com.au>)
	by 128.121.81.250 (qmail-ldap-1.03) with AES128-SHA encrypted SMTP
	for <openembedded-devel@lists.openembedded.org>;
	26 Aug 2012 07:25:58 -0000
From: "Marc Reilly" <marc@cpdesign.com.au>
To: <openembedded-devel@lists.openembedded.org>
References: <1345514067-16394-1-git-send-email-marc@cpdesign.com.au>
	<1345514067-16394-2-git-send-email-marc@cpdesign.com.au>
In-Reply-To: <1345514067-16394-2-git-send-email-marc@cpdesign.com.au>
Date: Sun, 26 Aug 2012 17:25:51 +1000
Organization: CPD
Message-ID: <000601cd835c$09479b10$1bd6d130$@cpdesign.com.au>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEt9CTNXFrVXqHxGNkAaUusfkR0DAKh8hqImJW+pLA=
Subject: Re: [Patch V2 1/2] qwt: fix link error when linking with ld-gold.
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
X-List-Received-Date: Sun, 26 Aug 2012 07:44:48 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-au

Hi, 

Just pinging this to check if it has been overlooked or is wrong. 

I tried to see if its listed on patchwork site, but its either not there or 
I'm looking in the wrong spot.

Cheers,
Marc

> -----Original Message-----
> From: Marc Reilly [mailto:marc.reilly@gmail.com] On Behalf Of Marc Reilly
> Sent: Tuesday, 21 August 2012 11:54 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Marc Reilly
> Subject: [Patch V2 1/2] qwt: fix link error when linking with ld-gold.
> 
> ld-gold doesn't implicitly link with librt, this fixes an unresolved
symbol error
> when compiling qwt examples.
> 
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
> ---
>  .../qwt/files/qwt6-fix-linking-with-ld-gold.patch  |   34
> ++++++++++++++++++++
>  meta-oe/recipes-qt/qwt/qwt.inc                     |    4 +-
>  2 files changed, 36 insertions(+), 2 deletions(-)  create mode 100644
meta-
> oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch
> 
> diff --git
a/meta-oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch
> b/meta-oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch
> new file mode 100644
> index 0000000..1fdd9cf
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch
> @@ -0,0 +1,34 @@
> +Upstream-Status: Pending
> +
> +diff -urpN qwt-6.0.1_orig/qwtbuild.pri qwt-6.0.1/qwtbuild.pri
> +--- qwt-6.0.1_orig/qwtbuild.pri	2011-08-02 00:33:53.000000000 +1000
> ++++ qwt-6.0.1/qwtbuild.pri	2012-08-21 10:27:30.721990849 +1000
> +@@ -67,3 +67,13 @@ unix {
> +         error( "local build will conflict with
$${QMAKE_LIBDIR_QT}/libqwt.*" )
> +     }
> + }
> ++
> ++########################################################
> ##############
> ++# libs for building qwt
> ++########################################################
> ##############
> ++
> ++unix {
> ++    # Some linkers require explicit linking with librt (eg ld.gold)
> ++    LIBS += -lrt
> ++}
> ++
> +diff -urpN qwt-6.0.1_orig/qwt.prf qwt-6.0.1/qwt.prf
> +--- qwt-6.0.1_orig/qwt.prf	2011-08-02 00:33:51.000000000 +1000
> ++++ qwt-6.0.1/qwt.prf	2012-08-21 11:19:49.435240439 +1000
> +@@ -9,6 +9,11 @@
> +
> + include ( ./qwtconfig.pri )
> +
> ++unix {
> ++
> ++	LIBS += -lrt
> ++}
> ++
> + contains(QWT_CONFIG, QwtDll) {
> +
> +     DEFINES *= QWT_DLL
> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-
> qt/qwt/qwt.inc index a299ac8..a9289f7 100644
> --- a/meta-oe/recipes-qt/qwt/qwt.inc
> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> @@ -6,8 +6,8 @@ LICENSE = "QWTv1.0"
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
> 
>  SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
> -	file://qwt6.patch \
> -	"
> +           file://qwt6.patch \
> +           file://qwt6-fix-linking-with-ld-gold.patch"
> 
>  S = "${WORKDIR}/qwt-${PV}"
> 
> --
> 1.7.7



