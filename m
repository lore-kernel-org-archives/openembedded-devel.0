Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 33CB07716E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 08:39:08 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 1so78188542wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 01:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=WlGoFLNUArYqag8GZcWEkD4UeLg4qK9sq3HMuWq/h3I=;
	b=UnM1DmIhy7wTZnwN8qgUfvSGx99WFYpVbyLrLFlF/5bOlUEocWT3zFAErt2FmC4CWJ
	FIV4dAipJ3F4eS32/K3WA76G9IBRvsCE1SNO5FKB59n2k+FtD3uRN/3QR+58zwUjcVcw
	TtI2ZSh6xC9xNlOA8yQy8A9TQLC5XoaRbWAM5G0TbLd1o1ddHe0li0ZDo/ZdtkwSJxj6
	JRDPQeGAM1bDM2lCc0s6qAgwXfFcMM76ogS1pkTXc/9D/OWjKiIxfNo/OY+VB0edx+Sk
	ZtjfgIBPx+Nx9oEWw8chNelxeEzv9kW9Ra5moOh51XcgVLepxlW09EYVkxrgaqm4MhE9
	7Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=WlGoFLNUArYqag8GZcWEkD4UeLg4qK9sq3HMuWq/h3I=;
	b=PRdcDYOiY1zcb3i3y/4vgRfr9RAg7QKoJLMUbdz7+0dl7GolxBuV4v16DHDfKMVbQz
	iZlHp7aIjd1NtBHwNtsz0/VD8hoyySz3JzGf/crdq2xCot9K2ZWe2MKlTCEvAMjevjBD
	rLKsA/tC57sZqNudgL+R1ly52k+FjiX7+7QqhhLS1VsuRHw/fZgqYjBRTfixA7cS+0pf
	pK7N+N8yZa+4CRsVOnk8TvAXYf6Tdx2MROOD9jGf5NWNkVReJOPmCaM69Xz3N8zyaH0i
	NZzwgTQTZRzCqqMNwQjSK5UcQkoojneQqi16/G+MYp13u687vqjOlmMm2mRQLX24rl9e
	r2+g==
X-Gm-Message-State: AE9vXwOixKLzgQHetMhaAq8AEMSYU/gPhJBQMQG0I/XxBDr6KcWSbAWv3TZN3doF2dZ2SA==
X-Received: by 10.28.157.194 with SMTP id g185mr1753919wme.34.1473928748201;
	Thu, 15 Sep 2016 01:39:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id d62sm1378211wmd.7.2016.09.15.01.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Sep 2016 01:39:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Sep 2016 10:39:06 +0200
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20160915083906.GB2641@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: 3 meta-networking patches
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
X-List-Received-Date: Thu, 15 Sep 2016 08:39:09 -0000
X-Groupsio-MsgNum: 63124
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline

--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joe,

can you please confirm state of thes change:
https://patchwork.openembedded.org/patch/128859/
it's Accepted on patchwork, but still applicable and included i
master-next.

I'll drop these 2 from master-next as they are marked as
Rejected/Changes-Requested now:
https://patchwork.openembedded.org/patch/122365/
https://patchwork.openembedded.org/patch/125839/

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfaXikACgkQN1Ujt2V2gBwFFgCgtK0uvRio90RRuMI2zLjvvo5D
2cwAn3EHqwnBv6c3JbmWJF1LVfLMJKYg
=g7Uv
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
