Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B254D60589
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:08:49 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 19so13074577pfo.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 22:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=F8esD0Q8tYmmVcmPW++R2C1c/0k1p1VJ9xavIjltAL8=;
	b=WuIJleM9ebOTGVHp6jemVuf6cznFnappoM6rE4N5TTjJwgk2MCS+MfMfop4k2GBXv/
	IWiKD97kRT45pJreM3pExQiny1p8hIh88CfL886bygYAiqhc3by7NdBueTwYoTlh0V+3
	dnq2fQV7Dz5l3OaKAlUJky3yimNqgGQZt4DQEmg+K04eC/RBb/pSagNvypjHAAFqqzH6
	osNeIpuJ4R5MEl+KePJVXvfolF+z1oVsaManNfNUToIUFLoAW3GZx7a+D2V7IiOnXAAk
	2HSHOzDZbjJEJKmvF7vFqGTkGVd4joOy95fFitJClQTJHXi43oXRuW0U4z9d5AEUvcBv
	/kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=F8esD0Q8tYmmVcmPW++R2C1c/0k1p1VJ9xavIjltAL8=;
	b=nymsToNMHG/ruf8+O9j1f0gjs0pwLkyHZmOIcGCGo1cgpEpQcSmHmv+r1JhM+H+5WV
	yAmy9rxrwiS9NfTATjJN+DjUbGDDmPQ314d61qxBd/hS3EwFjzrloUgiT5Li+UaM1bzI
	eUZkjxOScdgic2UMBHJ0ch1E4N7HvY7DhYakHOp8w4QKW2ehQtdZMbAM0RNbVRFp4WKr
	qfw3UpRPS1vRFbKYnzQ5kLkvZ6X/RTH+CFZ7781yr5uE6PkY9SbeWLREjhQrsaRkwSYW
	NagyFAnpa5+BuReS6v5yrcUVr2P1mAcH83/5xyrfURZazgxgdyPIg75eI9p0zDAGhCLK
	zvQA==
X-Gm-Message-State: AMke39nlemuXUTC9WoJtYwirHBaMSmOeNGHWQ7ihlgXA+r1/YkifC+b1bniJLFMrUkDShA==
X-Received: by 10.98.19.12 with SMTP id b12mr1779216pfj.150.1486620529626;
	Wed, 08 Feb 2017 22:08:49 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:54db:1f6:93cd:24b0])
	by smtp.gmail.com with ESMTPSA id
	y184sm24962694pfg.86.2017.02.08.22.08.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 22:08:48 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1486559196-22835-1-git-send-email-amarnath.valluri@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <64d88352-15e2-ddbb-a746-bd790e87fd4e@gmail.com>
Date: Wed, 8 Feb 2017 22:09:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486559196-22835-1-git-send-email-amarnath.valluri@intel.com>
Subject: Re: [meta-oe] udisks: Make use of bitbake variables for sbin, lib locations.
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
X-List-Received-Date: Thu, 09 Feb 2017 06:08:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/8/17 5:06 AM, Amarnath Valluri wrote:
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
> index eec6933..81533a2 100644
> --- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
> +++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
> @@ -24,6 +24,12 @@ PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
>  
>  EXTRA_OECONF = "--disable-man-pages"
>  
> +do_configure_prepend() {
> +   #Point to right lib,sbin directories
> +   sed -i -e 's;slashlibdir=/lib;slashlibdir=${base_libdir};g' \
> +          -e 's;slashsbindir=/sbin;slashsbindir=${base_sbindir};g' ${S}/configure.ac
> +}
> +

perhaps this should be turned into a static patch.

>  FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
>                  ${datadir}/dbus-1/ \
>                  ${datadir}/polkit-1 \
> 

