Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SrxLq-0008Sl-IB
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 22:29:34 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SrxAs-0005j6-H1>; Thu, 19 Jul 2012 22:18:14 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SrxAs-000827-E8>; Thu, 19 Jul 2012 22:18:14 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SrxAr-0007Qa-B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:18:13 +0200
Date: Thu, 19 Jul 2012 22:18:13 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120719201813.GB28427@mi.fu-berlin.de>
References: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
	<1342576568-31044-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342576568-31044-3-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH 3/3] classpath: Fix build with automake 1.12
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
X-List-Received-Date: Thu, 19 Jul 2012 20:29:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 17, 2012 at 06:56:08PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../classpath/classpath-0.98/automake.patch        |  100 ++++++++++++++++++++
>  recipes-core/classpath/classpath_0.98.bb           |    1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 recipes-core/classpath/classpath-0.98/automake.patch
> 
> diff --git a/recipes-core/classpath/classpath-0.98/automake.patch b/recipes-core/classpath/classpath-0.98/automake.patch
> new file mode 100644
> index 0000000..da86300
> --- /dev/null
> +++ b/recipes-core/classpath/classpath-0.98/automake.patch
> @@ -0,0 +1,100 @@
> +Fix build with automake 1.12
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: classpath-0.98/examples/Makefile.am
> +===================================================================
> +--- classpath-0.98.orig/examples/Makefile.am	2012-07-17 17:35:05.428405912 -0700
> ++++ classpath-0.98/examples/Makefile.am	2012-07-17 17:36:28.008405840 -0700
> +@@ -96,9 +96,9 @@
> + endif
> + 
> + $(EXAMPLE_ZIP): $(EXAMPLE_JAVA_FILES)
> +-	@mkdir_p@ classes/gnu/classpath/examples/icons
> ++	@MKDIR_P@ classes/gnu/classpath/examples/icons
> + 	cp $(EXAMPLE_ICONS) classes/gnu/classpath/examples/icons
> +-	@mkdir_p@ classes/gnu/classpath/examples/swing
> ++	@MKDIR_P@ classes/gnu/classpath/examples/swing
> + 	cp $(EXAMPLE_HTML) classes/gnu/classpath/examples/swing
> + 	$(JCOMPILER) -d classes $(EXAMPLE_JAVA_FILES) 
> + 	(cd classes; \
> +Index: classpath-0.98/lib/Makefile.am
> +===================================================================
> +--- classpath-0.98.orig/lib/Makefile.am	2012-07-17 17:35:05.448405923 -0700
> ++++ classpath-0.98/lib/Makefile.am	2012-07-17 17:36:44.728405932 -0700
> +@@ -83,18 +83,18 @@
> + resources: copy-vmresources.sh
> + 	@list=`cd $(top_srcdir)/resource && $(FIND) gnu java javax org -name \*\.properties -print -o -name \*\.css -print`; for p in $$list; do \
> +           dirname=`dirname $$p`; \
> +-          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> ++          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> + 	  cp $(top_srcdir)/resource/$$p $$p; \
> + 	done
> + 	@list=`cd $(top_srcdir)/resource && $(FIND) META-INF -name CVS -prune -o -name .svn -prune -o -name \*\.in -prune -o -type f -print`; for p in $$list; do \
> +           dirname=`dirname $$p`; \
> +-          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> ++          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> + 	  cp $(top_srcdir)/resource/$$p $$p; \
> + 	done
> + 	@$(SHELL) ./copy-vmresources.sh
> + 	@list=`cd $(top_srcdir) && $(FIND) gnu/javax/swing/plaf/gtk/icons -name *.png -type f -print`; for p in $$list; do \
> +           dirname=`dirname $$p`; \
> +-          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> ++          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> + 	  cp $(top_srcdir)/$$p $$p; \
> + 	done
> + 	touch resources
> +@@ -102,7 +102,7 @@
> + classes: genclasses
> + 
> + $(top_builddir)/gnu/java/locale/LocaleData.java: $(top_srcdir)/scripts/generate-locale-list.sh 
> +-	@mkdir_p@ $(top_builddir)/gnu/java/locale
> ++	@MKDIR_P@ $(top_builddir)/gnu/java/locale
> + 	$(top_srcdir)/scripts/generate-locale-list.sh > $(top_builddir)/gnu/java/locale/LocaleData.java
> + 
> + genclasses: gen-classlist.sh standard.omit $(top_builddir)/gnu/java/locale/LocaleData.java gen-xpath-parser
> +@@ -160,7 +160,7 @@
> + 	-rm -rf lists
> + 
> + dist-hook:
> +-	@mkdir_p@ $(distdir)
> ++	@MKDIR_P@ $(distdir)
> + 	cp -pdfR $(top_srcdir)/gnu $(top_srcdir)/java $(top_srcdir)/javax $(top_srcdir)/org $(top_srcdir)/sun $(top_srcdir)/vm $(top_srcdir)/resource $(distdir)/..
> + # Delete not wanted files.
> + 	$(FIND) $(distdir)/../gnu $(distdir)/../java $(distdir)/../javax $(distdir)/../org $(distdir)/../sun $(distdir)/../vm $(distdir)/../resource -name CVS -print | xargs rm -fr
> +Index: classpath-0.98/tools/Makefile.am
> +===================================================================
> +--- classpath-0.98.orig/tools/Makefile.am	2012-07-17 17:35:05.456405922 -0700
> ++++ classpath-0.98/tools/Makefile.am	2012-07-17 17:37:00.828405721 -0700
> +@@ -312,11 +312,11 @@
> + # so they get also included.
> + $(TOOLS_ZIP): $(ALL_TOOLS_FILES)
> + 	@rm -rf classes asm
> +-	@mkdir_p@ classes asm 
> ++	@MKDIR_P@ classes asm 
> + if CREATE_GJDOC
> + if CREATE_GJDOC_PARSER
> + ## Generate antlr sources.
> +-	@mkdir_p@ $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
> ++	@MKDIR_P@ $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
> + 	$(ANTLR) -o $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr/ \
> + 	  $(srcdir)/gnu/classpath/tools/gjdoc/expr/java-expression.g
> + endif
> +@@ -346,7 +346,7 @@
> + 	       sun/rmi/rmic $(GJDOC_EX) -name \*.properties -print -o -name \*.jav -print`; \
> + 	for p in $$list; do \
> + 	  dirname=classes/`dirname $$p`; \
> +-	  if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
> ++	  if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
> + 	  echo "  cp $(srcdir)/resource/$$p classes/$$p"; \
> + 	  cp $(srcdir)/resource/$$p classes/$$p; \
> + 	done
> +@@ -354,7 +354,7 @@
> + ## Copy over gjdoc resource files.
> + 	for res in $(gjdoc_resources); do \
> + 	  dir=classes/`dirname $$res`; \
> +-	  if ! test -d "$$dir"; then @mkdir_p@ "$$dir"; fi; \
> ++	  if ! test -d "$$dir"; then @MKDIR_P@ "$$dir"; fi; \
> + 	  echo "  cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/$$res"; \
> + 	  cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/$$res; \
> + 	done 
> diff --git a/recipes-core/classpath/classpath_0.98.bb b/recipes-core/classpath/classpath_0.98.bb
> index d822452..caff590 100644
> --- a/recipes-core/classpath/classpath_0.98.bb
> +++ b/recipes-core/classpath/classpath_0.98.bb
> @@ -8,6 +8,7 @@ SRC_URI += " \
>              file://autotools.patch \
>              file://fix-gmp.patch \
>              file://toolwrapper-exithook.patch \
> +            file://automake.patch \
>             "
>  
>  SRC_URI[md5sum] = "90c6571b8b0309e372faa0f9f6255ea9"
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I upgraded to classpath 0.99 anyway and pachted it with $(MKDIR_P).

Bye Henning


