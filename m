Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id E566E6B43D
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 15:56:57 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id j13so41158496ioe.0
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 07:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=/ol64VndBlgTbIDRe4lnFozMOoWIttrLPlHxvtEzGQk=;
	b=sZw/Dsi7qQW55BaZUTr5WlPhQhABoYCLIC7gXw0frsVf7ArvWt69lF0nS7yFHILuYF
	TNioBk5VOqfHxGlJug5zPvRsCpaDZ/RAudqcXc4DDZ0/MSRhoyoJZAujvEA6repCScpi
	h3Gi1S4lc8RtCvt7wG9DPVLw/w6dhFnK5bY3E08pvkh5W2IXGcxRLCPLt3XS/axqq/xn
	0jdc/LJ19P/9yszCBDpkVclzySe26cIf4F2eGrUovgesnMrnWvmADkwhO+ipQJt/UTzR
	+bOP+iNeEYEz5mWyZcypr4+BKzvsG4ZhOfNdu54fSnAlQAtvCFZ+FvTHNGfqx1rrhQsq
	mKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/ol64VndBlgTbIDRe4lnFozMOoWIttrLPlHxvtEzGQk=;
	b=YM+85f89NcFSMaMpLydmPZrmy+JV8JU1CJ5bvWeKIuJ4yHDoIA5g0uqaCX17eURW9u
	oTEdl9zFzMluKUiWFT3TZhqQ/SQmzOG9lZA/ewu68msouyhFcZruN6u6GzL5j2j8e518
	k5Kh5tfwSjyfJdwGiSMTF91aykTdnMqWSaXV/EwAZdnI6gcyi90dvbLfsE9TGcJn7GAK
	lcNGxjE/cQzH7ASW1rBSknDIVXTDlsrGRrtHbcTNmPsrxE7afzAtZENT3IAV9PLPPYzz
	GkZ0V1IFoha+rDBcBOReRNCpQmya3tCRDEJFTBW1wWIsmmamurnam14jnw2PvsHCihB3
	y4/Q==
X-Gm-Message-State: APjAAAXk/okMCYWUr/iOtqgfJuC9mITSDjjNx+IVCi2uWU5lAcDrBwa+
	M9kz6wHCMaMYp7vQJhY5X0FiL3mcSQu6QT8s8UNYEuTaJok=
X-Google-Smtp-Source: APXvYqy1CqVqsuB8UhE/6xoM8t0WeYJHzOIx+IjmoNNIhU3TTV43MDj4OjVY3KLSoiKqA6gqAnRWN6VED7nJXfIqfiM=
X-Received: by 2002:a6b:3c0e:: with SMTP id k14mr2239098iob.198.1575302218499; 
	Mon, 02 Dec 2019 07:56:58 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 2 Dec 2019 07:56:47 -0800
Message-ID: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: ANNOUNCEMENT: meta-python2 has been created
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
X-List-Received-Date: Mon, 02 Dec 2019 15:56:58 -0000
Content-Type: text/plain; charset="UTF-8"

Why?
====
With the pending EOL (end-of-life) of Python 2 in a month [1], it is time
to move python2 recipes to a new home. For that reason, meta-python2 [2]
has been created as the home for legacy python2 recipes.

How?
====
It was a design goal to keep the original history of meta-python, but only
the python2 parts. In order to accomplish this git-filter-repo was used
[3]. The exact steps used can be seen in a gist [4]. After that script was
run, manual merging of *.inc and *.bb files was performed to make recipe
maintenance with AUH (auto upgrade helper) and devtool easier. Since this
layer does not have to support two python versions, the reason for the *.bb
and *.inc split has been eliminated. Commits that upgraded recipes to
python2-incompatible versions were reverted. Changes to make the recipes
build and ptests be runnable were also made (to master branch). The stable
branches were also kept, to make it easier to refer back to prior history
and allow developers to use meta-python2 only in their workflow. NOTE: The
stable branches may require work to make them usable, this was outside the
scope of the immediate effort.

What next?
=========
Python2 recipes from meta-python will be dropped via patches sent to the
mailing list. Python2 recipes from meta-oe and meta-networking, which have
already been added to meta-python2, will be dropped via patches to the
mailing list. Other layers are welcome to do the same.

Recipe upgrades to meta-python2 will also be coming, for instance Django
1.11.x LTS is the last version to support Python 2, but we are not at the
latest release of that series.

The original meta-python will become Python3-only and patches for python2
support will be nacked and redirected to meta-python2.

python2 itself will likely be moved from oe-core into meta-python2

[1] https://www.python.org/doc/sunset-python-2/
[2] https://git.openembedded.org/meta-python2/
[3] https://github.com/newren/git-filter-repo
[4] https://gist.github.com/moto-timo/ab70ab96ddbaf5fd1226bd21dbbfec9b

