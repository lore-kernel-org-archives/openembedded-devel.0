Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3A11470A02
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:58:53 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id eu11so3998772pac.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=EJnv3nM+n9BDNmer0fNwld4YVQprjYVvsHSuU0sL+EA=;
	b=MEJadxzvv7MlEKkfhjDHKhBO6yW1C1z8m6cU9Dp2TbWWsLACcYr6wO3zbgmy3jAWxh
	zvZo9zVfEC2xij/KuArPzBaYlNJdnEqHd4EAZatbnCYy2uIEH6eoxhOdGFpIAj7onHwo
	cEnYHu8iZA0cM9vvdIY2KlHhY9v6sISVC3qz4O2Q/kukEeYBZQljs8IjKQDI582l/6HZ
	wH8Mv/sxxCnrv+uvBkryUODi+F2o+NON2gMhr6SHEvkk0vzmYKlbz3tIybzqeVrgTYnB
	NWFNRI8eow4fN7F9lSPpdKh7L7yIJl6bnrtlhN0m8tVfk6FAAXe2yJQSwVdZjkmeGQvi
	szHg==
X-Gm-Message-State: ALoCoQk973Ty06MWNy6Sl0kA795TBJ6jR+RyYoH5P3VCd7tQ3RoJDiYwM7RX5Pmu6Ta7QcFtv92g
X-Received: by 10.69.26.134 with SMTP id iy6mr13272496pbd.115.1407355134980;
	Wed, 06 Aug 2014 12:58:54 -0700 (PDT)
Received: from [192.168.18.4] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id vk5sm2126573pbc.44.2014.08.06.12.58.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 12:58:54 -0700 (PDT)
Message-ID: <53E288FC.1050403@mvista.com>
Date: Wed, 06 Aug 2014 12:58:52 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Joe MacDonald <joe_macdonald@mentor.com>
References: <1407354015-12183-1-git-send-email-joe_macdonald@mentor.com>
In-Reply-To: <1407354015-12183-1-git-send-email-joe_macdonald@mentor.com>
Subject: Re: [meta-networking][PATCH] wireshark: update configuration and epoch
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
X-List-Received-Date: Wed, 06 Aug 2014 19:59:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

if needed.

Acked-by: Armin Kuster <akuster@mvista.com>




On 08/06/2014 12:40 PM, Joe MacDonald wrote:
> Commit 6d781369 warranted a PE bump but didn't include it.  Update it,
> correct a typo in EXTRA_OECONF and explicitly disable c-ares resolver at
> the same time.
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>   meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> index 449ac47..13b1f3f 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> @@ -23,13 +23,15 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>   PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
>   PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>
> -EXTRA_OECONF = "--with-qt=no --enable-usr-local=no -enable-tshark"
> +EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
>
>   LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>   SRC_URI = " \
>       http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0.tar.bz2 \
>   "
>
> +PE = "1"
> +
>   SRC_URI[md5sum] = "8dcfe451d8769901129809d2e19c1fb7"
>   SRC_URI[sha256sum]= "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97fa25f4256dbf13c7"
>
>

