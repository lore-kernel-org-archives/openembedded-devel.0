Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UVdhp-0003Ym-SO
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 10:08:34 +0200
Received: by mail-vc0-f178.google.com with SMTP id ib11so3558578vcb.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 00:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=rU0Iki4qeyA8/GQiOCp4VBNI24cBOi/xVlxJPV2UQOw=;
	b=Yzto7VYIcV4hGkH2mOd7/Tgnpz174gUUGgBGXZL4t284xZtFKlbbgTg+9MaRjCsHz1
	sDf6hIeTC8wINq0PZ2dvbOyl33aB10KN3N6Ijy8FxfQDCtluoo3BEx5i0msh6SMdwpVN
	aCktOkbMBZPlUklw3e5U7FmESq2cjz//Z6XSZx0szzCddiTJIwDPPcK2YSnndQ8pvnSx
	DjvPiMoJjWt98ojlwXNw3uPRXpVSi6QkDC3s2QU0nKYg5jyvtDO1VOheS/3LFTzMPq2T
	G58B+u3Ov3W9iW+GDKCBqiR/qdp8pMUKV3UzwTNinxoYNuiI534j33uAu5bbzOfxN3rL
	6BZQ==
MIME-Version: 1.0
X-Received: by 10.52.170.204 with SMTP id ao12mr23785952vdc.83.1366962648928; 
	Fri, 26 Apr 2013 00:50:48 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Fri, 26 Apr 2013 00:50:48 -0700 (PDT)
In-Reply-To: <1366816884-32023-1-git-send-email-schnitzeltony@googlemail.com>
References: <1366816884-32023-1-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 26 Apr 2013 09:50:48 +0200
Message-ID: <CALbNGRSGhfmbBwUo-y4nTvHjnn_FoMjNH=ps83sTKbZUkyucaw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] lxdm: fix postinst-code
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 08:08:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 5:21 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Exiting postinst code leaves systemd.bbclass offline postinst code unexec=
uted,
> causes postinst not to finish at first boot (lxdm.service is not aliased =
to
> display-manager.service -> started much too early) and is not neccesary:
> language preparation can be done offline.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
This unbreaks 1st boot postinst issue - so I would like to see it also
in dylan (of course also in master :).

BTW: I am looking into postinst issue for gdm (and other recipes) -
will send out a patch as soon as I have test results.

Andreas


