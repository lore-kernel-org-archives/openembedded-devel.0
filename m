Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <norguhtar@gmail.com>) id 1RGBk3-0000UA-DD
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 17:38:11 +0200
Received: by bkat8 with SMTP id t8so1033976bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=aDdT8WsVYCRSKciRKVoloQA8DWUFSZHS05vER8igFYU=;
	b=uTUIquc+UJD/ZlLF6EinpODgXXKXqXeFaTHuAugxlumrbELqv0lDTAfYrWMaC3DmS8
	2a70FpZMfRPhhFF817xInnQduGtSjsUMTKnliWBGiQNhWoqdwAWh2IXCJG/G+HZcXdNc
	1f9+/89i3DMRFz6eb5/PzKPRZ7UwERzLbDwBc=
MIME-Version: 1.0
Received: by 10.223.75.25 with SMTP id w25mr4845882faj.15.1318951936572; Tue,
	18 Oct 2011 08:32:16 -0700 (PDT)
Received: by 10.152.22.165 with HTTP; Tue, 18 Oct 2011 08:32:16 -0700 (PDT)
In-Reply-To: <loom.20111018T095219-202@post.gmane.org>
References: <loom.20111018T095219-202@post.gmane.org>
Date: Tue, 18 Oct 2011 21:32:16 +0600
Message-ID: <CADYKPP+Lfd0XQSygVWL2Fb=Vkjna2s49ZMV4tBxbjonq1s20bw@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake build failed at bison
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
X-List-Received-Date: Tue, 18 Oct 2011 15:38:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 18, 2011 at 13:53, Kai <kaijun61@yahoo.com> wrote:

> Hi,
>
> I got the following issue when I rebuilt console-image from scratch
> today. Someone has reported this issue 4 months ago, I just wonder if
> it has been resolved.
>
> /usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/
> bison-2.4.3/m4/
> glib.m4:8: warning: underquoted definition of AM_PATH_GLIB
> configure.ac:128: warning: gl_GLIBC21 is m4_require'd but not
> m4_defun'd
> /usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/
> bison-2.4.3/m4/
> localcharset.m4:7: gl_LOCALCHARSET is expanded from...
> /usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/
> bison-2.4.3/m4/
> gnulib-comp.m4:153: gl_INIT is expanded from...
> configure.ac:128: the top level
> autoreconf: configure.ac: tracing
> configure.ac:128: warning: gl_GLIBC21 is m4_require'd but not
> m4_defun'd
> aclocal.m4:6788: gl_LOCALCHARSET is expanded from...
> aclocal.m4:3203: gl_INIT is expanded from...
> configure.ac:128: the top level
> configure.ac:128: warning: AC_RUN_IFELSE called without default to
> allow cross c
> ompiling
> ../../lib/autoconf/general.m4:2716: AC_RUN_IFELSE is expanded from...
> ../../lib/m4sugar/m4sh.m4:598: AS_IF is expanded from...
> ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
> ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
> aclocal.m4:8839: gl_POSIX_SPAWN_WORKS is expanded from...
> aclocal.m4:8768: gl_POSIX_SPAWN_BODY is expanded from...
> aclocal.m4:8763: gl_POSIX_SPAWN is expanded from...
> autoreconf: configure.ac: not using Libtool
> autoreconf: running: /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/
> bin/autoconf
> --include=/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-
> r9.0/bison-2.4.3/data/
> --include=/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-
> r9.0/bison-2.4.3/m4/
> --include=/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-
> r9.0/bison-2.4.3/tests/
> --include=/usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/
> aclocal-1.11
> --include=/usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/
> aclocal --force --warnings=cross
> configure.ac:128: warning: gl_GLIBC21 is m4_require'd but not
> m4_defun'd
> aclocal.m4:6788: gl_LOCALCHARSET is expanded from...
> aclocal.m4:3203: gl_INIT is expanded from...
> configure.ac:128: the top level
> configure.ac:128: warning: AC_RUN_IFELSE called without default to
> allow cross compiling
> ../../lib/autoconf/general.m4:2716: AC_RUN_IFELSE is expanded from...
> ../../lib/m4sugar/m4sh.m4:598: AS_IF is expanded from...
> ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
> ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
> aclocal.m4:8839: gl_POSIX_SPAWN_WORKS is expanded from...
> aclocal.m4:8768: gl_POSIX_SPAWN_BODY is expanded from...
> aclocal.m4:8763: gl_POSIERROR: Function 'do_configure' failed (see
> /usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/temp/
> log.do_configure.8271
> for further information)
> X_SPAWN is expanded from...
> configure:9788: error: possibly undefined macro: gl_GLIBC21
>      If this token and others are legitimate, please use
> m4_pattern_allow.
>      See the Autoconf documentation.
> autoreconf: /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/bin/
> autoconf failed with exit
> status: 1
> + oefatal 'autoreconf execution failed.'
>
> bitbake gettext-native

This should help.

