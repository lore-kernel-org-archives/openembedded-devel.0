Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UTVEw-0000ZO-P2
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Apr 2013 12:41:55 +0200
Received: by mail-pd0-f172.google.com with SMTP id 5so2688722pdd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2013 03:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KwTVq9GOmRVMpsY//6c5uQRYpToDazHPvp7svYAcMDY=;
	b=kphEgCyx7/NnfZbDTGb3FIYcnWMEG/Vx3P3+TB0x0T8uHD6/mMxIxkatRRMRmrEn+M
	al4dVLj+ASDmhiGo+stiYSnJHSPEYn1K5626feGPyLl2TCc8rBBnXlpuyh+RerSRLsPs
	aQSSWJYmwTWWc5tf024I8NjNc8q4gk83Q6wOXXlvUAjVpXWV9ak890I2Wf3cEUOrX69R
	RHTp4poau2Y8OUWDeBPzEO2PhYFhEcRfrzgbtKsVzv33UZXIvS8TfV8b3lxuIcAWAlYr
	RQdXeFIawBRIlqgzR192HTPQi7vAryaUdFYoEe/h37j63J/DVPbZBrYy1vlqYZb+iOlh
	aT6w==
X-Received: by 10.66.51.8 with SMTP id g8mr3268653pao.171.1366453456669;
	Sat, 20 Apr 2013 03:24:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l4sm11199313pbo.6.2013.04.20.03.24.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 20 Apr 2013 03:24:15 -0700 (PDT)
Date: Sat, 20 Apr 2013 12:24:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130420102417.GL2489@jama>
References: <1366380143-12256-1-git-send-email-Martin.Jansa@gmail.com>
	<1366380143-12256-3-git-send-email-Martin.Jansa@gmail.com>
	<20130420094605.GA13784@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20130420094605.GA13784@mi.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 3/3] llvm2.9: try to fix thumb build and disable it after failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Apr 2013 10:41:57 -0000
X-Groupsio-MsgNum: 44351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NZtAI5QFBF0GmLcW"
Content-Disposition: inline

--NZtAI5QFBF0GmLcW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2013 at 11:46:05AM +0200, Henning Heinold wrote:
> Hi Martin,
>=20
> sorry to say but arm support on 2.9 is broken in serval way. I put

Yes I also got this feeling :/.

> it in mostly for testing purpose. Maybe with upcoming llvm 3.3 the arm si=
tuation
> will be better.

Well when I was checking if there is thumb fix later in git repo for
backport I haven't found it, so we'll probably need to fix thumb also
for 3.3..

I wanted to add 2.9 only to be able to remove both from meta-java
without loosing anything and this at least fixes build so I don't have
another recipe in error in jenkins builds.

Also mesa documentation says that 2.9 is recommended llvm version (but
it supports different versions too)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NZtAI5QFBF0GmLcW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFybNEACgkQN1Ujt2V2gBxtvgCffcBbgeavMI3MCWbsY7zbeZlT
NywAn0WtK9Jh6snV4uTa4m3PTKKu2vuQ
=NhWJ
-----END PGP SIGNATURE-----

--NZtAI5QFBF0GmLcW--
