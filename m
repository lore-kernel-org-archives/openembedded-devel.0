Return-Path: <k4230r6@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3EE6FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 18:44:36 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so40242310wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2016 10:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:date:message-id:in-reply-to:references:user-agent:subject
	:mime-version:content-transfer-encoding;
	bh=TuRHz/Pdm+PvvvkszgO0TJ1chWeSeXmzo/c2YI0SpDE=;
	b=UCXBfG/OepiR3Cp8lzUEqvUlrKeUyhfc3TO8Z09nOLXwKKWEH3xivQjs9AC4myOaxB
	aKE/hiNVyV8wcYLL8XmoVXRxv/gPgRlfpmg2LYZKU+yiVKrvePEneT5UM59Np/OeVjaN
	NJ8GPg/VTnMAFtFISgtrpMne3rVjsMcK+aBXMV3rhxFKKLJZ1fHA514PYGAEBvA305gS
	YGC7zsj7bhVHPFz2gnvxe0lYGkH6jLrp/HMo4Mul0FNBj7Gl56liJh7ctY/TR/Zh2/1u
	JaSxpcSG34Q0n44Wy7vXPkwfUoXREz7sU7WHBhOXLxzzuGG7ZGpx2m5NKQsLPX0itPci
	FFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-transfer-encoding;
	bh=TuRHz/Pdm+PvvvkszgO0TJ1chWeSeXmzo/c2YI0SpDE=;
	b=F95zI+E0GRlkGPCwl19/NC/JiPIgikzBG7OagrAvAJe6ucj2SCfIJOhmoLp5SKyDLE
	xbL9joO8qqdJw/ECShMXGTRjjAcKZQ8Pz5KE+5eN1ulZR373VFHEewpM13okAGItU2cj
	aPWr4vu9QvovS6xTC5NgQVRBS47DyQdwLY7OcuaUaFm9jno3DeNtJgV9jf8Gfl0A4dEA
	ehJfuG8T7CBsh3X6bTlbaFEtASTeHG535h6EAN1FBG2rNRtCIR0wKa1K24CVZQ345Qqa
	bCySBTh+82IMO0uKicf1v5Cb6Knyaca4S/4Eg6kwmNVrAIb/pHps5xk6Waba/LXJT8mL
	AvfA==
X-Gm-Message-State: AD7BkJKYjJ8hJcaUeF0te7D+wQuPd8vJuyuFJ/Mhb79pimwENBXtTsKx4paQx9VYLSy+Cg==
X-Received: by 10.28.133.14 with SMTP id h14mr21980199wmd.100.1457462676321;
	Tue, 08 Mar 2016 10:44:36 -0800 (PST)
Received: from [192.168.23.165]
	(HSI-KBW-46-223-219-101.hsi.kabel-badenwuerttemberg.de.
	[46.223.219.101]) by smtp.gmail.com with ESMTPSA id
	ls5sm4224598wjb.33.2016.03.08.10.44.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Mar 2016 10:44:35 -0800 (PST)
From: Christian Ege <k4230r6@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 08 Mar 2016 19:44:34 +0100
Message-ID: <153578b8250.27ac.b5f386b42cd5ccf91b9cb7358bc3020d@gmail.com>
In-Reply-To: <CAGaPg5Kmm1qrm_R+b5uB+rw81=30Mau=MkNuk=KN_wiLGDAb4w@mail.gmail.com>
References: <CAGaPg5Kmm1qrm_R+b5uB+rw81=30Mau=MkNuk=KN_wiLGDAb4w@mail.gmail.com>
User-Agent: AquaMail/1.6.1.3 (build: 26000003)
MIME-Version: 1.0
Subject: Re: [meta-qt5] do_generate_qt_config_file not rebuilding when machine changes
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
X-List-Received-Date: Tue, 08 Mar 2016 18:44:36 -0000
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


Am 8. März 2016 4:39:28 vorm. schrieb Philip Craig <philip@blackmoth.com>:

> Hi,
>
> I'm using meta-qt5 with fido, building for two different machines.
> Each machine can build from a clean sstate correctly, but there's a
> problem with the task dependencies that means not enough is
> rebuilding.
I have similar issues when building for two machines on Jethro branch.

>
> Background info: One of my systemd patches has made systemd machine
> specific, so when bitbake needs to build qtbase_git, it sees a
> different hash for the systemd do_populate_sysroot task and decides to
> rebuild most of qtbase_git. I realise that's probably not ideal, but I
> can't fix it right now.
>
> The problem is that when bitbake starts rebuilding qtbase_git for the
> second machine, it sees that the hash for do_generate_qt_config_file
> is unchanged, and so it keeps using the old qt.conf, but qt.conf
> contains a path to the first machine sysroot, and so it fails. More
> specifically, OE_QMAKE_PATH_HOST_DATA and OE_QMAKE_PATH_HOST_LIBS both
> contain STAGING_DIR_HOST.
>
> So my question is: what is the correct way to tell bitbake that
> do_generate_qt_config depends on the value of the STAGING_DIR_HOST?
> Or is there some other way to fix this?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



