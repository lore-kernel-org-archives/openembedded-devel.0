Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5197D60034;
	Tue, 24 Mar 2015 05:10:42 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so52502290iec.2;
	Mon, 23 Mar 2015 22:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bltvKWjBRoKK6vv0Z5+Kdm0qL89OV/LG+QL7urVvAFM=;
	b=nJtNjpUOm2uzi2S+L8k5SxWg0h4kyxzCCWU43+LSQ2xG+1loAvd6FzDE+iAAw8/n34
	+tKPa0m3bf9hLolPt4Xwe5Ui4nbtqVbCbHnHNMlhLwaP9hf3stBoQ5nFMFZJr+mLO3cM
	oAXKxBCU8Phvtn+8vx702Jymozha6IO1DUbkoamlTfMirBb6pYoj1zBy5qo28IbpjvLs
	X0LC2UsfjlVy3dUtLItPSpeJN3t0DKpE34Qbr8zL2+HTICA1Ma71BI0vY2qyp5cuT9FR
	rfRasMXZfYqv4OLdn0qT21Ma6aGV8EcRhpbK1VNAQUVrd5xeCz5yU4t8myz6FTGwnEee
	qKyA==
X-Received: by 10.42.76.6 with SMTP id c6mr23417398ick.52.1427173844130; Mon,
	23 Mar 2015 22:10:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 23 Mar 2015 22:10:13 -0700 (PDT)
In-Reply-To: <1427126757-16368-1-git-send-email-ashcharles@gmail.com>
References: <20150321153245.GK4738@jama>
	<1427126757-16368-1-git-send-email-ashcharles@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Mar 2015 22:10:13 -0700
Message-ID: <CAMKF1spUz8OsY5b50tCXE==Na=iPicbg-zUZt-NH91gjn6XbdQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [PATCH] mpd: Add build dependency on samba
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
X-List-Received-Date: Tue, 24 Mar 2015 05:10:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 9:05 AM, Ash Charles <ashcharles@gmail.com> wrote:
> -DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib"
> +DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib samba"

where is this dependency coming from ? some explanation to this would
be nice. Can this be avoided ?

