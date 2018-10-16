Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id E1137745AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 12:37:32 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id f78-v6so5637613pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=splq7POSYgsb3WLukkKWsujizAIIxeerG6QLtvjigHo=;
	b=A+VakZubKu6Jp53JkzYfKu4XnB32tQqndyUv3qgu3IozeTgUMu2UBUDJqtBZJD6ZX+
	MrGs3nsrtcDnniK/TkNAcIPgi/r2taghT9k1pEGCrwRDLFMpNU6WvoSoMQSpWWmB9YPz
	y9j4VEhVNanIrQzX6jMDxDI8QvDNxzbIRA9DNf0uLy2OeNi3e8UHsfENkCwRsFr5IJdq
	OoHQupEQDzsGjj7GoaMGZkhFGZn0HRapOoyi89B/b4RQgqZVcLBULAltyk0ChSzQZRDD
	4eZqPHiHVFLiAU5x5vf6TrEx/3LMhpxomFvtTKAbaUW8D5bhhTbq2eQSjEfuxP4pOvFM
	liWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=splq7POSYgsb3WLukkKWsujizAIIxeerG6QLtvjigHo=;
	b=cjXP8xktxlrYvJWG4OBqa+UmmDO33gefjyqlsYz8s5zwt3EboZbqQPm4Oev6G1Y8yU
	VTg6blRvIB3kB3jhLiltDSPApQO654Gd2+sP1HabcUsDWzAH5u48Efdug6OoH0vc+Wo6
	1nzeVdr6jyrYom88oyJxgxiFcn52s0Z50HV2/RFmpsOC/DkXpC7tfdipIeJGP1nnWqDN
	s7D/2qn9sgxyZYbw6pQwAVD9Ixw0ug/QTriwXkMxhDGf2gAvIAKBCkTE9Xyc6nqWikRj
	hbFQEUqmfVflajjjqriF7ykFpM4qWo59HPzMF48KWcXn4zeMQEKv+O08OYRHwzh7hDMC
	vXdA==
X-Gm-Message-State: ABuFfojQpmOfZZ7hT+u85QV+P3XobkoBkTMEHryY1KCFTYFEApTeTgSf
	6DgocuN6QMYWopay46a33/s4AnwkRBQzKrJQlkQ=
X-Google-Smtp-Source: ACcGV60bgUO2jrB1wKMhyXiV5Npqn05F0UTljsxMaR4KiNH+ib6ivA6bo0UErsDnndqTY/Gwksl2kCFpTdfShVUxe8w=
X-Received: by 2002:a63:f252:: with SMTP id
	d18-v6mr20171654pgk.2.1539693453774; 
	Tue, 16 Oct 2018 05:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <1539664828-29601-1-git-send-email-ankit.tarot@gmail.com>
	<CAJTo0Lba-jQYe5W99ZA3zLCqNQiFeRhM7m8zipRTCon5cKA4sw@mail.gmail.com>
In-Reply-To: <CAJTo0Lba-jQYe5W99ZA3zLCqNQiFeRhM7m8zipRTCon5cKA4sw@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Tue, 16 Oct 2018 18:07:22 +0530
Message-ID: <CAM_RqkOR+WeyxbrGm5FEThYOELNABzcWt6KTmj-A+JyZ1hvYxA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Tue, 16 Oct 2018 12:37:33 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross
On Tue, Oct 16, 2018 at 5:01 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Tue, 16 Oct 2018 at 05:43, Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> > +do_install () {
> > +       install -d ${D}${includedir}/CL/
> > +       install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
> > +}
>
> -D to install is 'create directories' which you've already done in the
> previous line, so that can be removed.
>
> If you're removing -D then a more idiomatic form would be:
>
> +       install -d ${D}${includedir}/CL/
> +       install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL
Opps, missed -D.
Cool. I will use your suggestion.

Thanks, Ankit
>
> Ross

