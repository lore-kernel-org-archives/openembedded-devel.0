Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 35E5F61105
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:51:17 +0000 (UTC)
Message-ID: <52440392.5080908@communistcode.co.uk>
Date: Thu, 26 Sep 2013 10:51:14 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1380188747-9731-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1380188747-9731-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [meta-qt5] fix do_rootfs for images with dev-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 26 Sep 2013 09:51:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/09/13 10:45, Andreas Müller wrote:
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for qtquickcontrols-dev:
> |  *     qtquickcontrols (= 5.1.0-r0) *
> |  * opkg_install_cmd: Cannot install package qtquickcontrols-dev.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qtquickcontrols.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickcontrols.inc
> index 63e884e..06b5350 100644
> --- a/recipes-qt/qt5/qtquickcontrols.inc
> +++ b/recipes-qt/qt5/qtquickcontrols.inc
> @@ -1,3 +1,5 @@
>  require qt5.inc
>  
>  DEPENDS += "qtdeclarative"
> +
> +ALLOW_EMPTY_${PN} = "1"
> 

Hi Andreas,

I ran into this problem the other day, and after speaking to Ross
Burton, he suggested that the better way to fix this is with:

RDEPENDS_${PN}-dev = ""

I'm starting to get the feeling that the dev-pkgs feature is also a
little broken, as it seems as though it doesn't handle cases where
sub-packages are installed, but the main package is not.

