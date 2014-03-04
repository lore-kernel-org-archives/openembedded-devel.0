Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 683DF60577
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 20:00:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1X002THGW44912@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	04 Mar 2014 14:00:05 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 77DED20363; Tue,
	04 Mar 2014 15:00:03 -0500 (EST)
Date: Tue, 04 Mar 2014 15:00:03 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140304200003.GE22890@denix.org>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>
	<1393734165-15082-2-git-send-email-net147@gmail.com>
MIME-version: 1.0
In-reply-to: <1393734165-15082-2-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH v4 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Tue, 04 Mar 2014 20:00:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Mar 02, 2014 at 03:22:45PM +1100, Jonathan Liu wrote:
> This adds the necessary target packages for development with all of the
> Qt 5 modules.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../packagegroup-qt5-toolchain-target.bb           | 80 ++++++++++++++++++----
>  1 file changed, 65 insertions(+), 15 deletions(-)
> 
> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> index 997df18..25983dc 100644
> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> @@ -9,32 +9,82 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>  
>  # Requires meta-ruby to work
>  USE_RUBY = " \
> -    qtwebkit-mkspecs \
>      qtwebkit-dev \
> +    qtwebkit-mkspecs \
> +    qtwebkit-qmlplugins \
> +"
> +
> +# Requires Wayland to work
> +USE_WAYLAND = " \
> +    qtwayland-dev \
> +    qtwayland-mkspecs \
> +    qtwayland-plugins \
> +    qtwayland-tools \
> +"
> +
> +# Requires X11 to work
> +USE_X11 = " \
> +    qtx11extras-dev \
> +    qtx11extras-mkspecs \
>  "
>  
>  RDEPENDS_${PN} += " \
>      packagegroup-core-standalone-sdk-target \
>      libsqlite3-dev \
> -    qtbase-mkspecs \
> -    qtscript-mkspecs \
> -    qtxmlpatterns-mkspecs \
> -    qtdeclarative-mkspecs \
> -    qtsensors-mkspecs \
> +    qt3d-dev \
>      qt3d-mkspecs \
> -    qtlocation-mkspecs \
> -    qtsvg-mkspecs \
> +    qt3d-qmlplugins \
>      qtbase-dev \
> +    qtbase-fonts \
> +    qtbase-mkspecs \
> +    qtbase-plugins \
> +    qtbase-staticdev \
> +    qtconnectivity-dev \
> +    qtconnectivity-mkspecs \
> +    qtconnectivity-qmlplugins \
>      qtdeclarative-dev \
> -    qtscript-dev \
> -    qt3d-dev \
> +    qtdeclarative-mkspecs \
> +    qtdeclarative-plugins \
> +    qtdeclarative-qmlplugins \
> +    qtdeclarative-staticdev \
> +    qtgraphicaleffects-qmlplugins \
> +    qtimageformats-dev \
> +    qtimageformats-plugins \
>      qtlocation-dev \
> +    qtlocation-mkspecs \
> +    qtlocation-plugins \
> +    qtlocation-qmlplugins \
> +    qtmultimedia-dev \
> +    qtmultimedia-mkspecs \
> +    qtmultimedia-plugins \
> +    qtmultimedia-qmlplugins \
> +    qtquick1-dev \
> +    qtquick1-mkspecs \
> +    qtquick1-plugins \
> +    qtquick1-qmlplugins \
> +    qtquickcontrols-qmlplugins \
> +    qtscript-dev \
> +    qtscript-mkspecs \
>      qtsensors-dev \
> +    qtsensors-mkspecs \
> +    qtsensors-plugins \
> +    qtsensors-qmlplugins \
> +    qtserialport-dev \
> +    qtserialport-mkspecs \
>      qtsvg-dev \
> -    qtxmlpatterns-dev \
> -    qtdeclarative-dev \
> -    qtdeclarative-plugins \
> -    qtdeclarative-qmlplugins \
> -    qtgraphicaleffects-dev \
> +    qtsvg-mkspecs \
> +    qtsvg-plugins \
> +    qtsystems-dev \
> +    qtsystems-mkspecs \
> +    qtsystems-qmlplugins \
> +    qttools-dev \
> +    qttools-mkspecs \
> +    qttools-plugins \
> +    qttools-staticdev \
> +    qttools-tools \
> +    ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
>      ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \

Like I said in v2 comment - I like the conditionals here. Can we possibly make 
other modules as conditionals as well? I.e. qt3d or qtwebkit when they are not 
built for the target?

-- 
Denys


> +    qtxmlpatterns-dev \
> +    qtxmlpatterns-mkspecs \
>  "
> -- 
> 1.9.0
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

