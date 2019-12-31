Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id D339D7EC64
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:02:29 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j5so32068128qtq.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b+Qo054VwSASjhpwCQbvp2Lp15UAk2UmcBCqfAp0Rpo=;
	b=e+c06yQmIzxIgcVm6NcZQJI5rXxjMCfeLSzNPSZy5DzHIy1x2tYRzokFXdazhZRBIp
	cA10djU3qncmOp0Rmuku+UmiRqu2MhaGrJSRnKr1q8Kl06a6JRZ57096mGcsa0SPbi90
	9D3NP8xIXgzcDgBOO3W2VoXlEi6qpVXXRaWJu0hrLiTeyqnyQsfbDJe29OEakmY6r76A
	JPTBBEeh1rR4S2oKX0YtcNEWplBSWZosw5h95oxSrJr9D9ECoRHeRquFXnyGaW9oyskn
	CGW+uhhqaW9TSqwgJoa45HAza/TxOy8XGDDhUl+BqODD9muaX+O2UDn6VehvZeoeJxpc
	yavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b+Qo054VwSASjhpwCQbvp2Lp15UAk2UmcBCqfAp0Rpo=;
	b=VR2iT5AJaKl7UFMO0NiDCbVjMltz+W4uyjiUBaqNNE4oUQuhmss9wZ5ge2OgAgBN7m
	5LFM06Tx2XW4loddSNaRU3NIctzH2b4Tnuk1soYVuOLh3pI9lnlhuHMcaMyKe6zptX/H
	CCv26Qs7iln2YnvFclw3VDEjJRUkNVAJ3WT/C24zfVOmpfh+R2scKU18aZt972KMQY2Q
	SzOgUFiYmWeanr9E4mchjWVqf4ZBOXsOewuxegKbPwk8ALky/+ME6PpmaJGqgkaZGFKF
	Ec7blJDddYgKMVEGytaMJ9G/aXwIYVsDXGKCd2ZrN9HWcwNBYEYWZdX0gs/uJDaqZgqe
	7VLw==
X-Gm-Message-State: APjAAAV2y28Z9dIFdUM1Yrya3wUSSd6ybVzm+9zaRaw0hbtUG++3mJom
	rX63WjbBpl9RI6fbrIHg2crGsDsV2F7JYbtx0dMcAR0XGIA=
X-Google-Smtp-Source: APXvYqzJ5gX5KNsZVMI3zUYN8+ABRnq1D2RyWwWhzwjZNmekOzHtB+RWyLPFOwxTeiKQgnMcM5El9hSrJVQ0bpUMOUY=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr54174345qtq.53.1577818950386; 
	Tue, 31 Dec 2019 11:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20191231010652.3206534-1-raj.khem@gmail.com>
	<20191231092444.GD934@localhost>
In-Reply-To: <20191231092444.GD934@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Dec 2019 11:02:07 -0800
Message-ID: <CAMKF1spurUq6kzjEPWA+Q2wS3KLfDbSTqKOFkT4+cmf2t9gyTA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/8] glfw: Update to latest
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
X-List-Received-Date: Tue, 31 Dec 2019 19:02:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 31, 2019 at 1:24 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Dec 30, 2019 at 05:06:46PM -0800, Khem Raj wrote:
> >...
> > FPIC in static archives is needed for arches like aarch64
>
> This is not true.

I should have said shared objects see
http://errors.yoctoproject.org/Errors/Details/301233/

>
> What is the problem you were trying to fix?
>
> >...
> > +PV .= "git${SRCPV}"
> >...
>
> This should be +git${SRCPV}
>
> cu
> Adrian

