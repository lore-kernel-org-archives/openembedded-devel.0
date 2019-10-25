Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E55F7FA0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:07:45 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id o16so1601953ilq.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 05:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zRdgmpnCtANE/VY65hliq1KiPf/dm8tgbCIZUydyj9M=;
	b=Tcpg3Be7veTZLdfPoyHzW9UKkYXCkxSZ0T6c9/nHhS+qcXTB0ZOePIc4fjw2s9vT/t
	daqOKvjr+Q3R7iMKQ1PV3JtZ6ix27fXhi/y30XFNCXdwXWk0fXB0/yIjjyxkpHnnzF0D
	Jc8V8PT4hZXHxvpBs66qvAfAxzXSlaFV8OqtdpiYMS2cpej2Lxx0UG4fJeS4rAn6D518
	K1DKKn2ovUYPOeLcKML1H3XVu/0dy3sED1f2OsGe0HvljgOc2FjyL7QtL1eIoFIVxzIf
	lb+t5g03cYlJgpLJzFIrh2qPCK5Lq8DHEckp17ZJoiSF18755zDBPCDpxPP7L/yhLMjk
	Fkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zRdgmpnCtANE/VY65hliq1KiPf/dm8tgbCIZUydyj9M=;
	b=fhRp3G0baIHXBe6mniDIa91gcYe8W2NXWGanBorZuWw/KZUwMgnmmu69oimqvPZk7c
	CxiQDBNHQFFBWtjDWogDH9ytPmuCzITRydYoi8SbZ6PsLyjjXnmo+JyAQJgJEoglsoES
	lz0ZkTN54o7hl6s4nSR9qtYVJo1cuZ4Ot6zjfgbUH8SAYdNNCpkDFVUIzJ62j4W9SlCy
	aDtGcNhUT8yNE6jfpinsfstgnVmfoZUC0Ls7Zy/o2tIfnNNZfb6Bm9vTB/qIbHeKelu9
	UoHk8f8wIWK4Ms4CxpSRXFUzkQ7z0tO4bUGpSujYxpE7jkNYBIcM2Q5RGgO5UcyDunpt
	OMqw==
X-Gm-Message-State: APjAAAVhaiZBeDMWeZnvWfr3cOCrH49yxEHtJBaSt7wDrrYe1gglgLGN
	29hDfntMUzC5g9Od4Sbrnv+6rZECwNweRyF6JK7rxQ==
X-Google-Smtp-Source: APXvYqxtJSjFLtFl2hYtMp4cVBWZ99Tf8bMPu6/7V0svP/p7qqGFMuQwrJfAZx7H8w/3HaZyMpZGmlQapXzIlDTKeZc=
X-Received: by 2002:a92:9e08:: with SMTP id q8mr4024577ili.108.1572005266149; 
	Fri, 25 Oct 2019 05:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
	<20191025072113.11172-10-schnitzeltony@gmail.com>
	<20191025114506.GA24586@localhost>
In-Reply-To: <20191025114506.GA24586@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 25 Oct 2019 14:07:34 +0200
Message-ID: <CALbNGRQTdYJd4BgyEDuNr1KwtScJZR-0KZR6U___Ut7uW47GPg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/15] zenity: pretify recipe a bit
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
X-List-Received-Date: Fri, 25 Oct 2019 12:07:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 1:45 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Oct 25, 2019 at 09:21:07AM +0200, Andreas M=C3=BCller wrote:
> >...
> > -SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GN=
OMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
> > +SRC_URI =3D " \
> > +    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${=
PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
> >      file://0001-build-don-t-generate-manual.patch \
> >  "
> >...
>
> This should also stop overwriting the gnomebase SRC_URI, replace with:
>
> SRC_URI +=3D " \
>     file://0001-build-don-t-generate-manual.patch \
> "
>
> cu
> Adrian
LOL - V2 will come

Andreas

