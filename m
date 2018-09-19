Return-Path: <twoerner@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5C579306
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 05:21:15 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id m26-v6so3974960lfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 22:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NdQyecI9Bubac7O74zPMkkvjNNWC1bhm3M+n55f5VDY=;
	b=U4cNB19cRTE6C1wlfKIfQ83rUw990NK1QsvfOdgNys7JI2OR6TBCPtVbiv1UXGJFUL
	RfSmBea+8qy7J7h3DycsEW7VYrKBLp0pDDYI+T1/4KxECRhcXlS9UbKRwjUXEoJ/v7J5
	pEBgwzB8yY+TfxFn57qAP6agQKQHo0tzSiVqyDkBq6oIuOd65GFw4d4WkXw5RyerQq4B
	2Wfn5L2+00iDUZX7gWtg/hlCLolT7pNmRPc0rAG09lLJ0WYU4/VS7a0CI10CisJp87u1
	ESEOsrHd7+3R2TYw0dhShg5RklbiCI1gncQfSAi07h57kCClZ/O/K4azZqZgqYFRQ0VW
	JkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NdQyecI9Bubac7O74zPMkkvjNNWC1bhm3M+n55f5VDY=;
	b=MxTu0ETA62tEgNxOwWjb6kx2+hVvhKwJm+CzHxZKt//MV8/wLyWFFBThXJvkAfF+4/
	2CrPy0fYjTmFhKnQrZ44F5no/egO8GhwfjGAsm3Tihh70sciYXmNzJLLlbQVSAXxqY0y
	7b9txEID5juxsE5C9s2DDi50F0vOOWYHAXpOBXJJQ3ML+7aHEDbvVvJwfQqlwpVsyt2z
	zS2R0mVMxqIXccziAsBPR9wYsESCsCim4puQQdcWJGkgyHFGvOPkgyef8rnkZN6bdUxU
	ar1xI79Y8TCpktbB3bsCwJNg7L8qt3R/jyvLnvknvWnzVYQY4Ty03IKOryJqF6dWRdXh
	uo1g==
X-Gm-Message-State: APzg51A7Izm6dJaEzX6dsiRRYAm4xKhQMHOEqxpCun+U6eL3xpqFSrES
	rXESCh5YlxP0tG4Fas9Pt5zhVT25Jcyz4lRxJ55+2Q==
X-Google-Smtp-Source: ANB0VdaJ3sa6Bge0GKmTkGGd8+e6bbY4bzO0JJJ9/uyZQaSo2RcmWLE90IeFxQCFAjjKi+ChxYFARP30nG1urYd+12k=
X-Received: by 2002:a19:1f83:: with SMTP id
	f125-v6mr23060819lff.40.1537334475961; 
	Tue, 18 Sep 2018 22:21:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:6b14:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 22:21:15
	-0700 (PDT)
In-Reply-To: <1530121431-7102-1-git-send-email-daniel.diaz@linaro.org>
References: <1530121431-7102-1-git-send-email-daniel.diaz@linaro.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 19 Sep 2018 01:21:15 -0400
Message-ID: <CAHUNapQaiBWsFbosS1HmNVOa5z0Ajy3u+MyiKidTtswtR4qXgg@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] bpftool: add new recipe
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
X-List-Received-Date: Wed, 19 Sep 2018 05:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2018 at 1:43 PM, Daniel D=C3=ADaz <daniel.diaz@linaro.org> =
wrote:

> +PROVIDES =3D "virtual/bpftool"
>

I'm curious about the above PROVIDES line. Are there more bpftools other
than the one in the linux kernel sources?

