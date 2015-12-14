Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id 284B7601F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 01:10:17 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym04.jp.fujitsu.com with smtp
	id 0bdf_f1cb_d39c69b6_4482_4936_a032_e24d27e2374e;
	Mon, 14 Dec 2015 10:10:09 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E48AAC024D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:10:09 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 2624BD8;
	Mon, 14 Dec 2015 10:10:09 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 13BB61E0089;
	Mon, 14 Dec 2015 10:10:09 +0900 (JST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1449815135-28537-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CA+chaQcS0qKyyieAs+LunvTCgeLRr++u+jxeypQrv_WVXsBVjA@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <566E1735.4050700@jp.fujitsu.com>
Date: Mon, 14 Dec 2015 10:11:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcS0qKyyieAs+LunvTCgeLRr++u+jxeypQrv_WVXsBVjA@mail.gmail.com>
X-TM-AS-MML: disable
Subject: Re: [PATCH] curl: upgrade to 7.45
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
X-List-Received-Date: Mon, 14 Dec 2015 01:10:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Sorry for the wrong ML, it should go to oe-core.
Please ignore it.

Fan Xin

On 2015年12月11日 18:28, Martin Jansa wrote:
> wrong ML
>
> On Fri, Dec 11, 2015 at 7:25 AM, Fan Xin <fan.xin@jp.fujitsu.com
> <mailto:fan.xin@jp.fujitsu.com>> wrote:
>
>     Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com
>     <mailto:fan.xin@jp.fujitsu.com>>
>     ---
>       meta/recipes-support/curl/{curl_7.44.0.bb <http://curl_7.44.0.bb>
>     => curl_7.45.0.bb <http://curl_7.45.0.bb>} | 4 ++--
>       1 file changed, 2 insertions(+), 2 deletions(-)
>       rename meta/recipes-support/curl/{curl_7.44.0.bb
>     <http://curl_7.44.0.bb> => curl_7.45.0.bb <http://curl_7.45.0.bb>} (93%)
>
>     diff --git a/meta/recipes-support/curl/curl_7.44.0.bb
>     <http://curl_7.44.0.bb> b/meta/recipes-support/curl/curl_7.45.0.bb
>     <http://curl_7.45.0.bb>
>     similarity index 93%
>     rename from meta/recipes-support/curl/curl_7.44.0.bb
>     <http://curl_7.44.0.bb>
>     rename to meta/recipes-support/curl/curl_7.45.0.bb
>     <http://curl_7.45.0.bb>
>     index f6d350e..a7ed778 100644
>     --- a/meta/recipes-support/curl/curl_7.44.0.bb <http://curl_7.44.0.bb>
>     +++ b/meta/recipes-support/curl/curl_7.45.0.bb <http://curl_7.45.0.bb>
>     @@ -14,8 +14,8 @@ SRC_URI =
>     "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>       #
>       SRC_URI += " file://configure_ac.patch"
>
>     -SRC_URI[md5sum] = "6b952ca00e5473b16a11f05f06aa8dae"
>     -SRC_URI[sha256sum] =
>     "1e2541bae6582bb697c0fbae49e1d3e6fad5d05d5aa80dbd6f072e0a44341814"
>     +SRC_URI[md5sum] = "62c1a352b28558f25ba6209214beadc8"
>     +SRC_URI[sha256sum] =
>     "65154e66b9f8a442b57c436904639507b4ac37ec13d6f8a48248f1b4012b98ea"
>
>       inherit autotools pkgconfig binconfig multilib_header
>
>     --
>     1.8.4.2
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


