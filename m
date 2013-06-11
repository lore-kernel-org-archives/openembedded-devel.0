Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF776A8D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 06:59:50 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id c10so10129629ieb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=s4CTkwSZRBdzTskrVjC4mX2T041Qwv8Es0ahniEICXI=;
	b=UXZNxQ7u8lTI22OimaBt5UaorCmLxBE7u+JxNtiV01XV8WSTs/EEWq6AQZPSi/f6Qj
	MbEl9W+ynbo/MzkBmSXpZQlGNu/0d6XAz0IYo9wEiP+iXXbHKLfxijWJIW7fsETtfM3G
	nMn2+wJMztbaNaQ1R1BCfiYPkfzwUQIdLEGru2zJZ3djmhu7IO6zkT4Pwi0Bl01tNgNn
	0bEDFbj8ouyas1Lsv5XKv8MHbGcFyo6jur9zUHqUGLwt9jO7pTPXC3IQ69ZLIY63//9Q
	HIh5wVMvk5H24AscBzjBd3EwWYSNORvWq34Y8ZiMVu9R5YBAX/DHfZoUIO3Ppqw1XtdI
	Xr3A==
X-Received: by 10.50.22.37 with SMTP id a5mr236485igf.78.1370933991238; Mon,
	10 Jun 2013 23:59:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Mon, 10 Jun 2013 23:59:20 -0700 (PDT)
In-Reply-To: <1370928876-14423-12-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
	<1370928876-14423-12-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jun 2013 23:59:20 -0700
Message-ID: <CAMKF1spqaK7Lapq+ty4gpwu7n7OLhQrCevFxzaNQ72PLRhBQeQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome/meta-oe/meta-xfce 11/15] networkmanager: rework settings/dependencies for polkit/consolekit
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
X-List-Received-Date: Tue, 11 Jun 2013 06:59:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2013 at 10:34 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> +PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES','systemd','systemd=
','consolekit',d)}"

intention is to have either systemd or consolekit but not both at same
time is that correct ?

