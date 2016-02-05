Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id C22D477302
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 15:27:21 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g73so132016500ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 07:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N6590r7sMJnltEVqI1SB7Ra0Mqn6rDtp+tqr041kddc=;
	b=BcbY8r/YZtDnSHRMHOwJkEOtd/UbKNYkmL/r74mf68E3qPO+zgkZj0OugICfUkugVl
	jS+lQMOMieUYv/phGzij5A1U2VI5TRgWIhTcrzgvEoMslGzPebsmYVyoGeJPj+UTSq6I
	R7Sxsx9vfjKESYMDxgantqKpO8mEtn5+Pbjx/KCXwVBV1Ldv4/x8b1XkRQinAqq66dh/
	hIVTbc7XlJEiNswhvwqeYB3fdrDFo7tCsvWmhtHOEFtLzRl935njKpU+mfJd1zLaBuxj
	iSCtprqthHEoCOM5dL6jSi3rGSC5OWDh473Yh8iN22W6Y9mgWgcIEo5+Rcqf1RxC2BBr
	lA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N6590r7sMJnltEVqI1SB7Ra0Mqn6rDtp+tqr041kddc=;
	b=YXdORr+sdeav3G4imSiN8Jg/lsySnM7pTmNhYCc2Q9G1qrWGBfy0qfsZ594ocPjaEp
	cZaxLj4f2RclrrlpXKRYT+pLQWTNl5as62PeETnYBQfzyQrdCm1pnyS+lKNzDXxbVg5c
	OwRiWRwlKhoGhmObywoP8aShkbAdjF+92j7jSdDI2wJ4Q49eXJ5+KuJzWMyxsn7E4re9
	WVUDeeNmSBYhQUVaI4WBA7mgTQZmmO5SFi8TFCB9WKhE9pYF0pr3k26FMQwSfQjluv8g
	DfOzAY1JZjfPUzfKeZ2rU43aYoWM/MXkuOLcEZKHWmQdoeczegJr3w0kuEwRId7XSmHx
	FTFw==
X-Gm-Message-State: AG10YOSm3rDg94JL0ObOyVZR1P4wduUqZNeGqjj7JiHoWyhq/4V5QfmO0d8eQyxYjEO2Qhugev7Jop6NwVmQD+oq
X-Received: by 10.107.3.220 with SMTP id e89mr14532936ioi.99.1454686042673;
	Fri, 05 Feb 2016 07:27:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 07:27:03 -0800 (PST)
In-Reply-To: <CALbNGRRWrvs7JL6V8ePoofYvWU0Lxs-vBq1=qU2OE7syOOgDXw@mail.gmail.com>
References: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
	<1454511012.27087.183.camel@linuxfoundation.org>
	<CALbNGRRWrvs7JL6V8ePoofYvWU0Lxs-vBq1=qU2OE7syOOgDXw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 15:27:03 +0000
Message-ID: <CAJTo0LYu_uQSVgpVSobMP3MwM+vdfaX=xecBLX93T_WRNGjtzA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] Language settings GTK (glibc?) problem
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
X-List-Received-Date: Fri, 05 Feb 2016 15:27:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 February 2016 at 12:02, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> Will give the backport a test and hope I'll get i18n back for GTK (and
> most likely others).
>

FWIW I've tested and queued this for oe-core master too.

Ross

