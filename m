Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 37881731EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 08:52:00 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id 17so6721285lfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hQ9V7voJnZTZvWCy/J+7Xz+Fi1YYj/0sX+pbrQgmHFI=;
	b=H7vO699CfUGgXIR5bkfnVniRLKBaMuLkLntAComSeumEvx4XPOVTLBwmchdYYem+00
	8dJtgDxk0KPz2+rdhdZG6PSIF+vku/q8f9q4VFzDYewOLWDlaPsJkmo0uYkLRIrLdtqr
	/gzVidTxx7b7D2PL+XNgqToS6Ui+cxTgLQTEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=hQ9V7voJnZTZvWCy/J+7Xz+Fi1YYj/0sX+pbrQgmHFI=;
	b=VQVNXKsQMPuiP4v+ScxtB3NA2Mqoq6m5qkA21iga4SGHFTWkSRbJqDbrUYBSaW71a/
	BoJzwX8IXQGIPv2NMmwO+rE8j8KKNX71LOxtfd+H+2lgT4ZoL68xByZn5+XW3v78Pkwc
	jA4tbt6P2vFD0qCcZsktmbetm3hso7iIONBEjSpvnlN0p3Z2P/3PYPswJc2fW71fes2i
	Wr7wjU6IWeHETJXJ5MwOKmPEUhAjSupxJlvhp/ly5BOKgy+IddlPArzNoPQKIvY/1Y7P
	PrTKOqvw8Dzmlhs5o0gui1dGIFHdlFPunFDntYF881SPVbzljaHHMweVetKDPehLx0xZ
	tPPw==
X-Gm-Message-State: ALoCoQkhObn5KuDtNu8euv0oBU/8xNV8e4EJaqfticAO8rH3njQl6oNvxuQlOEYfUUyEPhgzUs4pheQFQeo7BMxVqnnhxSCSQSgKe58XUejS+oSXLMv7C9U=
MIME-Version: 1.0
X-Received: by 10.25.213.134 with SMTP id m128mr42158320lfg.87.1452502319736; 
	Mon, 11 Jan 2016 00:51:59 -0800 (PST)
Received: by 10.112.204.200 with HTTP; Mon, 11 Jan 2016 00:51:59 -0800 (PST)
In-Reply-To: <CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
References: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
	<CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
Date: Mon, 11 Jan 2016 09:51:59 +0100
Message-ID: <CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] various: delete qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Mon, 11 Jan 2016 08:52:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11 January 2016 at 09:08, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Jan 11, 2016 at 8:10 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
> double efforts? [1]

Looks like it, but [1] doesn't show up in
http://patchwork.openembedded.org/project/oe/list/ :(

>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-Janua=
ry/105406.html
>
> Andreas



--=20
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

