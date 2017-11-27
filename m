Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 886DF6006E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 08:16:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAR8GM3v024128
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Nov 2017 00:16:22 -0800 (PST)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 27 Nov 2017 00:16:21 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <1508833184-28676-1-git-send-email-Qi.Chen@windriver.com>
	<55eb9098-4794-addc-b7b1-150da89a56de@windriver.com>
	<CA+chaQf_iD91Umqtkk5DQA9m_5DQJQKaY2MG8oowhiq9QOGRYg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <eab4915d-ef86-9852-3e90-df6fe2dda3bd@windriver.com>
Date: Mon, 27 Nov 2017 16:17:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQf_iD91Umqtkk5DQA9m_5DQJQKaY2MG8oowhiq9QOGRYg@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnome-common: add PACKAGECONFIG for autoconf-archive
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
X-List-Received-Date: Mon, 27 Nov 2017 08:16:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

I sent out patch to oe-core to fix the problem you mentioned.
Now oe-core has merged the following patch. Could you please help 
merging this patch?

commit a9be3c445a047bc6fadf65b0d0f874c86c593e5d
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Mon Nov 13 13:26:22 2017 +0800

     autoconf-archive: inherit allarch and fix package splitting

     autoconf-archive is a set of common m4 macros, it should be allarch,
     just like it is on other distros.

     Also fix package splitting. With current package splitting,
     autoconf-archive itself contains almost nothing, the m4 macros are
     contained in its dev package. However, autoconf-archive should
     contain those m4 marcos itself.

     (From OE-Core rev: 8cbf5523f002e8ae0d8123755d2cbc3e8b0138ac)

     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
     Signed-off-by: Ross Burton <ross.burton@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Best Regards,
Chen Qi

On 11/09/2017 05:16 PM, Martin Jansa wrote:
> gnome-common is marked as allarch, autoconf-archive isn't. So 
> gnome-common cannot depend on it as it is now.
>
> This change causes:
>
>  === Comparing signatures for task do_configure.sigdata between 
> qemux86 and qemux86copy ===
> ERROR: gnome-common different signature for task do_configure.sigdata 
> between qemux86 and qemux86copy
> runtaskdeps changed:
> gnome-common/gnome-common_3.18.0.bb.do_prepare_recipe_sysroot with 
> hash f3130e0be68211325008e37b3d49460b
>  changed to
> gnome-common/gnome-common_3.18.0.bb.do_prepare_recipe_sysroot with 
> hash 0360cfa01ddf508a7670af2fcb306e20
> Hash for dependent task 
> gnome-common/gnome-common_3.18.0.bb.do_prepare_recipe_sysroot changed 
> from f3130e0be68211325008e37b3d49460b to 0360cfa01ddf508a7670af2fcb306e20
>
>
> On Tue, Nov 7, 2017 at 3:10 AM, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     ping
>
>
>     On 10/24/2017 04:19 PM, Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com> wrote:
>
>         From: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>
>
>         Add PACKAGECONFIG for autoconf-archive. Default to enable it
>         to avoid
>         m4 file conflicts between gnome-common and autoconf-archive.
>
>         e.g.
>         IMAGE_INSTALL_append = " gnome-common autoconf-archive-dev"
>         bitbake <image>
>
>         We enable autoconf-archive PACKAGECONFIG to avoid the
>         following error.
>
>         Error: Transaction check error:
>            file /usr/share/aclocal/ax_check_enable_debug.m4 conflicts
>         between attempted installs of gnome-common-3.18.0-r0.noarch
>         and autoconf-archive-dev-2016.09.16-r0.core2_64
>            file /usr/share/aclocal/ax_code_coverage.m4 conflicts
>         between attempted installs of gnome-common-3.18.0-r0.noarch
>         and autoconf-archive-dev-2016.09.16-r0.core2_64
>
>         Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>
>         ---
>           meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>         <http://gnome-common_3.18.0.bb> | 4 ++++
>           1 file changed, 4 insertions(+)
>
>         diff --git
>         a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>         <http://gnome-common_3.18.0.bb>
>         b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>         <http://gnome-common_3.18.0.bb>
>         index 06f3bb3..d874164 100644
>         ---
>         a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>         <http://gnome-common_3.18.0.bb>
>         +++
>         b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>         <http://gnome-common_3.18.0.bb>
>         @@ -14,6 +14,10 @@ SRC_URI[archive.sha256sum] =
>         "22569e370ae755e04527b76328befc4c73b62bfd4a572499fd
>           EXTRA_AUTORECONF = ""
>           DEPENDS = ""
>           +# Default to enable autoconf-archive to avoid conflicts
>         +PACKAGECONFIG ??= "autoconf-archive"
>         +PACKAGECONFIG[autoconf-archive] = "--with-autoconf-archive,
>         --without-autoconf-archive, autoconf-archive"
>         +
>           FILES_${PN} += "${datadir}/aclocal"
>           FILES_${PN}-dev = ""
>
>
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


