Return-Path: <max.oss.09@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 894FE6022F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 11:11:45 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id hb5so34963044wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 03:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FaKttqRtvxLmGZe8upyHoXrCIu8ckrS80hSpKcXRYV0=;
	b=NGeXw8kqU5BtzCo1N8u1EuRbpitE5yXqyx/NixHcM74nWRGBVjYKFdSZQ7icGUxRvk
	Fu0fie+VyY8yzz8g3IYwoW8Wpzb6esK4zXhzXVxHWbVqNUGzUnBIKNYXbTpv1neY81dx
	K5ex7veBL/ojruKdNGH9Qz7ZFZaQ8Xb1ZmxLVuIzWyhZqu+W4P9HAyJFFAvlgR8DpBXR
	MHtknr8NtuwAbDnn8hQcm/0OOX8IzOrSKdusz/ZDV3nR4SuqSbSYV0R8NJfV5CjXRuoJ
	3WPwVkuTDuXERsRKUNlTja2QXNpraAog1vcJo06+ch/eHUYpLgAKHuaeQo/TrBzbN2e7
	PnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FaKttqRtvxLmGZe8upyHoXrCIu8ckrS80hSpKcXRYV0=;
	b=N2+1KGn7yXUTkfYZFY5uygY6xz7J3EJoK7XLj2Zp/EugNiZ3WKST79ttl/68ToqNPP
	61Q5GFZG0EsHi9K1xt67ZuzWX3Xr9L4Xg9tY+2+dTQEj9fQ/QRBvs7weA5OHb4atj4e0
	pw9USfdTi7kgZOiMmMUTx9nxG9l6fddkekO25dVlomaP0tHQX3NVuhmlfUO+rBC9fpMN
	8yHHpL/RlQsvka+1xQL9glaQBkLCQ5awVInO6SHnvd+Skq6haAJgMecb35Akg7E51nco
	55O3OBGSzajOyTu1yq6VLbuA7IF9T4TY2kYld2jXfEe/82dIuOobfXnv20OflnvZ0m6q
	Rv+w==
X-Gm-Message-State: AIkVDXIDedUc02yggDrU39pwLmxT5c5vrH50XKux8WgPaUaROMlq18rOW50cSmR+5HK1TA==
X-Received: by 10.194.9.8 with SMTP id v8mr50421241wja.140.1483355504979;
	Mon, 02 Jan 2017 03:11:44 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	ct7sm87301400wjc.2.2017.01.02.03.11.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 03:11:44 -0800 (PST)
Message-ID: <1483355503.2262.6.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 02 Jan 2017 12:11:43 +0100
In-Reply-To: <45e5bbb8-6e17-d030-cf2c-f54e2c2e30ba@topic.nl>
References: <15daa04b-92db-cc3f-f0f9-14ac92764641@topic.nl>
	<CALbNGRTvDGuegSZPiV1E7WteGqjdYQkjfdHtB-dU0B=PT8xzxg@mail.gmail.com>
	<2fe8322b-11d9-8e04-09ed-77c78cda59b1@gmail.com>
	<45e5bbb8-6e17-d030-cf2c-f54e2c2e30ba@topic.nl>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: morty branch XFCE no longer builds, missing libwnck3
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
X-List-Received-Date: Mon, 02 Jan 2017 11:11:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi

Am Montag, den 02.01.2017, 09:18 +0100 schrieb Mike Looijmans:
> ﻿There's no trace of any attempt to bring back 'libwnck3' in the morty branch, 
> am I the only one in the world using morty to build an XCFE image?

You are not the only one.

As there was already talk on the mailing lists to either revert the removal
on oe-core or merge the relevant morty-next commit in meta-openembedded I
put the recipes into my own layer to keep my stuff building.

It would probably be beneficial for future recipe moves to first add stuff
to the destination layer before removing it from the source, particularly on
the non master branches.

Max


