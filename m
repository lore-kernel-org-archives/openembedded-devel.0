Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0F38577D3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:38:25 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g2so11249529pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=4mcCWNtZ3bQKKVGB2ONYS2Y9Sycbnr2UhBryGxYYn7o=;
	b=Ku+IFk3sCgOiwmvDIf7IAqRf8x6AxU1zKNvu8M3PCBy6HjRK3kcKzs80Y+FD0gVy5x
	Bcu9RjAAqDDwSKKqYmGtPtmjmWsjpd5qjhgXBvIODGoujk5Xp4313CqndlLkN0XIpd0C
	5oUuHfqDUk4rMiOrWUqWdvfHReCZPP9zW1rt56GByPkG3LmvQk5ckvIWW+OiYiGmWGNT
	gp9rHQStFx9JRRqwQpMzrNAYC9JH9He11z4DoRe/fPfFAHjVgfr5aWLAUUYzGsSe1T/A
	+QiPdMoggsH0qJ+ZfxMTy/9Qocv9YHYBisj0yXOEUig3cJVjGYQa9tIKyAIZOvqEr4mT
	+Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=4mcCWNtZ3bQKKVGB2ONYS2Y9Sycbnr2UhBryGxYYn7o=;
	b=qvYt9GefFMlvbtOrQWl2GRDLwaXt6ejDw/QgF/zIGsBM7kXFtXkY2rD6pJKvVQBhDF
	cqfQsoCG4rt3K5zcJFJaWFfetZ9zexIANa/fHVGoMYAVwSg7AKuyy6Be7oiTAVSxij/Q
	EeiWYWlA065NOPD8ciKYmDomEHGgBfQZpyq7ObjdP887lO3Ys7Pl3FBKxqfeTVab+kzM
	Ez9U/QQwfiREfBPSTdk/hHT6y7V3roOs29OKMzOs0zUy3jCkZXFqFyTQLi5+HYDkPhwx
	qidDcQdlYb7JmcUwIflABSBOO/pH3jMjRsuL7ilZQT2lQ4B9KhrYWUI7EJJCuZql/ffr
	DOyQ==
X-Gm-Message-State: AFeK/H31MKqb8mwffhT7VJjlP9DMYnMip7LCeCVuLpmKYMR+JAaRdT0Y6lq/RKQIz6YS8w==
X-Received: by 10.98.75.28 with SMTP id y28mr566288pfa.157.1490891906770;
	Thu, 30 Mar 2017 09:38:26 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:bccd:dd0d:39cd:978e])
	by smtp.gmail.com with ESMTPSA id z4sm5585098pge.49.2017.03.30.09.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 09:38:25 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
	<20170320053152.29352-16-raj.khem@gmail.com>
	<20170330094607.GD3060@jama>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <d80329d8-9944-0d52-ef67-d6fb2e4381e8@gmail.com>
Date: Thu, 30 Mar 2017 09:38:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170330094607.GD3060@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 16/16] libexecinfo: Add recipe
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
X-List-Received-Date: Thu, 30 Mar 2017 16:38:26 -0000
X-Groupsio-MsgNum: 65991
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="PxqRLngEk4Ces3LOxlDK3aXR9QUU7Dxic"

--PxqRLngEk4Ces3LOxlDK3aXR9QUU7Dxic
Content-Type: multipart/mixed; boundary="a3pHKP78x9nVrKVgMjLaR08oaxJSU8tpV";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <d80329d8-9944-0d52-ef67-d6fb2e4381e8@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 16/16] libexecinfo: Add recipe
References: <20170320053152.29352-1-raj.khem@gmail.com>
 <20170320053152.29352-16-raj.khem@gmail.com> <20170330094607.GD3060@jama>
In-Reply-To: <20170330094607.GD3060@jama>

--a3pHKP78x9nVrKVgMjLaR08oaxJSU8tpV
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/30/17 2:46 AM, Martin Jansa wrote:
> On Sun, Mar 19, 2017 at 10:31:52PM -0700, Khem Raj wrote:
>> This package is handy especially with musl to port
>> apps which use glibc backtrace APIs
> Fails to build here:
> http://errors.yoctoproject.org/Errors/Details/138496/
>=20

This should be made musl-only package. Fixed locally will
resend with next pull.


--a3pHKP78x9nVrKVgMjLaR08oaxJSU8tpV--

--PxqRLngEk4Ces3LOxlDK3aXR9QUU7Dxic
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljdNIAACgkQuwUzVZGdMxT/MwCfQEQcGnNy5DcjZBlngZtpWfiT
gv0AoIgHRUlXZul+u4fqHReALArcLHp/
=ab1S
-----END PGP SIGNATURE-----

--PxqRLngEk4Ces3LOxlDK3aXR9QUU7Dxic--
