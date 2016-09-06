Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCDA7753A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 18:24:02 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id id6so15151160pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=x+GheCERhh4bzEsfa9PpPFIIkMzHETCL620SHiuSUWs=;
	b=s2QMMaxP/jAQnHzRumToTGd4DSQ28z3L0M9PBRTM1tCiFQT7SFpMSdCVTwoqROtVup
	lvq1Q02t0Wh+ukH4AFFLNwb9yHMRBBeQzXAoHwXt+uLk5UqQ5G6I7lNkkxTbCBln0NCr
	ZzP/8Srb/yC0rBMJxoUX8yCYA98yGnG7IBu+FHoE/9kBHSOcOd/LxMZxfarKK3neDMUT
	kxuudQTBjB8Gp4yZ2H/I073G2XtZ0jfu098pF0xMYkiqIx7i/ZeEkD3J7XDzWxhFn4ag
	LFv9O5wA6yrY6CvS9FU49kfaCAfCzcGmrFp+gKvIxTqm9vnb5SghpYHr6xbrtQ3N+N/N
	TNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=x+GheCERhh4bzEsfa9PpPFIIkMzHETCL620SHiuSUWs=;
	b=UuwJYXqV4tuOI/eWbRjYGdYUQUno1i9dUKP0I554IT8W3HRjXDoSYDGSEFNg+u8S0A
	Vq/w1BvcM9Wp3GWObVFUKRutAAKUyhw8YgbCdZPXNuEedD8Q3w8FREwaRBqeG1UKXoXH
	h8ERCgyI5aR0xP2l/cVwkn/kn5pZo980Fhs7j0UEPba1b+E7B4AqZ0EbGzMsZ+QiGC6Q
	Ii1H9lnXLSQz+Tp1qe9AVmxHXe7OekyqLgDXxJB7MRZ/poDRntFgmmHCZbrOEvS/4+Rk
	b52e5q5NAocKtTYUDRJe/3fWPxr4qyhdZAyYnvRhYubQKYOqvBhbBEc9zcqVqj37nUp1
	tABg==
X-Gm-Message-State: AE9vXwOyPz5cA8tQlYWOypoNN1XSeR69yAGqQXxHQ0kl+e9/OGr/LApoBfsrb4pode5Dzg==
X-Received: by 10.67.7.70 with SMTP id da6mr74781469pad.111.1473186242440;
	Tue, 06 Sep 2016 11:24:02 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99d4:c55f:fbd3:66fa?
	([2601:647:4c00:3edf:99d4:c55f:fbd3:66fa])
	by smtp.gmail.com with ESMTPSA id y6sm42878953pav.1.2016.09.06.11.24.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Sep 2016 11:24:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a88a8419-f7ad-e9d6-a9de-a92f6efc3272@siemens.com>
Date: Tue, 6 Sep 2016 11:24:00 -0700
Message-Id: <8C97DD38-75FC-4100-A97E-A102C84006CE@gmail.com>
References: <a88a8419-f7ad-e9d6-a9de-a92f6efc3272@siemens.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-java]: java and javac in path provided by cocao and ecj
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
X-List-Received-Date: Tue, 06 Sep 2016 18:24:02 -0000
X-Groupsio-MsgNum: 62982
Content-Type: multipart/signed;
	boundary="Apple-Mail=_62A42642-8F37-4F5B-8D00-D07B5CECE1DA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_62A42642-8F37-4F5B-8D00-D07B5CECE1DA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 6, 2016, at 2:35 AM, Pascal Bach <pascal.bach@siemens.com> =
wrote:
>=20
> Hi
>=20
>=20
> While diving into meta-java I noticed the following.
>=20
> The java version that is found by default in an SDK is provided by =
cacao-native and the javac version by ecj-native.
> Both of these are very old and I get errors if I try to compile newer =
java packages as for example Ant 1.9.7.
>=20
> I was wondering if this is intentional and there is something I'm =
missing.
>=20
> In my opinion it would be better if java and javac were provided by =
recent JDK/JRE like OpenJDK 8.
> So in relation to my proposal to unify the virtual/java handling I =
think it would make sense to clean up the java bootstrapping too.
>=20
> The proposal is to not have anything from the bootstrapping process in =
the PATH. This means no javac from ecj not old versions of ant, no =
IcedTea 7 binaries.
> But only the final openjdk-8-native binaries that also provide =
virtual/jdk8-native. I guess this would mean to move all the boostrap =
components to a different filesystem location maybe under =
{sysroot_native}/opt somewhere. IceadTea already seems build up kind of =
a fake-jdk by linking the binaries. So instead of doing that ecj and =
cacoa could directly install to {sysroot_native}/opt/java-bootstrap and =
IceadTea can then use that. Also other bootstrap packages like old ant =
version could go to that location.
>=20
> I attached a graphic that tries to explain how the new bootstrap =
process could look like and where a host provided java would fit into =
that process.
>=20
> Does this make sense or am I completely off?

I think this is fine, you can follow the gcc-initial trail from OE-Core =
on creating a bootstrap sysroot or even stash them into sysroot
somewhere they can then be used from subset of recipes which need them

>=20
> Pascal
>=20
>=20
> <Java Bootstrap.png>--
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_62A42642-8F37-4F5B-8D00-D07B5CECE1DA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfPCcMACgkQuwUzVZGdMxSsEACcDEhLaz4LPfBcxdYwlw/8lSkp
sFYAn3q7BB2jG0wZiCmZA+zD4S0fnc/c
=co3M
-----END PGP SIGNATURE-----

--Apple-Mail=_62A42642-8F37-4F5B-8D00-D07B5CECE1DA--
