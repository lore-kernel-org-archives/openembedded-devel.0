Return-Path: <drew@moseleynet.net>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 996B77F2DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 21:38:20 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id i207so6463563ywc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 14:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=moseleynet.net; s=google;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=BnuaQk0QKAhCAzcBag13c0TUo7h2D57HIdP/OtFi1OQ=;
	b=Fh1KtwJJIDbXflREj6S7HEAf2LgrD+MJIGZT6uhPKaFG8u4GmUeHFmu4CatmC5nHo8
	bEQdaK2WfHOR1opRoV/Xy731H7/GVhox4LnXNhW5/kYa4nWjsmhmXT9lNJXG2QJ7MePc
	6zVYPJUicL0SVDN+xt8sVECS1tSuSJJN30fF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=BnuaQk0QKAhCAzcBag13c0TUo7h2D57HIdP/OtFi1OQ=;
	b=Bx3pMKmtwlSHU7uNFJAMdy+K2EU5yAdjfI0UIV/YSYkhXMNtmwVtvnNwruoVRhuUYH
	ptYvKaqHYxKnd9jPd8nmLP99XgL9KCtOe5jEMcnw2RTcnjZ8i7+TfPASH9EDrUpAQofw
	8FVBzmYkZof7ivL3140a0FTJDeoNY9W73AW75lY0Zfoxi13/BqKP6xGTYS+Ula/lyo0P
	ho+IRATqVvve4PokGiC3PMzRcpu9VaqhMbe8XcDYSpcVe2e96P4egtr1+7bZFkq036iJ
	LZoWuy+opfp0db+LIbEj+l6gvhlvNdEppraznSUT6OQagaYMVuI214uRapGmDZODICcy
	azGg==
X-Gm-Message-State: APjAAAWaa8+5vimPhuhzLm387gqaMl6+7V1qAxy+zyt3AB6rIpHwgbWm
	MNb1RpsmG0WKwo8tMoCpcKqlgGYFhxx59A==
X-Google-Smtp-Source: APXvYqzivqNrQ3mKIehEvid+x/kQUk2aU9CQconVDcupK75YAfNyMhTby/5s5HTC9mQe9SIE1yQ8CA==
X-Received: by 2002:a81:8453:: with SMTP id u80mr21765092ywf.481.1567546700711;
	Tue, 03 Sep 2019 14:38:20 -0700 (PDT)
Received: from [192.168.7.37] (user-24-236-82-253.knology.net. [24.236.82.253])
	by smtp.gmail.com with ESMTPSA id
	x10sm3839166ywl.16.2019.09.03.14.38.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 14:38:19 -0700 (PDT)
From: Drew Moseley <drew@moseleynet.net>
To: openembedded-devel@lists.openembedded.org
References: <20190902005927.175922-1-kai.kang@windriver.com>
	<9b4f23fb-70b3-0c75-d754-812e6e304d27@northern.tech>
Message-ID: <39215aee-15b2-ba27-5645-3ce28f40ba31@moseleynet.net>
Date: Tue, 3 Sep 2019 17:38:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9b4f23fb-70b3-0c75-d754-812e6e304d27@northern.tech>
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
X-List-Received-Date: Tue, 03 Sep 2019 21:38:20 -0000
X-Groupsio-MsgNum: 79486
Content-Type: multipart/mixed; boundary="------------D46E5CB84502C5C022B06BD5"
Content-Language: en-US

--------------D46E5CB84502C5C022B06BD5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 9/3/19 11:42 AM, Drew Moseley wrote:

> On 9/1/19 8:59 PM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> This reverts commit 3982dc5b1994ffcc52336b02fbd2c44db164dd82.
>>
>> With this commit it creates link file /etc/resolv.conf via
>> update-alternatives but the target doesn't exist.
>>
>> On target:
>>
>> root@qemux86-64:~# ls -l /etc/resolv*
>> lrwxrwxrwx    1 root     root            33 Aug 27 09:17 /etc/resolv-c=
onf.NetworkManager -> ../run/NetworkManager/resolv.conf
>> lrwxrwxrwx    1 root     root            34 Aug 23 03:08 /etc/resolv-c=
onf.systemd -> ../run/systemd/resolve/resolv.conf
>> lrwxrwxrwx    1 root     root            31 Aug 27 09:22 /etc/resolv.c=
onf -> /etc/resolv-conf.NetworkManager
>>
>> root@qemux86-64:~# ls -l /run/NetworkManager/resolv.conf
>> ls: /run/NetworkManager/resolv.conf: No such file or directory
>>
>> root@qemux86-64:~# cat /etc/resolv.conf
>> cat: can't open '/etc/resolv.conf': No such file or directory
>>
> (Apologies for the delay in getting back to this)
>
> Interestingly, in rocko, the /var/run/NetworkManager/resolv.conf file i=
s
> automatically generated but in thud it does not seem to be.=C2=A0 Witho=
ut
> this patch, we are relying on /var/run/systemd/resolv.conf existing eve=
n
> when not using systemd for name resolution. I wonder if the right
> solution is to figure out why the /var/run/NetworkManager/resolv.conf
> file is no longer created.
>
I dug into this a bit more and I was incorrect about it being different
on different branches. It actually seems to be different when using qemu
vs hardware (in my case an RpI3).=C2=A0 Basically runqemu sets up
kernel-level IP autoconfiguration so NetworkManager has nothing to
configure and thus the /var/run/NetworkManager/resolv.conf file is not
created.=C2=A0 But on RpI, it is.

In the systemd recipe, there are tmpfiles.d entries setup to ensure that
/var/run/systemd/resolve/resolv.conf exists. Should we make sure
NetworkManager and connman do something similar? I verified that systemd
will properly populate the file even when using kernel level
autoconfiguration but initial experiments indicate that NetworkManager
does not.

Drew


--------------D46E5CB84502C5C022B06BD5
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
7+85SM3M7t6pXOHL6evaYd/Qc/p6WKQdsKM=3D
=3DwaDE
-----END PGP PUBLIC KEY BLOCK-----

--------------D46E5CB84502C5C022B06BD5--
