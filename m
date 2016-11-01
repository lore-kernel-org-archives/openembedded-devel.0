Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id BB25771B0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 12:35:28 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id v138so105745829qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=pzGzGMdbVbWI11rM9f30dCN2MfmoDNe0Sf4+QUaoEGw=;
	b=j5lqgu/7qKmailbuECWOmaAR+aDKeKidFzwq/BbN/8kZFtKdadalaRgVcT4+7Qs1Zw
	Z0hBVKVrPIlQQPiTn4hOdRimu062yQxtofPHehdHrxavaPGoubX8KjP7dqGnVgD4ZUPl
	cvTRnUsT+CuaXKIplyysIULj+X+c49+j2MB+phDBwfreREFN5Tibv6apmTwlKiuXg1pe
	cHZfcYBksgnY2WyCpKT2uuze2q/XOvX27Dtb/3dtuGu8J7zmjenadwZZFpjx7SeXy8gl
	eha+4i/OJiQn2KvngOGAC+62dQtDyGPVdsTKC1NUqBi8ucwsKlqn/KCmAVp4Al0wt4/+
	oOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=pzGzGMdbVbWI11rM9f30dCN2MfmoDNe0Sf4+QUaoEGw=;
	b=NDhE7HYYA+I/xeiAz3edTX2kDEwDIj8EwVR1hk925SyMLPQ9y3aFKhQf3YnDJd0yRB
	jzcHV9vNQBZ5oqw+vwIIHnj6fltGm6n7sW7s/9DG1kYp3+6toZ7nElgaDoHC+UYRMg5k
	Po/g9X3K30aiQ6JqTWWsmvKH8gnExAQKhYhLlzVt0iHSVr4m/OBIpvAZ3FEv9heksTw2
	efuKTSanmwM3tNPree4SkHISiXWH8OvSnIx0hjRDvoSlisiKVcEAKPutuklHcJooqyIu
	WA8y5enTf8XMRXYTSLlvho2uXBq4zgeKX2ky5l2sPfzmZ+cYm0VxU8AWX0kqsqEHlZ4l
	AhfA==
X-Gm-Message-State: ABUngvfQh/fSP7Wk931YMHsWq8o3SV4licoEVi3LP1IUUqvLjA6CBjVO+lGXBJgHvgjfaX0op5DgXL8/pJsloNU3
X-Received: by 10.55.8.20 with SMTP id 20mr32890130qki.3.1478003730023; Tue,
	01 Nov 2016 05:35:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Tue, 1 Nov 2016 05:35:09 -0700 (PDT)
In-Reply-To: <4d4b2776807f4f6e8480ea33a3a71c89@SEGOTNC5112-N6.vcn.ds.volvo.net>
References: <4d4b2776807f4f6e8480ea33a3a71c89@SEGOTNC5112-N6.vcn.ds.volvo.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Nov 2016 12:35:09 +0000
Message-ID: <CAJTo0LYLT0bL4bgvkL_zJ1OGfOyvdxCooJ5V45ngtgW_pJFx0g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] packagegroup-core-eclipse-debug
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
X-List-Received-Date: Tue, 01 Nov 2016 12:35:29 -0000
Content-Type: text/plain; charset=UTF-8

On 31 October 2016 at 19:51, Visser Sander (2) (Consultant) <
sander.visser.2@consultant.volvo.com> wrote:

> meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> RDEPENDS on gdbserver but that is no longer provided. Should RDEPENDS on
> gdb instead?
>

The gdb recipe builds a gdbserver package.  There is a very rare bug that I
can't seem to find where sometimes gdb won't build gdbserver, but I've
never been able to figure out how and why this happens and you can fix it
by rebuilding gdb (bitbake -C unpack gdb).

Ross

