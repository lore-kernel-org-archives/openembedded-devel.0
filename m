Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4ERV-0002qr-EC
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 19:10:09 +0200
Received: by eaad12 with SMTP id d12so346042eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CwiT5K1avlmE3O1gRiMZN882w2+dhSBiegiLQcVGFh8=;
	b=ojaPF4rzKd4XPsVoRwvq0bgmyDdqxp900MiI3siIR5iHeYs+mCCLdGJXtWFRLknGvP
	fjff56BKXkQ9yRDB+mkrTtQVh5fgQ9DSbPCA6V6VNCROck+2kz9O41v2Xb1yWQCi2EYA
	EJ4Jt2OcFwV4wjnlvEu1H74rPBJyj9YQ9ZeCKoyjhbFPzK3DJftpVhgRGcJKnMWiX0v7
	3wSS3yI6huU0/sWzOLYLs69ucrnuP/zqE4DTfn8BvMxAf4T85Nc7kzY/hxyJNGQmsfJF
	yiZKKbKSXfEPJBH9uqN6v5Ts0Yw9PavoKVU3njKpVn9bFimL73RAqfpBn+ZujYxyECSJ
	3t0g==
Received: by 10.14.220.70 with SMTP id n46mr19448073eep.42.1345654684372; Wed,
	22 Aug 2012 09:58:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 22 Aug 2012 09:57:33 -0700 (PDT)
In-Reply-To: <1345647223-12473-1-git-send-email-raj.khem@gmail.com>
References: <1345647223-12473-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 09:57:33 -0700
Message-ID: <CAMKF1sop1DzziQgW4NpKLW1zG3K7RvjscFkC9QFp1MTqh_u1-A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] classpath-0.99: Remove unused automake.patch
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
X-List-Received-Date: Wed, 22 Aug 2012 17:10:09 -0000
Content-Type: text/plain; charset=UTF-8

ignore it. My branches are messed up.

