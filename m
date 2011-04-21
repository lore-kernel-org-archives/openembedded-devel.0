Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QCvuJ-0003si-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 17:35:04 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QCvs1-0003Q7-GB from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 08:32:41 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 21 Apr 2011 08:32:33 -0700
Received: from [172.30.80.171] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 21 Apr 2011 08:32:41 -0700
Message-ID: <4DB04E0D.1080508@mentor.com>
Date: Thu, 21 Apr 2011 08:32:29 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1303336806-30682-1-git-send-email-mporter@ti.com>
In-Reply-To: <1303336806-30682-1-git-send-email-mporter@ti.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 21 Apr 2011 15:32:33.0016 (UTC)
	FILETIME=[553DEF80:01CC0039]
Subject: Re: [PATCH][2011.03-maintenance] ffmpeg: switch to libav
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
X-List-Received-Date: Thu, 21 Apr 2011 15:35:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/20/2011 03:00 PM, Matt Porter wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> cherry-picked Koen's mainline libav patch to fix invalid git.ffmpeg.org repo
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> Signed-off-by: Matt Porter <mporter@ti.com>
> ---
>  recipes/ffmpeg/ffmpeg_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/ffmpeg/ffmpeg_git.bb b/recipes/ffmpeg/ffmpeg_git.bb
> index d84653a..57b2c31 100644
> --- a/recipes/ffmpeg/ffmpeg_git.bb
> +++ b/recipes/ffmpeg/ffmpeg_git.bb
> @@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
>  DEFAULT_PREFERENCE_angstrom = "1"
>  DEFAULT_PREFERENCE_shr = "1"
>  
> -SRC_URI = "git://git.ffmpeg.org/ffmpeg.git;protocol=git"
> +SRC_URI = "git://git.libav.org/libav.git;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNsE4NAAoJEI4NMjfc3nJxMCkH/38h8vHX/EM0e7xyIk3yiSht
hDDkm0pXeyBlfsAtwJIPg1BB9sl4owXzyjhyi2Ffx1peCvFGCJUHJItFtI+Hu/Og
vXCvgBRarK7Gq4mQE/RerjmWBpKcUW/FjbuOb+TP8CwAZ+szhd8l5LrFQRBV3uoq
9+3z5hUgPs7jsxfNfoJRqmWev5sktFU3LRXcHZ0q2LJpJR2syOqVrjA2gjYIzdRV
dtTwJV/RQOcGDnZNPKn5WIz3I8bg/nINliMu7vWoOULm/XNV4MjsfRHvzIdMmpGL
oXgdClmm7xQK2t0ArrEz7rF/tfmF8hO32GtScM/Ry1fzTBVQrRA3f4/7mQnexxA=
=7kvB
-----END PGP SIGNATURE-----


