Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id F08C661844
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 11:32:10 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id t7so4645453qcv.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 04:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=n2/k6eIguqDRMtHlwt5+0zOwcbADI434COkbpgRIAds=;
	b=C9kbKUDt21V57AUfZHgBknwSfNKilPGlOh2KIDOO3ITs7H9qtx/7fOJRds0FNKqp/C
	oRjS/kiYtaunag+ORDzlZbjYoZttJTkO5B2iaYuI/WImIqaAtF1QWrThqMTSXjVkBt0H
	A8eyOZ2XjUzc1vWbLQg8XswD2JCfywsMnqryfYHzBkb5WaTpLoTTSU4AhQsAtzdX1Ozz
	J/eJccJllC7Raj4klLUHfftgbVZeHyVSHGzOfa7WppJ0vJdZ69087l4yo4tr4GsksubG
	XMI4DV+GyXaqmRlnjk055j6o2tghsu3aF2fcEDEyXfBXBGct+sKVawdWMYhGLFukeM2H
	bXMw==
X-Gm-Message-State: ALoCoQn4So2LjZKdGg/31kL0cg8EtThun60MZA7PEqMg70l0Vt9uiNl3rO8DfuYMEeNTS9aeUv5E
X-Received: by 10.49.29.230 with SMTP id n6mr34341011qeh.20.1380627132389;
	Tue, 01 Oct 2013 04:32:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.25.131 with HTTP; Tue, 1 Oct 2013 04:31:52 -0700 (PDT)
In-Reply-To: <00d001cebe98$360affc0$a220ff40$@oss.bmw-carit.de>
References: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
	<00d001cebe98$360affc0$a220ff40$@oss.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Oct 2013 12:31:52 +0100
Message-ID: <CAJTo0Lb7+Kdzg-M6N=j0rb0CRAXZ1OWbCrxAkzNXGafWK9Fc+A@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>, akini@synapticon.com
Subject: Re: unable to compile eglibc_2.18
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
X-List-Received-Date: Tue, 01 Oct 2013 11:32:12 -0000
Content-Type: text/plain; charset=UTF-8

On 1 October 2013 12:20, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> wrote:
> I can confirm this error that occurs when you set DISTRO_FEATURES = "opengl
> x11".

If that's all DISTRO_FEATURES is set to then I'm eglibc is bound to
not compile, because almost everything has been disabled.

You probably want DISTRO_FEATURES_append = " opengl x11" so that you
don't overwrite the default features.

Ross

