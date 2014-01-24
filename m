Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4548D600AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 00:38:34 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id n16so3027280oag.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 16:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=UrzLEsW4pbhOKrSh6sGuiHSaAMnkB5P672kktDcDiTI=;
	b=i7OmHXDd/24du3y29oHzJfWDdkMCwR0ZUHJb9e4YXbAQNZ3x2FoNvNJoGbaDWM0e5s
	tikT7wHy0S3MasK4izc65sSZlzN//rBaBPKOgkbPtRAq5Pj8lNDlX8IRgrww5FDzRDu0
	ncLBl2mr60LK8jwLnn6xcWPur8VXTCV6jZ0f5EKvpOP4FXdpOSiQ3y3ArgVz0EhNHMpc
	ESFlbRBTOfW7a471/q9djWD+GIndJNQDoGGaR53429GH80ryMeWgN05mE8rzO6+wTmk9
	sob73QxqSMaxyfneaKiJt+NI/7Iy0oojuLu2Qloj8VVlfPIkaskWGbm/YQyexJWqABx8
	z2eA==
X-Gm-Message-State: ALoCoQkzuian0c+W8uGijnX9fqMVXfO9umEBGzjQYcU7wNTtpScIacFpvw6UoscVl5DE4aQ2ICKH
X-Received: by 10.60.96.167 with SMTP id dt7mr112356oeb.66.1390523915064; Thu,
	23 Jan 2014 16:38:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Thu, 23 Jan 2014 16:38:14 -0800 (PST)
In-Reply-To: <2040901.xScSF211cV@nirvana>
References: <CAP71WjydArvSEYRdK0NRWs5tTS_KuYBjZena8nas9eE0tHbv6g@mail.gmail.com>
	<20140116235245.GK3742@jama>
	<CAP71Wjw=izSkOfwTHpLG_OZpX=4tUHeKgiZboT-2rg3jStNYog@mail.gmail.com>
	<2040901.xScSF211cV@nirvana>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 24 Jan 2014 01:38:14 +0100
Message-ID: <CAP71WjxnP9N+S9UMzXd=hMQu3w8ckcvrvdp8P8FA-5dN--9EWg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: qt5 and virtualbox
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
X-List-Received-Date: Fri, 24 Jan 2014 00:38:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Simon,

On Fri, Jan 17, 2014 at 6:51 PM, Simon Busch <morphis@gravedo.de> wrote:
> Thanks a lot! We're building currently three different target machines (one is
> qemux86 based and for virtualbox) from the same tree and it's working very
> well :) Every target has the same core system with just some changed runtime
> configuration.
>
> If you have any questions about how to configure the setup feel free to ask :)

so I was able to replicate a similar config with our distro and custom
layer (Qt5 apps). that works quite well, i haven't integrated any
'input' for now, but that will be the next step. and for the record, i
am using eglfs, not wayland as the backend.

i noticed that you added the vboxguestdrivers in the image, however i
think i am getting more or less the same behaviour whether i install
them or not. what do you expect vboxvideo kernel driver to bring?

cheers

