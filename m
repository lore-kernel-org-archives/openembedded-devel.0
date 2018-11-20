Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id A9C286C0EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 08:07:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x10so885312wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 00:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mpuwpeukha52J31tYQMNbtoWr78SOsdMty18nKVlFbg=;
	b=Q4dh9y0XIQhaerg0SHx36yynPyNPc3gBdooS8RUJ6vqW69jDSscXpbxXuYDduC1sH2
	/yN4tbXbFxjb7lEKM+tXCBIdVQpZk/t02wPxqYjq9yQ53lg1KVvpNUlht3MmEYSu83J7
	8DaDji4eNql2YQ+wUswtSTTrVxT/T06U8uAiJaSNB4iSh8SaF1EIgkAFrjQIxQWufU2J
	ZfXZIxx8JRtDmqMJ9tyzMMYY6cIh5SNSvGS73+mXGMB2ZEM6jH8VQnthF06PNnFNB/D2
	S3sJlTdHy29r9stim+NiKWKYlSvealBxZbNldF0BLoDo4Ut25SiE3wHMY4owDkM00ufF
	RGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mpuwpeukha52J31tYQMNbtoWr78SOsdMty18nKVlFbg=;
	b=Rf7lfA0ctRnO5wh44M6yOkP7WP1unAy56qGYH2Xx9AZE2j+hAFOGdghvbGihEzQJph
	509MAZf8tAPEeI83W4JymiVpJjg6Q98Dx8ie8UdJkT8W1y4rCG8YVcpe+eYoxy7BZhgL
	ALnG5fSHAF71XiStZ0k6hax9//Mvw9diqLmVCBmWonwfn8MNkBY7CBcaqh9W0WV3Xb9r
	Yw/LM6/k2is6DMRtsQBH4h5IpVGsVlRGqXqS3ca8nNVJERlI091oewQRM8/JrSFykcez
	B51yS6NDSzb1r9zysyKEpJoPUOOqrce/bqum04zBl+fQhM63zS+Z4fl38yv3ucZhbB2X
	Y7jQ==
X-Gm-Message-State: AA+aEWbLVQQV1r0B0rOcq/NO8W13nfWNTJE6rFU4f8qXvdy/I2jErxCt
	IZ/CYND+0Py2ejemx6x1JclNswFHcAKp0Oqr3So=
X-Google-Smtp-Source: AFSGD/WA/HJw5Ww8qCrfFfiXUzV/RzHzQObqPkrIcgrqMw9AULToyI5diD3VT4LPG6SUdFjYmFecumV3G7Nab5VIGr4=
X-Received: by 2002:a05:6000:151:: with SMTP id
	r17mr992971wrx.53.1542701254202; 
	Tue, 20 Nov 2018 00:07:34 -0800 (PST)
MIME-Version: 1.0
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
	<9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
	<20181114151723.GA1417@jama>
	<e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
	<CADfgfoZt=B2-3JMCdUvNvQdGvtOQYsPvypNB4TU0VXPxQ6sSaQ@mail.gmail.com>
	<CAMKF1srPp_W_e6ospFUzjNN1d5L6OKUExCZtxV07hU1jqO=7Vw@mail.gmail.com>
In-Reply-To: <CAMKF1srPp_W_e6ospFUzjNN1d5L6OKUExCZtxV07hU1jqO=7Vw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Nov 2018 09:07:28 +0100
Message-ID: <CA+chaQd_7P1utSGnhP6VPDSaZ_DP9gNhNx6x6TvzVVWakwXL4w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Tue, 20 Nov 2018 08:07:34 -0000
Content-Type: text/plain; charset="UTF-8"

The jenkins job which does the rsync (or at least how I was doing it), is
still failing as reported before:
http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-rsync/480/console

Either you're using something else now, or it still won't work.

Regards,

On Mon, Nov 19, 2018 at 9:18 PM Khem Raj <raj.khem@gmail.com> wrote:

> Thanks Michael for taking care of it
>
> On Mon, Nov 19, 2018 at 12:02 PM Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>
> > The rsync target on on the world build machine was offline following a
> > reboot causing the sync to sources.oe.org to fail. The rsync target is
> now
> > configured to be available following reboots and the sync has run. Please
> > let me know if this test still fails.
> >
> > On Wed, Nov 14, 2018 at 8:19 AM akuster808 <akuster808@gmail.com> wrote:
> >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

