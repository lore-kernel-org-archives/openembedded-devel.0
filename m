Return-Path: <kowabungappl@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3F86FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 22:01:53 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id d16so11812583ioj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Oct 2017 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bnJWszhWRAO4csysdFFPkj8QOlpjnfBNsvXyIuk3M4o=;
	b=PgHuW4BY6YgLlBWB4Jojvq9SDzxLp+QYoWfCoE2EIJ6Q1fYdBpK10ddmsFUJVY8XKj
	B0wcJFdKy4BbuOde3s1aSqKU+U9zss9ROsrdUhZWc8l7gvqWOib7vd8cRvYRehsWWugF
	FUgHfnlAlQnR3A276hKX2e72nZxe7/eaqy29uh9Sybgltce5cpKiN5STRSzOsg2Q/4Yq
	69Aawwx4J+DnYmAfyjHDqmkNX00Jlz4CPsSOZ0jATAW7aQfrInVjUMNDu1DIaXqyH0Lz
	n1rdeKLiQ3OY8IoBlQ+Qu/bTTx0Sb+pUJSeNVkwNWnkKiQW1R8EXeuSqAGEZj7JsBn5u
	1l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bnJWszhWRAO4csysdFFPkj8QOlpjnfBNsvXyIuk3M4o=;
	b=JHxr68iroacZsmDBGSlYVusBVA40QWpOg52QcLNWtHQ2igtwL+I70LbdSzaCs2zCPx
	+LFVtaQCI0cRdxk8RVLlT6NCHTNmpyjQ5vIxZT4CXsFgNojgHKLsGh/wKPNtNaQFF1gs
	rQ1v1yYvTKP99614zyYWaSGj9OWvQwG8Wfm1RaojOlNWY+EmD3JR14p1yDhhzmqGGbBX
	SW3/mmX6HVEiKx8gcfkUA2ljjXlUoYQ54h3Im277+B7RuwL+QEJ7LdNhmHDJjPKzwbRt
	LeutlFdlJY84iIft0oc/6Q4kxPKUlfMZQzrhoADPCQKR3Iw7pphe9yox2RDUP4QRsJJt
	WqaA==
X-Gm-Message-State: AMCzsaXSacmOhQUGnaXUq4YdTh09I6ZUkEg19lMky0RnvBlRvsucCaMY
	KW25hb0EbNfcMiRUhExIHZ8plDa9uWcmVE27Npo=
X-Google-Smtp-Source: AOwi7QAAj3PAjYsDvyOt6i+wd8EvlNy1NO94vpvbmETH0wCoQhgeKBjbqGFvsn2tqLwFUqO69nQZwu3btwoCuRi1gHg=
X-Received: by 10.107.57.3 with SMTP id g3mr3350973ioa.210.1507154514580; Wed,
	04 Oct 2017 15:01:54 -0700 (PDT)
MIME-Version: 1.0
From: Satya Bodduluri <skbodduluri@gmail.com>
Date: Wed, 04 Oct 2017 22:01:43 +0000
Message-ID: <CAGNWprvL2=xrH-ve8qF6z_AAAHjJ3WLWA5761V-fUwwhZzUrZA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: asn1crypto dependency missing for python-cryptography
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
X-List-Received-Date: Wed, 04 Oct 2017 22:01:54 -0000
Content-Type: text/plain; charset="UTF-8"

In versions of python-cryptography >=1.8.x, it includes a dependency for
asn1crypto and removes a dependency on pyasn1 as can be seen with this
commit:
https://github.com/pyca/cryptography/commit/0e6a129724b707ebf79149376251e85fad550414.
As
far as I can tell, asn1crypto isn't included in
meta-openembedded/meta-python.

I've managed to work around this by using an older version of
python-cryptography, but I just wanted to make note of this as it makes
portions of the newer versions of the cryptography library (the master
branch of meta-openembedded is using version 2.0.3 of python-cryptography)
unusable when it can't import asn1crypto. I'm not sure when I'll have time
to create a patch, but I can take a stab at it if no one else beats me.

Thanks,
Satya Bodduluri

