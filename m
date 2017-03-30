Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBAA77D30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:42:07 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id 81so45039279pgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=d8q3hbBqLrOlF7bz5hAJw49LNQV8X3BT0A2ymOZy44A=;
	b=SYwYZFDsphCjzKLDO97giIGT6dqGSGEuHcWWodoWYStNpF1lHcoWt2VYTmlekQ/MMy
	uoztaDFLtg+tv6RMl8XP/krl4ruIpTdnb6RJKvRXvQVigdx+crTpC2IEE/bPA9YJTsTB
	bGazH6TozenZJPdCIi6c0pXABWLG9GLpW4SUE3YAl7NdRmGsPKofg1eLNB8EbdAfd0Jj
	gNi/iaM0wnQFLow9+IiZ7aUAQ2tyVWMQepTCuOJyoiZEU6ZLhAQRnYZF7gmjadja2icW
	Zflr1J8kxWppFKdbfeq84diN1LOGJeFk0sCPU6IfIIJrvbcjSIewiUCsy7KhazA7v2ZV
	jLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=d8q3hbBqLrOlF7bz5hAJw49LNQV8X3BT0A2ymOZy44A=;
	b=jk0Bz+a9h7nvQUun1D+RqDIvIA6qE6BuPkpo5RKqHzFFAWvTr8TNgQDW8tztE86fPj
	80dTlqECOb39L0OVWWlLHxwx6JpVkVW29kjQakfO14p1WrS+nyZfZdcbomcxFGkqiM6V
	+qWfij5WCws1r2ansNc8sIa31f1ulK77zbsqfVm3uLiIYBwwM/AC4pcfZBUxqfcLJWz3
	yPn5ZZZPr3zsA8tKPXFc7xnrlj2zNIJjRoC1F2wjsmSj2bAyKZ2k511JGPDdMNGB4el1
	lIbki9b3NbGFj5aKzYEqbYpPw11yR8Arhumce4dG0y8fNRwOYM+h0U2HCIaBApSvJ1QS
	U1uw==
X-Gm-Message-State: AFeK/H1lZswiENIeAFAtFp7Zc2+1qZgvyHrEXvtCeVwOSPL2u/cYuKyKEeHqav2TAYVT5g==
X-Received: by 10.99.167.1 with SMTP id d1mr609056pgf.129.1490892129004;
	Thu, 30 Mar 2017 09:42:09 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:bccd:dd0d:39cd:978e])
	by smtp.gmail.com with ESMTPSA id
	x21sm5641801pgf.15.2017.03.30.09.42.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 09:42:07 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
	<20170322184533.6501-2-raj.khem@gmail.com> <20170330094100.GB3060@jama>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c61173b4-b1ed-0a86-38fa-a71f6639981b@gmail.com>
Date: Thu, 30 Mar 2017 09:42:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170330094100.GB3060@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 02/10] netcat-openbsd: Fix build and whitelist
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
X-List-Received-Date: Thu, 30 Mar 2017 16:42:08 -0000
X-Groupsio-MsgNum: 65992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="r3UncdNSaaJ1MralvtXCMEfDESPe8RcrU"

--r3UncdNSaaJ1MralvtXCMEfDESPe8RcrU
Content-Type: multipart/mixed; boundary="28Dxw5NV8nIUPUOftOPMUSt8mf0h02ACB";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <c61173b4-b1ed-0a86-38fa-a71f6639981b@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 02/10] netcat-openbsd: Fix build and
 whitelist
References: <20170322184533.6501-1-raj.khem@gmail.com>
 <20170322184533.6501-2-raj.khem@gmail.com> <20170330094100.GB3060@jama>
In-Reply-To: <20170330094100.GB3060@jama>

--28Dxw5NV8nIUPUOftOPMUSt8mf0h02ACB
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/30/17 2:41 AM, Martin Jansa wrote:
>> +    fi
>> +    QUILT_PATCHES=3D${S}/debian/patches quilt push -a
>> +    mv ${S}/.pc ${S}/.pc-netcat
> Doesn't work here:
> http://errors.yoctoproject.org/Errors/Details/138495/
>=20
weird.
works here.


--28Dxw5NV8nIUPUOftOPMUSt8mf0h02ACB--

--r3UncdNSaaJ1MralvtXCMEfDESPe8RcrU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljdNV4ACgkQuwUzVZGdMxSwfACggkEhz+EilunxrXX0CIUGc9eh
WecAn02aHaBQMWiGhIwovVZ3WBSa/S41
=I1Vs
-----END PGP SIGNATURE-----

--r3UncdNSaaJ1MralvtXCMEfDESPe8RcrU--
