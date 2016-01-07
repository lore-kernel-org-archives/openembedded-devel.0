Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2F33560761
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:26:23 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id ik10so59179678igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=GL3PAWK7FGYPgBhy54lbixC++Dn4sA76JnkskkRFBXM=;
	b=i1Ip4BMGQotfQTlC7qnow8Plj6463DD6mGi6qNfM1/Q6UZDDTiRflY8M/sFHL1CQg3
	T3QD9I6GBTfHgRTx1qC8BcTJmUFsDWfn50a6XQfyuxJuXAvRHR6T1RpDOl8PT3J3zyWn
	n83lYT5dbOrRLDKGPgr4LaHgi/kmfCfVHoE+ICoAn6X11mDevAIz3HBfOB7W3d2cOn16
	NZoKAVwa3FH9YNDCXg/0yaeRPK+H2ULGdZAz8PMxD6hKrNeOGNJgO76MaXS55m9r0R8T
	ThN1kxNa9AghAxVthgkf5/BvfBtSJGb4SCJJ3MDV5SYhYdWCvxH8MKWOrxjz90pbPRPp
	hDOQ==
X-Received: by 10.50.60.6 with SMTP id d6mr17301002igr.94.1452183984867;
	Thu, 07 Jan 2016 08:26:24 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	nj19sm365108igb.15.2016.01.07.08.26.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 08:26:24 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1452183872-22328-1-git-send-email-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568E91AC.3010702@gmail.com>
Date: Thu, 7 Jan 2016 11:26:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452183872-22328-1-git-send-email-twoerner@gmail.com>
Subject: Re: [meta-oe][PATCH] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Thu, 07 Jan 2016 16:26:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Oops, looks like this one got mangled somewhere along the way, and I
forgot to mention this was a v2.
v3 in a minute...

On 01/07/16 11:24, Trevor Woerner wrote:
> Additionally, the LICENSE file changed as follows:
>
> --- node-v4.2.3/LICENSE	2015-12-03 17:16:54.000000000 -0500
> +++ node-v4.2.4/LICENSE	2015-12-23 11:53:36.000000000 -0500
> @@ -338,11 +338,32 @@
>  - npm is a package manager program located at deps/npm.
>    npm's license follows:
>    """
> -    Copyright (c) Isaac Z. Schlueter
> -    All rights reserved.
> -
> -    npm is released under the Artistic 2.0 License.
> -    The text of the License follows:
> +    The npm application
> +    Copyright (c) npm, Inc. and Contributors
> +    Licensed on the terms of The Artistic License 2.0
> +
> +    Node package dependencies of the npm application
> +    Copyright (c) their respective copyright owners
> +    Licensed on their respective license terms
> +
> +    The npm public registry at https://registry.npmjs.com
> +    and the npm website at https://www.npmjs.com
> +    Operated by npm, Inc.
> +    Use governed by terms published on https://www.npmjs.com
> +
> +    "Node.js"
> +    Trademark Joyent, Inc., https://joyent.com
> +    Neither npm nor npm, Inc. are affiliated with Joyent, Inc.
> +
> +    The Node.js application
> +    Project of Node Foundation, https://nodejs.org
> +
> +    The npm Logo
> +    Copyright (c) Mathias Pettersson and Brian Hammond
> +
> +    "Gubblebum Blocky" typeface
> +    Copyright (c) Tjarda Koster, https://jelloween.deviantart.com
> +    Used with permission
>
>      --------
> @@ -554,24 +575,49 @@
>      --------
>
> -    "Node.js" and "node" trademark Joyent, Inc. npm is not officially
> -    part of the Node.js project, and is neither owned by nor
> -    officially affiliated with Joyent, Inc.
> -
> -    Packages published in the npm registry (other than the Software and
> -    its included dependencies) are not part of npm itself, are the sole
> -    property of their respective maintainers, and are not covered by
> -    this license.
> +    The following additional terms shall apply to use of the npm software, the npm
> +    website, the npm repository and any other services or products offered by npm,
> +    Inc.:
> +
> +    "Node.js" trademark Joyent, Inc.  npm is not officially part of the Node.js
> +    project, and is neither owned by nor affiliated with Joyent, Inc.
> +
> +    "npm" and "The npm Registry" are owned by npm, Inc. All rights reserved.
> +
> +    Modules published on the npm registry are not officially endorsed by npm, Inc.
> +    or the Node.js project.
> +
> +    Data published to the npm registry is not part of npm itself, and is the sole
> +    property of the publisher. While every effort is made to ensure accountability,
> +    there is absolutely no guarantee, warrantee, or assertion expressed or implied
> +    as to the quality, fitness for a specific purpose, or lack of malice in any
> +    given npm package.  Packages downloaded through the npm registry are
> +    independently licensed and are not covered by this license.
> +
> +    Additional policies relating to, and restrictions on use of, npm products and
> +    services are available on the npm website.  All such policies and restrictions,
> +    as updated from time to time, are hereby incorporated into this license
> +    agreement.  By using npm, you acknowledge your agreement to all such policies
> +    and restrictions.
> +
> +    If you have a complaint about a package in the public npm registry, and cannot
> +    resolve it with the package owner, please email support@npmjs.com and explain
> +    the situation.  See the [npm Dispute Resolution
> +    policy](https://github.com/npm/policies/blob/master/disputes.md) for more
> +    details.
>
> -    "npm Logo" created by Mathias Pettersson and Brian Hammond,
> -    used with permission.
> +    Any data published to The npm Registry (including user account information) may
> +    be removed or modified at the sole discretion of the npm server administrators.
> +
> +    "npm Logo" contributed by Mathias Pettersson and Brian Hammond,
> +    use is subject to https://www.npmjs.com/policies/trademark
>
>      "Gubblebum Blocky" font
> -    Copyright (c) by Tjarda Koster, http://jelloween.deviantart.com
> +    Copyright (c) by Tjarda Koster, https://jelloween.deviantart.com
>      included for use in the npm website and documentation,
>      used with permission.
>
> -    This program uses several Node.js modules contained in the node_modules/
> +    This program uses several Node modules contained in the node_modules/
>      subdirectory, according to the terms of their respective licenses.
>    """
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb}    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb} (93%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> index 66a3c11..18e23b7 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE = "http://nodejs.org"
>  LICENSE = "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=963ca39eebcb15ac618bc3006504ae3f"
>  
>  DEPENDS = "openssl"
>  
> @@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
>  SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>      file://no-registry.patch \
>  "
> -SRC_URI[md5sum] = "529a8abd4ca5a2225636767d3f14c382"
> -SRC_URI[sha256sum] = "5008ade5feb4b089f59163f66bffddc113f27de5d78edf203e39435c2c5d554f"
> +SRC_URI[md5sum] = "86e4d0d8b626f6e60ca7bef02f2543d2"
> +SRC_URI[sha256sum] = "4ee244ffede7328d9fa24c3024787e71225b7abaac49fe2b30e68b27460c10ec"
>  
>  S = "${WORKDIR}/node-v${PV}"
>  


