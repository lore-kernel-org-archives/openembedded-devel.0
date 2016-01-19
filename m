Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 191F8600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 00:55:03 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id e64so3768660vkg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=94rsxtGFHm120ChLWSWWRSTVu3rzlFgcOrwA5CevNGM=;
	b=iGAqEUvTPIUmaWWbpmEjHyJ3PggZ+fsXDpeU+L9Bff9EWDRsiWEZI1RBYz3UEXb7IR
	jAdjgNoEmYNjpL4rQHG6XrKJvkkrTHUVpwCUpD1FM+AbYuTF0reeAV2jj3ZX2PDiYcG5
	/fQk1cs125kSt3cpLIeXCwjBSMteD8arJcL3T/vc7ElRXvavMleFtb25L1vN2g3JaYnZ
	raXOUzDutkzDn93ui/Q5ud4fq8OP1FZsjV/he4/O8J8wGFUWsKNbh1/YFE/IuN5PO0AU
	hxS5aQDHLVqCqEIfMNnXI5TWhZqgCer4QsTrG78v94QFzpiKXsmF0E6Ta2dH89qSwM2v
	ulhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=94rsxtGFHm120ChLWSWWRSTVu3rzlFgcOrwA5CevNGM=;
	b=X5u8ZwKs71Rhd4gXVaD1+WTVDwLxyAKMRlPf03YlcCKJ/quCR+TVyA/RIzPyE2ifXP
	2M2KLoj79o7VzkmZrER1qpElqJt5UDc4qBD7AB0FGB4dL9prLC4WJfHQSSoSVreP3VaK
	Zq5iyRxAhFSr3RMQawFvywufjNhowN8BvD8kVigo5wnqE4osu9LVK17kpCUuvcWBq0hj
	82qr6fwx0Np7a8WYIUCT3Z/vjxFLKl+r/qiJx/wyJby4k1hGACXVAz08SvswMz4OavC9
	vT3z6odaAUT4VebJHxIs7ACkmp9OlC41oNLW8v7VOHyL6Nbr1fJBiHBtKKI+UuLKb70q
	SOPQ==
X-Gm-Message-State: ALoCoQmVkRVo1igLp1hhwYVi3nY6Kfsp0Ko9suWzXYmZShQ4FQg/i5Gqf8H81wn/fJBfCZvCr/szF1kdDqe8w3cXJCNxa7y1hA==
X-Received: by 10.31.151.75 with SMTP id z72mr17843870vkd.104.1453164904171;
	Mon, 18 Jan 2016 16:55:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Mon, 18 Jan 2016 16:54:44 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 19 Jan 2016 13:54:44 +1300
Message-ID: <CADySD0EFwRsTc3mMAfZZBFmsCGhY_7my=yaDnxiZV3OgwqeXwA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] Change bluetooth.h to compile in strict C
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
X-List-Received-Date: Tue, 19 Jan 2016 00:55:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

qtconnectivity and qtsystems fail to build because of Bluetooth.h
compilation error.

It is fixed in :
=E2=80=8B
http://git.kernel.org/cgit/bluetooth/bluez.git/commit/?id=3Dcf52a40302d0d20=
ccca22a7a1f53e46ef8abfca8
=E2=80=8B


Please include this patch in bluez recipe.

thanks
Ankur

