Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 90CC175A69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:07:45 +0000 (UTC)
Received: by qcmc1 with SMTP id c1so15417824qcm.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2015 04:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LSWC8B9zaF7Mwg3c1m5e2KzxvxeeF32JFnsUwhuJ2wI=;
	b=FjFHRbo39TXAPOXfE9vYlyT+xz/tmgQuC+bNfsnj6S+FTKudTX859BymN0tItdnA7x
	EqS7JTci4Yt+GKeNedMHgKjiMtwmt9UKJgT2g645A3v9w3KoVjm1NbUEzhmnd3qYNu1/
	0ayF4wYHGXbh/1t8MtVjMqrdn1RPllPEwWxkV0iiTFYCqdTo6OyFM/piel0l0oVDno+w
	fInqIOWaJBdFRcfN9NGKZly41NMaIP3ywVLWAovqp5uaQE730DJ1jBJ2zOagHAiCyU+z
	EjHiVRUylScypkXiOJxJHhz5DMTumpFIBMN5wY1sp/j71USD/vJpVpmqLJYeFiYNN41O
	mR0A==
X-Gm-Message-State: ALoCoQm5ota9XkqTO19gDrLjGGl7RbNgkE1KFCDk8DJK3zHDhKLspdu00TXPpfm1g95ynyW4pfOK
X-Received: by 10.140.235.19 with SMTP id g19mr38584152qhc.52.1434971266652;
	Mon, 22 Jun 2015 04:07:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 22 Jun 2015 04:07:27 -0700 (PDT)
In-Reply-To: <20150619165245.GB2398@jama>
References: <20150619165245.GB2398@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jun 2015 12:07:27 +0100
Message-ID: <CAJTo0LZBZJdUbqPWNDsJ6SmgPHmpio0JwVE=xfsen-2OoB0RnQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-06-19
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
X-List-Received-Date: Mon, 22 Jun 2015 11:07:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 19 June 2015 at 17:52, Martin Jansa <martin.jansa@gmail.com> wrote:

> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on
> libgstapp-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on
> libgstvideo-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it
> isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10,
> but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but
> it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a
> build dependency? [build-deps]
> qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a
> build dependency? [build-deps]
>

I've just filed a bug for this chunk, looks like we missed something when
disabling GStreamer 0.10 in Qt.

Nice to see nothing in oe-core break in this build. :)

Ross

