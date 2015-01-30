Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 42E19606BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 12:34:43 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so51906391pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=cJ80Gm0np9OHZiRGtLJ08zUny9OGBY8/gAMCNvbix1s=;
	b=ZflJEdBy6O2Wbwd/JtV0kVXIXHQEgl+duR2vk6DAs/Z0piHIt5epAzrDz3O3XMdIop
	JGJdM1VWaicwzEiwE4RnjYUOcomkrtx4whsLoe+8Kc0GywYC8Pt2fodl+quUVnbf1apJ
	x98tGQxwTiemvYwHfqsx36AGyi439n69zXcZnkQGJr+5LiDbXm+NUwH8Vaeet0kPSiIK
	yUk1xJmHLnxIZWMDYUdEWWalVbEIUl6UIG0F4HhNPjbeS4iWrePkeNHWDEujaEunIXVq
	r0smNYU/v2icKIPD3VHlc1VLsZ+cGlI2TiplRZB+ud0KerkZIKs5p9ljNly1QrlURE4R
	vbJg==
X-Received: by 10.70.130.33 with SMTP id ob1mr8405190pdb.7.1422621285103;
	Fri, 30 Jan 2015 04:34:45 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	nh4sm10727242pdb.37.2015.01.30.04.34.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jan 2015 04:34:44 -0800 (PST)
Message-ID: <54CB7A5D.1050409@gmail.com>
Date: Fri, 30 Jan 2015 23:34:37 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Raphael Freudiger <raphael.freudiger@siemens.com>
References: <1422609231-10378-1-git-send-email-raphael.freudiger@siemens.com>
In-Reply-To: <1422609231-10378-1-git-send-email-raphael.freudiger@siemens.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] p7zip: new recipe
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
X-List-Received-Date: Fri, 30 Jan 2015 12:34:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Raphael,

On 30/01/2015 8:13 PM, Raphael Freudiger wrote:
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> new file mode 100644
> index 0000000..db46271
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "7-zip is a commandline utility handling 7z archives."
> +HOMEPAGE = "http://www.7-zip.org/"
> +LICENSE = "LGPL-2.1+ & unRAR"
> +LIC_FILES_CHKSUM = "file://DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a \
> +                    file://DOCS/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de"
> +PR = "r1"
PR is not needed.
> +
> +SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
> +          file://do_not_override_compiler.patch"
> +
> +S = "${WORKDIR}/${PN}_${PV}"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
Can this be removed? Why is INHIBIT_PACKAGE_STRIP needed?
> +
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/bin/* ${D}${bindir}
> +}
> +
> +
> +SRC_URI[md5sum] = "bd6caaea567dc0d995c990c5cc883c89"
> +SRC_URI[sha256sum] = "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782"
Regards,
Jonathan

