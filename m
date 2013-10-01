Return-Path: <ross.burton@intel.com>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 28A0B6CA93
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 12:35:12 +0000 (UTC)
Received: by mail-qe0-f47.google.com with SMTP id b4so4856229qen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 05:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cDVShpv1/EsCMgm7SmgjQrVMrPHGPvQDWqE4TqmsM6s=;
	b=c3Vd9tzbyvopLUVO3hf8VyMpMYNra64q6+DuEiDytM+vc8tSUrc42Z9QwOBK01YRUu
	TpSEHxqrRWY6DkYxjnwnQTq+uKI+sO4xXjVpqMOoaIOvi96esYGCbx9uMs8pO5j8LBqg
	QDW1s06wVgMV1EGM/uHjsclFqLILnTwcwl3HrHirm/sC2O4J7LEp2MRrJ0jiGrV5zwOm
	SF0MeTWXFxQxWUoI8S92im5u/PAqYXlc4fGj40bMXZCQg7hYguPOnHePgC2r/lguNO5q
	Z3Y4i/ch1CGRhINbnxg+iRnqDh6MLrD0j65UzyNltAs8R0k62DbN9htF6Cz8h422BtBl
	S3Dg==
X-Gm-Message-State: ALoCoQmpUcqqHt0na8hDZnRZ9VszKNt9eFO5TE1E/5QEtnAcEG0mCIqwPIjPPW7V5BnJz9oZKxKJ
X-Received: by 10.224.11.133 with SMTP id t5mr20840814qat.34.1380630913754;
	Tue, 01 Oct 2013 05:35:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.25.131 with HTTP; Tue, 1 Oct 2013 05:34:53 -0700 (PDT)
In-Reply-To: <CAKS01o=pE_6PiWyk=Xct8ias3xFQ+X2CtLufLGsNeAXgj_wTkg@mail.gmail.com>
References: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
	<00d001cebe98$360affc0$a220ff40$@oss.bmw-carit.de>
	<CAJTo0Lb7+Kdzg-M6N=j0rb0CRAXZ1OWbCrxAkzNXGafWK9Fc+A@mail.gmail.com>
	<CAKS01o=pE_6PiWyk=Xct8ias3xFQ+X2CtLufLGsNeAXgj_wTkg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Oct 2013 13:34:53 +0100
Message-ID: <CAJTo0Lbn3fYmzCmvDwdxrVw3CUwzoR5ugU0iQV4gs8YNYyLJHw@mail.gmail.com>
To: Anup Kini <akini@synapticon.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: unable to compile eglibc_2.18
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
X-List-Received-Date: Tue, 01 Oct 2013 12:35:12 -0000
Content-Type: text/plain; charset=UTF-8

On 1 October 2013 12:38, Anup Kini <akini@synapticon.com> wrote:

> Thank you Ross,
> but i already tried that..
>

_append doesn't insert whitespace, so I expect you did "opengl x11".  You
need " opengl x11", with the leading space very important.

(the variable ended in sysvinit, but you turned it into sysvinitopengl,
which is why you got the warning)

Ross

