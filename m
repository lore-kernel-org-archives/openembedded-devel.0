Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id ABCD665CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 19:29:28 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id w127so170599132vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WzvrRznJ4K/sV/XFUHscVTP9GWHcTTXlIM0Wu6wdi2g=;
	b=ff0vbwtBBBfsIG8VBMHS45fs3plWZ9409xX2V66d63qg9iVrIyoSIb+6cUTrQMEFuI
	3A60V39zPwRaJ9Csud5yNLkwFn3Jo9SMfQZU8kGF6NdztUGZMFDMFzyxR5G7Z2s+Ovr5
	FUp2Cj7iN+J9JBHN6BtVDmXiNs/VOqQC2q1ED3BHIqOgXHh9nk5/OtTxbP4G8N0rnHUK
	ttcWYDjbJRcWe7MItg3dHntV3IVRN3TLWNNiZMjdBtKUfM+C8eaEfE7rHf/TqMOufCD2
	lolGoDraNWVPKtaeOm9+3MmINkO8cBnsyM2GU/Xz6ye7EsXHIt1FuhgxZX91Vk72XSAM
	cCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WzvrRznJ4K/sV/XFUHscVTP9GWHcTTXlIM0Wu6wdi2g=;
	b=aY/BwX/K4mnbli4SWwtqBvcjTAA2sw5NGT5N9IKMNikXSMsMFFMjhGfLPR2TWvzOmi
	r4OG9dtkeBv8IZkFkx1n7B7hYdYBj33cT3mRv4pIykWUjG4q5Abj1kl4ylwnX9jhTSwb
	KEPyBQ8NoPqiL0Y8u88O7NA378w+wQ3WYQSKbkG8FB15RY+r2Y9+DFCy7/npdmgRIwIM
	lNVUil+lvLPNDitg9Mymlyu6eUGRyIvF8m1y5AxErTxZ9L6+IikexYkPkrHG8xLc74Di
	plJ4c5ArlWVYrz+1bBjBecuZVx/GVpklyaELYhZ1sqa4z+LM+LkUNW9QPkQywV9vGi+Z
	EWsg==
X-Gm-Message-State: AEkoousGCxgMqbSIfle2lBO8PO6i9idQZXDz/euFbbTdN0GM4/h+WKyP0QoLt41FzPNYxQ==
X-Received: by 10.31.81.199 with SMTP id f190mr2263384vkb.139.1469215768301;
	Fri, 22 Jul 2016 12:29:28 -0700 (PDT)
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com.
	[209.85.213.53]) by smtp.gmail.com with ESMTPSA id
	u35sm2371903uau.25.2016.07.22.12.29.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jul 2016 12:29:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f53.google.com with SMTP id w127so170597900vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:29:26 -0700 (PDT)
X-Received: by 10.159.36.15 with SMTP id 15mr2266897uaq.79.1469215766556; Fri,
	22 Jul 2016 12:29:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Fri, 22 Jul 2016 12:29:25 -0700 (PDT)
In-Reply-To: <1469014819-17231-1-git-send-email-gordan.markus@pelagicore.com>
References: <1469014819-17231-1-git-send-email-gordan.markus@pelagicore.com>
Date: Fri, 22 Jul 2016 16:29:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqggtFoq0N9NdrL+0-yFk6PtbyOD6ozZJHrGeKHO_NyXA@mail.gmail.com>
Message-ID: <CAP9ODKqggtFoq0N9NdrL+0-yFk6PtbyOD6ozZJHrGeKHO_NyXA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: Re: [meta-qt5][PATCH] qt5: update the recipes to the latest LTS stable Qt 5.6.1-1
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
X-List-Received-Date: Fri, 22 Jul 2016 19:29:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2016 at 8:40 AM, Gordan Marku=C5=A1
<gordan.markus@pelagicore.com> wrote:
> * The Qt 5.6 release featured a severe bug where the
> Qt Quick applications would crash after some time (QTBUG-53761)
>
> * qtdeclarative: Fix crashes when incubating objects asynchronously
> with initial properties
> * qtdeclarative: QML: Only release types if they aren't referenced anymor=
e

Missing the Signed-off-by. Please send a new patch revision and I can apply=
 it.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

