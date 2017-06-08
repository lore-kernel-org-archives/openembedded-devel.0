Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3E97825C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 17:45:28 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id x70so82174382wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 10:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jpSn/Ar95gOF5ZxUUA1bQ+vq/IotOHRRqgyUHkaHNKI=;
	b=ZGMcsxryr03DoQYXoABkrjT3lNiEkmqqPqYq3rS29eJ/nQPKLdE4Y1iCPDORkQm1AX
	lSg18JLT8x4G9Pzo8tMOzaVbRSMjbnyFqRjemH8U67dRyOG1doCSCiqKXSg4f5jNJaQu
	6RdlcMHvnQDUGNBgQvHVaeCx+q/VOXKzqDK9elfCNjem3DypX2iqwkr3iqGGtDQyp1Nn
	uqnHpBATW5pDHON00tn7Xq6gwW/PWE/IhVotLTRmyec8E8srw7I//JcoGjkfLsKBUM6M
	gbA5mr8ZxDvHsoEsakkAqWf8kHV8F8+OG2JSc/pPa7ETBnlbj0VhDBxdJnCe6vAMKE9G
	lY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jpSn/Ar95gOF5ZxUUA1bQ+vq/IotOHRRqgyUHkaHNKI=;
	b=Zkpxoy9oBoDGVQtNRm9sSnhJxnMVLDAdi0z0q3aj9I72vRQ+nMFtRWrEpSPrvvo0W1
	Coelza64PVJbw1U6i6mgdhOb2zKcmp6sPcd//hXHGFSi8WRbBAOd4qfKHwMPqztVaNEQ
	6gdpyBftysvXZmN/sMbP3y74TKbt3reiBI5XHeoUnVTb7Nc4hS7oAjBwsePNhVUaoJ99
	Krq5AvuVz1d5MpIZV0mJI7u9XvIYrJHidUG0kB4Lck4rqUJ7LcByrfNGfa+/zvd8IX3F
	EQtVvmZLxXZ/HDGcQ6j9ndQxfvrkY/YxF0A71EvRLOOJvsR1L2WK2EIu1gNPG9+3gce/
	K5Bg==
X-Gm-Message-State: AODbwcAy9tzREUHqf9W88tcILTf0Roi/NAYb2AyY+PFhIFiZXHwUY5dV
	H10a75JLVj4EdgJAJJlaYS+VvFb1QA==
X-Received: by 10.80.182.35 with SMTP id b32mr30827277ede.123.1496943929955;
	Thu, 08 Jun 2017 10:45:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Thu, 8 Jun 2017 10:44:59 -0700 (PDT)
In-Reply-To: <20170608173414.29852-2-acfoltzer@galois.com>
References: <a96952a133614ffc9779d8a7ce912f8e@XBOX02.axis.com>
	<20170608173414.29852-1-acfoltzer@galois.com>
	<20170608173414.29852-2-acfoltzer@galois.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jun 2017 10:44:59 -0700
Message-ID: <CAMKF1spMa3eYd92zWOB_ktdwMCqUvgy+odVYzNY3K4kHDnoBJQ@mail.gmail.com>
To: "Adam C. Foltzer" <acfoltzer@galois.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meson: add LDFLAGS to bbclass C/C++ link arguments
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
X-List-Received-Date: Thu, 08 Jun 2017 17:45:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 8, 2017 at 10:34 AM, Adam C. Foltzer <acfoltzer@galois.com> wrote:
> -cpu = '${TARGET_ARCH}'
> +cpu = '${TUNE_PKGARCH}'

what is this change for ?

