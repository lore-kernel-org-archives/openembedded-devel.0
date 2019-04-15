Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD5CA7C749
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 19:30:33 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p23so15553038iol.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+L/QL5sQHaZWK63gJYZTYrxU32TH3gW4vn5Qs3WJ+hc=;
	b=jGVt6NW6Obb/qXC6YGbMMtK6c7Ze1FBCy90fro0BW7aW3XtYH42lDneswRURuuXw96
	obB7UIrFivvfMylwVTtduQy1yjEELo3QdnTW98LOnqJs0w1sFx0h2an4uJz2LurASVl1
	cu5oLzgc4f6VOWq+R8VUJC6+Zap5wwHYLh4L5Y+LF1gq//cvgywVQTJisW2d29wiTaa4
	pw/fqVMcFB2tMIHyNX3sI6l5T1CThsMpKWchcQB8kfoYlelO5Ud0sShY7yKyLDVN3QG4
	JexUuZbqN6g96jPD7Mqj2xxPbWUs1zEYMk7mLEL6WCw18iavQ+3l8y4uhGlI5+vcgeiJ
	8Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+L/QL5sQHaZWK63gJYZTYrxU32TH3gW4vn5Qs3WJ+hc=;
	b=GCheRNb5kcV6FMsyAvul8ZlFzEsQ1LYQb2kGrLrNnfQw6kfAfYV30uVE0BL20DHL1N
	14hNT/2taKMPfSncwIP07DIiD83uZXtT71lUugoNOcdSnchdrLV+8B2cmOL4j9cHLBhS
	XwqPjL1qE46ocRm6IAqfrxAuesPYiiXRg3kunLP+j2Qhi85o/wkozPSfaJBmjuwvgWNS
	1wMS5vOvcLH2GNC+DN9pTf8mN+pleCokDLcrOLJ+EUTkoXz+x3zvd39FIZZ/ubO8BSYQ
	D/3Gk7XecemZVDn8+iw7Aoozf+rIghmO7hVtVFIYTFjbmhoWFnYQcrgqs4tYV9oUbz9f
	4MZw==
X-Gm-Message-State: APjAAAVw/DhfjsE5FaQ52pn+fYIJ1+8/Avvvy7T+hKot+6eLugj9dVpj
	B8Rzaeg2afPWIyUfTY+OxTlodmG4hoRgQWRPtNE=
X-Google-Smtp-Source: APXvYqyDtJQ6Imdn4uQ6sKLNInY3lZ4WaLRvPVgCSkRr4gzSnxRXMkbl4Vwl6PFuyGQzuNFo/2fwd0d0SQ0Vs3wdSuU=
X-Received: by 2002:a6b:440b:: with SMTP id r11mr43318383ioa.48.1555356634728; 
	Mon, 15 Apr 2019 12:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190415063233.119684-1-kai.kang@windriver.com>
	<CALbNGRQTJQcCkmOLcvxFryEbEZ+eGhOEubgDcQmFC8ZeFghA9g@mail.gmail.com>
In-Reply-To: <CALbNGRQTJQcCkmOLcvxFryEbEZ+eGhOEubgDcQmFC8ZeFghA9g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 15 Apr 2019 21:30:23 +0200
Message-ID: <CALbNGRS3nQ12iE_AU=ck2KeykjOiMGZdGj2yXOrqZ45ZiDUhxQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] gvfs: fix typo libexec
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
X-List-Received-Date: Mon, 15 Apr 2019 19:30:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 12:39 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Mon, Apr 15, 2019 at 8:32 AM <kai.kang@windriver.com> wrote:
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > I believe ${libexec} is a typo here which should be ${libexecdir}.
> > Otherwise, the execute bit of ${datadir}/polkit-1/rules.d will be set
> > and previous workaround which chmod ${datadir}/polkit-1/rules.d does no=
t
> > work.
> >
> Thanks - for fixing and I think it explains the other issue: Systemd
> service adjustment can go now - it was caused by the typo either
>
Will send a follow-up for systemd user units

Acked-By: Andreas M=C3=BCller <schnitzeltony@gmail.com>

