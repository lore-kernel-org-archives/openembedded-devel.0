Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id CBE9B79C29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:32:47 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id e74-v6so13232373ita.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rmqAUvU5QuhICmWP2cXKM+KFvahghJByctBdkMLpx2g=;
	b=fRsj2h5marsPuZ5TRdon82lpv+jAfBuxz4mxZiwRn3vAopPoHcWCwx4oacJJZ0NI7C
	DgFbdb8y3Bw47SET6ThUDtvv+gN4RyStUgi5ee1s7YxqiVC1c2NIkfaBObcg8+39PUmq
	ezgeo589uC0ifjCInOv97Z+P8liUL8KTFhqLNaJMh8MZmqZcaPvmgsaJcbr534Fw2PR4
	HXEjNIZJZ8TA+biFCumk9Q+Jwr7gXBCunTwerQ/mpjjtY3+ThQIPfeo+X5smdKs4blHF
	SToMuzZXtBDwC3JVmLJ1hDa0l/Wk06IJT/dMQ8/SfyaayaEdjS/7pzcfGfdZAgc4oR5p
	WhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rmqAUvU5QuhICmWP2cXKM+KFvahghJByctBdkMLpx2g=;
	b=U2fw6yYW8FiIr8RE5YyugbwRcAsMHJuICCscKFuVAO0VQizQT9+o7hVhTuQAfxw4Rh
	GGmoq7beDpSZhlv/bY9gl5Br0EDm53wQCw5UquQl9E9w1VJLVvVQeWG+TrL3LOMV6OKa
	Ub+DJdCRdE9qR3/OT4Jh8HdYc54cA7L779Q5ghGHulDaeBVJXThExSWK6x9qB0audz+4
	PUDLw+wsicf6fcVR7wx8HigoBMAwoTfz3EFgG3AakK4PpKJ2A2G2XtYeaK6RH7RhIxKD
	uBqw8Z4T+0ty7J620o4Umr1ziMcuJuX52Zp7lXxgj+lFjfRv4+Uuy/ngL04tpfo8s4s5
	bg0A==
X-Gm-Message-State: AGRZ1gIgp4ArKb1s+t0LhCKQlTyEs65ioXuGf58m7rpGNKyQnl7Gcs8J
	ERYX5WKiI+Zs5EMVL01H0QBnQ0O4d/D7H+H+jHXvmQ==
X-Google-Smtp-Source: AJdET5ebB1JRavpBY3s6cTvbtK7fICJpH0WwbHlbi0TCYLTIn0cGvCdRiCKpLPqyGzuy4pRgE7V5mHGOufcaDNnVy/M=
X-Received: by 2002:a02:3b2c:: with SMTP id
	c44-v6mr13387077jaa.31.1540899168958; 
	Tue, 30 Oct 2018 04:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<9f5b028fdf90a7650a62e538889580dc31864a6b.1540830650.git.brendank310@gmail.com>
In-Reply-To: <9f5b028fdf90a7650a62e538889580dc31864a6b.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:32:37 +0000
Message-ID: <CAJTo0LYheMm0T3BvKTiTFfhqbTPG+OrYseKLjXUEB1AHHM3F0Q@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 14/16] packagegroup-gnome3-base: add packagegroup for installing gnome3/gnome-shell
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
X-List-Received-Date: Tue, 30 Oct 2018 11:32:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:
> +inherit packagegroup distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "x11"

Everyone running GNOME 3 on Wayland will be surprised by this.  This
packagegroup should be *just* GNOME and then the image using it can
decide whether to pull in X11 or Weston.

Ross

