Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7764C79981
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 11:31:21 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v69-v6so17740723oif.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 04:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h9K/ujxpDdVnmlgSre30Bp0dVFqtto+C2rhrhHXGOiQ=;
	b=fxktEUpvzszICLqhIfqtYaOfv2ej5OdjUgxFkgY/9usYSr1SWToZdlkopSua7Hd8lA
	F8csJzG9vDSuNDhL7Dukve0doLL0ahOB+RwJ/1vbEbKy/ugNequHjbiZKi8zABBtgH1T
	M8n8MjTEpJGS2ECUARpU2ve5YoRds375VKtuIlLpDF81DAdb1qaeZNPEMMVgZyboasDQ
	Je3cNyYo9P+A7TjKstwF3qyUDf5fNBeCvEazaGr+IE6ChVgMMIeuIES1Gou7nbrQ8aqV
	PfmJMhr2IFtb8IkB4dumkmrmCG0bmKG1/EgGqzS76Y+vvG55vFGLN2P/Z2GAXQ7RIlYO
	8FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h9K/ujxpDdVnmlgSre30Bp0dVFqtto+C2rhrhHXGOiQ=;
	b=b4ENXpIuggP45rPXNwXetX2PDRMgChMkTLndo38dFuurPK/sNVr/ZhWUL8ng26ooyt
	hvIwJQNl8NyjydA2Uv2Sok/fAhIbcDYBzRnUC5wPouuXMMOeJnaaKoprMjmwLGERKG3J
	N+mdeSIem+zP3RPgbTLVMLiOcPlHfiIxBFNCN6h9YdZvolRfYDFA0KHlueVVUNfAIxX8
	q4sseWyDRMCUkrzmOKdyz9ISeaB2ppp3sq3dle3Q7iqhAhB5UQavOt2/IC7elb2Zekab
	EXDc5WRfoPCAzOZBbnj/3l/8dovLkAW9JdJ2rffWVcpi/48izWDkc4DPNogluoI6z1Sz
	nD1Q==
X-Gm-Message-State: ABuFfojb4JxQ2ktptCanRMP2uIlceriLy1gZewFyIKf80t4IPw5fPtwG
	ZYVov0yzaH43hBVrdJkBUy0vuFHbiDOL9KwXKku+IA==
X-Google-Smtp-Source: ACcGV62ydAkzHakpeimg4YPfwJwLCCm67j4UC0dqzWFcwJ6u3LuvRKx67tKo4tUZcenAsok8q+WGHRppxnouFyXD/5c=
X-Received: by 2002:aca:bbc5:: with SMTP id
	l188-v6mr7304558oif.340.1539689482360; 
	Tue, 16 Oct 2018 04:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <1539664828-29601-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1539664828-29601-1-git-send-email-ankit.tarot@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Oct 2018 12:31:10 +0100
Message-ID: <CAJTo0Lba-jQYe5W99ZA3zLCqNQiFeRhM7m8zipRTCon5cKA4sw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 16 Oct 2018 11:31:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Oct 2018 at 05:43, Ankit Navik <ankit.tarot@gmail.com> wrote:

> +do_install () {
> +       install -d ${D}${includedir}/CL/
> +       install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
> +}

-D to install is 'create directories' which you've already done in the
previous line, so that can be removed.

If you're removing -D then a more idiomatic form would be:

+       install -d ${D}${includedir}/CL/
+       install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL

Ross

