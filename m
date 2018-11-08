Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 06A606C0F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 23:12:15 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id e11so625703itl.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2018 15:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VUN2JDU9efRE0LGFmDVMT8femUreAN8W4hsFBkr2HUg=;
	b=ahyQl0Xy9BlOjkDVBoqoOaoWqfC1krGwc2TmH/ViXEjI4WRbmgfoqUR9HWsRnkg+yl
	6PzRfoIvAOvaPlUOK5mCaX0/oB2tEe4FXAHB8MfWMxPEnv1cwwx6C2UljhOCQZRUjn4c
	i5SDq8CxDCjZ5TxzRVEdbw++9vwlzfwWVph69+xWxmmFLHs9TWsretskViNzJ68eVJas
	/MLf1WCwmsCVdptVpnj6uXUTPxa68y6jfKieb5+4irzvcTzrA1ZDoaN9smCKPaZyxD+u
	RgtFBa55BpxhKYBK9jGmxQhfx+zieGzlCvzpj0x/QntO17QzK0wdmnHMWE33Jd5xmO9p
	qVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VUN2JDU9efRE0LGFmDVMT8femUreAN8W4hsFBkr2HUg=;
	b=l8AOm4M42QOvAUA4iTGAF4I3yIHVUUtRw7iBpD9phxgjeuQLhCbrtq/iyUN/UaB+t1
	Hw2XAIOeMrsJluOwtFE3ESZSdThDLDUFVMn6ik9wL0GZ4yFH3KMr5JraN6MrqhRBu+rQ
	cQ3HlTfnxdRYBA/cxWQ2br+uHs4i5Isn7ngzKr0D1bCwo5Az+Srm1pTOeaDYJlyKrrW1
	69t4Eblhnvh/K2/yAElru42+EQgFRQN5+gZiCBO9pj5l4UHGRj6bI7tZKshQRhUMzgWg
	NJSWLbiCbXw5VU+xoZmazDipaPGh0vB4MX9aoDEUD31oSTaJHWtcgDxXpysJnP1AVX91
	FCug==
X-Gm-Message-State: AGRZ1gKiLy9syxS0DjvcJXxmJk0SnTgc4zB6oZmjukRXXrm57QAycLDA
	eQP0hrz6V8lDl6BrnS4qi2/y4uNbOcp63rS1b14PFQ==
X-Google-Smtp-Source: AJdET5fFvZ7AhbN7YkDqVUPGNKW8FDBnFnZOGJEQNAbYXS0Hrz7UKlyRUWB5TCsNcSawUFSKA7DNf0pUWafjdfG1MgA=
X-Received: by 2002:a24:1d8e:: with SMTP id 136-v6mr316730itj.62.1541718736953;
	Thu, 08 Nov 2018 15:12:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
	<CAJTo0LZJv8Pmoqnb5-Xb2Tjms12P_Oa4S69CxdYvHd=fRSWBNA@mail.gmail.com>
	<CAKPa3c2N1=Q-Ay5J=iN3U0U7HcR=8LEbTRVM7AMuFSqaLi=TzQ@mail.gmail.com>
In-Reply-To: <CAKPa3c2N1=Q-Ay5J=iN3U0U7HcR=8LEbTRVM7AMuFSqaLi=TzQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Nov 2018 23:12:04 +0000
Message-ID: <CAJTo0LY-7_4kwP6HRBUPS0FYbuF_M5e4viZpwnaxWLZX29o_fQ@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 02/16] ibus: add recipe for ibus to support gnome-settings-daemon and gnome-shell
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
X-List-Received-Date: Thu, 08 Nov 2018 23:12:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Nov 2018 at 17:28, Brendan Kerrigan <brendank310@gmail.com> wrote=
:
> Yeah it does have a build time dependency on gtk+2. I've made the other c=
hanges, though I still have two libraries that are in subdirectories of lib=
dir that are giving me an installed vs. shipped QA warning. Is it appropria=
te to do a more specific packaging within libdir (e.g. FILES_${PN} +=3D "${=
libdir}/subdir/subdir.so") or should I take a different approach?

If they're plugins/modules then for clarity do FILES_${PN} +=3D
${libdir}/subdir/, because if a proper library is ever added the
packaging will totally break.

Ross

