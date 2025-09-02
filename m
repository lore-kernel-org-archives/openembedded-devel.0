Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3128ECA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 18:55:00 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.85681.1756839293922434622
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 11:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRVO63uf;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f646b1db8so5545717e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839292; x=1757444092; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhrajVTW1arSuIE7fkZ0CU4oK+Hkg9hAR3aOlFFcwJ0=;
        b=MRVO63ufKzLibBycHyERsj/tnxH67OO8ddPXG1yyolUIvQYTv7TzndUQe4I4Z2Or2X
         LOwDv3KB2khfaycYVaTro202wmyLGyI+9ilsUP2IcCIjVHVxDpSqkUcTHSGUsJ1bovNn
         1j5PeTWXM2yVdCzOCsCNmZUFcdMg1d5dk6eK5oyElDU3MK0cSUZFWO2txr1uUK3Sz7Cn
         gQ6Wx29KpTlj8EgdlE8qPCwkGDsRpSfCGfNG8P1FjeZZAoda38MxqJIEba2spOoZjkNi
         b2RAocC3xkdZhncmvc1/23xMhxxxaHGDhMSmvTgGK/ExL3VOBXiZVycfaNHBxiiRuprM
         CsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839292; x=1757444092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhrajVTW1arSuIE7fkZ0CU4oK+Hkg9hAR3aOlFFcwJ0=;
        b=BjsR29WU2HQ8BfY0dfrznFzqmzAHIJIiF6kr6VYft7D7E/+UKuAI67w1TWUV+n9NQn
         tdqERR0wsZGfhTix6UBTynlvUbf/ZXsWS3mWhIZHWnxrxEJnXPJ/65z7YgFq0QrFPNQj
         vo4TuSbZWtWOZHcA3d5kjDIipgc6lunxulyjHV/wI9CD8lSCYHeo0sf/S+KDDzUJ07kY
         XCEdJUlFu63lBrx9xHGxVvMIaiHNeALHK3opbSBj8VdcMMBVsY6G1Vx5McLRNF8yaSs+
         GuPJlMe1hAlDXogZTfp6XXqRfNgQQX94nM0xKtL/1PE+JGp4sFPwIB9k9c7ERFXru4P6
         bxkA==
X-Gm-Message-State: AOJu0YwnD4JBgJiXnsHs1MlbVKGA5DwVxwXdPNIdetds8KvGVlpwHDXn
	A3v1u0r8uirTMojVuIPadBvBpIVNPJgPK0tBcxDqfrSsUMv/tp8lTLb5Ocg5x1AIhIdkFAVbuZ0
	x4WynG3WRjViJEchfwViDRoLXguEc6oQ=
X-Gm-Gg: ASbGncsKU/vDWjGaaemb/Rra1gXHlTqfWKB1h9rDRPB8hhghzKFl8BMRbxLL3IyorVM
	VRcmOwi4JdYDlJpfDUvzeKyqi6QHRDESWUCTRokCOxahGFrfN0ZwXWSI35mOP+Li/cdC2XJHnoz
	QYlJYUU7eCRQvJ1oCl83PQUexkxEcR7Yi2EyOQCSCapZBCZ9VVnmU6IP4/MEoXuYGc1Ts2c/yJg
	zlDm7rJejmwF6uKDtdZFR4ajFtGTGXcjryFUWAoIuecwDlnKg==
X-Google-Smtp-Source: AGHT+IFhd99/c6OtOZmrrpH/3Z/rLqW7+IfmlSbgC4YE+/8qDJTnHhU6LPIQxdQHHcKodopixWNPtpAC7mCaHbUFRNg=
X-Received: by 2002:a05:6512:1053:b0:55f:47a9:af6c with SMTP id
 2adb3069b0e04-55f708a2d37mr3914425e87.11.1756839291375; Tue, 02 Sep 2025
 11:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250902180740.263633-1-marek.vasut@mailbox.org>
In-Reply-To: <20250902180740.263633-1-marek.vasut@mailbox.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Sep 2025 15:54:38 -0300
X-Gm-Features: Ac12FXweSHnSYvUMA7V5fr3306U4L5Dm3cPbYeTxSdiRGTzdkS2bBIy8YSzvtao
Message-ID: <CAOMZO5C-qzw4h6YKHJCZ3cwz6Y2g_4JvGVj2Td2YHqcyB_PMsg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RESEND PATCH v2] imx-cst: Replace hard-coded
 linux64 with linux${SITEINFO_BITS}
To: marek.vasut@mailbox.org
Cc: openembedded-devel@lists.openembedded.org, 
	Kelefa Sane <kelefa.sane@smile.fr>, Khem Raj <raj.khem@gmail.com>, 
	=?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 18:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119187

On Tue, Sep 2, 2025 at 3:08=E2=80=AFPM Marek Vasut via lists.openembedded.o=
rg
<marek.vasut=3Dmailbox.org@lists.openembedded.org> wrote:
>
> Replace hard-coded linux64 with linux${SITEINFO_BITS}. This way,
> 32bit machines can also build and use this tool correctly.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Thanks for the fix.

Reviewed-by: Fabio Estevam <festevam@gmail.com>

