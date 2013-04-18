Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1USwOQ-0007mR-8Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 23:29:24 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 409F0D22E9; Thu, 18 Apr 2013 23:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7A3FFD2284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 23:10:41 +0200 (CEST)
Message-ID: <51706174.6070407@linaro.org>
Date: Thu, 18 Apr 2013 23:11:16 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.4.6
Subject: openldap and icu
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
X-List-Received-Date: Thu, 18 Apr 2013 21:29:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

As one of our Linaro builds failed in nasty way I decided to take a look
and discovered something ugly.

bitbake -ccleansstate openldap
bitbake icu
bitbake openldap
rm -rf TMPDIR
bitbake openldap

99% that it will fail...

Where the problem is? in openldap sources: build/openldap.m4 has this:

-----
dnl International Components for Unicode (ICU)
AC_DEFUN([OL_ICU],
[ol_icu=no
AC_CHECK_HEADERS( unicode/utypes.h )
if test $ac_cv_header_unicode_utypes_h = yes ; then
	dnl OL_ICULIBS="-licui18n -licuuc -licudata"
	OL_ICULIBS="-licuuc -licudata"

	AC_CACHE_CHECK([for ICU libraries], [ol_cv_lib_icu], [
		ol_LIBS="$LIBS"
		LIBS="$OL_ICULIBS $LIBS"
		AC_LINK_IFELSE([AC_LANG_PROGRAM([[
#include <unicode/utypes.h>
]], [[
(void) u_errorName(0);
]])],[ol_cv_lib_icu=yes],[ol_cv_lib_icu=no])
		LIBS="$ol_LIBS"
])

	if test $ol_cv_lib_icu != no ; then
		ol_icu="$OL_ICULIBS"
		AC_DEFINE(HAVE_ICU,1,[define if you actually have ICU])
	fi
fi
])
-----

which is called by configure.in:

-----
dnl International Components for Unicode
OL_ICU
if test "$ol_icu" = no ; then
	AC_MSG_WARN([ICU not available])
else
	ICU_LIBS="$ol_icu"
fi
-----

Now the question is: will we kill ICU dependency or will we add it into
build dependencies?


