Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Aug 2017 20:08:08 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id DD5DF782F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 20:08:08 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1dcdDr-0002p2-0M for openembedded-devel@lists.openembedded.org;
	Tue, 01 Aug 2017 21:52:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 1 Aug 2017 21:52:49 +0200
Message-ID: <olqm6a$87a$1@blaine.gmane.org>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
In-Reply-To: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Tue, 01 Aug 2017 20:08:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Op 01-08-17 om 19:01 schreef Randy MacLeod:
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

Does python-wand work with this version?


> --- .../imagemagick/{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb}      | 6 +++--- 1 file changed, 3 insertions(+), 3 deletions(-) rename
> meta-oe/recipes-support/imagemagick/{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb} (96%)
> 
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb similarity index 96% rename from
> meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb index b8ee6e7be..6f967c3a1 100644 ---
> a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb @@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng
> librsvg tiff zlib fftw freetype" # Important note: tarballs for all patchsets within a version are deleted when # a new pachset is created. To avoid multiple patches for each
> patchset, try to # update to the last pachset of a version -PATCHSET = "6" +PATCHSET = "4" SRC_URI =
> "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \ " -SRC_URI[md5sum] = "dfaa2bd61f65d67ea8d5307ed6cd197f" -SRC_URI[sha256sum] =
> "f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab" +SRC_URI[md5sum] = "079a857268536862148b00efcf3ad75a" +SRC_URI[sha256sum] =
> "5fe1ce7d78befb5c8aa7f8ae69710d0f78063d2e3a35c656521a3ce468ea733b"
> 
> S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
> 
> 



