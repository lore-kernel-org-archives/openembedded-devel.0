Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id CB8BE71CB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 21:32:53 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v186so153106357wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=Z0LKxBrMKvf677aam3R6XSyuCYF6hdoH2WMDsYbYZBk=;
	b=Q/gHT1GH7cO+XpmLfr8F63gqb+UCUYY0kUl68kREIIRsi0qj7eCqTP33hdEiXwj5j1
	Lmth1eDNpgbTwMkPH8KKi8OATikZzoWFN3pWuzXwk1LJT7PRmWzVLpAbaLwIi/Gmk7Ex
	3lN7n8ZbVNv+9xejjyITx2TdNd2bIOOQvZ4fUqm6tIlWk18GSkuQ19f5HNfsNo7qxHys
	vlrgYKCht4vfFuO39uZwdBZjoVABIxas9O6QUUHg3ZHpefvG5c/wNeQSGeAUx4c5jBSu
	kHFaOjC92NrH0R755uzeF1ljmK4mfIMN4SUUuPJ4o7McIWq+xDd+AjRUWIPuheFvnIl5
	w5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=Z0LKxBrMKvf677aam3R6XSyuCYF6hdoH2WMDsYbYZBk=;
	b=a2KHaOlEpPUmHFWbE7RWswUoUGHyp283oB7qdGZg9H6OBPyqZlk+3CdQNk+NFF/fRr
	mDX6Z7o+JG0BlFGfu6JkcALV1IZdLnDYDyduna0KJkEsVfWoafxhycZwWx4dWmNGB73q
	Fp7HkaAK69BLMGuAlBg5TL4VaWk5JKAn4Y2xMz3Twuvs+SCUGkevC8n+TRj9EhCpqYhg
	228FYtMrOVRka5SowdxDxGUXuK3kV1PnQQbiyoPNBQZ5wsBqxQ48KQM2GgtNUj6zGuiR
	ReKqiWJalYV1lo2Daz4PZ6bMH2mbc6ADHiLNgvDXonDMoEKn+Ml5wQBRsWf+ooANklbD
	tOog==
X-Gm-Message-State: AMke39mqV5iemNXobNpMXdUKyUd6WJ4EO1Ug6ZmVu09vTMRdJsw0DgR0kvaYK53EP3pjLw==
X-Received: by 10.28.88.6 with SMTP id m6mr265809wmb.4.1487799174064;
	Wed, 22 Feb 2017 13:32:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m84sm3578788wmf.10.2017.02.22.13.32.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 13:32:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Feb 2017 22:32:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170222213254.GH3283@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Before you ping some older patches
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
X-List-Received-Date: Wed, 22 Feb 2017 21:32:54 -0000
X-Groupsio-MsgNum: 65461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NyChO5MpGs3JHJbz"
Content-Disposition: inline

--NyChO5MpGs3JHJbz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

1) Make sure they aren't already in master (or master-next), currently
there is only one change in master-next:
eb7979113 netcat-openbsd: fix implicit dependency on pkg-config

2) Make sure there weren't some negative feedback comments on our change

3) Make sure the change made it to patchwork, currently there is only
one "open" change:
https://patchwork.openembedded.org/patch/137499/

Be aware that the changes are usually daily marked as archived, when
they are sorted to corresponding bundles and included in master-next
branch for testing, as described here:
http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same_oe_project_on_patchwork

I'm writing this, because currently many changes are missing on patchwork,
because of some unknown issue with it, see:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111467.html
once this issue is resolved, please re-send missing changes.

Regards,

--NyChO5MpGs3JHJbz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK4DhQAKCRA3VSO3ZXaA
HE7IAJ4yqjhjyAOrw2xePCO7JuNAnPNtAgCfbAlWz58BbimeUqVAeeiJE2ZMSVQ=
=HmJh
-----END PGP SIGNATURE-----

--NyChO5MpGs3JHJbz--
