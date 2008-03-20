Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1JcKaO-0000SO-EQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 14:13:38 +0100
Received: by fg-out-1718.google.com with SMTP id 13so676581fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 06:13:34 -0700 (PDT)
Received: by 10.82.127.14 with SMTP id z14mr4055548buc.3.1206018813811;
	Thu, 20 Mar 2008 06:13:33 -0700 (PDT)
Received: by 10.82.118.18 with HTTP; Thu, 20 Mar 2008 06:13:33 -0700 (PDT)
Message-ID: <74d0deb30803200613h2066625bobb951f7151be5c6@mail.gmail.com>
Date: Thu, 20 Mar 2008 14:13:33 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080319154538.76AFB1880CA@amethyst.openembedded.net>
MIME-Version: 1.0
References: <20080319154538.76AFB1880CA@amethyst.openembedded.net>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: philipp.zabel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev gettext: switch to autotools_stage_all
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2008 13:13:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Not related to this commit, but noticed because of it:

NOTE: package gettext-0.14.1-r8: task do_package: started
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/preloadable_libintl.so
NOTE: Multiple libraries (libgettextpo.so.0, libasprintf.so.0) found
and LEAD_SONAME not defined

Should preloadable_libintl.so be packaged in FILES_${PN}?

regards
Philipp

On Wed, Mar 19, 2008 at 4:45 PM, koen commit
<oe@amethyst.openembedded.net> wrote:
> gettext: switch to autotools_stage_all
>
>  Author: koen@openembedded.org
>  Branch: org.openembedded.dev
>  Revision: 440982b14f1fd12b1e82ec3aaeb30d18b44722f3
>  ViewMTN: http://monotone.openembedded.org/revision/info/440982b14f1fd12b1e82ec3aaeb30d18b44722f3
>  Files:
>  1
>  packages/gettext/gettext_0.14.1.bb
>  Diffs:
>
>  #
>  # mt diff -rc31a0840a5919504cd869926bc3a2c2318c90578 -r440982b14f1fd12b1e82ec3aaeb30d18b44722f3
>  #
>  #
>  #
>  # patch "packages/gettext/gettext_0.14.1.bb"
>  #  from [7293581921c029392be4691314f4f9b6d79c1d09]
>  #    to [de52cbbadfde1d2a8520b9e08d233b8c44267b54]
>  #
>  ============================================================
>  --- packages/gettext/gettext_0.14.1.bb  7293581921c029392be4691314f4f9b6d79c1d09
>  +++ packages/gettext/gettext_0.14.1.bb  de52cbbadfde1d2a8520b9e08d233b8c44267b54
>  @@ -2,7 +2,7 @@ LICENSE = "GPL"
>   HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
>   SECTION = "libs"
>   LICENSE = "GPL"
>  -PR = "r7"
>  +PR = "r8"
>   PROVIDES = "virtual/libintl"
>
>   SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>  @@ -43,10 +43,5 @@ do_stage () {
>   FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
>
>   do_stage () {
>  -       autotools_stage_includes
>  -       oe_libinstall -so -C gettext-tools/lib libgettextlib ${STAGING_LIBDIR}/
>  -       oe_libinstall -so -C gettext-tools/src libgettextpo ${STAGING_LIBDIR}/
>  -       oe_libinstall -so -C gettext-tools/src libgettextsrc ${STAGING_LIBDIR}/
>  -       oe_libinstall -so -C gettext-tools/intl libintl ${STAGING_LIBDIR}/
>  -       oe_libinstall -so -C gettext-runtime/lib libasprintf ${STAGING_LIBDIR}/
>  +       autotools_stage_all
>   }
>
>
>
>  _______________________________________________
>  Openembedded-commits mailing list
>  Openembedded-commits@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


