Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81B3D60F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 12:27:02 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id m13so13071145edb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m+jEIpVvsAM7rEsO4Jp8KnQTrbTBBj3QEXKUHGJeTqo=;
	b=GtlgRcSEtRcajtISLG+PwTLlwOW/21xAvN5QuJDMYiqigBBIyz2VmgooCZgAJv9DrS
	4NrRXm0cfdyuM2WUoE0k/qmpZE0iQHM5rU4ZlgUK0w0raIXxLRUnL2444wWMq3Vrgr1L
	dCX7jUpWoxg8/u49jX2KZrd2gTL9qsdSuYVNS3rcZb0XFaFSyInkh4QKNyBXw/CnAqfx
	brw0bP45h7G8icAMykNC7BQ1QGrhDyGylMDthSo3l/QDiOqq3Gq8tPiqlFYydKeK8Lg1
	sEv4zM4Ul5IhIkZSr1ZrWPqFmSORGBPRBckixF2W4PxRyXxYZFSqnN5wcJr4/RpfWYyb
	IAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m+jEIpVvsAM7rEsO4Jp8KnQTrbTBBj3QEXKUHGJeTqo=;
	b=MHcRyQwTBOgYOawXNni3mtdfhySPc4m5mmlcg7pkMgNYfOkX2bdnOg/N587792KIg9
	/JYcDV2iJVFI56oByL7obxroJLEpE/QZeqMqWfGImuWB1dgZMQl/Kv9l9XrjMeFMGVgm
	nU5lRNQl5UfuWtW19ERzs3qyJ1U2smqI5YlI58+3A9fAkTx38NxEcZ9DQZxnwx/wCvZl
	fmMHixp9EzT0YGP1mSyiABvY5iI076J1rtCjQBAf8qTe8sZTqTWwTdkWIoIF3h85z2/E
	DcgJdXUoaJP7NMEI8e5cXDQUiVBtVkbIPe86wWjF5cWKCPUUR3tWabQ5i2uz26HFxyD9
	yH3Q==
X-Gm-Message-State: APjAAAXKA4B/054A57OhgSXHSBFgGLCWoZn4Jk2jdHlDNK6nAsANyDG8
	k7XrdJJun4XSXTolpXoC1eG8B+HBlpzfGZS2eqI=
X-Google-Smtp-Source: APXvYqxVyNSMmYBvUWuPyFCx6gQqcDiH3JalGzP5KQr/Rf8s7lxBw4vNEfFBzFKihwy3zxcL2wZOorOvWP9k9t6mOAE=
X-Received: by 2002:a17:906:8247:: with SMTP id
	f7mr14897549ejx.320.1583152023134; 
	Mon, 02 Mar 2020 04:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20200229185539.3905864-1-raj.khem@gmail.com>
In-Reply-To: <20200229185539.3905864-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Mar 2020 13:26:52 +0100
Message-ID: <CA+chaQfxab4+mepbvxdNkoj4h9T1T5Qq4TWwne2teiexjyuwnA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 02 Mar 2020 12:27:02 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

added dependency on grpc exists only in meta-networking, so this fails to
parse now.

Cheers,

