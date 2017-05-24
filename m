Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 03E8A780CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 13:16:53 +0000 (UTC)
Received: from [192.168.10.79] (pd95c9a6f.dip0.t-ipconnect.de [217.92.154.111])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 7FDDF280435;
	Wed, 24 May 2017 13:16:25 +0000 (UTC)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170523123448.5051-1-daniel@zonque.org>
	<CA+chaQdXu3XRfDz0ALkaMZnZsunnm-nrH6+m2q1SyK_iTia9=A@mail.gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <23a92144-8853-50b5-2c4d-24ea5fd82208@zonque.org>
Date: Wed, 24 May 2017 15:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdXu3XRfDz0ALkaMZnZsunnm-nrH6+m2q1SyK_iTia9=A@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meson: update to version 0.40.1
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
X-List-Received-Date: Wed, 24 May 2017 13:16:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 05/23/2017 11:43 PM, Martin Jansa wrote:
> Please check 2 meson changes from Ricardo Ribalda Delgado sent few days
> before yours and rebase your change on top of it.
> 
> One of those patches don't apply now on this version:
> http://errors.yoctoproject.org/Errors/Details/143049/

Oh, sorry for that. I missed that other patch.

I've asked upstream if there is a better solution so we don't have to
touch meson in OE. If there isn't any, I'll port the patch.


Thanks!
Daniel



> On Tue, May 23, 2017 at 2:34 PM, Daniel Mack <daniel@zonque.org
> <mailto:daniel@zonque.org>> wrote:
> 
>     Signed-off-by: Daniel Mack <daniel@zonque.org
>     <mailto:daniel@zonque.org>>
>     ---
>      meta-oe/recipes-devtools/meson/{meson_0.37.1.bb
>     <http://meson_0.37.1.bb> => meson_0.40.1.bb
>     <http://meson_0.40.1.bb>} | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>      rename meta-oe/recipes-devtools/meson/{meson_0.37.1.bb
>     <http://meson_0.37.1.bb> => meson_0.40.1.bb
>     <http://meson_0.40.1.bb>} (87%)
> 
>     diff --git a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
>     <http://meson_0.37.1.bb>
>     b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>     <http://meson_0.40.1.bb>
>     similarity index 87%
>     rename from meta-oe/recipes-devtools/meson/meson_0.37.1.bb
>     <http://meson_0.37.1.bb>
>     rename to meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>     <http://meson_0.40.1.bb>
>     index a83af77..2ba2fc8 100644
>     --- a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
>     <http://meson_0.37.1.bb>
>     +++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>     <http://meson_0.40.1.bb>
>     @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
>     "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> 
>      SRC_URI = "git://github.com/mesonbuild/meson.git
>     <http://github.com/mesonbuild/meson.git>"
> 
>     -SRCREV = "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
>     +SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
> 
>      S = "${WORKDIR}/git"
> 
>     --
>     2.9.4
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


