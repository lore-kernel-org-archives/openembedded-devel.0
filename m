Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCeJ2-0000gY-81
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 23:51:56 +0200
Received: by lagw12 with SMTP id w12so440340lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=oxIOkfc1Yj2jFBX5vCrGipt+RJoVL16klAnPfAQSnxQ=;
	b=kCbTRE8QIIMExJVaK/EY6AXU/WiBx4SJyYtqFNUc1VXuUUTbbP+Kd6v+pqnSeMfbTl
	X/NPScasMnTQn1I43wvcdA8dOVBO6JNkHqp4RpSsjif9Jjt6VKjUFw9iyFxNqOIxdnYO
	p7odMj5RyAvhgZZ/2k8GeHIKgd6herT5KLqKT+srnBhZzZB5WrqyzB3C3uNXmGT60dnw
	FmD1fXhKlfv3qS968Dhrh22Zo6FU/TkgS8hpGO+G0ESIrkGKER+T7QW3TpJFHl31s3xQ
	QhLO9dbFU4vi3mB2r1/f5WarQFL92En9NdP9PvsFbOLCeEW0FuNUUw5EwjSbbKV2dDO2
	4IYw==
Received: by 10.152.113.229 with SMTP id jb5mr20010291lab.45.1332884574824;
	Tue, 27 Mar 2012 14:42:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Tue, 27 Mar 2012 14:42:24 -0700 (PDT)
In-Reply-To: <4F7047C8.10403@gherzan.ro>
References: <4F7047C8.10403@gherzan.ro>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Mar 2012 14:42:24 -0700
Message-ID: <CAMKF1sooLVEAo5MLOi9mCvT1HpoVFatBF-ffxJDYj2cKuaprsg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Build from precompiled rpms?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 21:51:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 26, 2012 at 3:41 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>
>
> I want to speed up my build process by using rpm's from older builds.
>
> For example, i want to have a build with a new layer meta-yyy. On a new
> build i want to build only packages from this layer and all the other layers
> built from rpm's already generated on a previously finished build.
>

use shared state it should help


