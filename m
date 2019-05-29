Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id E99F57E323
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 21:19:34 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d30so623016pgm.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 14:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TTiu/GpT2Ywnpi2f3T5RHgO97Ylh+F8o3X2TeLH/OFw=;
	b=eT4FKaBnepX7uC0Dv9l98E6B/v62pBAoCs9aTKJMI9Y04foX6lZkCGhV9k266ZNWWl
	2JPE01nRm+xtqL2MNBpIjxReHwKU/8vIv/QHIqE8KS6RjgMnquvU0LdLqlUkbjBSDcYI
	8Po6kg5K/k7GIz3I2vL77v01ITRFht4/cWEydnF0LtuhlYVWaSCu6HmEt4BoKk1FM/wV
	A3fq/nd/4qGdWhgPHeF715rVwaFFLa1zPbRZ6BNJsSycx94v3n/ZcLmi0yieFN02DjbD
	/2UzIvg4cDyf87Oun/Lg5A2KowvjLL95HbtVkBHlUlwWcn9uXq+4aSSWoQ9BTopjTMsA
	eHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=TTiu/GpT2Ywnpi2f3T5RHgO97Ylh+F8o3X2TeLH/OFw=;
	b=evI9Ef9pRIjua5fqjCpdx8UL7uiQha5bsc21AWsP/cclgTGqYfaVP3aB2cdZ5sk1ol
	/VE0Lsvw9T9e+c4mHvJB8qg1a0WB2o+C/tfRXR+jMYk8eBU4uHP9/MLKHzkomIUcoEoW
	3xSYQUIxFkiMHIzzsS1mke6Lgd1DQtQFqK0IRdoMbeboIAqUo1CNFa8Mk+DzwPqy/vxd
	MP/h8m9Y7/j9oh3zP6BnJDkBqDwH9ohUMZtLBliV1TNzGIsWXdpi7EABfVXWKxAeDgbt
	eed5tO0Gc8Q255fOQIY4gx4/2nCY2lF4drdn8vAmYzMqM2t7glRdwjuGr8DRTD9362VW
	vo9A==
X-Gm-Message-State: APjAAAUTV1vnouE3AmXo9kB7jgkJg8dgcOuDJtUIOwoVeQM3eQ20bsv0
	PZwKeTeJbU3uQGCZcOyP/QGb5xxM
X-Google-Smtp-Source: APXvYqypUmwsFGdP1Zk6m9LkIc5/VTproukouNYTgO8xoAPgxUqYOyKxQuOb86NxUBr58T5YuSlXzQ==
X-Received: by 2002:a62:3085:: with SMTP id
	w127mr127488983pfw.170.1559164775627; 
	Wed, 29 May 2019 14:19:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4865:9151:ec2:e220?
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id
	g83sm562735pfb.158.2019.05.29.14.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 14:19:35 -0700 (PDT)
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
References: <1559116039-168682-1-git-send-email-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8cd345b4-c098-d25b-9222-2d1a750989d1@gmail.com>
Date: Wed, 29 May 2019 14:19:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559116039-168682-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [meta-networking][PATCH] netkit-telnet: add rconflicts
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
X-List-Received-Date: Wed, 29 May 2019 21:19:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/29/19 12:47 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below error:
>
> file /etc/xinetd.d/telnet conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586
> file /usr/sbin/in.telnetd conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586

with backport?

- armin
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> index db4b1c9..4b035af 100644
> --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> @@ -63,3 +63,4 @@ FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
>  
>  # http://errors.yoctoproject.org/Errors/Details/186954/
>  EXCLUDE_FROM_WORLD_libc-musl = "1"
> +RCONFLICTS_${PN} = "inetutils-telnetd"


