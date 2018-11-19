Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by mail.openembedded.org (Postfix) with ESMTP id 67AF86C13D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 20:02:04 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x23so4728464oix.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 12:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0YsrARd64NY5yOEl3aZ11QG1y83/ckKrxOrCmCxjmxU=;
	b=hygy+b8lH1UacnCkdKf3HzOjDMFhGZpO4F2KHRFNTlmFvlNWfr+WQbPeEyhuc08wcv
	kunbGW1wvPRG0WY9swCBd0GJ1chiiNfVbsW9hUjZCpoepgfD8A93QSYqpGc5KEU/56wz
	/LKLETPE1po1Ep5r3IbngdNTbvpf7RRdM6Cfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0YsrARd64NY5yOEl3aZ11QG1y83/ckKrxOrCmCxjmxU=;
	b=EbmWhOAvCYuEttC7UVdUcIdHu8pH88BcHzQtMN5EyItYE7hg3SSc1lD3tkSn3GgSIt
	ybdwysss7KYATnxnLyWmvQD8V9ROCrYpdPfQtnCk5SQ4a6ZLc1Wh+7cjVuoEyPk24gmM
	mnDxR+xiT9MAgm06EWF/BBtNfq9G2biYIsUlKfKYnlsHMdPrvx0Qp7a8pT3CxC1mq3Kl
	kwqU6jiWbf1IGpy7PZOTt28bZgmeB6I3dfuSXWSbJcEvAp3TGVvXvCCfan7x/YaQo3wI
	+41Esj9wiKuwzvx+WOA94hJ76IRkKQku+lRuGo5ptBGiKNeqmVrhHqd0uBmKQx978WNe
	Hraw==
X-Gm-Message-State: AGRZ1gLhLwML6XcaLv641PayU999q2RfP7zwam2s8VY5TQmGlSc3FaXw
	DhLsv17IkWS+kmu13+3lUYKVR29ec31lhoy4WCXiHg==
X-Google-Smtp-Source: AJdET5fbV63qQm3i2vknIq2ZLHkmhFtoEEfZyVjddOKOSSBM3WEYTg0/kzCwePPz1NiR+Zr6d/nJ8rQHSMpqAQTbIiE=
X-Received: by 2002:aca:c413:: with SMTP id u19mr1605272oif.209.1542657725145; 
	Mon, 19 Nov 2018 12:02:05 -0800 (PST)
MIME-Version: 1.0
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
	<9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
	<20181114151723.GA1417@jama>
	<e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
In-Reply-To: <e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 19 Nov 2018 12:01:54 -0800
Message-ID: <CADfgfoZt=B2-3JMCdUvNvQdGvtOQYsPvypNB4TU0VXPxQ6sSaQ@mail.gmail.com>
To: "Armin Kuster (akuster808@gmail.com)" <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Mon, 19 Nov 2018 20:02:04 -0000
Content-Type: text/plain; charset="UTF-8"

The rsync target on on the world build machine was offline following a
reboot causing the sync to sources.oe.org to fail. The rsync target is now
configured to be available following reboots and the sync has run. Please
let me know if this test still fails.

On Wed, Nov 14, 2018 at 8:19 AM akuster808 <akuster808@gmail.com> wrote:

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