On Wed, Aug 22, 2012 at 7:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This was meant for 0.98 which has been removed
> 0.99 was not using it at all
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../classpath/classpath-0.98/automake.patch        |  100 --------------------
>  recipes-core/classpath/classpath.inc               |    2 +-
>  recipes-core/classpath/classpath_0.99.bb           |    1 -
>  3 files changed, 1 insertion(+), 102 deletions(-)
>  delete mode 100644 recipes-core/classpath/classpath-0.98/automake.patch
>
> diff --git a/recipes-core/classpath/classpath-0.98/automake.patch b/recipes-core/classpath/classpath-0.98/automake.patch
> deleted file mode 100644
> index da86300..0000000
> --- a/recipes-core/classpath/classpath-0.98/automake.patch
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -Fix build with automake 1.12
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: classpath-0.98/examples/Makefile.am
> -===================================================================
> ---- classpath-0.98.orig/examples/Makefile.am   2012-07-17 17:35:05.428405912 -0700
> -+++ classpath-0.98/examples/Makefile.am        2012-07-17 17:36:28.008405840 -0700
> -@@ -96,9 +96,9 @@
> - endif
> -
> - $(EXAMPLE_ZIP): $(EXAMPLE_JAVA_FILES)
> --      @mkdir_p@ classes/gnu/classpath/examples/icons
> -+      @MKDIR_P@ classes/gnu/classpath/examples/icons
> -       cp $(EXAMPLE_ICONS) classes/gnu/classpath/examples/icons
> --      @mkdir_p@ classes/gnu/classpath/examples/swing
> -+      @MKDIR_P@ classes/gnu/classpath/examples/swing
> -       cp $(EXAMPLE_HTML) classes/gnu/classpath/examples/swing
> -       $(JCOMPILER) -d classes $(EXAMPLE_JAVA_FILES)
> -       (cd classes; \
> -Index: classpath-0.98/lib/Makefile.am
> -===================================================================
> ---- classpath-0.98.orig/lib/Makefile.am        2012-07-17 17:35:05.448405923 -0700
> -+++ classpath-0.98/lib/Makefile.am     2012-07-17 17:36:44.728405932 -0700
> -@@ -83,18 +83,18 @@
> - resources: copy-vmresources.sh
> -       @list=`cd $(top_srcdir)/resource && $(FIND) gnu java javax org -name \*\.properties -print -o -name \*\.css -print`; for p in $$list; do \
> -           dirname=`dirname $$p`; \
> --          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> -+          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> -         cp $(top_srcdir)/resource/$$p $$p; \
> -       done
> -       @list=`cd $(top_srcdir)/resource && $(FIND) META-INF -name CVS -prune -o -name .svn -prune -o -name \*\.in -prune -o -type f -print`; for p in $$list; do \
> -           dirname=`dirname $$p`; \
> --          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> -+          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> -         cp $(top_srcdir)/resource/$$p $$p; \
> -       done
> -       @$(SHELL) ./copy-vmresources.sh
> -       @list=`cd $(top_srcdir) && $(FIND) gnu/javax/swing/plaf/gtk/icons -name *.png -type f -print`; for p in $$list; do \
> -           dirname=`dirname $$p`; \
> --          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> -+          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> -         cp $(top_srcdir)/$$p $$p; \
> -       done
> -       touch resources
> -@@ -102,7 +102,7 @@
> - classes: genclasses
> -
> - $(top_builddir)/gnu/java/locale/LocaleData.java: $(top_srcdir)/scripts/generate-locale-list.sh
> --      @mkdir_p@ $(top_builddir)/gnu/java/locale
> -+      @MKDIR_P@ $(top_builddir)/gnu/java/locale
> -       $(top_srcdir)/scripts/generate-locale-list.sh > $(top_builddir)/gnu/java/locale/LocaleData.java
> -
> - genclasses: gen-classlist.sh standard.omit $(top_builddir)/gnu/java/locale/LocaleData.java gen-xpath-parser
> -@@ -160,7 +160,7 @@
> -       -rm -rf lists
> -
> - dist-hook:
> --      @mkdir_p@ $(distdir)
> -+      @MKDIR_P@ $(distdir)
> -       cp -pdfR $(top_srcdir)/gnu $(top_srcdir)/java $(top_srcdir)/javax $(top_srcdir)/org $(top_srcdir)/sun $(top_srcdir)/vm $(top_srcdir)/resource $(distdir)/..
> - # Delete not wanted files.
> -       $(FIND) $(distdir)/../gnu $(distdir)/../java $(distdir)/../javax $(distdir)/../org $(distdir)/../sun $(distdir)/../vm $(distdir)/../resource -name CVS -print | xargs rm -fr
> -Index: classpath-0.98/tools/Makefile.am
> -===================================================================
> ---- classpath-0.98.orig/tools/Makefile.am      2012-07-17 17:35:05.456405922 -0700
> -+++ classpath-0.98/tools/Makefile.am   2012-07-17 17:37:00.828405721 -0700
> -@@ -312,11 +312,11 @@
> - # so they get also included.
> - $(TOOLS_ZIP): $(ALL_TOOLS_FILES)
> -       @rm -rf classes asm
> --      @mkdir_p@ classes asm
> -+      @MKDIR_P@ classes asm
> - if CREATE_GJDOC
> - if CREATE_GJDOC_PARSER
> - ## Generate antlr sources.
> --      @mkdir_p@ $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
> -+      @MKDIR_P@ $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
> -       $(ANTLR) -o $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr/ \
> -         $(srcdir)/gnu/classpath/tools/gjdoc/expr/java-expression.g
> - endif
> -@@ -346,7 +346,7 @@
> -              sun/rmi/rmic $(GJDOC_EX) -name \*.properties -print -o -name \*.jav -print`; \
> -       for p in $$list; do \
> -         dirname=classes/`dirname $$p`; \
> --        if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> -+        if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> -         echo "  cp $(srcdir)/resource/$$p classes/$$p"; \
> -         cp $(srcdir)/resource/$$p classes/$$p; \
> -       done
> -@@ -354,7 +354,7 @@
> - ## Copy over gjdoc resource files.
> -       for res in $(gjdoc_resources); do \
> -         dir=classes/`dirname $$res`; \
> --        if ! test -d "$$dir"; then @mkdir_p@ "$$dir"; fi; \
> -+        if ! test -d "$$dir"; then @MKDIR_P@ "$$dir"; fi; \
> -         echo "  cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/$$res"; \
> -         cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/$$res; \
> -       done
> diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
> index 4c3174b..df23b4b 100644
> --- a/recipes-core/classpath/classpath.inc
> +++ b/recipes-core/classpath/classpath.inc
> @@ -21,7 +21,7 @@ RPROVIDES_${PN} = "${PBN}"
>  RPROVIDES_${PN}-common = "${PBN}-common"
>  RPROVIDES_${PN}-gtk = "${PBN}-awt"
>
> -PR = "r0"
> +PR = "r1"
>
>  SRC_URI = "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
>
> diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
> index b1e4089..ee38992 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -8,7 +8,6 @@ SRC_URI += " \
>              file://autotools.patch \
>              file://miscompilation.patch \
>              file://toolwrapper-exithook.patch \
> -            file://automake.patch \
>             "
>
>  SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
> --
> 1.7.9.5
>


