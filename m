Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id A886F7F57B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:37:37 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id w12so3241137iol.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q3lqPM2feqVLU9825Wamr6dPsSWIl4Gn+A09TkHrvE4=;
	b=MP020Q7VnE9+/P+p78vDDlNnCbVQuRo/fAdFXpvtQcqjoIvNBm24uYUsLNpvXfe86W
	YI2sUHdZXgGsNYd2buOIe1sAAzMMaxQKHgZrqq/gu7iOTa1iq4Xb+vJUUa4ev0MJw6gF
	f7bxIMN2p+F9Vd1Kz/lWaNQ95FF3rPFnBIOVPMsDLeywxL7CKoPQRSMrXu830CXYNdfV
	MlNuek7rgTGZSo9Gz34kqb4QcB6voFK6MiHI2gdU1ZEvBNzTMlyA8VOHTmRGi4o5ovwy
	FURV+PLLIrJ/eHb5Yy49tr38W8EH8y/znmT07KxnQa5Yh+rBJCB9Uqi6MPdO/S5ubsdt
	8XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q3lqPM2feqVLU9825Wamr6dPsSWIl4Gn+A09TkHrvE4=;
	b=Ymzi80sB8SPoh405VD0VisKWqaaVnph0QSpKM83KgbwJAVuivET/Sb+K9n/IUl4tyb
	g80ExCd/iYjgt6EEJqiw9SBu+0SsQPOPwf1Nu9iAKgSySy9gqbo97xsJBKt16y2sB+1l
	1idNxvHFrPIrtnhLcXt0prBl8LsmljYLHHQZqMVYNUrGkW+1nM1o9sIq0tDzQ558P+YF
	ntM3upafJ4bUQHVhTd1yaEUfjwpb8/cnS1RqZHXwhYlIG16AxXuVPsnBRaHARKIFZ/6R
	9gqQ+/59Oc7mFLRp0YlITbGpZKBx4FlEYGXxA0a4oMP2mnUFPLcb3gmgwWPOkylo+JSx
	9TNQ==
X-Gm-Message-State: APjAAAUyIPalK0HvIAEcMaLYVRpa7Tk/0Ze5R3b9VZXf6ddUVtnqoj4g
	gpFLbVN7s6pjZUFckHAlWV5mFF3e95ThA+4zIUk=
X-Google-Smtp-Source: APXvYqyJrFfNrRh83MSM3ATINB+lcVWtYlTyDssO7g4rFoTykof/uq6Kq0/nzmRenpYCMqKdYLUG0IzRSymk4DNoyR0=
X-Received: by 2002:a5d:884f:: with SMTP id t15mr3446605ios.224.1571323058513; 
	Thu, 17 Oct 2019 07:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191017135309.32441-1-trini@konsulko.com>
	<a481c7b712504bb4a40364fab7ff1a0b@XBOX03.axis.com>
	<20191017141932.GJ16029@bill-the-cat>
In-Reply-To: <20191017141932.GJ16029@bill-the-cat>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 17 Oct 2019 16:37:27 +0200
Message-ID: <CALbNGRTG5k=Cqh2O6U=-8bHs+GwjoXCnKo=tudeoNgKaDMAJTg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: George Kiagiadakis <george.kiagiadakis@collabora.com>,
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
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
X-List-Received-Date: Thu, 17 Oct 2019 14:37:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 17, 2019 at 4:19 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Oct 17, 2019 at 02:11:11PM +0000, Peter Kjellerstedt wrote:
>
> > Just to add to this, I have attached a recipe for pipewire that we used
> > to use (we have not used it for a while so it is not up-to-date). It
> > should hopefully give you some more ideas. E.g., it uses automatic
> > splitting of all the spa and module packages similar to how the GStreamer
> > plugins are automatically split into separate packages.
>
> I hesitate on adding stuff like this right now in that with 0.3 (and
> audio support) a bunch more stuff changes.  One of my goals right now is
> to get pipewire 0.2.7 in such that it meets Andreas' needs and then with
> 0.3 later being able to confirm his use case still works when updating.
>
I think this is a very good start - thank you!

Andreas

