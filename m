Return-Path: <morandg@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 504536AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 12:41:21 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id i50so3834281qgf.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=coWg61yUxcQyuXzYC61Phv9d5rxha7u6kUBxJaOxu1g=;
	b=ZraFbIPhN0qvfXoJDst/L6esXZRk2R2w2q8EZeLAIlFdbWrUJlzFe1DqawyIDH+ew3
	KcAF/wTbtrX8g3l6ZZ2/UptKSOFwSqEV6Pg1CiNMMj6pFZl8fQ/9L/lY5ZU6kdflkpFU
	boJjtL8s9jfXCWbnPFYkShzIP6a1W+W2mKbCGPAOXCFsFIZQ3JPKBa8T447FdLJHwa6b
	ttRmPS8K0bBdlL+ummRyHg+oCeaD6Q/8PmJcrBbhgIhEVgd/XFZ7L++nixetKKi1OLiA
	7cRohfCO4qDHi/EkTgEsX75VAvpolN241wN2l3sokU7rmMhOoziChS4X9S4oi5hN8uqf
	SfxA==
MIME-Version: 1.0
X-Received: by 10.224.125.4 with SMTP id w4mr8638495qar.20.1412944882997; Fri,
	10 Oct 2014 05:41:22 -0700 (PDT)
Received: by 10.140.242.11 with HTTP; Fri, 10 Oct 2014 05:41:22 -0700 (PDT)
In-Reply-To: <b03eb983876d49959ca37bf40964fa6f@ebro.netmodule.intranet>
References: <1412690904-15774-1-git-send-email-guy.morand@netmodule.com>
	<20141010100938.GH12322@jama>
	<b03eb983876d49959ca37bf40964fa6f@ebro.netmodule.intranet>
Date: Fri, 10 Oct 2014 14:41:22 +0200
Message-ID: <CAEQpzu8-mP3DBz_db1dJ6rFdz=8x-k5=+meVMsgsaxt4b6DgAg@mail.gmail.com>
From: Guy Morand <morandg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: FW: [meta-oe][PATCH] iperf3: Adds git and 3.0.8 version
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
X-List-Received-Date: Fri, 10 Oct 2014 12:41:24 -0000
X-Groupsio-MsgNum: 52437
Content-Type: multipart/mixed; boundary=001a11c248f8d7572b050510dddc

--001a11c248f8d7572b050510dddc
Content-Type: text/plain; charset=UTF-8

Thanks for your review!

No, I haven't, I'm working with the "dora" branch ...

I will make a setup with the master branch to test it and resend the patch.

Kind regards,

Guy

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]
Sent: Friday, October 10, 2014 12:10 PM
To: openembedded-devel@lists.openembedded.org
Cc: Guy Morand
Subject: Re: [oe] [meta-oe][PATCH] iperf3: Adds git and 3.0.8 version

On Tue, Oct 07, 2014 at 04:08:24PM +0200, Guy Morand wrote:
> iperf3 is the new successor of iperf. The project is now mature enough
> as it started in 2009 and has stable releases. It supports reporting
> results in the portable JSON format, provides more information than
> iperf does and also adds some features from other tools such as nuttcp
> and netperf but were missing from the original iperf.

Have you tested this with oe-core master?

It probably needs patch to pass -foreign to automake:

| NOTE: Executing ACLOCAL="aclocal
| --system-acdir=/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64
| -oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0/build/aclocal-copy/
| --automake-acdir=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x8
| 6_64-linux/usr/share/aclocal-1.14" autoreconf --verbose --install
| --force --exclude=autopoint -I
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/iperf
| 3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/config/
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
| --system-acdir=/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64
| -oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0/build/aclocal-copy/
| --automake-acdir=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x8
| 6_64-linux/usr/share/aclocal-1.14 -I
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/iperf
| 3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/config/ -I
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/iperf
| 3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/config/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `config'.
| libtoolize: copying file `config/ltmain.sh'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to
| configure.ac and
| libtoolize: rerunning libtoolize, to keep the correct libtool macros
in-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| libtoolize: `AC_PROG_RANLIB' is rendered obsolete by `LT_INIT'
| autoreconf: running:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bi
| n/autoconf
| --include=/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-l
| inux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/config/ --force
| autoreconf: running:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bi
| n/autoheader
| --include=/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-l
| inux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/config/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| Makefile.am: error: required file './NEWS' not found
| Makefile.am: error: required file './README' not found
| Makefile.am: error: required file './AUTHORS' not found
| Makefile.am: error: required file './ChangeLog' not found
| Makefile.am: installing './COPYING' using GNU General Public License v3
file
| Makefile.am:     Consider adding the COPYING file to the version control
system
| Makefile.am:     for your code, to avoid questions about which license
your project uses
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/iperf
| 3/3.0.8+gitAUTOINC+bcd038dd93-r0/temp/log.do_configure.16696)
NOTE: recipe iperf3-3.0.8+gitAUTOINC+bcd038dd93-r0: task do_configure:
Failed

>
> Signed-off-by: Guy Morand <guy.morand@netmodule.com>
> ---
>  meta-oe/recipes-benchmark/iperf3/iperf3.inc      |   20
++++++++++++++++++++
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb |    6 ++++++
>  meta-oe/recipes-benchmark/iperf3/iperf3_git.bb   |    7 +++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3.inc
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
>
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3.inc
> b/meta-oe/recipes-benchmark/iperf3/iperf3.inc
> new file mode 100644
> index 0000000..029a144
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3.inc
> @@ -0,0 +1,20 @@
> +SUMMARY = "Network benchmark tool"
> +DESCRIPTION = \
> +"iperf is a tool for active measurements of the maximum achievable
> +bandwidth \ on IP networks. It supports tuning of various parameters
> +related to timing, \ protocols, and buffers. For each test it reports
> +the bandwidth, loss, and \ other parameters."
> +HOMEPAGE = "http://software.es.net/iperf/"
> +SECTION = "console/network"
> +BUGTRACKER = "https://github.com/esnet/iperf/issues"
> +AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <
websupport@lbl.gov>"
> +LICENSE = "BSD"
> +
> +BRANCH = "master"
> +SRC_URI = "\
> +           git://github.com/esnet/iperf.git;branch=${BRANCH} \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
> b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
> new file mode 100644
> index 0000000..a39deff
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
> @@ -0,0 +1,6 @@
> +require iperf3.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ab59a0c3a4bc3954d1ece68ea19d77a4"
> +
> +BRANCH = "3.0-STABLE"
> +SRCREV = "24d5cdec3731bc589f6cb7c359d8311dcaa41854"
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
> b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
> new file mode 100644
> index 0000000..77ebe15
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
> @@ -0,0 +1,7 @@
> +require iperf3.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=062ab1bc33fae1926387ac1274cb0873"
> +
> +PV = "3.0.8+git${SRCPV}"
> +SRCREV = "${AUTOREV}"
> +
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--001a11c248f8d7572b050510dddc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f6426351f6a2422a_0.1

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYyDQoNCmlFWUVB
UkVDQUFZRkFsUTNzR0lBQ2drUU4xVWp0MlYyZ0J5MHZ3Q2dnOWltUi9BNmVvNlRJYkU2SEFkZWY2
eWgNClBZc0FvSzdTZWU5ekhuZm52cnhvQzcydE5Ed2Z0SWhVDQo9ZkxkSA0KLS0tLS1FTkQgUEdQ
IFNJR05BVFVSRS0tLS0tDQo=

--001a11c248f8d7572b050510dddc--
