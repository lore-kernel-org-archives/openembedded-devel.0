Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id C743171F05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 11:15:09 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q200so3753079ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=e7E/qwrfYlbP+2VJSuAV1ZDL/K+NU3RwhpbtZvB69KM=;
	b=e+FgoBcElrauCt/FyuKXVPVA61o2dbjkVVZvcNUdtaZdN/XWlsUwkyFbbiT70/KD24
	Js5AjEK7XTvBvh320GRaILCGLr8PLml/F7H4mBW1oT9jHXu5XfC1FnF/Wyr/EhSU1gKf
	YWipmOWS7Z3sgdM1TL7GNLpOpOFgTxdTv+e4VCBiIhRW7a5boqn6GHuiUSwIS4D4uoGh
	LC/UVT6qLZcOeR5ExSOyNmAeAB1+zf7x7ot8nUj1uI57QaF4OdAQUb+GU4FV6K+M5LtT
	NOjCGqr0xwdG0O2Cg+TfrxnWRg4P9EvVze8McNO3vUztGKs2t3yvn/ImdxrGVdrTb/dG
	6MYA==
MIME-Version: 1.0
X-Received: by 10.236.36.65 with SMTP id v41mr2401584yha.102.1424344510563;
	Thu, 19 Feb 2015 03:15:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Thu, 19 Feb 2015 03:15:10 -0800 (PST)
In-Reply-To: <1424287616-637-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1424287616-637-1-git-send-email-alexandre.belloni@free-electrons.com>
Date: Thu, 19 Feb 2015 09:15:10 -0200
X-Google-Sender-Auth: XM2Q75tyFI9dslsjY4stZaIM2Rk
Message-ID: <CAP9ODKpeDCspPy_e51KHKbnG_rqq4BgyYc43piN+3wfcnLD3VQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][dizzy][PATCH 1/2] qmake5: add a qmake5_internal
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
X-List-Received-Date: Thu, 19 Feb 2015 11:15:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 18, 2015 at 5:26 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Add a qmake5_internal class to be used when configuring and compiling qt
> itself.
> It simply remove the -r parameter from the qmake command line. This is
> necessary to avoid those errors when building qtdeclarative or qt3d
> without opengl for example:
> Project ERROR: Unknown module(s) in QT: quick-private
> or
> Project ERROR: Unknown module(s) in QT: quick
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

I use prefer we use a:

USE_RECURSIVE = "0"

Flag or similar to control it and avoid to duplicate the class. Does
it makes sense? Also this patches should target master branch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

