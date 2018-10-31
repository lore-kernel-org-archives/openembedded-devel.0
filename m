Return-Path: <brendank310@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4447474535
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 13:17:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g9-v6so16441336wrq.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=grNdnMw/T6kx36gQiQRc2Pgko7AIFdITASJHq/q/dms=;
	b=TINXhpGkRdUqPm13jSyeR3bSfCqL95flCxSa2QK6sVVFW1NcecuSi4OP1F3fRq304B
	pBeRHY8kwW8DrhZ2ArmvQWWX3jyC2Ntz5L1XBEw1F1uKTpdVf8/sz+//G6S7p1jU3HjG
	stu/bgEeQtcHnOf0FTdWjqERwZeqdW1wJGJk+iDSxsJSHI0tVDN6LBGjsJS4GiwbKtN0
	rKDMMu0Mvm0gWr3E62AmQRpKv1z/uTgEpgNLfIgQMbf3wBoBnuBVkVJfPRs/eHpFwEb5
	yV2CR+pRi7bD7SOs8wOw3kAcm7Kke73sQRFAYVrwVyP4lTdBxURZNqogDwA4Sq9BLM6o
	4BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=grNdnMw/T6kx36gQiQRc2Pgko7AIFdITASJHq/q/dms=;
	b=Iu6kvYViQTn7fCbxRDQ/aZu3Nshfbur3efGMqp+HPgLSp/lEh3tv3UFQNeUsQxFIRy
	Qd92LuIpHGfISdW6vFJRpwe/+ttQYpnZYKn4R6QgvOsa5s8diRwmS1ABIYY2/swr7jgs
	Lubz/CIxJByAYqIuywWVjoNyspeeGQO4WGOWfNfSO1FPD9OoXyqRwIAULLEPMTiugYvu
	75/P5rpsd0xfM7cBn7aES5rzrPdOc/5O7nSXQ4N2ZiWL06mJYq+46/IGyCXq+qlEYYNQ
	ODDsl2IqElkMDGeVCXExCFVpJsloFSRbxm/KFIr2SWO1V+I6ps0aAZkYwfZI1jbn7m1v
	WYdg==
X-Gm-Message-State: AGRZ1gL2RjA4nVVZ9pZ/MnsQ7zTgHaLCnDS3liAWEJCPHnorKCtuCpQv
	r2kBzCHIj40T8jUWAMysbqsyA2HJDdWfL/cWD0Y=
X-Google-Smtp-Source: AJdET5cBN//Gj+GppztGEm6nO4Fsd+Rz98ignDu47NgTHWuuqKVu9URcs8b8sHr/BARlbDoYOKeAEH49cELJjzvSxds=
X-Received: by 2002:adf:c90e:: with SMTP id m14-v6mr2845344wrh.6.1540991836514;
	Wed, 31 Oct 2018 06:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<CALbNGRRO-qQFvXDJODFn28e9AGr-AgUgDY1D52-2TdDcViYcYg@mail.gmail.com>
In-Reply-To: <CALbNGRRO-qQFvXDJODFn28e9AGr-AgUgDY1D52-2TdDcViYcYg@mail.gmail.com>
From: Brendan Kerrigan <brendank310@gmail.com>
Date: Wed, 31 Oct 2018 09:17:05 -0400
Message-ID: <CAKPa3c0ky_hpa2AhdzR2-=3dBxMjffzf+U4PZFnnbm3GYOi0Tg@mail.gmail.com>
To: schnitzeltony@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 00/16] Add gnome-shell support
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
X-List-Received-Date: Wed, 31 Oct 2018 13:17:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah the recipes still using autotools were not utilizing meson at the time
the work was started. If some of the projects have migrated in the mean
time, it makes sense to do that work now. At this point I think it makes
sense to split this into two pull requests, the first set of patches will
uprev existing recipes (e.g. lcms, dconf to support native, etc), and a
follow on reflow of the additional recipes for supporting gnome-shell with
the comments addressed. I expect to be able to post a v2 by early next week
as I have other commitments that have taken priority. Thanks for all the
comments so far.

Brendan

On Mon, Oct 29, 2018 at 6:34 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Mon, Oct 29, 2018 at 5:41 PM brendank310 <brendank310@gmail.com> wrote=
:
> >
> > This adds gnome3/gnome-shell support (and required dependencies)
> > to meta-gnome.
> >
> > Please review the following changes for suitability for inclusion. If
> you have
> > any objections or suggestions for improvement, please respond to the
> patches. If
> > you agree with the changes, please provide your Acked-by.
> >
> > The following changes since commit
> f1511d254632a34c1deb51f4bf8b8c21e7423f51:
> >
> Thanks for doing this! Hope to get it build/run-tested soon -
> currently I am shaping my layers for thud and poky-users.
>
> Did not look much into details but I have one question: Many recipes
> still use autotools and GNOME's target will be meson. Is there a
> reason that most of the recipes use autotools?
>
> Regards
>
> Andreas
>

