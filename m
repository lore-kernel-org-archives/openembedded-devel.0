Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA306FF7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:40:37 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id b62so112407810iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xdzqVFfsJhgiC5yzXBMaq5NRwYa7xP+pM4P2tIeinVk=;
	b=tKn7JsXgV4vkpyydZGW7tQjVRrn3sIbs0nfXZzVrx4JBSIJvQxRcGPyqTE2n1dpfZX
	MJFpGlyKEUiAXrw7sLLS4FnKJk0thtXgNzkI5e0Lnt+sm5Ce7QCAfln4jCz4r4+hU+el
	CQnRsogFUXsjaftJuzQtSe95Ly2+SghcjLTDxKmZ6F11CfdEutDqfouzk9uk0SGJpZkW
	wyvXsOQf2HGAsPUlk15QW0i753TlyIyc1xgPoholZf5M8Xiu9KXc7m7c/74K19A2TYbF
	FE6tjPb2draLQ1Ptpqm4jbYaNl5tMIV09PTfIGZ4MCogwy7EKbuf+gPcH0F4IS8bzbYQ
	xvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xdzqVFfsJhgiC5yzXBMaq5NRwYa7xP+pM4P2tIeinVk=;
	b=S8iCu6d0lvfFn/N8PKGg7Hy8opY175cxw+Ex7ga6LCdtpqChrM2M67nCdrnQvfzsZh
	MfMTv7dAPujC5kMvk2FaDAN9/MxaFpVWsSvDfTRtrKoLCjhxERVmHZehvsh4P2JJbz1z
	F16tFjH9FFWRe+1U3r0/uWmxT//7o+BZT5sDGKBG6U8+K6iDwys9QMJ4uN9m0MkFOVAA
	gSrNsQrsQAUJo8ODfP/hyqET6wy1/PhQrMW0k9wflSdqSnbIIjcsA0IRH30vsXCMV1c5
	T1UKutpyZZcQDzDxRkR/G1BXDGK8HSi56U9Jv2nKzLCsBd1xinhLXpWkE1aXwewzs332
	240A==
X-Gm-Message-State: AEkoousTi0lmNIpdvPz5JE7R00Q0vCje7qopBoVM8qf7sKRxqZJjRS48+umeaFP3lXokGTrsA+LnMJBvZyHQQQp4
X-Received: by 10.107.154.196 with SMTP id c187mr39951121ioe.99.1471365637688; 
	Tue, 16 Aug 2016 09:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 09:40:16 -0700 (PDT)
In-Reply-To: <fa2fc853-b871-1ad1-a1cc-408fed9967bf@smile.fr>
References: <1471343516-6946-1-git-send-email-jeremy.rosen@smile.fr>
	<CAJTo0LYKYph9e_JaLVbFbByCCwk9a2zmHVLAMEoed7h5rGeArQ@mail.gmail.com>
	<fa2fc853-b871-1ad1-a1cc-408fed9967bf@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 17:40:16 +0100
Message-ID: <CAJTo0LYFf-UaFB4VyCRv-0JPb+aBA_ZzVk+UCEB_GG65h3sqkw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] [jethro] fix gcc-cross when BUILD_* are set
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
X-List-Received-Date: Tue, 16 Aug 2016 16:40:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 August 2016 at 14:13, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> Master build correctly with gcc-6 and doesn't trigger the bug. i'll try t=
o
> trick my debian to trigger the bug...
>

I almost did this on Friday but had some more important builds to run:
basically chmod -x /usr/bin/gcc /usr/bin/g++ /usr/bin/cpp and anything that
doesn't respect BUILD_* will fail fairly obviously. :)

Ross

