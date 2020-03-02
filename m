Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 646D2618E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 17:22:46 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m2so414381qka.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 09:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=69lPvzOSVZo8LrZto3CNTM2pKNJwMInOO2dfx4/rzGw=;
	b=UoLQ9Re8c/0gO2BlPGtLpVbcbLQ0PAEqjeRu2OWnIRieO+uGFkNr5ZKnj/3tSi+4MV
	QI4cqY376X6zdgLCJN6V1keiu/0NzsNHUtsTQoRIqjjzbBoCUZfS9sqOOjjME14gIZOA
	w5Zsu38ZQ50HvCnlDV+mSHYyUXfw+LrDYBQQHp2YRwk2jHcNA0p4fLADYk/OG1gKoPkq
	UO0T14gPGro2DJa9ab4omylp/q6tgoZBTy92axe06RDPMoHe6LBaWsvVMnVB6spgQZxN
	xFCrscIp5/83i72XxFUxSEPc29rGIw4ytD9wbwyUFOs/OfjpHT17e666sDfUlZy5NyWN
	sNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=69lPvzOSVZo8LrZto3CNTM2pKNJwMInOO2dfx4/rzGw=;
	b=PJrYkNXB3zsT98yTwjW5EiZ3EshWfyZgIT9QPo5Evzd8KEhCzo+FowGwNurn5xuaKG
	dRQPc1v1tDTZP9s/RYj06AFI9Kq1RUoiaCTsdFblwiaaxkhra1esuUPwTvOtgPc6HYW0
	e3KKWsurBVpNJZl6bA3i+WYUzsuS43lAhITPSlUy/rYaLkgEpaWJjqFwyhn3Hd0zELBq
	OFp0YsrFLDd+KC7/bcRVYtM6m+3dw/+2OAsyvF2Cpwf2fREOPaTq/H26C4vs5bhzBtqe
	S9SXJMqYf6oYpeR0qbqgHabNmcmluY3L0QikVARaxUFiZ9Emz809JZuW0ex+Ri8ov14X
	Jpzg==
X-Gm-Message-State: ANhLgQ3wMgl+NjP095/nCb9bxQi2WwjbJSU4HhQuK75ovYThd/Ix+aq1
	Vx5K38hTibFWt26gud4l80nPG/Ctkw6kEQoow4+iSVtO
X-Google-Smtp-Source: ADFU+vsURP2KXHZZN+31ol8r9mQ7t1iqBDpkUBSJ/87ctHx9srwox8PJPw+3uR1t1lIX4CsOIZQP2RBk3Va6DI8TsNI=
X-Received: by 2002:a37:e47:: with SMTP id 68mr295567qko.17.1583169767001;
	Mon, 02 Mar 2020 09:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20200229185539.3905864-1-raj.khem@gmail.com>
	<CA+chaQfxab4+mepbvxdNkoj4h9T1T5Qq4TWwne2teiexjyuwnA@mail.gmail.com>
In-Reply-To: <CA+chaQfxab4+mepbvxdNkoj4h9T1T5Qq4TWwne2teiexjyuwnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Mar 2020 09:22:20 -0800
Message-ID: <CAMKF1srZjHaeuTD0FLv0kmmn+Gwq9QThHxhGXB0+WSBSo2bEJg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: Upgrade to 0.26.5
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
X-List-Received-Date: Mon, 02 Mar 2020 17:22:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 2, 2020 at 4:27 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Hi,
>
> added dependency on grpc exists only in meta-networking, so this fails to parse now.
>

I think grpc is common enough to belong to meta-oe as well.

> Cheers,

