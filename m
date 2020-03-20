Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5E90860405
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 08:19:25 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l14so4780186ilj.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=16N+k5AgTDyi7PV8Kij6kFNALRyr6MsjRrLH8dvhJuU=;
	b=lI80H2IYtxPXAjXqL3QbpWEpilP9rg6Nge7yn0M+2rsGg9IoGZ+ebgUzJ2EtKcQSYV
	LyeXkq1sc32+bf4W2UrOXPKV7ZxsCPujlvcFRgmbb4UI3uEcpNYifa6Fu0FxBRl2JCRL
	sgxq6tH1RtkKYW4GN9HdnMtHZo/iaReEJv/BVHjF/zACwYJMVG6fhv0DIGGR9bHBRiiJ
	i4UHLt0fPZB44UE6UTkS6Lk3UFH5zJ5LXsI/S8OxCtqPUeg0z78KVTYJnmFs2v6z3HLP
	PLFHpcrlfSxTZsTgXZgVF3ale9iua5Z7dASMB16RkTh4VvGzug8jjFUyASM+hht9Fe/C
	ewug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=16N+k5AgTDyi7PV8Kij6kFNALRyr6MsjRrLH8dvhJuU=;
	b=c9qZB/3frZs7lbaFFP9gaI9vPdkyxFpBLOL3hXOqBxoQx2cqA6nH107CnCtyVTIUVE
	ruwVw21KFhRKdIw7FkDYJKt6QrvOXdLrBE7jLCAseXYLhWFPEjzZC/KQlO3NV8t/h1zS
	Hiv2U1e7BhOPAkKp0XRJ8C+HNMOCCz60dhYc2J35EiHpEk/Xg5kubXVwL2X3WGp3WVYd
	VGRO+xCVXYxyry1D0l7AYUg8jCEsmnQF3D5wr3ChXovs3/dRflSRbK2By8pBPQ/owxXO
	3CgnIl+v4HHhV83SajkX+HxmbwbjVfjoEJyVF76fzPsHLYYmmPWMD/iHKWl2wYGIa3lZ
	toEQ==
X-Gm-Message-State: ANhLgQ15Zq58FdaIFXvOR6JNspeH1ymMiV5QjsQrPbYj7NfHAEEITMIK
	3vs9XdqcYYkA3lgH4DYxyQ2cVAoUYAIwq5Kw48I=
X-Google-Smtp-Source: ADFU+vtCho3ZRDEQjhoAT2o3E+sC3uKbZzwfV9csScFDzqLbLYXAqCbVNtgiTY8/w2+hyGcp7a/d97nkxcKCKWTISX8=
X-Received: by 2002:a92:c504:: with SMTP id r4mr6828961ilg.147.1584692366172; 
	Fri, 20 Mar 2020 01:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
	<DM6PR11MB349890ADEBB154F7AB354EF4EDF50@DM6PR11MB3498.namprd11.prod.outlook.com>
	<DM6PR11MB3498A7172CD23A5BCE165647EDF50@DM6PR11MB3498.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3498A7172CD23A5BCE165647EDF50@DM6PR11MB3498.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 20 Mar 2020 09:19:15 +0100
Message-ID: <CALbNGRTwwQzzb6Xij0WwxuMMv7wLs2909V9Mx36LcdemPMrGpg@mail.gmail.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] libnma: initial add 1.8.28
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
X-List-Received-Date: Fri, 20 Mar 2020 08:19:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 20, 2020 at 7:42 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> Hi Andreas,
>
> There's also another problem. The PACKAGECONFIG item, 'gcr', cannot be disabled, otherwise, we will have do_configure error.
>
> Best Regards,
> Chen Qi
Thanks for feedback - will look into both issues and send follow up.

Andreas

