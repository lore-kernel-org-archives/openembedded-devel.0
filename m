Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0F7E7F8A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:00:04 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id q19so2793478qvs.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1U5t5PZrMEwGcOJeuhqBCDqXY0pdq+vLgPwCzAf+Z7s=;
	b=gYIczE2kOAlb7ya7kT873evRKlFjsK4UbsNKYupt/+b9Nv8Zld29TcRHDH+dZ4kWGF
	fACF1gWRzjyfY3E+uypfQqAVqDZCjjbNCKp3l7oAOn+5I8MnQINJ37kU3as/n9Ouf0Z2
	jXBHtZtaM8BmCKdfx/Js4VlBV+IrdrDAwoIo1k0F7BPBm2uC2B8eXeQINH/fSJUct1mx
	2ZJ1DXH+Nu9a2kvamCQ7tIxvuxF2Dyfh+k7pUvHm6ZMWWZYaOm6d8RQC0VpnmHQmL2He
	esBzYykE9+RPTQ1cLat4HxGdEtyC9HcZ32ZGkZhchsa1LhywC2nGjoAVN3KGKv26ARqL
	CLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1U5t5PZrMEwGcOJeuhqBCDqXY0pdq+vLgPwCzAf+Z7s=;
	b=R6N5cRkpklSHUW4eadCxolFNhVPrric9MnCzWj1T9fMYvqLsQxZj4vmXq84gSGSaSW
	xiwEER+nAzwzOiL6Nhu/Uduqkd8q3Y4moX2kDkLQw42FS4YN773aNfVJ4iHAVOyhy2sq
	R1E94DB+FpJ+1sYQYpUd2pdxxH+jP42+TRJP+097MSZpyCDYJuzNSSQebFtmtce7+9gp
	iLkpAe2Hu73PW5sCg4Mt7YQQz1cVG7Bxat1OmlRhDHHaqpSRg8vmbZ9Dye0T4emDLa9k
	PsxaEV3QL4h9K3uLi/5EEw1+ocCZFANpoH6MQ2ewMNXr1H7qjH8XmxIaTU0Jo3ZVG+PP
	9K/A==
X-Gm-Message-State: APjAAAXPeb0NHgMvDw2sSGMxp0GZap47MLk6NEaMBuNlysgoeiLbj4Vy
	LBpf0HEzc3YCrTHjeNzvlXYCtM1TnuOkqwcY0C4=
X-Google-Smtp-Source: APXvYqwH/p0pjb1kLaELc9YPh453HFLoCze8V8Cv1U2u470bHmXOg5rnmfGh50NKDGnqMCTgaQHSohOE+7tgLOhEv4c=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr9628532qvy.109.1573758005285; 
	Thu, 14 Nov 2019 11:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20191114142641.17385-1-nick83ola@gmail.com>
In-Reply-To: <20191114142641.17385-1-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 10:59:38 -0800
Message-ID: <CAMKF1spCmkONVx3TRKEU9hKXjbkN7w51K0T69h67OWuHRPLhSQ@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-dbus-next: fix recipe position
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
X-List-Received-Date: Thu, 14 Nov 2019 19:00:05 -0000
Content-Type: text/plain; charset="UTF-8"

Now that its building, its failing see
http://errors.yoctoproject.org/Errors/Details/275777/

perhaps its needing

PYPI_PACKAGE = "dbus_next"

On Thu, Nov 14, 2019 at 6:27 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> the previous patch:
>  903bfb78a0 python3-dbus-next: first commit of dbus-next 0.1.2
>
> was put in the wrong folder. This fixed that.
> ---
>  .../python/{python3-dbus-next => }/python3-dbus-next_0.1.2.bb     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-dbus-next => }/python3-dbus-next_0.1.2.bb (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

