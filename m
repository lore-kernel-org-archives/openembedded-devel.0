Return-Path: <nickaein.i@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 14C2E65CE8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 11:46:10 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id h19-v6so392152qkg.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 04:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GWodbSxYwb/LfCkvjegym9AhxiaxN10xlaGHv9Qh6q0=;
	b=OFESxW+7Z8cFX44i7ml/v7v8wQMWqgSOKaUaMSzAi9lTXpEmGUr3E91YWVIVzofDmn
	PbsDcJSQ1paJXSiPWxHg3SVbEYfu7Z8XXETPU+gqIqbdXAqlbaXXAg7LZqk7m379EOqQ
	nU017+rVSuMSsxbw8ZXYnpD0lnjrMbwrb859ajWNlNh5xWss0WYTDZ82WJEqED36WDwK
	W1va79ycmGtv8dglwxpeHmz8MxLIpGn9dnqdEBKnrb/Gdnhfe3n1kxhIDlGhTeCwipJL
	JVHvHwuwQZYE/7xhcr62+jBYm0xi+PhohkxamxNax18dDxCz5wZl3lLB/Mqy+usaJYxR
	wHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GWodbSxYwb/LfCkvjegym9AhxiaxN10xlaGHv9Qh6q0=;
	b=Gkj0vzjjN9ddaAzH6CoIT80SflzB2CUxUJ9n8RsOa8runjiPDHGlIrdQJwc5mPE7BW
	M4hfIijdJs+X1U7QDVVJFGZ+CwBQ53Q0M0pxBQvj0fP2dl2eijOaB+aVmWMfOOfIRGY8
	ztezOk9kX6gfXI2c0ZkwOlejAs2UkAUkxebyMJRpSMuiXzu+y2/O49pcCS31Cnu1GYqX
	b/mDqo6fpFzNN7OFUw+gXaeT2cwsXMIZ4e5QjEQAfjHTMV+3NeJ4B19utgnXmPSA3kvx
	o4rpNIupQWRZ9ODrIpwx4d/DbdU424RUUbIglv0/EyQ/hMcodLAjfyYlxmi3VqGdJYit
	W14g==
X-Gm-Message-State: APzg51BeDX45EDFeifYPl5mWYhnsUjHNbnOPQeb3vSDw3XGVMiklr0bu
	B6B/4SNcxHUCumK7saoPphPJr9A2nlNGfGdOwWGVcwuJkGo=
X-Google-Smtp-Source: ANB0VdZWieNgBU9X4gXgu+NU8jSaFncwVcsFKrRa4xPZoSs+aQb+aGrbi9MCoxXyq7HFv00NSxaoO5+GbeUTX631FpU=
X-Received: by 2002:a37:2004:: with SMTP id
	g4-v6mr2693197qkg.433.1534679171699; 
	Sun, 19 Aug 2018 04:46:11 -0700 (PDT)
MIME-Version: 1.0
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Sun, 19 Aug 2018 16:14:14 +0430
Message-ID: <CA+NJmkcJ+K8fuTaDebtXhHgKsGKsszAK+bDZRyunZny4-Ntbcw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Specifying incorrect license in recipe
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
X-List-Received-Date: Sun, 19 Aug 2018 11:46:11 -0000
Content-Type: text/plain; charset="UTF-8"

I was in middle of writing a recipe for a library which I wasn't sure
about its licensing. I wondered what if somebody get the licensing
incorrect and submit the recipe to open-embedded upstream.

Since Yocto doesn't enforce the presence of license text inside the
source code (which would be crippling as not all source codes contains
their license), a careless submitter can specify an incorrect license
inside the recipe and just set LIC_FILES_CHKSUM to a README file.

How such issues is prevented in openembedded (e.g. throughout review
of new recipes)?
Who is responsible in the cases that license is violated?

