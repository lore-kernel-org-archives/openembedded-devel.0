Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 903 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Nov 2017 14:55:42 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 5106677E88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 14:55:42 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1eHsg1-0001gT-7X for openembedded-devel@lists.openembedded.org;
	Thu, 23 Nov 2017 15:40:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 23 Nov 2017 15:40:26 +0100
Message-ID: <ov6mkj$3kb$1@blaine.gmane.org>
References: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
In-Reply-To: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
Subject: Re: [meta-oe][PATCH] Fix PACKAGES assignment for fftw
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
X-List-Received-Date: Thu, 23 Nov 2017 14:55:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Op 23-11-17 om 14:25 schreef Vladan Jovanovic:
> fftw recipe using wrong operator for modifying PACKAGES variable.

Please explain what's wrong with it and show a buildhistory-diff between the 2 builds.


> ---
>  meta-oe/recipes-support/fftw/fftw_3.3.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> index ed14e16..e13684c 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> @@ -65,12 +65,12 @@ do_install() {
>  }
>  
>  
> -PACKAGES =+ "libfftw libfftwl libfftwf"
> +PACKAGES += "libfftw libfftwl libfftwf"
>  FILES_libfftw = "${libdir}/libfftw3.so.* ${libdir}/libfftw3_*.so.*"
>  FILES_libfftwl = "${libdir}/libfftw3l.so.* ${libdir}/libfftw3l_*.so.*"
>  FILES_libfftwf = "${libdir}/libfftw3f.so.* ${libdir}/libfftw3f_*.so.*"
>  
> -PACKAGES =+ "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
> +PACKAGES += "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
>  FILES_fftw-wisdom = "${bindir}/fftw-wisdom"
>  FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
>  FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
> 



