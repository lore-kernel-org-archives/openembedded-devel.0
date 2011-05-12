Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <harvey.tim@gmail.com>) id 1QKJV1-0007dy-TU
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 02:11:27 +0200
Received: by fxm19 with SMTP id 19so828243fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=vxuTHAeivDnh1wcDDZRGs8afoY0UTtuIDgc2z4+oWB4=;
	b=E8uv51tK7MBkr9k+LzLQWcuFEFrFik8OU8HaT3uBZJGnHG11qQGUqr9pdsb2MipVsq
	e8PwGHMly0PyNJ/q7xGZS1lUaSdJdgPerThtyrSyRC6uGJr6jHtaGTpfu6pAJWgKPavy
	+a6hsPQ20k+hIfDH07VZNzOkUsCmPIJR24klA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=Z6q99Z9IOK9KO+IDqsci/P+3Ekop8m0Y0g2/U76MikbO/xCW0Z2XkAnyGb3i6bN7ur
	Wbezmo+gLDBQJ0bWMxuS5SxHLU5u1SYRH41seI4joFcoqU/cotmgCRb0JowEIa8UBQVb
	AYJ0ZuzZTpWMxdS/VUFYKSQyo5OQshhG7JulU=
MIME-Version: 1.0
Received: by 10.223.148.147 with SMTP id p19mr1211877fav.140.1305158920979;
	Wed, 11 May 2011 17:08:40 -0700 (PDT)
Sender: harvey.tim@gmail.com
Received: by 10.223.116.200 with HTTP; Wed, 11 May 2011 17:08:40 -0700 (PDT)
Date: Wed, 11 May 2011 17:08:40 -0700
X-Google-Sender-Auth: pj-j9YfdB7pVxFoGeqH8TmjZ0yE
Message-ID: <BANLkTi=axnPU8WwFuShg1CjWH-m-hvxsxg@mail.gmail.com>
From: Tim Harvey <tim_harvey@yahoo.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: RFC: Inclusion of re-written binconfig's in SDK
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
X-List-Received-Date: Thu, 12 May 2011 00:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Greetings,

I've been struggling trying to understand the in's and out's of SDK's built
by meta-toolchain for a while.  While the produced SDK works very well for
simple makefiles as well as things that use pkgconfig, I've seen various
snippets of documentation out there that state for autoconf projects simply
invoke configure such as:  ./configure --host=$TARGET_SYS

I've found this to perhaps rarely be the case and am trying to figure out
why and if anything better can be done.  The issue that I see is that
autoconf projects that require lib support typically (always?) use
binconfigs (ie freetype-config) to provide flags for the compiler and
linker.  These binconfigs come from the various upstream lib packages and
are packaged in the -dev packages (ie libfreetype-dev_*.ipk).  As these -dev
packages are intended to work for compiling against on the target, they
return paths based on /.  This however does not work when cross-compiling in
the SDK and if used by autoconf will end up putting / based paths in your
flags.  OE native builds work around these issues by staging mangled
binconfigs (by virtue of binconfig.bbclass) in STAGING_DIR such that when
autoreconf is run in oe_runconf the correct paths are returned relative to
STAGING_DIR.

I wonder if a better approach would be to have binconfig.bbclass mangle the
binconfigs such that they return paths pre-pended by '$LIBTOOL_SYSROOT_PATH'
(unresolved) which on a target could resolve to "" and in an SDK would
resolve to the correct sysroot path within the SDK based on its exported
environment.  With this in place, the same binconfig can be staged to
STAGING_DIR as well as packaged in the -dev package.  I wonder if
additionally the path to the binconfigs ($DSK_PATH/../bin) should be added
to the exported PATH from the SDK's environment-setup.sh

Thoughts?

Are there other issues that I'm neglecting to think about with autoconf that
makes all of this pointless?

I've been told that 'libtool with sysroot' support may be the answer to all
of this but I'm not understanding libtool well or how that necessarily helps
a broken or perhaps 'inadequate for cross-compiling' autoconf config.

Thanks,

Tim

