Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 983A762132
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 23:04:50 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id h85so4480113vkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=v1m7Eq+/yW2Hhnie86O7fKKMaE7ep+PR2rkNeEldPcA=;
	b=N1lBS612nUupC9FLT3GRsUnEKQ+P7IPinYCMtBjzOhTEMFiIjN2R3ZEx69LRRJSk8r
	mWziZkynwsKUAEYSwCsFWvBIRe4oZXx9z+zDw0/TTJn9d+LveIgW0XCvxEYMel7fCw3b
	QxqO0vjCIsuq/j3n415qmlcCSJkSx/0HFb4gxWRafQ01A97YtcVI7qgHeaf/uauvTpI1
	MuSiLj0yQs2Vfo1u83h+o1TMu+vAmCt8nVJ/RJF3CCclsmj6qBCK173R5iOlHMlPk+jp
	zisG5ftqsQQxk3F4DCNV4tDZjI9FTTNYIL4qqXOzzQZaua4h2CmvfipdET967R6ts/Uh
	9Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=v1m7Eq+/yW2Hhnie86O7fKKMaE7ep+PR2rkNeEldPcA=;
	b=l2iT6HVXpGDa04LL3iVW472ShZ2L/mOFkBS+vhDBxEK3l1J9Y2sDYjvSLQOPj7gvNI
	7XBmayPcBnzOOg+3xORW/dev9RdhH5iMGaJVnJWrthURPenHr75aXpc0UqAMBRtYGRU/
	rTvDZcWI0EboAJHZdg6nsc/+I2z2js98jEhFtHUWOM4BhDMJfPwoPSmaN/WtZMebXqKa
	QYunRvWIKlwRieJRGKj4WF5UiCBqPzew1s3uKat/P+SoIR2skY6BIYlP0qJqiIyd5tcN
	Fwm/ov4rYUDNWdJ+LdtF8DOfabgYUfCWRk4YAyAzumtQb2ubBvF974XYaPeQ/4fbpphd
	TT1w==
X-Gm-Message-State: ABUngvfQ8bhEdIjZ76aYkjAbmAWvQ+q+Y83oToqiUSEymObTQ9+oKcyMLq1V1uXQyE+j47EFeRCALaO5I6M50A==
X-Received: by 10.31.15.65 with SMTP id 62mr10622216vkp.93.1477350291096; Mon,
	24 Oct 2016 16:04:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Mon, 24 Oct 2016 16:04:20 -0700 (PDT)
In-Reply-To: <6137B5D0-B8F8-4137-B822-D555F003E385@gmail.com>
References: <6137B5D0-B8F8-4137-B822-D555F003E385@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Oct 2016 16:04:20 -0700
Message-ID: <CAMKF1sq0aCfPyUuG80_mYkno+wVZkE7pSPza6kMJ-hsyU4Nh5w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: openjdk-8 runtime failure with x11
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
X-List-Received-Date: Mon, 24 Oct 2016 23:04:52 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 23, 2016 at 6:01 PM, Randy Mortensen <randy.mort@gmail.com> wrote:
> Using yocto jethro and meta-java to build openjdk-8 but when running a java swing app, it fails with the following:
>
> Exception in thread "main" java.awt.AWTError: Toolkit not found: sun.awt.X11.XToolkit followed by a stack trace.
>
> It seems openjdk-8 is being built without X11 support?
> Is there a fix or known workaround?

do you have 'x11' in your DISTRO_FEATURES as well as PACKAGECONFIG for
openjdk ? if not then it wont enable this support

may be you can add a little bbappend in your layer to add x11 to
PACKAGECONFIG or via local.conf

PACKAGECONFIG_append_pn-openjdk = " x11"

> Thanks
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

