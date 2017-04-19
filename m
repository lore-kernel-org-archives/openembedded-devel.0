Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 504A571AFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:18:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3J9I6pL005162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Apr 2017 02:18:06 -0700 (PDT)
Received: from [128.224.162.239] (128.224.162.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 02:18:05 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1492583315-67555-1-git-send-email-zhixiong.chi@windriver.com>
	<CAHiDW_GhMU0Gi6WZnOdxeUs1pXJQrEgW74S7-WB66_inzu90HA@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <58F72B4C.80805@windriver.com>
Date: Wed, 19 Apr 2017 17:18:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_GhMU0Gi6WZnOdxeUs1pXJQrEgW74S7-WB66_inzu90HA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] autoconf-archive: drop m4files confliction with gnome-common
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Apr 2017 09:18:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年04月19日 15:34, Jussi Kukkonen wrote:
> On 19 April 2017 at 09:28, Zhixiong Chi <zhixiong.chi@windriver.com 
> <mailto:zhixiong.chi@windriver.com>> wrote:
>
>     Delete the conflicting m4files with gnome-common to avoid the
>     confliction,
>     and the two m4 files will be installed by gnome-common that comes from
>     oe-core, then set rdepends to gnome-common.
>
>
> For those who missed it, there was a discussion on oe-core already (a 
> suggested logical dependency from gnome-common to autoconf-archive was 
> not accepted because oe-core should not depend on meta-oe).
>
> The real solution might be to get rid of gnome-common altogether -- at 
> least for oe-core this will be relatively easy as its usage is 
> historical. Maybe something in meta-oe still requires gnome-common but 
> at least the dependencies could be more correct if the gnome-common 
> recipe was in the same repo as autoconf-archive: the files could be 
> deleted in gnome-common and gnome-common could rdepend on 
> autoconf-archive as was originally suggested.
>
> If we weren't so close to Pyro release I would suggest the above... 
> even now I personally wouldn't object if someone sent patches for that 
> but I can see how this hack may be less invasive. In any case I've 
> filed a bug for removing gnome-common and will do that during next 
> cycle if no-one else gets to it before.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11380
>
OK, I got it, if we will drop gnome-common from oe-core next cycle, 
indeed this patch is useless.

Thanks.
>
> Cheers,
>   Jussi
>
>
>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com
>     <mailto:zhixiong.chi@windriver.com>>
>     ---
>      .../autoconf-archive/autoconf-archive.inc |  2 +-
>      .../autoconf-archive/delete-some-m4-files.patch    | 23
>     ++++++++++++++++++++++
>      .../autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>                |  4 ++++
>      3 files changed, 28 insertions(+), 1 deletion(-)
>      create mode 100644
>     meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
>
>     diff --git
>     a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     index 779115a..9684d1f 100644
>     --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     @@ -6,7 +6,7 @@ DEPENDS += "m4-native"
>      DEPENDS_class-native = "m4-native gnu-config-native"
>      DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>
>     -RDEPENDS_${PN} = "m4 gnu-config"
>     +RDEPENDS_${PN} = "m4 gnu-config gnome-common"
>      RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>      RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>
>     diff --git
>     a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
>     new file mode 100644
>     index 0000000..2aa788b
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
>     @@ -0,0 +1,23 @@
>     +Delete two m4files ax_code_coverage.m4 and ax_check_enable_debug.m4
>     +to avoid installing conflicts. These two files can be installed by
>     +gnome-common from oe-core, even if the files in gnmoe-common is
>     +copied from autoconf-archive(the reason is that the old version
>     +autoconf-archive don't provide the two files).
>     +After upgrading to the new version, we need to drop them in meta-oe
>     +and then set rdepends to gnome-common(oe-core)
>     +
>     +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com
>     <mailto:zhixiong.chi@windriver.com>>
>     +
>     +Index: a/configure.ac <http://configure.ac>
>     +===================================================================
>     +--- a/configure.ac <http://configure.ac>     2016-09-16
>     06:00:00.000000000 +0800
>     ++++ b/configure.ac <http://configure.ac>     2017-04-18
>     17:43:05.946290554 +0800
>     +@@ -19,7 +19,7 @@
>     +
>     + AC_PROG_SED
>     +
>     +-M4FILES="m4_esyscmd([echo -n m4/*.m4])"
>     ++M4FILES="m4_esyscmd([echo -n m4/*.m4 | sed -e
>     's:m4/ax_code_coverage.m4 ::g'|sed -e
>     's:m4/ax_check_enable_debug.m4 ::g'])"
>     + AC_SUBST([M4FILES])
>     +
>     + TEXIFILES="m4_esyscmd([cd m4 && echo -n *.m4 | sed -e
>     's/\.m4/.texi/g'])"
>     diff --git
>     a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     index 0a1a771..561b57b 100644
>     ---
>     a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     +++
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     @@ -9,5 +9,9 @@ LIC_FILES_CHKSUM =
>     "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>      SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
>      SRC_URI[sha256sum] =
>     "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
>
>     +SRC_URI += "\
>     +        file://delete-some-m4-files.patch \
>     +"
>     +
>      EXTRA_OECONF += "ac_cv_path_M4=m4"
>      BBCLASSEXTEND = "native nativesdk"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


