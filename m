Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id E992C77794
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 17:07:21 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id w22so4119263ywa.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6/mH3f4OsSRmtgw9nL0ew5F/8je1GqytiZMUQXcDrek=;
	b=RmHLfLZEO8uL4Z1fh1CDegxKjBL8Ez7DanJ8c1jYTckeDag36UD56UbLzWtvOzrRI7
	h4stjkSfQ18VpcJrwJK9QqwBadBa4sHMyJVQ3O6ebyL1rwDQpWXlX9Pn3p8k9yCtd/iB
	D/8fE84ZV4Qdq5Ft0/eBAKnLm0UV3AfqKxpQnNasvM8yPvx1UbaeBjf7Pv5u0teCDVJa
	TT77ahhE3NOUK3bSikcDYQu1u7SfN6Pwirv3VeD5p69wC8zyJobPPHueCiBgv3X8vKHQ
	GsNNaEuDuOV97Z8kDfmzBHF1mhGOef7crrWVjE+vIR+MGHvxPIP66O6zv3dmL0yDyCFE
	Gn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6/mH3f4OsSRmtgw9nL0ew5F/8je1GqytiZMUQXcDrek=;
	b=cJiOcAKt9bgXYrfOyY21wtfS4zChdfB9mERXh7UdOhVEC+lSIua0WcLp6/icQbPqtY
	/vdAKMgDpI0qwyUj2pjyOtAYv7vEZxFkZHtuBTg+mpDm3AJxGXYQlatyUiEthpZ/iVoK
	H/8qoX6WZktmuxK8cG8bjSUFTUH5I1aHlk1mVKDjkIkjbSHSHNTktE0Y63ErJ0zPnAzF
	knXBjGoGtqGWnqVliQcggMlRHP4+4Sm1uabshbo4KW+jrQc/okXiluWUSTITYCPVnu2N
	/+Oz1kUl8W5OJtZhYxYHiwigBEeLHM8RZtw8hNfU8b0mEX7q4FdBkqbHoVRAjvoBMgBT
	4Rpg==
X-Gm-Message-State: AMCzsaVaY6VDSRKKWqltH2qkeGIopMtVE3VPm+JK29QTKxU/WJVxZl+E
	oCWQzNa+S8ASHtAwyB+JkaUxLjqZ
X-Received: by 10.37.107.18 with SMTP id g18mr3782350ybc.390.1506964042555;
	Mon, 02 Oct 2017 10:07:22 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51])
	by smtp.gmail.com with ESMTPSA id h7sm2240884ywf.38.2017.10.02.10.07.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 10:07:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id 125so10129218oie.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 10:07:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBugE0u2jEweKauayPbUT4jIMHCSs/djmZtJPm1TkoH5VjGZ5KmdSHTN130nRyHGmXuBarzI4WWUGY3Xx7fQ7w=
X-Received: by 10.157.41.100 with SMTP id d91mr8592694otb.426.1506964039755;
	Mon, 02 Oct 2017 10:07:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 2 Oct 2017 10:07:19 -0700 (PDT)
In-Reply-To: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
Date: Mon, 2 Oct 2017 14:07:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
Message-ID: <CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
To: =?UTF-8?Q?Jacobo_Aragunde_P=C3=A9rez?= <jaragunde@igalia.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Mon, 02 Oct 2017 17:07:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2017 at 12:35 PM, Jacobo Aragunde P=C3=A9rez
<jaragunde@igalia.com> wrote:
...
> I will send patches as soon as I have something!
...

+1 :-)


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

