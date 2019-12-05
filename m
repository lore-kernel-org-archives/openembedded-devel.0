Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1807F7C346
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 05:00:30 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id l17so2259337ioj.3
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2019 21:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PnYBOosKb+KUF5vvrACnJaz6wPQDEvowonvuhHX2kxs=;
	b=HbLbkLo9MELvOjoqgRjBQn5YhC8dxbJiNQJYYtmBFFUJ4wGiyHY/RE1zC2XCwogV58
	QlJDZRDAgx2u+IRsNMe4yC3c4CHUfZcWSuCBfuXMAfEInI+TuV+bL/WtaLWm0vst4UZl
	Cpp0lamJK2xoT85juie6zvn8+VZgkdbHRYUjWyJ7r4mnjKuvv/8gJ2NYbDZVnmV+qV2o
	eUQzsBiBQaSJA0LHS8fsFXr16P6RfSQzkF9U9jbgt2MZZO6BuyhtQLLUwHpZZAOytUgb
	XL1WCQTVyJ7VdG545+bLZib4uYvvkiXBd2bB8jLB8vOiI6PbXmXpm+6Zjm1IIGKwB24q
	OLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PnYBOosKb+KUF5vvrACnJaz6wPQDEvowonvuhHX2kxs=;
	b=EWYd/aomweep2BOnJ5nXAVdmRG/3w+UIu9KW6CEk1Cy8GTJc+TcR+cVaemcqz3tOP0
	Ym0d4G28Mym63JMkgNwyQxRi5+uFMtlguusKGuKJGtpKnsC1um2nduh5pCMvdvC+5VUJ
	87lmy7tjvSSJwKGwCmyVKwJak9ebj0GyAaZFrtDuaI4pHiWy1ZgpjVo5xpQr+RbPiwaW
	5rd5zT828/UeT67pTMQbXIXUtBAUeIDvb+5wMCjFs+/4sTsNKka9pJmVvO386M20A3I4
	xscq1PeCElI54d6ZgVowQ6iYMPQ13G3IYkUE/dYq1YVD7X2QkzRDl4CFkKR5PoUptpj2
	WUTQ==
X-Gm-Message-State: APjAAAV1YZgTbm0k+xkBqT71PfMLEQLH8V4W5j/rHMSDNyi+HI2FUwgR
	4Cx9GTzYLrGXURlKLQI2iWt44GaGnklfKxdREhzuGVTSW8s=
X-Google-Smtp-Source: APXvYqyfwK5EmfbGN3gCjdxNAj9QhaWXPMxG1+SL0vxBluojw6GuzyBfGBdGMzwBWPcAVb2S5FDDYbCTahkfe7PWFSQ=
X-Received: by 2002:a05:6638:5a6:: with SMTP id
	b6mr6650398jar.22.1575522031786; 
	Wed, 04 Dec 2019 21:00:31 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 4 Dec 2019 21:00:20 -0800
Message-ID: <CANx9H-CNHDMVz4pNz=T1FpmsQ3hDcF=_nWM_a2PhM+KD3JWAPw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [thud, warrior, zeus][meta-python] Conundrum: python-pycrypto and python-pycryptodome
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
X-List-Received-Date: Thu, 05 Dec 2019 05:00:31 -0000
Content-Type: text/plain; charset="UTF-8"

python-pycrypto [1] is rather old and un-maintained [2].
python-pycryptodome [3] is more modern and is basically a drop in
replacement. However, the two cannot be installed at the same time.
Instead, one would install python-pycryptodomex which does not conflict
with the paths of python-pycrypto [4].

In an effort to enable packagegroup-meta-python [5] and meta-python-image
[6], one runs into the existing python-pycrypto and python-pycryptodome
recipes attempting to install the same files to the same locations (no
surprise, they are providing the same libraries).

For the stable branches, should we rename python-pycryptodome to
python-cryptodomex and PROVIDES python-pycryptodome?

[1]
https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb?h=zeus
[2] https://github.com/dlitz/pycrypto/issues/285
[3]
https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-pycryptodome_3.4.11.bb?h=zeus
[4]
https://stackoverflow.com/questions/48155294/what-is-pycryptodomex-and-how-does-it-differ-from-pycryptodome
[5]
https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb?h=zeus#n21
[6]
https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-core/images/meta-python-image.bb?h=zeus

