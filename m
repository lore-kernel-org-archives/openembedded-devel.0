Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 79E396FF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:46:29 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id q132so75359935lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=edul2VkM5sqj+NtOkiFCx42XRK9dnQxeOTV2K83/7U8=;
	b=GuGzIVn9Dcq6BGWatKGIN129m71cgK4cJVUw1CLLBya73klxKnRisMpoArsuge8l7X
	km2JT9O7kGzjK+4PsZDjvfaYVIxB1m4jBVUb0dcpvEMPRHcl3cTGuLhLOlwRna5eyc+Q
	y96eEE5K9CEE1154L2tKJK7N+9BaTFNbg32p2vKcPSvoclLAtNJyKUtLdFaaSnQQTkaP
	6jrCdajC7cDU8rrrn0ywmRdZUpUMxRNV3C5gsEkS1hokWC6N/6MCbAHiooaA7LqEROY7
	LEhVx1oFcFZ1HBLjyTd1PuYmzA4dG5Av2HflrQMzR30PbkhJiw+6vb4roWU7PsI7OgG1
	nqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=edul2VkM5sqj+NtOkiFCx42XRK9dnQxeOTV2K83/7U8=;
	b=cc9VEu8o9x8LicPYdGo5cl/Tqxae0Tttz7z5De4k3nCp+fSv6ZAacB9T4DvHqOMXHD
	KonBXq4b05zbGlHTQFwr67D4PNW5Sd9cBhM3iSha4nVwKjgRLB/q27LK+HtUzkgoRWcM
	fsR5iau/B0CWxIWeTxUfkGqk36lUI64R64XGhiSoyHkNZc40tIwfaPe9QoQxJ13YdUBN
	GGBd/3VvVlVvTSji9YEenXmmpgMZvDbyWIVxS2IeID8ssTItUS4+gKRMXzMMUf1qIiF6
	+vkjn4sGoT8hcg4RQjdiViwzhMkEKJ9jC0LhHTyn110+1T75uKcKuMgnqB6FUuEGb+bM
	mJCQ==
X-Gm-Message-State: ALyK8tLtfSKqhcx9tNXshfTkL2J6+KAIr9Lpf6AnWA3lY23Cjn1hx7gp5703cqBiDpJaT77PoOD22zQxk6nujQ==
X-Received: by 10.25.147.200 with SMTP id v191mr6934430lfd.9.1468248389780;
	Mon, 11 Jul 2016 07:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Mon, 11 Jul 2016 07:46:00 -0700 (PDT)
X-Originating-IP: [177.100.227.79]
In-Reply-To: <CAMKF1soG_dmoqDtjGqM+=trw9OLfJs54m6Z85N+A-8QVEHmAgg@mail.gmail.com>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
	<CAMKF1soG_dmoqDtjGqM+=trw9OLfJs54m6Z85N+A-8QVEHmAgg@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 11 Jul 2016 11:46:00 -0300
Message-ID: <CAAPZna2W0ScPrJYMgWkA9-QEwtVJjeJTbLmT6FTDGWKo5STnZA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH] openjdk-8: make GCC6 happy
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
X-List-Received-Date: Mon, 11 Jul 2016 14:46:31 -0000
Content-Type: text/plain; charset=UTF-8

Hi Patrick,
I tested your solution and works fine. Can you send this as a patch to list?

Thanks,

Fabio.

