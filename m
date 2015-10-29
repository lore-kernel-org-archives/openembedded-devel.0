Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f195.google.com (mail-wi0-f195.google.com
	[209.85.212.195])
	by mail.openembedded.org (Postfix) with ESMTP id E2D0675A38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:26:50 +0000 (UTC)
Received: by wicuk10 with SMTP id uk10so7250810wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=dhnUWty+KQPfCLfpqB51AbzduLcQHiVcF2JP9i11REc=;
	b=WEdIPrYDPsledoWXVwN8hKLe97j5q54dXmmQtO6HXiJPBaqopdQnF/KLA0nV8iOaNw
	aMP/mVESVqN3BLnwJL20JHk0Oy3MbOfxAulvSI0i6GmCGoDgrBa4Wtb5JEHgRmpa+XAb
	WSYl3n1rLp4rU62sx0creDjkuSL0urAgV8F4trljzyoqwLcutwG503ktWk6tMUwXSlrD
	kSdn7RwBnImJPIs07OE5+VqD58kkEsfUa0T6k3bIAZTdFQXDrUDVhAnhcbRGu214Ktrr
	dVSx7uT3zUd03dQXYmBoRJg6wlKs9W2g1tUq9ASO6Spxa0Zgzt4WYSEB49Yo5bnpyBLi
	HHdg==
X-Received: by 10.28.91.72 with SMTP id p69mr6373121wmb.49.1446118009826;
	Thu, 29 Oct 2015 04:26:49 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id w9sm1314587wjf.20.2015.10.29.04.26.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 04:26:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <5631E9F1.20104@skidata.com>
Date: Thu, 29 Oct 2015 12:26:48 +0100
Message-Id: <F03B4725-C610-4875-A1B8-E29106FA8A19@gmail.com>
References: <C3B2E501-2242-41EF-B8CD-9F5A9D395691@gmail.com>
	<5631E9F1.20104@skidata.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 2/4] meta-java: rely on well known bootstrap-path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 11:26:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 29.10.2015 um 10:42 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>=20
> On 10/28/2015 06:59 PM, Jens Rehsack wrote:
>> Instead of potential circular depending virtual/javac-native (even =
this
>> recipe provides such a useable java-native), rely on well known path
>> via cacao-native to build up to icedtea7-native in reliable manner.
>>=20
>> virtual/javac-native should be used by parts not belonging to the =
bootstrap
>> phase.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>=20
> Hi Jens,
> I get following error during the OpenJDK 7u91 build for a CortexA9
> target with VFP & X11.
> Currently I have no time to dig deeper into the problem. Sorry for =
that!
> Maybe you can take a look at it?
>=20
>=20
> ERROR: Function failed: do_configure (log file is located at
> =
/build/myTarget/tmp/work/x86_64-linux/cacao-native/1.6.1-r0/temp/log.do_co=
nfigure.8290)
> ERROR: Logfile of failure stored in:
> =
/build/myTarget/tmp/work/x86_64-linux/cacao-native/1.6.1-r0/temp/log.do_co=
nfigure.8290
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `.'.
> | libtoolize: copying file `./config.guess'
> | libtoolize: copying file `./config.sub'
> | libtoolize: copying file `./install-sh'
> | libtoolize: copying file `./ltmain.sh'
> | libtoolize: putting macros in `m4'.
> | libtoolize: copying file `m4/libtool.m4'
> | libtoolize: You should add the contents of `m4/libtool.m4' to
> `aclocal.m4'.
> | libtoolize: copying file `m4/ltoptions.m4'
> | libtoolize: You should add the contents of `m4/ltoptions.m4' to
> `aclocal.m4'.
> | libtoolize: copying file `m4/ltsugar.m4'
> | libtoolize: You should add the contents of `m4/ltsugar.m4' to
> `aclocal.m4'.
> | libtoolize: copying file `m4/ltversion.m4'
> | libtoolize: copying file `m4/lt~obsolete.m4'
> | libtoolize: You should add the contents of `m4/lt~obsolete.m4' to
> `aclocal.m4'.
> | libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to
> configure.ac and
> | libtoolize: rerunning libtoolize, to keep the correct libtool macros
> in-tree.
> | rm: cannot remove 'src/mm/boehm-gc/ltmain.sh': No such file or =
directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> =
/build/myTarget/tmp/work/x86_64-linux/cacao-native/1.6.1-r0/temp/log.do_co=
nfigure.8290)
> ERROR: Task 693
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/cacao/cacao_1.6.1.b=
b,
> do_configure) failed with exit code '1'
>=20
>=20
>=20
> best regards,
> Richard L
> --

Hi Richard,

please run a bitbake -c cleansstate on cacao-native and use patch 3/4, =
too.
I tried to avoid such situations for people by wiping out relics from =
former
builds on successful passing.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


