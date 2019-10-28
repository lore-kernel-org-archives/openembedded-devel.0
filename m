Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5927F98E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:58:07 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l15so8054178qtr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eBvBiw7dNSPbwEHbFy9lg2V2TkNyjVANyNsK7DFb/6A=;
	b=PgJiK31VZ0vINLMhCAuV+VL74pqUC1H9gm1Mcnn96lsIYThhtc7kR1DL0gXDxPmIXS
	MgaXH4xV+pHrJxauSDbLz+3aQfl5f+1Q6zbCp+Hwv6oaWDuCSsct7p/nER+Pt2jP7JHj
	/fbPTcOxqsQ6gENDQWndaZhtvXz2KX4nXAiQEIRnzY5ndzejzmVdAoCDep13YFaIUXwr
	FxASg2cVaj6eZTV8/ArLU74Vg93cfma9OBPWugR5Z/6yPPYcjxB4Qmw6BmYPeaotkkN5
	ep+Zw5+HjRfvQ1C+g5MBTwLdv4JSZ3Lt/+nZSgpcIujA3QJMFCqgO2NHKVc/JXKRR+GK
	SJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eBvBiw7dNSPbwEHbFy9lg2V2TkNyjVANyNsK7DFb/6A=;
	b=H6YLXr7RBBXEyTNDFPoa4itbhtIHJc/bwXZ15iLutCWr6ZVLIW/hce0yjm1VtPpy/f
	j3wNB/95YU7LTSlc5e0rA4uVT2IBbCjGVe1+7M4jjnDUhn/wpidmicbzLl9EO5Y3HL/8
	VrnHTyQ6S/X3pwrqKOj/ZF6E86+F8njvCI1A3/WM2rvHxiIwa9ZwzkUHFkAVBFW+tIe9
	7PXAglbeDZGRctrJCxDiwC0axfEypuJaF0cE5xXTBKQqrhjLFUVFPxDlvmU+88wHhZ5g
	8jFxLL3WNHDafPUxuFOCo4AowduoFIraYyKRCN+Rst+yg+d27PmApxoHlWAkTOtzfbnT
	SoZw==
X-Gm-Message-State: APjAAAWHTiMvIch8RRv4auRwN3sdxPD+ZASBJ34HcA4e3XFpjVtqo6DK
	EuHKo/wwCX2la99AqSv4rs91rl6LsDPE/6DIhxw=
X-Google-Smtp-Source: APXvYqxZbQaJwAf/iinvbQ6bNN8vorCg6Xl43G1NNBP4G5vl6V7mF1GPrq2xZByQViCm1uY6pke5nhwcnbRaO2tOyts=
X-Received: by 2002:ac8:6054:: with SMTP id k20mr7014766qtm.88.1572271087882; 
	Mon, 28 Oct 2019 06:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <595fa4eb0a404956aae3fa9a7a25ba12@gomspace.com>
In-Reply-To: <595fa4eb0a404956aae3fa9a7a25ba12@gomspace.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 14:57:56 +0100
Message-ID: <CAMKF1sqUw6fbN=096+ed29=iLW+7y+0YnqBVeEG_Qy3AoT1fqQ@mail.gmail.com>
To: Martin Siegumfeldt <mns@gomspace.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Libiio Python Bindings
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
X-List-Received-Date: Mon, 28 Oct 2019 13:58:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 28, 2019 at 1:33 PM Martin Siegumfeldt <mns@gomspace.com> wrote:

> Hi,
>
> I noticed that since
> http://lists.openembedded.org/pipermail/openembedded-devel/2019-October/202502.html
> was merged, libiio started depending on 'python3-core', even without any
> dependencies defined towards libiio-python3.
>
> We use
>
> RDEPENDS_${PN} += "libiio"
>
> for describing the (native library) dependency (i.e. without bindings), and
>
> RDEPENDS_${PN} += "libiio-${PYTHON_PN}"
>
> for a dependency including the bindings - isn't this valid?
>
> I assume, that a pure native library dependency (i.e. without python
> bindings) should not introduce any python core functionality?


I am happy to take a patch to make it a packageconfig and keep it off by
default

>
>
> Thanks,
> Martin Siegumfeldt
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

