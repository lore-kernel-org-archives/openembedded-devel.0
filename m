Return-Path: <obi@opendreambox.org>
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id B1F297FB36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 13:22:32 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id E8D3210048FB2;
	Mon, 20 Jan 2020 13:14:38 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DD6C13140060;
	Mon, 20 Jan 2020 14:14:36 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1579526077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=m5PG3J4NyBKiDKwNf3bRgJ8wK9uNkFqNY8CGQ9NqEjQ=;
	b=4fWG7q+3HwtFeoGxecgQDPHgzdUruUqyQeMgOsqqn88ghFF2y+m8cnWyKJ4pfTm6oSsQLT
	m0rZoRKY4qHiLJBw==
Date: Mon, 20 Jan 2020 14:14:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200120141434.1424967b@opendreambox.org>
In-Reply-To: <20200120003527.1518697-3-raj.khem@gmail.com>
References: <20200120003527.1518697-1-raj.khem@gmail.com>
	<20200120003527.1518697-3-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/5] meta-networking: Remove using python2
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
X-List-Received-Date: Mon, 20 Jan 2020 13:22:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Khem,

On Sun, 19 Jan 2020 16:35:25 -0800
Khem Raj <raj.khem@gmail.com> wrote:
> diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
> index 3aa41f1add..91a6edd241 100644
> --- a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
> +++ b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
> @@ -8,6 +8,6 @@ SRC_URI[md5sum] = "f638d854a3639fb37c0e06d1092a771e"
>  SRC_URI[sha256sum] = "aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc"
>  
>  PYPI_PACKAGE = "python-networkmanager"
> -inherit pypi setuptools
> +inherit pypi setuptools3
>  
> -RDEPENDS_${PN} = "networkmanager python-dbus python-six"
> +RDEPENDS_${PN} = "networkmanager python3-dbus python3-six"

shouldn't this change also include a rename to python3-networkmanager?

> diff --git a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> index af8961e322..2ad70ace4a 100644
> --- a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> +++ b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> @@ -12,7 +12,7 @@ HOMEPAGE = "http://www.python-ldap.org/"
>  DEPENDS = "python openldap cyrus-sasl"
>  
>  PYPI_PACKAGE = "python-ldap"
> -inherit pypi setuptools
> +inherit pypi setuptools3
>  
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
>  SRC_URI[md5sum] = "fe22522208dc9b06d16eb70f8553eaab"

Same question for python3-ldap.

Best regards,
Andreas

