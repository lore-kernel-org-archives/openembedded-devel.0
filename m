Return-Path: <brendank310@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8E85479BC2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:28:24 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b203-v6so8979424wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HaJgkMonlsq7sLq07Nb7yJPfD8c5DJmMVozZ8tjYiIs=;
	b=RqJ594YOrJj+hvdJl6iDxyPJoWqGWlTgzkWkJV3YyQIPlpk3KLrBXxpCGwUXQcfTQY
	gaQyHdwC3PPADYebB9ijpb5l90V0HMv8hhOEsZMtS3TsNA2QEQPytDHUKb8pp6Ppmv1I
	8bFLRTib/nhPIriNunwxbUGHwVFyea8C1OAcO8KvxR8527bwKPJU9G1lpTSn4SO5Ikuo
	/t68BXk1tCJiF/RhhF72ZJgGwarZ+zCTr8sMg41X/JWksE5YNFbabHVkefavsMAFiJsk
	20mb7RBKGTXmqFyVYXocTaCex1Hw18lT5xkVdpwTBRxLMqOCnLN/i2iWUJpDLzToGljX
	ssNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HaJgkMonlsq7sLq07Nb7yJPfD8c5DJmMVozZ8tjYiIs=;
	b=bewHdNgSda+Dii23hh0MiaXCTzAgiznlXVU8hvcEFrbHWUew5T4xz+0zMvOGdU3rtj
	qy9cSdIghcWQC9k8GJEhXvLJMMR/zwTQv4DWxoct62rTpEaAOCKVuOJ6I3VqhBXmqfFf
	bqEZPwa7sMnTwCm372IqF1CFAzVjgaAn0qVu5INTcV6IWdEZEMcN2f1EeaweMeq327Yl
	+diEMWYzZUt8SQ4GvLmaiKBOG47aDonDU70aYWtd5RMVQrWUC/WmaBor6lGR6yjL+YwF
	X7Qntw/W8ZHfOSdl8a6wfdzSyAl4wGjmDtZOJ210yugUXXnImZ4P6yRJceI+yf85fdtJ
	0n7Q==
X-Gm-Message-State: AGRZ1gKhIeST8kerYlB9AN5pymqsYE3S8Q6srZvacUhq7j/bTf+06+Dj
	gr39ybtdL99O8ncOl0mbY0bYKlaGDa40zBe+JAg=
X-Google-Smtp-Source: AJdET5dFmQMwjpfPusBOTZnu/HSIUMnqP0AX9RqPOQ04mC5G4eqgM8guYFFEtYyCTPi6rLjBHhtyXzSzqp+5b5lvWlM=
X-Received: by 2002:a1c:8fcc:: with SMTP id
	r195-v6mr15314784wmd.44.1540837705231; 
	Mon, 29 Oct 2018 11:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<b40eac3600551dd8e597cbf1cbdec7b78c038711.1540830650.git.brendank310@gmail.com>
	<CAJTo0LbQzmQ4d2ybPT9vLoPPRzNFkJWTiVecUJH_ovt_RSN_zw@mail.gmail.com>
In-Reply-To: <CAJTo0LbQzmQ4d2ybPT9vLoPPRzNFkJWTiVecUJH_ovt_RSN_zw@mail.gmail.com>
From: Brendan Kerrigan <brendank310@gmail.com>
Date: Mon, 29 Oct 2018 14:28:13 -0400
Message-ID: <CAKPa3c0-tkLYO94y59nC0q_sO1EAwSrisPiLK1TgBRSDKnKX9A@mail.gmail.com>
To: ross.burton@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 03/16] gjs: add a recipe for gjs (Gnome JavaScript engine)
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
X-List-Received-Date: Mon, 29 Oct 2018 18:28:24 -0000
Content-Type: text/plain; charset="UTF-8"

Sounds good I will refresh that change into a patch.

Thanks,
Brendan

On Mon, Oct 29, 2018 at 2:07 PM Burton, Ross <ross.burton@intel.com> wrote:

> On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
>
> > +do_configure_prepend() {
> > +       export
> GI_DATADIR="${RECIPE_SYSROOT_NATIVE}${datadir}/gobject-introspection-1.0"
> > +       sed -i 's#mozjs-17#mozjs-52#g' ${S}/configure.ac
> > +}
>
> Personally I prefer patches to sed in do_configure, as nobody will
> notice when the sed isn't required anymore and the point of the change
> isn't always obvious.
>
> Ross
>

