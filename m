Return-Path: <kergoth@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 914E4758AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2015 02:38:57 +0000 (UTC)
Received: by qcnj1 with SMTP id j1so1953027qcn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 19:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=VmetsYbtPFRxVeNKNI+LwAbasE6IbldNJ8NqSukXoxo=;
	b=y/qQ/ecmk34zA430o9Wz/bA7hxH1U1yeeQunstv6UOt+I5bJvHXePkZ/Qo+jVtkMdk
	0pyYWfWLt9cqV8SWn7Dw9ZGouCzNhy7jdCAPGyrdYMFUDbS1V+pkqGIg1V625FV+KfSX
	lR/RX6rmPetiiJUTpUuE+9tL4crJpSOcNLTVfihPO9I1pPffSDemKEwoLmAmsLUz6FNY
	1k/ZAvh4giQBUADUfuticCN5zTgdfIhGoswCamVwhGRTLJzrVapu1gQ2MMjpJ7fFmMoz
	6I4QHusIKzvFPXEXHu2am6LqMiQ6uCU3y2PBFkDzHZmKXiqL8kBmcylUCSojRqcX4/uu
	0Xxw==
X-Received: by 10.140.43.228 with SMTP id e91mr22651595qga.80.1433817538400;
	Mon, 08 Jun 2015 19:38:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.73 with HTTP; Mon, 8 Jun 2015 19:38:38 -0700 (PDT)
In-Reply-To: <CAMKF1srmP=02oMEvuNMPbsdd5u3vvc6fv_QmOtL07ydUTuDC0Q@mail.gmail.com>
References: <1433032319-13061-1-git-send-email-kergoth@gmail.com>
	<CAMKF1srmP=02oMEvuNMPbsdd5u3vvc6fv_QmOtL07ydUTuDC0Q@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 8 Jun 2015 21:38:38 -0500
X-Google-Sender-Auth: As5n87sNXGDhEEkesJGWZEyo08M
Message-ID: <CABcZANnBy7iruPexD8Skf7zXxCHhNg0s4Nru89AniW=uvO-fhA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] ntimed: add recipe to meta-networking (git version)
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
X-List-Received-Date: Tue, 09 Jun 2015 02:38:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2015 at 1:05 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, May 30, 2015 at 5:31 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > Ntimed is an unreleased ntpd replacement being sponsored by the Linux
> > Foundation. Currently it only includes a work-in-progress client, but f=
or
> > future use this recipe emits an ntimed-client package and an ntimed met=
a
> > package which will pull in client and server.
> >
>
> should it have RCONFLICTS with ntp ?


Probably, I=E2=80=99ll look into that as well as see about adding a service=
 file &
startup script, and re-submit after testing that. Thanks.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

