Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 804D96C20D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2019 16:59:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2UGxAl7031403
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 30 Mar 2019 09:59:20 -0700
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 30 Mar 2019 09:58:57 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20190329204710.22747-1-Randy.MacLeod@windriver.com>
	<CA+chaQdaQJOXCjvx8F-5NQa=13eiPzQEGaE5XUF2KhLtP3RYWw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <86545b49-1e32-2d79-c8c4-4c376be1afd2@windriver.com>
Date: Sat, 30 Mar 2019 12:58:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQdaQJOXCjvx8F-5NQa=13eiPzQEGaE5XUF2KhLtP3RYWw@mail.gmail.com>
X-Originating-IP: [172.25.44.10]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Sat, 30 Mar 2019 16:59:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 3/29/19 5:34 PM, Martin Jansa wrote:
> Don't use github archive which are generated from time to time with 
> different checksums. Either use developer uploaded releases (if 
> available) or git fetcher.

Done. Using git.

Armin,
I might add a non-default 4.0 next week but
then again, I might not. :)

../Randy
> 
> On Fri, Mar 29, 2019 at 9:47 PM Randy MacLeod 
> <Randy.MacLeod@windriver.com <mailto:Randy.MacLeod@windriver.com>> wrote:
> 
>     The previous SRC_URI did not work for the new version and
>     when looking at the site, users are required to navigate
>     through a click-through license agreement.
> 
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>     <mailto:Randy.MacLeod@windriver.com>>
>     ---
>       .../wolfssl/{wolfssl_3.15.7.bb <http://wolfssl_3.15.7.bb> =>
>     wolfssl_3.15.8.bb <http://wolfssl_3.15.8.bb>}         | 5 +++--
>       1 file changed, 3 insertions(+), 2 deletions(-)
>       rename
>     meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb
>     <http://wolfssl_3.15.7.bb> => wolfssl_3.15.8.bb
>     <http://wolfssl_3.15.8.bb>} (78%)
> 
>     diff --git
>     a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>     <http://wolfssl_3.15.7.bb>
>     b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>     <http://wolfssl_3.15.8.bb>
>     similarity index 78%
>     rename from
>     meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>     <http://wolfssl_3.15.7.bb>
>     rename to
>     meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>     <http://wolfssl_3.15.8.bb>
>     index 0a0a6075d..7690925f8 100644
>     --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>     <http://wolfssl_3.15.7.bb>
>     +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>     <http://wolfssl_3.15.8.bb>
>     @@ -13,8 +13,9 @@ PROVIDES += "cyassl"
>       RPROVIDES_${PN} = "cyassl"
> 
>       SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip
>     <https://www.wolfssl.com/wolfssl-$%7BPV%7D.zip>"
>     -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
>     -SRC_URI[sha256sum] =
>     "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
>     +SRC_URI = "https://github.com/wolfSSL/wolfssl/archive/v${PV}.zip
>     <https://github.com/wolfSSL/wolfssl/archive/v$%7BPV%7D.zip>"
>     +SRC_URI[md5sum] = "5ba7af2bae27716a3d90e55565a08784"
>     +SRC_URI[sha256sum] =
>     "34605bb540ed091b1e4b2f14a1f6c7e3f26302f7c65f46378a27a6f0aa944881"
> 
>       inherit autotools
> 
>     -- 
>     2.17.0
> 
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


-- 
# Randy MacLeod
# Wind River Linux

