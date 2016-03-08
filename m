Return-Path: <phil@blackmoth.com.au>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id E67CE60797
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 03:38:52 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id d205so2293815oia.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 19:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blackmoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:date:message-id:subject:from:to;
	bh=J2sjEKuxw0Bx2YNpvtxWUh7VwxecnQGWHn983KhF3bY=;
	b=QBP07C5siXAV9hNV/ghadFLytsYy32/ixtXcBmTVCKU8m7As7/8Gfv/E4m4g8O5VBH
	SZQYptpI9Q/tqQu0agzFG27qWXxZ5bnhf8lhR8YooIU16BTycOgak5tHcbU7oXzH9wyh
	xdco4rJAH90V6jIzsPZfsVgSe2WYntnoUIAiRELUOQ8a9F6aEtuqn5ckq0DhEhO2/Yw1
	bCBRtnwgxeVk/C43vttxzmBMzf/mvVOvwtAEV2f3dFgiBcUKG8f8a8M9MsYTRn6n2MGT
	14OCjaLbiD58sKbL2gYHq0mVx/dym2MZBLGd1EXqaAWFaxnHAWewDPg28vZgZEyzxbUF
	wSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=J2sjEKuxw0Bx2YNpvtxWUh7VwxecnQGWHn983KhF3bY=;
	b=TR3xaFTOauVFfuAyOgVa7um4XauZxd8B+T+BhDSb46HseMIKt/XxgJ6gpM6uTi7S62
	KYZeWNqv44DVs/sDkFtl9sYpuJERDRejfsTJ3SsfmmD48Z07JUAFypyyDRnoKrCHYECn
	FGx8A4aES388iiR/NxZfhNGCeuiWMXiSguKsZxkEmZjV5iP/i1uVw/e+j3ygi6CcymiR
	DycjV1u+JH543EaDhioeS/ZrFIVRAeTZZ1qmxQRjV0YryQ3I7FQqyd+175OSETjYvA+1
	mKqCWnfyWL17UagIsxV4GavB5m3JqC462B7wPiyAmeRiV8qbnyj2KKEC3CoZv+FWB3x1
	i+EQ==
X-Gm-Message-State: AD7BkJJKT23fvOEAhZGhb/SzxRSScNzzbrKkAhCLQ7SmYm8gNEfPe6WsvvS/yo3x/mj05tTU2bclLd2Jfid33Q==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr15877145oib.96.1457408333047; Mon,
	07 Mar 2016 19:38:53 -0800 (PST)
Received: by 10.76.28.138 with HTTP; Mon, 7 Mar 2016 19:38:52 -0800 (PST)
Date: Tue, 8 Mar 2016 13:38:52 +1000
Message-ID: <CAGaPg5Kmm1qrm_R+b5uB+rw81=30Mau=MkNuk=KN_wiLGDAb4w@mail.gmail.com>
From: Philip Craig <philip@blackmoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] do_generate_qt_config_file not rebuilding when machine changes
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
X-List-Received-Date: Tue, 08 Mar 2016 03:38:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm using meta-qt5 with fido, building for two different machines.
Each machine can build from a clean sstate correctly, but there's a
problem with the task dependencies that means not enough is
rebuilding.

Background info: One of my systemd patches has made systemd machine
specific, so when bitbake needs to build qtbase_git, it sees a
different hash for the systemd do_populate_sysroot task and decides to
rebuild most of qtbase_git. I realise that's probably not ideal, but I
can't fix it right now.

The problem is that when bitbake starts rebuilding qtbase_git for the
second machine, it sees that the hash for do_generate_qt_config_file
is unchanged, and so it keeps using the old qt.conf, but qt.conf
contains a path to the first machine sysroot, and so it fails. More
specifically, OE_QMAKE_PATH_HOST_DATA and OE_QMAKE_PATH_HOST_LIBS both
contain STAGING_DIR_HOST.

So my question is: what is the correct way to tell bitbake that
do_generate_qt_config depends on the value of the STAGING_DIR_HOST?
Or is there some other way to fix this?

