Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 29CDB7732B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 01:03:35 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id uo6so24924338pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 17:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=WKrMuaTStmELUBMrhBXN9fcocqVtlPEH15XLWP4bkGM=;
	b=NBIkIlfkjNkjvlT+Bqxx24IyEbjn0OczF5eFItzZ0jPf6VF3Sz6ElbjMC2MyQbiCRr
	ZZcHQ6mZTcNXNaR/frZdyWA+Xxvt5hyzQEQ7bN4eNpkHkLZzE6Czh/HK6fyiRwr4isCM
	XnV5YFl4SMQDtbHCz0eKocAyWeuqk/LVe4hf7YwWcWhTz86S+wx7sCsb5MInbT2lYX5N
	P276qc9629Jrs8EvppR8xY2CvY+oGWAY2r2cONxGp5yWA70lSpHr4tSiTGCGEehUQ6Zg
	gQPJWXdMZ+PYqXxdHQBsaHC7EDpWMRIREXnla1duDdDhN8ZZrr5Bvr+bYGSro30Tl7zi
	e5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=WKrMuaTStmELUBMrhBXN9fcocqVtlPEH15XLWP4bkGM=;
	b=f9nPsBaqfDut6pt5M4OObRrvtznhrwU8S29cQsqkN9xBJfPDSlqnDcB3JE6ofNuDue
	zmPlEJKykHatfMvEmCtYvI3ZMQZdSVE7U8ND6OWmwieBG65Qq6wlVnvQa3Sqej7Y4JD2
	V/vd83cAYgRo/g3E9GVcUOyfDOC2DzJ04Xsx8/Z5VseQlkP3nx0tHVCBh7ZNJDMC07oY
	0CgHbRB5Ax8ipwtv8P5qfn9rACszkghZMaBVeQvaa4H+mY0HRZzAIB5gOTqxeTpsQl4Q
	MP9d0pUZZDLdGLTylaiHW3HYD5V5lvsgSwCB20/bDZAD4IJLlgt2e/Ef6IvvHRnc3ehr
	RRMQ==
X-Gm-Message-State: AG10YOQDLfH5Os0hEO39UFR7aWHV8dhZAsRKVPaO1saJWOzajFLgMcMJk7Vqa9ydgoS4lw==
X-Received: by 10.66.144.37 with SMTP id sj5mr15695825pab.69.1454634216507;
	Thu, 04 Feb 2016 17:03:36 -0800 (PST)
Received: from ?IPv6:2600:1010:b11a:af59:e014:12a1:76d:3d01?
	([2600:1010:b11a:af59:e014:12a1:76d:3d01])
	by smtp.gmail.com with ESMTPSA id
	cf6sm19776211pad.41.2016.02.04.17.03.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Feb 2016 17:03:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1spJ+xeuV_iiyswkfWSkFiQ84t0qBDQsesrGBCyWiO5yHQ@mail.gmail.com>
Date: Thu, 4 Feb 2016 17:03:31 -0800
Message-Id: <FEF0A910-0CCF-49A5-9CA0-75D50E23BDA0@gmail.com>
References: <1454465517-24926-1-git-send-email-alejandro.joya.cruz@intel.com>
	<CAMKF1spJ+xeuV_iiyswkfWSkFiQ84t0qBDQsesrGBCyWiO5yHQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe][PATCH] toybox: upgrade to 0.7.0
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
X-List-Received-Date: Fri, 05 Feb 2016 01:03:36 -0000
X-Groupsio-MsgNum: 59848
Content-Type: multipart/signed;
	boundary="Apple-Mail=_32614C79-2032-4787-9B3D-B3FB24D8EC96";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_32614C79-2032-4787-9B3D-B3FB24D8EC96
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Feb 2, 2016, at 9:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> On Tue, Feb 2, 2016 at 6:11 PM, Alejandro Joya
> <alejandro.joya.cruz@intel.com> wrote:
>> +CFLAGS_prepend = "-I ${STAGING_DIR_HOST}${includedir_native}"
> 
> why is a native include dir needed here ?


this is same as STAGING_INCDIR and that should be automatically added
via compiler so I wonder why its needed.


--Apple-Mail=_32614C79-2032-4787-9B3D-B3FB24D8EC96
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaz9OYACgkQuwUzVZGdMxTpBQCfVewwqrrFsHOtXVJMyJEEBth6
VtAAnAsmh35PowCyEAJ8itT7GBNcyblG
=o72I
-----END PGP SIGNATURE-----

--Apple-Mail=_32614C79-2032-4787-9B3D-B3FB24D8EC96--
