Return-Path: <ryanelkholy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 512CC6011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 18:46:50 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id bi2so21155044igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc;
	bh=aLDUVqSfU0bNo80xlq4po9/tHLFzj2k8Lf5HRljNdgM=;
	b=ZeYw/O5vQdq7eygPGAcxC/VAO70hsf+c/2CfYT7vHlMr1iqPczW7I1i9u/roEd3yhM
	VLXeWKcMrNn0ep/JsSeEAW3Ocsr6TZy4rshInzyWjPi0JOQBqtEaKd+6uwL7FRG2KD9V
	/E94bUbBw+/DEu9hYR7BPbLI3uRW5vDQ/tJhQIXM7+JONhX+rBJkoiV1A9GmthRltLP+
	tCb/CR6gv9C6WwEN0u7ZRMf73FA5pUBErd7lXM6QWsnAbrpVpQh+LZwKUS1Z59xxBA7A
	wqew3sPuHOuYOdJiCz2vCadjfBsyRxxOtU+uGW5kGkDT9aO7kCIRPBWthYGaL7lqEhBN
	CBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
	bh=aLDUVqSfU0bNo80xlq4po9/tHLFzj2k8Lf5HRljNdgM=;
	b=c4Dt/hxPtlAyc3t9ZLjezjgdjW9Rr/Wjpp2p55RrM3SzR/+Rzgtsz5jo8Xij/jWEgW
	dnPL6NEjoE/2ESE/pAOamxpL9HKlM6yacoXSMNEizCRkoIru59DIMiWzvAcL9YJDWoLF
	9Kk2Qh5xN8G2/GiZgJZeC8h3in1Nj/2BzLwH9i/F+uMzUAt4IB8uC8pf0V1n5PU3qGCc
	QptBJr86yEM+CrxT2x8yey4BVyen/Cr9QOHS3PaIuovmf+xKSDuhip89UC2I+fllzGH7
	CmRGWCW1lirFkOJLipc+WngeTZByt6zXE9BzDCHsuuGfvjpyTVsqFeMf9yTywTOx8bXE
	4nLQ==
X-Gm-Message-State: AOPr4FXHa8asc+TBweD7ljP1z4WRz2GeZf54pNK/K6YjDulH2DSFDS2L517zyqCAKEUL2Pcc1D9V3emT/dZoeg==
MIME-Version: 1.0
X-Received: by 10.50.78.73 with SMTP id z9mr3943050igw.42.1461350811357; Fri,
	22 Apr 2016 11:46:51 -0700 (PDT)
Received: by 10.64.78.105 with HTTP; Fri, 22 Apr 2016 11:46:51 -0700 (PDT)
Date: Fri, 22 Apr 2016 14:46:51 -0400
Message-ID: <CAMZfsd4zjgsco_JCiPF3YZ=taz0gO-JS6OR6eErrmnEBCSuk8w@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: sgw@linux.intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-intel] libva dependency on x11
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
X-List-Received-Date: Fri, 22 Apr 2016 18:46:52 -0000
Content-Type: text/plain; charset=UTF-8

Regarding meta-intel, I would like to know if what I found is a bug or if I
am misunderstanding it. I see that in libva there is this dependency:
RDEPENDS_${PN}-egl =+ "${PN}-x11"

Does this mean that even if x11 is not used there is still an x11 dependecy
on libva-egl?

The reason I ask is because I cannot build my non x11 package because it
says libva depends on libva-x11

Thanks ahead of time!

