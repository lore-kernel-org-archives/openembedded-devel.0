Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D11872FFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 17:16:58 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id h78so2148586vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=P68dBIkUvGtrtjuSDdjFF/paafEu4Y+e9XJzlaG+cA0=;
	b=gb+dWNvIJUH5mHr6KJ6WcKm6GEWXhmBv8h/SIytKkaulsEo10PBiIc4ee9EZd5uFN/
	UhoXL64lAb7N3MA3Ua4I+lK+8GhceHXx2fBbMUzKlCVm4chJBIEvqjPk2kujEzA+SWvZ
	+1ADOCUHmK9nAhrEAmBkB0aR039TgReTPMYZJyDw4qjtVfoAylczu988JIEUGyjyRMWc
	peONW7YiW1cu9gH1RvtkNzHPaNZ8wqi+MkyYbLyE7DEAf3YVd9wt/qgjMTqVFCGUspYw
	98CbJux7tiA7oWVhPcoJ2DMtXCE/t1sLKDonPX6X5uMwTV/p6LJ8P8oRKEf8L0YKP88X
	TK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=P68dBIkUvGtrtjuSDdjFF/paafEu4Y+e9XJzlaG+cA0=;
	b=dKXHLFyGIaUDK+Ioais2WVhdlbV8ejPzekMtM8+Yn7LHHEAbyrAOBhv52zDC38WQv6
	QE0UlRVMBBTHNpft8lh53dN9E4PKK1xYAKp/mj8rdtjSbAGf1F7FISLRLCwU74RSpcnm
	ZcRtM2v/8w5sCj75y/TzBVCLvhciMox1t0Wh0Rf8om3cQD2j9WHC3K/YhNtfYsx/DIsj
	ptLNDw9ydxdgoK9jNIOMlBiC59rZB3sR8b+IvmOJCJ+5i26Mfq/QWKC6avtDyi4/nU2l
	LCWBYZQoexLp0tnnx3OqOlnQj/OLFg68xC4g7P3qjG6Fb18t1E/AwYt63XDLXHhU8rjE
	0Deg==
X-Gm-Message-State: AMke39nRbqw40cKYWWCRaMY3ALBHJEhrnwvar5XfQMEAoZPe6QnzWl+Zm/+LXCoLqK7SpfN+TiTGWtgArz+AYg==
X-Received: by 10.31.60.143 with SMTP id j137mr16544710vka.30.1487870220200;
	Thu, 23 Feb 2017 09:17:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Thu, 23 Feb 2017 09:16:59 -0800 (PST)
In-Reply-To: <CALbNGRR7+C+HchBmzuxZjSXjVmeyqhrQ+87eWikfe5Fuu9Z0sQ@mail.gmail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
	<20170222230250.30288-6-schnitzeltony@googlemail.com>
	<20170223105259.GA3300@jama>
	<CALbNGRSr2VNR6P=u23u=ecchFCOs=cNwPmDYGz92fwbtmB-xLw@mail.gmail.com>
	<20170223125901.GB3300@jama>
	<CALbNGRQ3rfUFAhKqpMhT9yGhWJ3RPDSn9cGtVUhoMvuFNvyvBQ@mail.gmail.com>
	<20170223143238.GC3300@jama>
	<CALbNGRR7+C+HchBmzuxZjSXjVmeyqhrQ+87eWikfe5Fuu9Z0sQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 23 Feb 2017 18:16:59 +0100
Message-ID: <CALbNGRT=TEA23TvYZE=DzJQjE35R2aCn=oiLVin2ebEf8pdQ4w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/11] abiword: unblacklist - gtkmathview is back
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
X-List-Received-Date: Thu, 23 Feb 2017 17:17:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 4:07 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Feb 23, 2017 at 3:32 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Thu, Feb 23, 2017 at 02:31:37PM +0100, Andreas M=C3=BCller wrote:
>>> On Thu, Feb 23, 2017 at 1:59 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>> > On Thu, Feb 23, 2017 at 01:20:05PM +0100, Andreas M=C3=BCller wrote:
>>> >> On Thu, Feb 23, 2017 at 11:52 AM, Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>>> >> > On Thu, Feb 23, 2017 at 12:02:44AM +0100, Andreas M=C3=BCller wrot=
e:
>>> >> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> >> >
>>> >> > Thanks for another round of fixes!
>>> >> >
>>> >> > All looks good except this one, see:
>>> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.201=
70223_005128.log
>>> >> >
>>> >> The link does not tell why abiword's do_configure fails - can you gi=
ve details?
>>> >
>>> > The link shows:
>>> > http://errors.yoctoproject.org/Errors/Build/32829/
>>> > which leads to:
>>> > http://errors.yoctoproject.org/Errors/Details/133989/
>>> >
>>> > configure: error: Package requirements (
>>> >   fribidi >=3D 0.10.4
>>> >   glib-2.0 >=3D 2.6.0 gthread-2.0 >=3D 2.6.0 gobject-2.0 >=3D 2.6.0
>>> >   libgsf-1 >=3D 1.14.18
>>> >   wv-1.0 >=3D 1.2.0
>>> >   libxslt
>>> >   gio-2.0
>>> >   cairo-pdf cairo-ps pangocairo
>>> >   gtk+-2.0 >=3D 2.12.0 gtk+-unix-print-2.0 librsvg-2.0 >=3D 2.16.0 ca=
iro-fc
>>> >  x11) were not met:
>>> >
>>> > No package 'libxslt' found
>>> >
>>> Thanks - have overseen the links. This is the 'fedora is useless
>>> without libxslt' problem - will send out V2 for abiword.
>>
>> Thanks!
>>
>> Isn't this the libxslt for target? I wonder why you're having issues
>> reproducing these failures when our builds should be very similar with
>> RSS.
>>
>> Of course missing glib-2.0-native dependency is different case, but
>> target libxslt? Does it silently fallback to host's libxslt?
>>
> You are right - this is different - wonder what made me build without
> errors. In configure.ac libxslt is searched by PKG_CHECK_MODULES
> (->pkg-config). I ran on my build machine:
>
> | pkg-config --cflags libxslt
> | -> Package libxslt was not found in the pkg-config search path.
>
> And the recipe has pkgconfig in inherit - strange.
>
> Have morty-like environment active at the moment - so I cannot check
> now. But this needs further investigation.
>
One big difference on my machine compared to your autobuilder: I have
meta-office in my layers. That causes different
depemndencies/pacakgeconfigs. I bet removing meta-office will lead me
to this error.

Andreas

