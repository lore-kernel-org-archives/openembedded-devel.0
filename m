Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0A57FA33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:50:36 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id a7so6910443ild.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4QJAKMG35WCP89uk6inOrmHbwWbQ/R3OI7PHQfB9/Ik=;
	b=rRiUEwuWZK+hUAKzPQ+s64WFIkBduc4QzE9peIiwGk0VZF70Wb7ud59mMrvNtzs1DU
	T/Ee72h9w0s+y6vgbDXmOLZ1IGgkLYtm8+Ww3KsY4JHfEHcszP0841+sTw0RQJ+gZKdH
	tZOiaHF7w6EH7NHglx71CMnGmYtw37YEUOjDL6AVSZctGkGgBNLqj4I/aEbveeM4W01F
	MtIEu2VjRtevTzjq1uFg7D4df8bC7CYlhomYlHePEa/PfWthMsCUWOGD8aG0YtjlkOri
	Scf9ISYhFLUi0U4+Tf+vRRXMx32Ck8KCBxvblhVM/JcNEzX1xRDwkda0Ltx7xS9yfFxu
	o+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4QJAKMG35WCP89uk6inOrmHbwWbQ/R3OI7PHQfB9/Ik=;
	b=S7SPU7WQ90+SCNKPOWH2Ml9EACQCfLEX6vnRTV/IP6wKMrb1kDfoojsVbj0exwUkqy
	UxxpHNpcxsYTl7s39N6WU/AaoQVPpbdukPmxOe+5Jp6/n1X5JEIBj0mXbQb0ZjgK0gXz
	54lqGqSUTAD11NP+JvpCDotMgwhc/OK/4ryuAN7v+j/HSebrgU/vM9siyuDZphUwE2mh
	b2gwz7zaH2Qv2VIvXP6jF+VBzUPgqhI+vgnJZGJcyVEXWNcdIhtf/TT02bdleeE6JVUS
	4fxxdTF9S4Q14HDgt3HFp3uINTyQdURb0+hQzYWeKzpyKX9/MtxknnuTt7SS8ZHTgtHM
	Qh2g==
X-Gm-Message-State: APjAAAXTGtbtSZqUfYLP87qruppP0+x+6pyAWCDraUCJaGxJ4BmOCNl9
	2g/P5TCJzxC7cvyYR0dYNImqUqR9JpZQwMjpRHc=
X-Google-Smtp-Source: APXvYqx9ppnVGCxiTonBG8xpiMptbmAqz5mV8Gjmn2WNtmRfDe6EvkFZyyqw7TJTfSsuLSlmIQn7wFCXnoAyhP4fYe0=
X-Received: by 2002:a92:5cce:: with SMTP id d75mr4988604ilg.299.1573771837345; 
	Thu, 14 Nov 2019 14:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-16-schnitzeltony@gmail.com>
	<CAMKF1soTKvJ=uYgm-Q51yq8xGcissdwf4nKzR3qxXKwPTUXrgA@mail.gmail.com>
In-Reply-To: <CAMKF1soTKvJ=uYgm-Q51yq8xGcissdwf4nKzR3qxXKwPTUXrgA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 14 Nov 2019 23:50:25 +0100
Message-ID: <CALbNGRRL8f1RFYqO5Eb7BHEN=K12vRWxjoSmi1ReFiHT-6Adag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 15/16] libwacom: initial add 0.33
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
X-List-Received-Date: Thu, 14 Nov 2019 22:50:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 On Thu, Nov 14, 2019 at 10:39 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Nov 14, 2019 at 11:51 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > * it is a dependency for upcoming gnome-settings-daemon
> > * there are later versions of libwacom availabvle but due to genaration=
 of
> >   udev-rule at build time these versions open nasty native dependencies=
:
> >   libgudev-native -> udev-native
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../recipes-support/libwacom/libwacom_0.33.bb      | 14 ++++++++++++++
>
> the latest release is 1.1, any specific reasons to not use that ?
Same: long time ago: The only thing I remember is that libwacom was
not my friend exactly (anybody out there with wacom devices - gnome
seems to rely on them..)

Will look into and why I chose to use old version. Maybe there is a
chance to disable wacom in gnome-settings-daemon these days so we
don't need it at all..

Andreas

