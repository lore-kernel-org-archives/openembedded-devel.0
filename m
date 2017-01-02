Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 81FA96079E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 13:15:58 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id v2so125830434uac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 05:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=9hehTznmruAH+ygkSwc1QUVO1az4kwmwxeALWKJa5p0=;
	b=ZhiDTA1u/FaYTIyGJjbaNRa+agd8F192Igaj7ll0uWya4nTG+loqTcqOfhtpfIyEV5
	Vl8rAOFa4ThyNMTj4f8pyo0HeNBfUt0qexXIft1Kj5LSi/V/RNvwgSX1WwZeD7uppo7z
	PEC6j0HpkdL4uRWu1pdB4xxmxE2G4Ra4hErlGHgsqPrbJ682Ab63B7GJK8qfAwCrGGf2
	BG1NDaKIdjAwiW3Qb1f5du7WhVTxaKZWu4Z0BtVwvcR/ixMF/RpiL98FjA3q4KJIvvSW
	UAXFkRxCbSryDjTZVdmgDeTysZVKTLfTor3kjciYkeAlCNsONZfQ7X/coDwZl7WHC2kp
	6ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9hehTznmruAH+ygkSwc1QUVO1az4kwmwxeALWKJa5p0=;
	b=iKrqNEoaktWm5Nvtg7a6pTNgkIi/e3TPJN2uK9WZQ9TRMtYs1kgqF6Osb1rYCizDAG
	9RDnh7+xxxas5xh5E/KaVFQEhe61Kbw601GcrJWHF5PUqIbQMSc3ZK2ROTTePUvBLyYY
	WOIk77MDUjTra6VbLxl8jJClc4u2pW8YmUxH1y8cp6hpxAeZC+9CXNn1Gu3Q/ulXpnZ4
	W9rwA6RXYEpRwHVP/eEcmNNkzix7vCJ9Q5mNInlSsQpus7aJ5yGke/HKPKSXUT3Sektd
	3u5nuH/2ejwN13uB4o3psJaNAazc0KYPPV3G/C8IXg8oiv7q4uKfWmge9fVi6+6Q0A45
	Yf1Q==
X-Gm-Message-State: AIkVDXJNgbsgMsN7TgZa+uSY09yA4PZk8hJdOM2/8RShbUzFKrg5QPlTXHWjSYo8f8MmiB5nz9v5Bw4W4qU0TQ==
X-Received: by 10.176.84.150 with SMTP id p22mr43632891uaa.50.1483362956788;
	Mon, 02 Jan 2017 05:15:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.14.2 with HTTP; Mon, 2 Jan 2017 05:15:56 -0800 (PST)
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Mon, 2 Jan 2017 15:15:56 +0200
Message-ID: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: apache2_2.4.23.bb fetcher crashes
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
X-List-Received-Date: Mon, 02 Jan 2017 13:16:00 -0000
Content-Type: text/plain; charset=UTF-8

Hi!

http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been removed.
Latest/current version on http://www.apache.org/dist/httpd/ page is
httpd-2.4.25.tar.bz2. This crashes fetcher of
meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
that is Krogoth recipe for apache2.

Thanks,
Matti

