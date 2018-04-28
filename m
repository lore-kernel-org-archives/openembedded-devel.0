Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB1E605BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2018 20:04:05 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id p6so3901744pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2018 13:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aPRzJ/aVxLukzr48AZSz13wiHo+rv9Rin+5w6hJaZf4=;
	b=ln+t7qreJrTZu3QvtoPhN+Zm55Z6uw7vZMeMxAah8em5FpcE0I6MYeFCobdKj981Nj
	DFFpGdhIh85KWFsTr5I76fywQXIfOzIckMz+6rvPmtmWWXP2OjWv4ceUTa2P6hy+eBRJ
	/+lTZf6Ll2+h5SwqwIqzcILXbh7cE0Me1LDsNsARoFFyijn0/E9FpKtjaFm6H/fo8XKy
	+O0RFF0Jg+Bb7hJRZsPJjUU2CBxPG+SMBgCugvoC+iNblbU7LnwypNqT9iab5rSZSG3g
	1+ROHoh+NTxMyOb2P+ZBqPVvyw6/Fw70jlc/mw+vepNH2Fww/HuXQcsHAOmnhd01SzhX
	BSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aPRzJ/aVxLukzr48AZSz13wiHo+rv9Rin+5w6hJaZf4=;
	b=lKic7XwlfcwOIFSww9oGnFTGP7ImNI+mZd3oTcsiZKFBMI5Ui4mZkZXKsX0DIhcGck
	nHXuaPcEb8UeasZgP1J9ZfQFX0Z5tJcVHPoc3j5eatm39MeVH+jl0wKSlvUDkgKL/r6/
	mORd+A0lWv36/EsTqvWs90zjyR77t++ZP2LktLQUUY9XtiV4CFngYuVGKVJu+lTmqpZU
	3/3blg/K/GAsfQ62hbjgBMbdWixd/JYg59aXxMKN5AEqCGNo9QvZQU7K0Ie17V1a6xwg
	q0cWE3g8go0ejJ7971/ip7WRkCeWHDDySTvYzR8b4jgV7AxE/1bEduGdrFWImZFGszX6
	hvqw==
X-Gm-Message-State: ALQs6tD10k+NS8d+gX3ius5lmgnWIkyx1YoyS6kyC59y0cS4A3ncnxM2
	TsywMsqlFMvp1jbeZibrWGtn5jrumblg0NP9FMM=
X-Google-Smtp-Source: AB8JxZqf+j+zgcS/CvM5BuJ/Y/QHC+TaFxcpg71o6GUqD/qpzLmrqymUTBuUrYeq6ky8Cah2cJ+2lwYvC8W4X3ypDC4=
X-Received: by 2002:a65:4b4a:: with SMTP id
	k10-v6mr6048946pgt.227.1524945845986; 
	Sat, 28 Apr 2018 13:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAC+thW3RAbh6_2b8_Lzqx-UnE8xzFsW=1z0E9C1KXBukD02ecg@mail.gmail.com>
In-Reply-To: <CAC+thW3RAbh6_2b8_Lzqx-UnE8xzFsW=1z0E9C1KXBukD02ecg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2018 20:03:55 +0000
Message-ID: <CAMKF1spLgyayuJG0LMoEbWNw9=D2zmXE0aiK8p2n-iwV5sxBUg@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] README: contradictory indications?
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
X-List-Received-Date: Sat, 28 Apr 2018 20:04:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 26, 2018 at 12:10 AM Andrea Galbusera <gizero@gmail.com> wrote:

> Hi,
>
> I see that README in meta-python contains conflicting information
> about layer's dependencies. The introductory paragraph states that
> "modules in this layer need to be independent of openembedded-core and
> meta-openembedded/meta-oe", then a few lines below both of these
> layers are listed within meta-python's dependencies.
>
> To me, looks like the sentence in the introduction does not hold true
> and can be removed. If you can help clarify what the correct
> information is, I can send a patch to fix the documentation bits.


Usually it shoudl be just core layer

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

