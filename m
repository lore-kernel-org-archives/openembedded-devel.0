Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id E775B6E97D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 11:36:22 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so607258ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 03:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Nfo8N9R+H3IhW4kDIMVO3I6U+9rRFx05X3ZVm8p9RTg=;
	b=fObtzud7Px+QlmbmNhaVFqSenqvkjFp+qbjgWpVnTZBdBAfsN6PhVWGWtewrfPlKcn
	E872MhWtwb/uoLQMn4DaVx+If6CTSNAD0tqb3/dO3PUd1CJltpAWlziA2PEEB+lgYPuW
	/IC8gpEK9qQzmpVmj1RqvDrUfOlSdl5StT2lBaCKq4LULu/dwCNc0TLGDGX7J71u299z
	niFsanWdIpfocYJbkSNe0ZJom8QjQTaim5fzBsg5IC9DQ7ahka9284Ytr7pe+WGQ96AO
	K/KH/qJW1jcCaMVvf5rEY40BlBfq9B+W1NkPrk/sxkAChrNdC4uEFFV0y+dVJyKlzLuM
	/eKg==
MIME-Version: 1.0
X-Received: by 10.236.94.243 with SMTP id n79mr5494571yhf.46.1393328183136;
	Tue, 25 Feb 2014 03:36:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 25 Feb 2014 03:36:22 -0800 (PST)
In-Reply-To: <CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
Date: Tue, 25 Feb 2014 08:36:22 -0300
X-Google-Sender-Auth: h2aWfVptPooAwDK4LBD28e43alE
Message-ID: <CAP9ODKp_b4MmZZ38DSB5JwWevucrOmE3tzFeL2F-DKe9=LyEnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>, Giulian Vivan <giulian@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Tue, 25 Feb 2014 11:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 25, 2014 at 2:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Feb 24, 2014 at 12:28 PM, Otavio Salvador
>> +RDEPENDS_${PN} = " \
>> +    gdbserver \
>> +    openssh \
>
> one could use dropbear or openssh for providing ssh server can we rely on that
> instead of hardcoding openssh here ?

We can try and see if it works.

Giulian, could you give this a try?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

