Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id B4CB66AD2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:15:03 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id D755221760
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 08:15:03 +0200 (CEST)
Message-ID: <51C29DF8.70901@pseudoterminal.org>
Date: Thu, 20 Jun 2013 08:15:20 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1371700482-12885-1-git-send-email-nicolas.dechesne@linaro.org>
In-Reply-To: <1371700482-12885-1-git-send-email-nicolas.dechesne@linaro.org>
Subject: Re: [meta-qt5][PATCH] qtbase: typo about virtual/egl depends
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
X-List-Received-Date: Thu, 20 Jun 2013 06:15:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-06-20 05:54, Nicolas Dechesne wrote:
> The proper 'virtual' name for EGL is virtual/egl, not virtual/libegl,
> as per meta/recipes-graphics/mesa/mesa-common.inc.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>   recipes-qt/qt5/qtbase.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 569332e..ee4094b 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -41,7 +41,7 @@ QT_DISTRO_FLAGS_linuxstdbase = "-sm"
>   QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite"
>   
>   # if you want to enable egl/gles2 in your .bbappend, don't forget to add right dependencies, e.g.
> -# GL_DEPENDS = "virtual/libgles2 virtual/libegl"
> +# GL_DEPENDS = "virtual/libgles2 virtual/egl"
>   # QT_GLFLAGS = "-opengl es2 -eglfs"
>   GL_DEPENDS ?= "virtual/libgl"
>   QT_GLFLAGS ?= "-opengl"

This highlights a problem I've noticed in the past. A directory of 
officially defined virtual names would be helpful. Also, since many BSPs 
offer hardware-accelerated OpenVG, a virtual/openvg name would be 
useful. ("vg" and "libvg" are very uncommon, so I'd pick "openvg".)

