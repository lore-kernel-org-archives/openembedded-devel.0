Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBE16E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 20:38:39 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so22482410igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=EV/SfIK596d50tbf1rYOfce+BD3aRHiVtUBgVRoLXKw=;
	b=eojvq3pnTdSTmDq29pmmeDSxepSuN3Le3StyTAe/0o8+z2N+aenSkf+j/2m9dnf89u
	2ycvY4GW3JA8IE4GXMc/MNJyNlfZ7sKpxXN19lTjBTiG2A+qMWgwENrsN4ijvxCSGBcS
	0dz2CcLbuGO8ZR7wuMPgJ4Kf7f35yg6clTOoeA6DwXlNwYMUuJ8gz0k5AtPqH9qsChev
	RX+TluteLddJM/HD4GMd9VHkVdlg/gKeIQJBu23yK0Wpzdkr5mNl8p5WYHaLDMM+i7kJ
	EMf2EUw6neLEHfLKcSiDuQvzs8rwD8IBSomtjcmi2M1mIi5lWXSsz6hXH5+1U0KZbwx+
	aayw==
X-Gm-Message-State: ALoCoQlqjrw/Tzm8Wp+I5Q6S376v3iBTEk8BlBvxGoHwq0jD3Ij3FACltvKxl1O+Gf9H0wo4M5Rr
X-Received: by 10.50.61.243 with SMTP id t19mr9442093igr.22.1442349520088;
	Tue, 15 Sep 2015 13:38:40 -0700 (PDT)
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com.
	[209.85.213.172])
	by smtp.gmail.com with ESMTPSA id y6sm372044igl.17.2015.09.15.13.38.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 13:38:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbni9 with SMTP id ni9so20399587igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:38:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.138.72 with SMTP id qo8mr9904447igb.46.1442349518575;
	Tue, 15 Sep 2015 13:38:38 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 15 Sep 2015 13:38:38 -0700 (PDT)
In-Reply-To: <1441868246-3987-1-git-send-email-samuli.piippo@theqtcompany.com>
References: <1441868246-3987-1-git-send-email-samuli.piippo@theqtcompany.com>
Date: Tue, 15 Sep 2015 17:38:38 -0300
Message-ID: <CAP9ODKpi6quc6N=7kRAUE1DCjm6SQQ9vYnctfpT4UNh-g05SVw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] qt5: package Qt Quick Designer files separately
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 20:38:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2015 at 3:57 AM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> Some modules (at least Qt Quick Controls and Qt Canvas 3d) have extra
> files for Qt Quick Designer integration, which are not needed in the image.
> Create new ${PN}-qmldesigner package that includes those files instead of
> ${PN}-qmlplugins.
>
> Modify qtwebkit recipe so that it removes the conflicting {PN}-examples*
> packages, instead of redefining all packages again.

Please add Signed-off-by and split this in two commits. Those are
clearly not related.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

