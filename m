Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E86973004
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 13:31:37 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id h78so1659194vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z4JrwMvfBT+MoGla0K1SiJ6YQAUPzAzKEnsrEZUaSWI=;
	b=gFfQ3fxC+8q8MnTpOXHtj0tMrGV97KQxrWTOMv/Q+0Sze6VgvF62M5c3k8R7k5pltZ
	KgI4/No92c1ZwNS9SzQ6I6ybfsIuzLqa/I/OkvtG5Qa26p9SxpkDueLhdogERGpux3yy
	KRu57tYINSc2pZprZc8Qpne7w2EMELvJK8cp96H/XuFXP/Gy7SXH7II/Jkq2kfZpaF6K
	dpwUL5ruwnw5XJacektiSwaSubn1NHKLNcIuY+60XIJdc7g25Yw60jT9Kv7VTCo5cH3T
	5/sIgPMh7c/zUpjFjxi9pN5o4WqK1mcywX4m142qAJoVadlSuiJNaue+gkZ3gL9t7J6I
	tFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z4JrwMvfBT+MoGla0K1SiJ6YQAUPzAzKEnsrEZUaSWI=;
	b=rHRWA7XpeNbDOSMO3Wo8UR4UxpfrNsghiRsnmgxXkU+tQ2fwUiwKDM/3TPchGR3iOG
	1/r1zvaRUZAPE1fEiK5axlEb+nF86ht/qAZDSX/At/CY+DNC4MnNIbkhjUZe9O2yKTtO
	smvUA8ETsnPpHFP8UKRK/HvpYmTzTD8Z9/6+owHQy5pDyovOPmxij9cPzKVZpiP1jiN9
	82Vv1BxgwTah2YonWJdg7wC1j41u9PLk7V8R6o5+jwfQxp+6rUhMgVoMDeFGBQ+ycE8Y
	owLu/1NWebMoMbAUpvc9/1cRr32//G+5IoxMHXyhkwpSxNtOrW1HxP1kaJ5+xlB5RqTM
	Vsjg==
X-Gm-Message-State: AMke39lEt6zKMRSa2i6LFAhI+QEfX9lRapKVd80n3mTk0CrcoZhhh8brBhJ1a7yiUEGaOrOwAfZDQHQwwmtxKQ==
X-Received: by 10.31.155.75 with SMTP id d72mr17682231vke.55.1487856698085;
	Thu, 23 Feb 2017 05:31:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Thu, 23 Feb 2017 05:31:37 -0800 (PST)
In-Reply-To: <20170223125901.GB3300@jama>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
	<20170222230250.30288-6-schnitzeltony@googlemail.com>
	<20170223105259.GA3300@jama>
	<CALbNGRSr2VNR6P=u23u=ecchFCOs=cNwPmDYGz92fwbtmB-xLw@mail.gmail.com>
	<20170223125901.GB3300@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 23 Feb 2017 14:31:37 +0100
Message-ID: <CALbNGRQ3rfUFAhKqpMhT9yGhWJ3RPDSn9cGtVUhoMvuFNvyvBQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Feb 2017 13:31:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 1:59 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Feb 23, 2017 at 01:20:05PM +0100, Andreas M=C3=BCller wrote:
>> On Thu, Feb 23, 2017 at 11:52 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Thu, Feb 23, 2017 at 12:02:44AM +0100, Andreas M=C3=BCller wrote:
>> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> >
>> > Thanks for another round of fixes!
>> >
>> > All looks good except this one, see:
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.2017022=
3_005128.log
>> >
>> The link does not tell why abiword's do_configure fails - can you give d=
etails?
>
> The link shows:
> http://errors.yoctoproject.org/Errors/Build/32829/
> which leads to:
> http://errors.yoctoproject.org/Errors/Details/133989/
>
> configure: error: Package requirements (
>   fribidi >=3D 0.10.4
>   glib-2.0 >=3D 2.6.0 gthread-2.0 >=3D 2.6.0 gobject-2.0 >=3D 2.6.0
>   libgsf-1 >=3D 1.14.18
>   wv-1.0 >=3D 1.2.0
>   libxslt
>   gio-2.0
>   cairo-pdf cairo-ps pangocairo
>   gtk+-2.0 >=3D 2.12.0 gtk+-unix-print-2.0 librsvg-2.0 >=3D 2.16.0 cairo-=
fc
>  x11) were not met:
>
> No package 'libxslt' found
>
Thanks - have overseen the links. This is the 'fedora is useless
without libxslt' problem - will send out V2 for abiword.

Andreas

