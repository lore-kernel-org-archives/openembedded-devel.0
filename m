Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2A07D2E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 23:06:36 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id l10so969506iti.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 16:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MLJ4uQL94pzqBrBYMBNB4bUrxocI3c2Dl2I5gPTKV4Q=;
	b=C0Iihob/k+cmv+P/dJoDm88JlcekIJyI0nfQwwMrPwxU7P7CDXhUacnQsYjw7DmWUL
	HyIIPxmxOVYSnk3im5ZHpGdikGkLNyEkWs3Yj8Bwks/k97bbxRFkbPeC/inr3ZbAW0o5
	77uVNvzW4WlJ6puzTEDhjQe6wHzeI+4H0mQf4JOIdXVAenpfGD7wWbcwcSEjPmTX1eZa
	FjHBXNiKmynvd3vTG2W6RbEMhl2MAfU9kwb+861wJvj3AJHFCURYA+ekI6/2vTquJdVm
	U+cQ0KF+WaPO7XKe7AES9qx52Ca7aWBMaRuuqLATGZV61/Ld8lFGSNIDQULMwYtp1tyn
	ePlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MLJ4uQL94pzqBrBYMBNB4bUrxocI3c2Dl2I5gPTKV4Q=;
	b=U3HdgGr1vw9XQWhGceiiEniffSMtuzWeWjcUnusTxmYj488r9D78tY4Ul2/GW+ZrbP
	m/tUdcPFFjfADNhATrrR71H+qsVG2UIeI1q7wnnjeJU2u4ugCEEvQVtRVbID7I1GYlPe
	LxzH18vwSBUNX/CbiboZZedxUBFtnjHT9+4Ip7Loe6vt9QLPu6j91lFoldxupZCd4knt
	BbqE4q37IFWIvtfdUvirjIh5vH9M1R7xO+H8PAoUBtYnmtDECNmrviFw3yvwoL9yp1Fk
	PTY00g3y5omCpraFVvYgZL+RktZWN0eqkDibqFStoj9xmF+I3a0+CLuDW29fWDVrynVu
	0vxA==
X-Gm-Message-State: APjAAAUUl0xTWOoTQzgndo6HCRclmIa89nI6Q+J1rDRVBBmivvsVLFcP
	Tycfo1NnW09KqYnPrtmFXhg0WvSx3dlut01HkuwLQzWeHr0=
X-Google-Smtp-Source: APXvYqyz899auzm6ThBc6c1pu0NKiXiWul5af1WcunkqykclOmzVEdz5s4UsnvHVuGKjEDcJUDC8Z1q2XXzFmiWKfHk=
X-Received: by 2002:a02:3846:: with SMTP id v6mr25412887jae.81.1557270397611; 
	Tue, 07 May 2019 16:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190507214414.19696-1-bunk@stusta.de>
In-Reply-To: <20190507214414.19696-1-bunk@stusta.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 8 May 2019 01:06:26 +0200
Message-ID: <CALbNGRTQDPSZTk0z46fh7gEpLeP-pp3SqJsHBCaX_o1g=sxGaQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] Remove the obsolete glade3 recipe
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
X-List-Received-Date: Tue, 07 May 2019 23:06:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Adrian

On Tue, May 7, 2019 at 11:44 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> After the libbonoboui removal there shouldn't be any reason
> left for this ancient version instead of the glade recipe
> in meta-oe that currently builds version 3.22.1.
NAK - libxfce4ui PACKAGECONFIG gladeui builds components necessary to
open glade files shipped by GTK2 xfce4-panel-plugins. I need that at
least until I have ported xfce4-closebutton to GTK3.

So there are use cases.

Cheers


Andreas

