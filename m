Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pzuoj-0004xI-A8
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:47:29 +0100
Received: by pvc30 with SMTP id 30so291463pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=iYGmjmD55+zsM1ZK4NKxuNNfuoEU9zmMB2yjirepWZQ=;
	b=Bfr52tZfVDsCe/rq5gT1MmWP9xwa7IkddQfbuMZUPkbfmcjGbRVzc+BfLuPNCII4hc
	4VMyUKYBcWz4NNOA5NQDKkby3svXpQxKrWkVtflX0qbqeqgO1F/k8Aft7W7MSm0kq+Xh
	dOLUl4Hm7IJntnAESGgyYIHy5pfztsSsQVv9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=s1I/0xcseYelrGZshmyoigDFsEcYLCH1TqDvp2B2m7ZplrZqzbAzy+/ZHTcLnZOCex
	oRcG3OgOlhtgz2oiiAYrLtKkfRSW2BZlqM0FZ70iX/VjaVk6CQj2hQnSZ6SVvKZn43zA
	o1eBTqnbR5VUGm0kANDx3LXrQicEiRMjcHcQk=
Received: by 10.142.202.12 with SMTP id z12mr145451wff.442.1300297544407;
	Wed, 16 Mar 2011 10:45:44 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w27sm1418356wfd.4.2011.03.16.10.45.41
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 10:45:42 -0700 (PDT)
Message-ID: <4D80F737.70906@gmail.com>
Date: Wed, 16 Mar 2011 10:45:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300272884-24220-2-git-send-email-heinold@inf.fu-berlin.de>
In-Reply-To: <1300272884-24220-2-git-send-email-heinold@inf.fu-berlin.de>
Subject: Re: [PATCH 1/4] openjdk: use qemu now for the awt sizer binary too
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
X-List-Received-Date: Wed, 16 Mar 2011 17:47:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2011 3:54 AM, Henning Heinold wrote:
> From: Henning Heinold<h.heinold@tarent.de>
>
> * bump INC_PR
> ---
>   .../icedtea-crosscompile-fix.patch                 |   24 ++++++++++---------
>   recipes/openjdk/openjdk-6-common.inc               |    8 +-----
>   2 files changed, 14 insertions(+), 18 deletions(-)
>

the inc file has
DEPENDS_append_arm = " qemu-native "
so I guess it will work fine for arm how about other architectures ?
otherwise patch looks ok

> diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
> index ec0f259..652f7ac 100644
> --- a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
> +++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
> @@ -73,17 +73,6 @@ Index: openjdk/jdk/make/sun/xawt/Makefile
>    endif
>
>    ifeq ($(PLATFORM), solaris)
> -@@ -237,7 +238,9 @@
> - 	$(BOOT_JAVA_CMD) -cp $(WRAPPER_GENERATOR_TEMPDIR) WrapperGenerator \
> - 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
> -
> --$(SIZES): $(SIZERS)
> -+#$(SIZES): $(SIZERS)
> -+# Prevent binaries being created. Instead take what is available.
> -+$(SIZES):
> - 	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
> - 	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
> - 	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
>   Index: openjdk/hotspot/make/linux/makefiles/vm.make
>   ===================================================================
>   --- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-01-24 17:54:57.000000000 +0100
> @@ -212,3 +201,16 @@ Index: openjdk/hotspot/make/linux/makefiles/launcher.make
>      LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
>    endif
>
> +Index: icedtea6-1.8.5/build/openjdk/jdk/make/sun/xawt/Makefile
> +===================================================================
> +--- openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:17:03.926207269 +0100
> ++++ openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:30:11.956186631 +0100
> +@@ -245,7 +245,7 @@
> + 	    $(CHMOD) +w $@;\
> + 	else	\
> + 	    $(ECHO) GENERATING $@; \
> +-	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@)>  $@; \
> ++	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@)>  $@; \
> + 	fi
> + 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
> + 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
> diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
> index f04800b..54c45f8 100644
> --- a/recipes/openjdk/openjdk-6-common.inc
> +++ b/recipes/openjdk/openjdk-6-common.inc
> @@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
>   S = "${WORKDIR}/${ICEDTEA}"
>   B = "${S}/build"
>
> -INC_PR = "r10"
> +INC_PR = "r11"
>
>   SRC_URI = "\
>     ${ICEDTEA_URI} \
> @@ -288,12 +288,6 @@ addtask compilestepone after do_configure before do_compilesteptwo
>   do_compilesteptwo() {
>   	echo "2/3 Building bootstrap JDK"
>
> -	# Take pre-generated binaries from -native build
> -	install -d generated/sun/awt/X11/generator
> -	ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/generated/sizer.32 generated/sun/awt/X11/generator/sizer.32
> -	install -d openjdk/${BUILD_DIR}/gensrc/sun/awt/X11/generator
> -	ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/generated/sizer.32 openjdk/${BUILD_DIR}/gensrc/sun/awt/X11/generator/sizer.32
> -
>   	# Now cross-compile bootstrap JDK
>   	rm stamps/icedtea-against-ecj.stamp stamps/icedtea-ecj.stamp || true
>   	oe_runmake icedtea-against-ecj



