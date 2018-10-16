Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D24B379101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 15:13:18 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 12-v6so14327688qkj.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JrSvSVQdodYUq46IpHCKwCn74BsaOVUNjpAzDmizCxQ=;
	b=NN8XfC3WnbDBPVn7+ZHLnhPBSQI2oIpCKYIq0mZkL19EqrlpJpmczy91PB0CZL+bpx
	eyh5sXWtgSiyQb0L+ukdnPX5orlQg5GmUcF9/fzNOtF97D+WClmPSwkrhMveOjgIlCMD
	IUVKSBm8hmGlFgJZVUdlaVkvyPPtHm0Jk0osHyD79VyDg0XIyztoVjBxsasQLmCiwPpB
	TOeOmDb15q3MNKjNrIFIQlNTb36YWlELI8lYunWHJ5I78UtjeeTB/uCqN5QYqoLuX0eu
	FoN++OVhh6txKHtsR6q690RlAgcdMvqxxS6iqQJ89uilU4W8LCS6nZbrU67CA39rKwO1
	u1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JrSvSVQdodYUq46IpHCKwCn74BsaOVUNjpAzDmizCxQ=;
	b=WmJYhygbvhPx3r5GDpPuCu8NqXuJNDXs9rmkwzxbQEeYyUcSo5RNZybgRr+3JcV+AU
	PytU2eyaGPD0Af1DBgmQasSRc/QGdaU9p/W3Z3nTqFEz4PUGNNpylPnfFC2hE7Ijeppt
	jOmqXdTJ05ARutjMAI2f9yXd/unBWSgp4PrfDSRG78dJmqU67Mhq8aKyI6KjHGEgR2yz
	RmlyTDUgDYvhnA3SScuby77YTY0tifFR78oeY7PeY2p/kdWinUuPMlDDX1xY9Rz1h1zU
	3PNOqLDRncY1UTrm8tTHXiHN6Uo3Uh/5fCzwWqYRKZpGKYlGVOaUc7MLbV1rD5wxlH8M
	SusQ==
X-Gm-Message-State: ABuFfoj/SUhQrh5laFaHn7Br8F2cHZsWjQM5chCyudmaXR+tFg7OkmQG
	lcyAJ557CJVhhvzSswkwE5n61N9mQx+7Q5X6RCI=
X-Google-Smtp-Source: ACcGV60j6+FpQwj/Obmeve7B6gzfLx+Ox+XbHvsNEmfXML7/WSi2XWlUeiJk1nGD1VYze3dGrxlP+tjogQTSL36QY7w=
X-Received: by 2002:ae9:f408:: with SMTP id y8-v6mr21593880qkl.2.1539702799516;
	Tue, 16 Oct 2018 08:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <1539664828-29601-1-git-send-email-ankit.tarot@gmail.com>
	<CAJTo0Lba-jQYe5W99ZA3zLCqNQiFeRhM7m8zipRTCon5cKA4sw@mail.gmail.com>
	<CAM_RqkOR+WeyxbrGm5FEThYOELNABzcWt6KTmj-A+JyZ1hvYxA@mail.gmail.com>
	<CAMKF1socKGKNmOROX0-isBt47hj+z1r7YyKxt+TKYDs0XZe=ZQ@mail.gmail.com>
	<CAM_RqkN_A6tsLUBWcscF0m7AVZbi2+QBaKoF9QmprFnb0n--1Q@mail.gmail.com>
In-Reply-To: <CAM_RqkN_A6tsLUBWcscF0m7AVZbi2+QBaKoF9QmprFnb0n--1Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 08:12:53 -0700
Message-ID: <CAMKF1sqb-asvC5rAvxnLD4ahUEZFBih+JHfuECWvoc_ZoTbYsg@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Tue, 16 Oct 2018 15:13:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 7:06 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Hi Raj,
> On Tue, Oct 16, 2018 at 7:17 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Oct 16, 2018 at 5:37 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> > >
> > > Hi Ross
> > > On Tue, Oct 16, 2018 at 5:01 PM Burton, Ross <ross.burton@intel.com> wrote:
> > > >
> > > > On Tue, 16 Oct 2018 at 05:43, Ankit Navik <ankit.tarot@gmail.com> wrote:
> > > >
> > > > > +do_install () {
> > > > > +       install -d ${D}${includedir}/CL/
> > > > > +       install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
> > > > > +}
> > > >
> > > > -D to install is 'create directories' which you've already done in the
> > > > previous line, so that can be removed.
> > > >
> > > > If you're removing -D then a more idiomatic form would be:
> > > >
> > > > +       install -d ${D}${includedir}/CL/
> > > > +       install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL
> > > Opps, missed -D.
> > > Cool. I will use your suggestion.
> >
> > you just need single line there in do_install
> >
> >  install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
> Single line solution is not working as I said in earlier email, it
> throws an error as No such file and directory.

yes it wont now I see that its using wildcards. So send the final
patch with Ross's suggestions and we can move on

> Regards, Ankit
> >
> >
> > >
> > > Thanks, Ankit
> > > >
> > > > Ross
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

