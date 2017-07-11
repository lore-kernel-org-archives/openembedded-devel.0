Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id DA7D2606B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:03:00 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m84so10596098ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mzwh8hfCMW4vx2HYSa1hb/ZfHClKjSR4G3YHiDaPVdA=;
	b=aVddm1+q7JwFywlHADtGQkTkiZeHy8JfFrqvAQRlGMDKEQMMxecBI62TPb01PB5YKr
	TpnYgMWf9zp5E0wJ9sqKlHDx3cPBl5oRtM/e8g3xJxinB7Ko/1A0jcihP2eUFsE4A06Q
	exnOEcwqN5iuH0CrzKDEN95B7eoD8usxTHga/n/NfnBJWoNWI5fsCNsLzThpgTmMUVky
	n7IQACjw4U8sU7KmtsaRtG985Y1ns6IXbqt3rY8H3AP/6VOR14hLLRe+yj4ooMw3/wrK
	bsvMtFwZmvhYcgUds4i9d17Gh5Dio7vekFlQACJQwl2p3A6T9RNLXxW/RxGofvhaMRNy
	S2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mzwh8hfCMW4vx2HYSa1hb/ZfHClKjSR4G3YHiDaPVdA=;
	b=UZgPA7IjUXwsO8FdsGgQPaOt+9RpyVKZo4nwvxukqjME+weH+dLEt2tNWiVWdoNwNS
	UqTSDIyB3Mij9OJBgApmGvdR751Oknm6y/6oWlVrEHNUKC0Kq8smr4iqFV4MPer9vCq1
	3S6S3I2BE3z/1Zllaetg0kuHu0D7chWlkLmbq3k3vBOx+ObZ2b0ZWmZrCWQzqlVnZRyq
	lHjYEzzDyyoEQ2lzhU1TGLavLMuDdUx6BnzPZ8cfFomXg8GPYRs0+/1QmbPuEARh3hHC
	9FgoQvIVDjqS4OA1zHLFEtlsl6SpWfq/RIf4JlTf4hLgNLV+Edav2fWvmFoI4ew36FKY
	FMIw==
X-Gm-Message-State: AIVw110ILrDtBhxUpaz1tDjms6VvbvQzqMA0m6/T4JAvHJV/PNIOgRHP
	pHMYz24jaaihdfhpgLCv0qxTocZYuv/D
X-Received: by 10.107.37.141 with SMTP id l135mr6883217iol.146.1499756581847; 
	Tue, 11 Jul 2017 00:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 11 Jul 2017 00:02:31 -0700 (PDT)
In-Reply-To: <CAMLuUbUdZKf9N2q5VQ_D3WHyysaxLw_kFU-JcKu6mQtW87kUQQ@mail.gmail.com>
References: <CAMLuUbW8ZL3AcvU2ViMdMb-eyfihmFWFxEcsCMBfeZhm0kTAvg@mail.gmail.com>
	<CAMLuUbX5OBj6Odz-K27CsWVtoQwoBsukpYfNA8bSzS-tzzv_Ag@mail.gmail.com>
	<CAMLuUbXJ9YSf8bd8dQ3PsMZh3yZgf+Co1Q58sGUC551VaD3JkQ@mail.gmail.com>
	<CAMLuUbUGL99KWx9k9JAS4p6eZAcuiNFrfd_KOnHeTnumWesqww@mail.gmail.com>
	<CAMLuUbVA5+3oZf-skxQzTxusVTaRaHbuMH4p-pG-frt581YaYA@mail.gmail.com>
	<CAMLuUbW9G8v+kEQPnPQSQLzSEQJBRhnE97BESr_3WYoJb56HOw@mail.gmail.com>
	<CAMLuUbXQaXVxf5b2idB8ADEFkj7nBjD15+wvpdS5s4n6JroCpA@mail.gmail.com>
	<CAMLuUbV8YtPa25s9v2JSyocAEsL7ZXy2H_GFs6jLRjtGn_6bFQ@mail.gmail.com>
	<CAMLuUbX=eGPsHcSLDdSPNZxZZiQrWb6nE259DxsTv6nBMnTBQg@mail.gmail.com>
	<CAMLuUbUdZKf9N2q5VQ_D3WHyysaxLw_kFU-JcKu6mQtW87kUQQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Jul 2017 10:02:31 +0300
Message-ID: <CAHiDW_FX1X5MPKHuu-TFO43pb_TA062dvRaOSYiE8C5-KYx_jw@mail.gmail.com>
To: Brownson Obele <brownson4u@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] python-pygobject is not building and installing gi (gi.repository etc) modules on the target
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
X-List-Received-Date: Tue, 11 Jul 2017 07:03:02 -0000
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 00:49, Brownson Obele <brownson4u@gmail.com> wrote:

>    1. The main python module i am trying to add to my yocto build image is
>    LDTP (https://github.com/ldtp/ldtp2). Using devtool, i have been able
> to
>    create a recipe for it which seems to build without any errors. It is
> only
>    when i try to run ldtp on the target that i see that certain
> dependencies
>    are missing.
>    2. So i am currently stuck at creating recipes for the dependencies.
>    3. Right now, below is where i am stuck
>       1. When i run ldtp, it trys to do an import from gi.repository XXX
>       and then complains that there is no module called "*gi.repository*"
> but
>       I have a recipe python-pygobject_2.28.3.bb which i expect to build
>       and then install (create) the gi folder and its contents on the
> target.
>       Somehow this is not happenning and i'm stuck trying to find out why.
>

That version number sounds _very_ old.

Which oe-core / meta-openembedded release are you on? Proper
gobject-introspection support was added into oe-core early 2016, I think
Krogoth was the first release where it really works (but please read the
release notes, it's been a while).

Jussi

