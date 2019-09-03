Return-Path: <drew.moseley@northern.tech>
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
	[209.85.219.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9B27F323
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:42:25 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id c9so6018707ybf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=j9j4vI1FnL/aZARdHsRGXMSfHqsjQHip5c8xwlsHHhk=;
	b=O1goas8eh3pNqBcdPwOWWmV8gnPq6CcYz1zk6HOhA6aux5+iL5Ye58F3AXuNbriFj/
	XzpG7UUaNhQLTWDEw5H4Hy4Byyw67qLUxbdjkn0KXNTuI77akSVrz6zp2bqILkjOTHaR
	0GOsBqjA7NPuzyk0PkoFPOaZpyENyvOVHydap7XjqAJp89qP/ngx8TYHyg2s6CZqgm62
	IOQeaR8klewR+JqZOE5Et/NQRayvAfytS4lVdE3dgZGji1mWkTCd/CjnpglJCsAZybPw
	XC/u+mVKa7xkCkeyQ0FGblEqnvFfEKmGdOki7uIqpJ22jdSQ+H4/OT4bzyYWubXxjClP
	PHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=j9j4vI1FnL/aZARdHsRGXMSfHqsjQHip5c8xwlsHHhk=;
	b=pdIjlcd6QpIb5jsaGP/gsckXyJS7hbmhulrk0WSKoG1Ioczp+K+3NdUuxLvppzBAst
	kvnqQu8W6lm7/bUIUwFLtYZJOTMuw8JwkANIvV8WX8g/Ix58DI/22ynUL3Rn71vJvZ4H
	R2KYk6UOxLfs/DbMuDN0HprZpaBXPcj3WhG2vrgYxFmmjBYJ4uAVBfZWtsBdoCuAFlKa
	Mk/dmMiJkLxdHL+qU6PMPZV6L9h+7uf4Cwqm+4kGaCJzS7Zeftei3MXo5F3O2yk7csFW
	9praOmZc8zuXmsX9cOwNYHZC/1Xi5nZBsdqEZOS/4HcdjwNeAL3olOBV02/+ZlWaWy6L
	P3MA==
X-Gm-Message-State: APjAAAVaLVgmOPLCsxy7SVH61ofDyPPjIsVM/gP2S6uvt0gK8MezQZBf
	LKLB55pXg+h68eRIHuZVvtPWBVJGgEOmnQ==
X-Google-Smtp-Source: APXvYqxzkjHTu0cA7hKOArYP/fi0N3W+lcQ0ZKRq5beA3ymQnPPBTuKISri1/zL+6+AvtUpvYNjPtg==
X-Received: by 2002:a25:9803:: with SMTP id a3mr24647726ybo.27.1567525346430; 
	Tue, 03 Sep 2019 08:42:26 -0700 (PDT)
Received: from [192.168.7.36] (user-24-236-82-253.knology.net. [24.236.82.253])
	by smtp.gmail.com with ESMTPSA id
	h20sm1791458ywa.24.2019.09.03.08.42.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 08:42:25 -0700 (PDT)
To: kai.kang@windriver.com, raj.khem@gmail.com
References: <20190902005927.175922-1-kai.kang@windriver.com>
From: Drew Moseley <drew.moseley@northern.tech>
Message-ID: <9b4f23fb-70b3-0c75-d754-812e6e304d27@northern.tech>
Date: Tue, 3 Sep 2019 11:42:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902005927.175922-1-kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][Patch] Revert "networkmanager: Use ALTERNATIVES for resolv-conf handling."
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
X-List-Received-Date: Tue, 03 Sep 2019 15:42:26 -0000
X-Groupsio-MsgNum: 79484
Content-Type: multipart/mixed; boundary="------------681A40D82B7828CF90FFF2BE"
Content-Language: en-US

--------------681A40D82B7828CF90FFF2BE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 9/1/19 8:59 PM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> This reverts commit 3982dc5b1994ffcc52336b02fbd2c44db164dd82.
>
> With this commit it creates link file /etc/resolv.conf via
> update-alternatives but the target doesn't exist.
>
> On target:
>
> root@qemux86-64:~# ls -l /etc/resolv*
> lrwxrwxrwx    1 root     root            33 Aug 27 09:17 /etc/resolv-co=
nf.NetworkManager -> ../run/NetworkManager/resolv.conf
> lrwxrwxrwx    1 root     root            34 Aug 23 03:08 /etc/resolv-co=
nf.systemd -> ../run/systemd/resolve/resolv.conf
> lrwxrwxrwx    1 root     root            31 Aug 27 09:22 /etc/resolv.co=
nf -> /etc/resolv-conf.NetworkManager
>
> root@qemux86-64:~# ls -l /run/NetworkManager/resolv.conf
> ls: /run/NetworkManager/resolv.conf: No such file or directory
>
> root@qemux86-64:~# cat /etc/resolv.conf
> cat: can't open '/etc/resolv.conf': No such file or directory
>
(Apologies for the delay in getting back to this)

Interestingly, in rocko, the /var/run/NetworkManager/resolv.conf file is
automatically generated but in thud it does not seem to be.=C2=A0 Without=

this patch, we are relying on /var/run/systemd/resolv.conf existing even
when not using systemd for name resolution. I wonder if the right
solution is to figure out why the /var/run/NetworkManager/resolv.conf
file is no longer created.


Drew


--------------681A40D82B7828CF90FFF2BE
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3DibDG
-----END PGP PUBLIC KEY BLOCK-----

--------------681A40D82B7828CF90FFF2BE--
