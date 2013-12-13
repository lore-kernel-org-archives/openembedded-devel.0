Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id B7D526E2F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 11:14:53 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id pa12so1271292veb.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 03:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=sHU7Xf/vrMM3KyQjy/pFKbNW7Qj3siIcZYqct/7rWgI=;
	b=gzVoB7D3A9ddWzjPmfSXQbcII/wuCNGhOdx/JFTR4GFMHErHMCt9rXNx6Zfb96p6uT
	HXVSgs1f4IuyJamFj3Cx5KD3ETr4qAT38vA4VuThRGjs+4d75M416Exv7txsO1sX7X0/
	fPRgtPMeaJAdLzcAhfR/xAxZ0vq6fcAKQ7y2YCfrwYoShAh6GFwzxfwNQ9OU1PdgOWM5
	ey5mzl+ufTAkzaejzUAihEcjSnaRzEmQvoN2HH6hIqbjKXB5RyyjTd75qY6xgy8fRlgP
	M1jLAsxU/apUcDV1MY4vYqkqRPNHNsyfxYGNDRE29TDm4OXSQZ/+SWnYJfnPMeW3A17R
	8+Gw==
X-Gm-Message-State: ALoCoQmHlxOVBdat0CabaT0i0Y1ge9hqPT6CZtSBb6m/fXbL/H4FJqEJYr3TztwtHrKEGjjxDEie
X-Received: by 10.52.35.41 with SMTP id e9mr219378vdj.79.1386933292929; Fri,
	13 Dec 2013 03:14:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 13 Dec 2013 03:14:32 -0800 (PST)
In-Reply-To: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>
References: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Dec 2013 11:14:32 +0000
Message-ID: <CAJTo0LbvjK-4j5dDzZuMk=osskjktH8doWfOERpo6BsRsC8m+g@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-systemd] connman: follow oe-core to 1.20
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
X-List-Received-Date: Fri, 13 Dec 2013 11:14:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 December 2013 10:45, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../connman/{connman_1.19.bbappend =3D> connman_1.20.bbappend}          =
    | 0

For trivial appends like this you might want to start using bitbake's
support for wildcards in bbappends.

http://cgit.openembedded.org/bitbake/commit/?id=3D31bc9af9cd56e7b3189248699=
70e850993fafc5f

Ross

