Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80D0E6010D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 00:57:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6P0vSxI029558
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2018 17:57:28 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 24 Jul 2018 17:57:27 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
	<1531899089-395618-6-git-send-email-changqing.li@windriver.com>
	<CA+chaQdAwHn0fAj2A6oX5HrbK5zADMmYX0DACO2KEVt55+0ZBQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <7a57a79d-49d4-ac13-ecd7-fee271e0a17f@windriver.com>
Date: Wed, 25 Jul 2018 08:57:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdAwHn0fAj2A6oX5HrbK5zADMmYX0DACO2KEVt55+0ZBQ@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] pps-tools: 0.0.0+gitX -> 1.0.2
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
X-List-Received-Date: Wed, 25 Jul 2018 00:57:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 07/25/2018 12:47 AM, Martin Jansa wrote:
> Why not use RDEPENDS_${PN} instead of RDEPENDS_pps-tools? It's now 
> broken with multilib.
>
> Also meta-oe is using 4 spaces for indentation, would be nice to fix 
> the do_install.

Thanks,  I will send a patch to fix this.

//Sandy
>
> On Wed, Jul 18, 2018 at 9:32 AM <changqing.li@windriver.com 
> <mailto:changqing.li@windriver.com>> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     ---
>      .../pps-tools/{pps-tools_git.bb <http://pps-tools_git.bb> =>
>     pps-tools_1.0.2.bb <http://pps-tools_1.0.2.bb>}              | 5 +++--
>      1 file changed, 3 insertions(+), 2 deletions(-)
>      rename meta-oe/recipes-support/pps-tools/{pps-tools_git.bb
>     <http://pps-tools_git.bb> => pps-tools_1.0.2.bb
>     <http://pps-tools_1.0.2.bb>} (82%)
>
>     diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
>     <http://pps-tools_git.bb>
>     b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
>     <http://pps-tools_1.0.2.bb>
>     similarity index 82%
>     rename from meta-oe/recipes-support/pps-tools/pps-tools_git.bb
>     <http://pps-tools_git.bb>
>     rename to meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
>     <http://pps-tools_1.0.2.bb>
>     index 8bf9036..106be35 100644
>     --- a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
>     <http://pps-tools_git.bb>
>     +++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
>     <http://pps-tools_1.0.2.bb>
>     @@ -4,12 +4,13 @@ HOMEPAGE = "http://linuxpps.org"
>      LICENSE = "GPLv2"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
>     -PV = "0.0.0+git${SRCPV}"
>     -SRCREV = "0deb9c7e135e9380a6d09e9d2e938a146bb698c8"
>     +SRCREV = "cb48b7ecf7079ceba7081c78d4e61e507b0e8d2d"
>      SRC_URI = "git://github.com/ago/pps-tools.git
>     <http://github.com/ago/pps-tools.git>"
>
>      S = "${WORKDIR}/git"
>
>     +RDEPENDS_pps-tools = "bash"
>     +
>      do_install() {
>              install -d ${D}${bindir} ${D}${includedir} \
>                         ${D}${includedir}/sys
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 
BRs

Sandy(Li Changqing)
+861084778653


