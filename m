Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DFF0730DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:44:37 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 5so1162996pgj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=s05D1Mc67fSG/UusSjqqvWiIy0Z5QnZJ9A7W3LeYY3g=;
	b=gXc3PXjzVVhDGxYnkN2O6I3hc9otaU4RVcPai29mYdRZdQ83JP4wgSzWJiIeVxHNpC
	KXHSShwnqf4dd/7mEmZ0XiCGEEeL+Kp3zKZWz/Z2EesrOzQouDqapMfego2maJr9F3lq
	mkFqInwSr7wxnHaRusB6+TReCXb+8XmFLMqhqcyPhmHn/6Xf0nyN89sz38/DaxB1YSIy
	M9xwmpj8qmYvqgm9tM7cH7ZW0MqjU4WtkY4jrHIItHt4/VobUMU+W8ZjC4zz56Afo1Q2
	81ugok2IRfU2aAjKHVAlZxjp1tuAT072SpT1NNwmtX8nPSYcWNBhUFzuYdsEShFUcHQ+
	DMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=s05D1Mc67fSG/UusSjqqvWiIy0Z5QnZJ9A7W3LeYY3g=;
	b=b9r7ZFN4qzA6O/JK8Sm9/cxMdis0BjKPJPkt5drPTctCdXRu8L/OXDGAPkk4oO7MNk
	q5KVd0/y+JxHiQf1tY9hL8KqHGEWiPjalO0Eh5wMvf7rBxotjZXRWED2kSvnIyqS9+SB
	VmEzWPjLwRtg9o3Q+9CFp2Vtavog/R2z2lPitk7Ay32LU4n+JL0BfrF9JXRvd0/BdSHP
	dY/GJZqj+6ZEzkPRP2j9Ng0EAUQ1Ja8fAPSOeqWrpVW1vKr/PXhXdpk5GZrAwHDP3xf7
	nuTJtHeI+7IG6udrntsGJPNupe9gbQPZ/OD4uMdI3EKQ3H4/5WOEerehfw1F/RG8UZi3
	By0g==
X-Gm-Message-State: AMke39m7x67OdPtxa1ABnd7WUIWEZcdvuXj5wP2GDax29FxwhU47OdD1cjcKenXwfl4w7Q==
X-Received: by 10.84.233.200 with SMTP id m8mr19323386pln.92.1487781879271;
	Wed, 22 Feb 2017 08:44:39 -0800 (PST)
Received: from [10.11.10.242] ([67.23.202.154])
	by smtp.gmail.com with ESMTPSA id q64sm4773170pga.0.2017.02.22.08.44.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 08:44:38 -0800 (PST)
To: chong.yi.chai@intel.com, openembedded-devel@lists.openembedded.org
References: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
	<1487636765-15631-2-git-send-email-chong.yi.chai@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d1f4a86c-605a-6bcd-f597-480c91d389fc@gmail.com>
Date: Wed, 22 Feb 2017 08:44:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487636765-15631-2-git-send-email-chong.yi.chai@intel.com>
Subject: Re: [meta-networking][morty][PATCH 1/3] libtdb: fix SRC_URI - http has gone
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
X-List-Received-Date: Wed, 22 Feb 2017 16:44:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/20/2017 04:26 PM, chong.yi.chai@intel.com wrote:
> From: Andreas Müller <schnitzeltony@googlemail.com>
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> (cherry picked from commit 7131b825b6973e703c24101dec4628b1765723b6)
> Signed-off-by: Chai, Chong Yi <chong.yi.chai@intel.com>

all three push to akuster/morty-next on meta-oe-contrib


thanks

Armin


> ---
>   meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
> index 1d65d39..7eb0d7c 100644
> --- a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
> +++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
> @@ -5,7 +5,7 @@ LICENSE = "LGPL-3.0+ & GPL-3.0+"
>   LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c98f48018c4 \
>                       file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
>   
> -SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
> +SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
>              file://do-not-check-xsltproc-manpages.patch \
>              file://tdb-Add-configure-options-for-packages.patch \
>   "


