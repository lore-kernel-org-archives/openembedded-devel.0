Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id D99F47D1A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 09:54:01 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id y10so4157339itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2019 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=wCL5m+90Cd9Z0xEb0G7G54CPCGn7krJFavyTHuk2zK8=;
	b=ncfVin32j4i8UmqZO3Dzo/2DCVLcs0pHrh9gCBaOgQzXEnW/3jrE1wsWngMDbxTFyu
	R9Z7Yd56aLUC30ByjzNmokY5vlASHrCevrkCCHMruGml7ZkgbjBDxkdbA2fTvlIBT1ST
	YiUKp3V1rllCK8f4V6ADU9mQE/LZW+TgWIRbwyLKmS/hP+YPXnXOjIvmz8neENrfzqnA
	btcLwWyEXIpx7a3KlDnFKlihwWfyDCFQHsmoKN4U/M0lZpOrG7O3JE+96Gl2xE8M8pJn
	KnkjNvDvRG2TowvWOEkhZcNL5ve2kfmOd1hWJBfMtrpmq8+0ON06svOEeqZ7RbhA3HGo
	CjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wCL5m+90Cd9Z0xEb0G7G54CPCGn7krJFavyTHuk2zK8=;
	b=RVCTuKTKzwsTCDZ1vB2MhD3IaigTpRdD+oY+Yz1ugBqbDzv3D9N48s4SCevVciiVbe
	YSDGz8OwSO153XpUSQ2yfxE3d2pB/D32/++IC3CMq1I1vDSVfMYt2tnSB2rHaehvDjUJ
	/Pl7rn3Vtl5xnDXx0M7RhL/U1+mIcHmQPpxQTvS/K88K+6z80k4VDw/zZ47x6wXyvsHv
	Rg9l/0/EDPVBaCyqOBxRPFcwMO4xRL41ZQcmshi3XxpZ/vUoB/h9/n4I//e0JF8k7JSm
	ZRrrCr1EX0TTCniVQYjIbaRY9l5xxZXaCiI52RZUSXv0pGtJGkjJz0/RRmztC538/A4R
	nB8g==
X-Gm-Message-State: APjAAAXqO7Gm8vqKHYCWBHW9ZkUy5zhYRR9oFeeZXwkSwJj3bfRIqqsF
	xPDpcC6/fcytgSoQR3/yi31y3GMbsGkR92Ee38XGpcGn
X-Google-Smtp-Source: APXvYqzgr8rAP+rviwM6SF1xNgk0tXQvt7jgZLtK9kwNl9Co4awsGJExzguZCwS4d00U4+sEdMO7/y0C7Ku5CVMN1Aw=
X-Received: by 2002:a24:43c8:: with SMTP id s191mr2928735itb.109.1554198842860;
	Tue, 02 Apr 2019 02:54:02 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 2 Apr 2019 11:53:50 +0200
Message-ID: <CALbNGRQSQ=G=iZwifJ-SfniDAG0BNqRtM2Mf97Xn8hRC1H0zqg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: gvfs issues
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
X-List-Received-Date: Tue, 02 Apr 2019 09:54:02 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

a while back issues with current XFCE were reported in
meta-raspberrypi [1]. One symptom was mentioned which I see now either
on master (did not have it on thud):

| It takes a long time to visualize the background. Does not let in
the Xfce-terminal.

I looked into this and know what is causing it. In journal there are
complaints that gvfs-udisks2-volume-monitor cannot be started due to
missing permission. That is correct: this and other executables
shipped by gvfs are missing executable flags. Setting flags manually
fixes the problem.

Have not analysed this more deeply but:
* Seems the files get correct flags when building from scratch
* I suspect the build system change from autotools -> meson might be a
place to look in.

Will check further

[1] https://github.com/agherzan/meta-raspberrypi/issues/364#issuecomment-472439863

Andreas

