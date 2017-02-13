Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC94871DEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 08:29:55 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id t8so7231729vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 00:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=Xg0W7GbKjSxDx9L6DHvnCCALmcxhrcGSjlDSQb/qzjE=;
	b=ULfL9T/OfQbbGPOCaXbLZ52D/nxakF1zHtPmZC74/9soQY+jqiDB1ie+5k7UYSA9ca
	IHPwBbM+OG2//NKD0qHdbI1V3DuYXG++JiSGvE3OY2jmhlxtJqWHMDGgtq5cJwY0FeLg
	YPNRhAgcPT9rVO58/YIv2lw3Dodwt9B9dtEkf2rMqvmFUCsu+T8TWHL2CxzURFHmkDvg
	D6zGbT9DT/9G6n6Gusz7IrehmJEVp/dzvQrFCS8DNpEisfMz0+Wm9dWwCz0Y5xzItcud
	FZPqV10dEx2E1P2/PPefnLFZ8BhGCRpwjn3xN4UW3AJea/LPuowzBXDtmMmmaGGO2EuT
	FbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=Xg0W7GbKjSxDx9L6DHvnCCALmcxhrcGSjlDSQb/qzjE=;
	b=WHVnHG5KU1xcQptlq1kxyZHckIhh70B6C+adLRIPeAer+j7zDP9Suwlgt31Vva1F/F
	czA/dSk9Cdof+V4pXb6pPCjRijvLpW8LZQnhJxXYmcs51ceX1tieteOuZC+yDysmsvPM
	4IXYiVj0o+wolJaqx9ZAMAyyf2EV6PLzM7qJUni9icSoO313H0o77BhglmTebse54rKc
	KWwQttuUFDuj8Q2Vp2PWlb/y7yZZHOxLEuCYiUFgJHJOydT+CgP5ZF6LmT7DypRKpr97
	W+623KuIBQWfWdJE6KLeG0sD4xMd+aDmv6Pmqm2ReCwQ1W0pAhRHpysR2k6tmzGXkJDR
	1XEA==
X-Gm-Message-State: AMke39m5vnMpsiwNQHLYlAYnqG02zZWQIzEojWjKgEfvW+8dkzGdtGnDSzQlowND1wafJ8vcPqW3rznA+NxfoQ==
X-Received: by 10.31.167.70 with SMTP id q67mr10801489vke.135.1486974596087;
	Mon, 13 Feb 2017 00:29:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 13 Feb 2017 00:29:55 -0800 (PST)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 13 Feb 2017 09:29:55 +0100
Message-ID: <CALbNGRQ16W0oKziEJCoWBdt6-73NGB-OeRZ3_YRHwzwoi0oVug@mail.gmail.com>
To: Thiago Macieira <thiago.macieira@intel.com>
Cc: development@qt-project.org, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Development] [meta-qt5] Qt5.8 qdbuscpp2xml broken for kde baloo?
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
X-List-Received-Date: Mon, 13 Feb 2017 08:29:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2017 at 5:54 AM, Thiago Macieira
<thiago.macieira@intel.com> wrote:
> Em sexta-feira, 10 de fevereiro de 2017, =C3=A0s 11:19:14 PST, Andreas M=
=C3=BCller via
> Development escreveu:
>> qdbuscpp2xml -a filecontentindexer.h
>> Unregistered input type in parameter list: QDBusMessage
>> Unregistered input type in parameter list: QDBusMessage
>
> Hmm... unregistered types. Can you check if you're applying these patches=
:
>
> https://codereview.qt-project.org/180231
> https://codereview.qt-project.org/180232
>
> I can't support any QtDBus unless those two patches are applied.
>
Bad news: qdbuscpp2xml build with these patches does not output a
single character, the application does not return (no significant CPU
load) and has to be terminated by Ctrl+C.

Andreas

