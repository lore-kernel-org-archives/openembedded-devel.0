Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4848160119
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 17:45:05 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id f105so121238812qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 10:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=zagbtqzRkSta5Y4ldGsDamtPIeUPVc1mUval+ks2GuY=;
	b=k5lN5g4lwAa5jnc0kFp0YD5yU2xPnXFTfBctTPSYglyNHJN9rEcIqUpvqIAaQe5P6k
	3VNt/zdE0TDYBzLhE/qHTp56g9DrG8p9bY9GdBOQOPGXPk8vdblroLu7KX8nXhh3Z2LB
	7j4aATuwW1hpUTdyA8bZJqkRJBl+lNGdvCYPczjWTgSkPVEmKZsAjDZVTN5WGxourJAV
	vOuLskY/L1sioAtFFRFNo7Vuk4WlOga37M3zS/s93v67gxDXAcLdtTFrLoSv8xI5UyHY
	XGONUxXBtfEREj94UXGmCbIJ/TEP7Eu1V5CfRuDbMxDzB1Qdvz86A01hhbtQCTClAkTR
	LMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=zagbtqzRkSta5Y4ldGsDamtPIeUPVc1mUval+ks2GuY=;
	b=iB4NAPCo9RNEGsK88sW+BB7xkNPZ0HmnTBuPtaFVAxDWzFYagBowsmHit5qa71i4TJ
	XBWuqemqti4ckbIis6mBpWyBBbU2M4t3tYQGdJJhRdO9L+/ES73wXFUqKkvovewFnCJp
	/HeEhK3ZQ/DzoAW150DW0+SuNRrQeMQ3IXSN62U7vMybyL/7qmhMQ5oIoWXuJwnV6IGc
	49ax6cGyEoHdrkrZZL/y3jIE5Lg9PXK7aKi6jrAk+c10vR+8IEua081EBfpgGvOTje/t
	8b5FftFYpQrtfxic+KFzw3J4wAPV47oKlUlFHsHOkER27UAtOtClhslDMmqMyHtABa2z
	fl1w==
X-Gm-Message-State: AOPr4FXEHg+2yi47mrGU5LE14gqc9MJikYsOxEQkxTTbqsY39z2Httfs984/BpwGYtw+5XZMdwo/nO3vF0RNBA==
MIME-Version: 1.0
X-Received: by 10.140.41.203 with SMTP id z69mr10064226qgz.57.1461001506490;
	Mon, 18 Apr 2016 10:45:06 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 18 Apr 2016 10:45:06 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 18 Apr 2016 10:45:06 -0700 (PDT)
In-Reply-To: <5714AF66.9050000@mlbassoc.com>
References: <5714AF66.9050000@mlbassoc.com>
Date: Mon, 18 Apr 2016 10:45:06 -0700
Message-ID: <CAMKF1srGttCf=iOg7Kfz10FnEfrqjGXXV93x2AC8NT9bhwyXQg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: x11nvc: useless rpath?
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
X-List-Received-Date: Mon, 18 Apr 2016 17:45:06 -0000
Content-Type: text/plain; charset=UTF-8

You can use patchelf to remove it in do install append. Ideal fix is.to
correct the linker arguments
On Apr 18, 2016 2:57 AM, "Gary Thomas" <gary@mlbassoc.com> wrote:

> I'm getting this error (used to be a warning only):
>   ERROR: x11vnc-0.9.13-r0 do_package_qa: QA Issue: x11vnc:
> work/cortexa8hf-neon-poky-linux-gnueabi/x11vnc/0.9.13-r0/packages-split/x11vnc/usr/bin/x11vnc
> contains probably-redundant RPATH /usr/lib [useless-rpaths]
>
> How does one go about fixing it?
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

