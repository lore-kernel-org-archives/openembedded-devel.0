Return-Path: <brownson4u@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id CC44077DCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:49:25 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id r103so157016115wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=yuydLI6+UtKebLXsc2pnvCC2VkA7PrtU6rx6ira2+cE=;
	b=P4r7Ns0qmOsJqTGIxnnn2pxR4LDJQrGl/iD1ONE4CTimgMtmPGKwzr4A+BBK5B3LFJ
	45RM1sh2e1pNSFg6QxTiBncnrzIvU+Il5jkCngXnHJNlokVk40yxuzDqsWR6B9jHkwjB
	RcH5o2HtuRjGsiL2UkzF3377pfToRJ1nmkO3qqZrpyIRRhtAuXGAgIag7/4UuA6BAEt8
	o4VV7RijIrrt8IfCJnVKehtrl0zHGvD2xVe0luGQecB48pLY5wQpRBVx9vdvE6ovWJ0c
	r8QesGx/Ap6q1F4r4KP2odDczwoUZUgiV3qRHw4ZFT+pSudW72Q6sE5a3UPMLJvFOmjp
	8mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=yuydLI6+UtKebLXsc2pnvCC2VkA7PrtU6rx6ira2+cE=;
	b=ZzBU2mUil+ZMGFyH2bsqETkTaAP8/ZX1uHWquYJ0OFWc+PwIMzVKfE/PaOvxqUIZ8+
	WEuIh8hf/aYvZVheggNV9JCCrkUeTOBcVY9+wUq3jA8n4uZd2zmoUIL0nQ4LdkmQ2/vN
	ZGMR4NmNwc+mzZ9eBLMQKqHukrfzp01/iQQ2kZ08GLDRe98eFhwiQwD1wf8o1bsbDaKV
	JS6ngyX8wBwKXJR9CIBPlqHYpYyAHDxiwZ0lmgxqS6VjHCXhYUwyt6kfhyoXzQbph9T6
	V/L/TB3tMX81xcn6wfCruI0SUApimklqayohh9zFchG61K4aASqrGYkhUi2pFwdj5Nw7
	MoCA==
X-Gm-Message-State: AIVw110UMc6BxRM8z3awNCQqU3JkyBwv6VZ+3ptZmDtxQUclBMEAgvAA
	51DTH9NF4Emf4JYV0zuA3Bj2rdEAPg==
X-Received: by 10.223.169.51 with SMTP id u48mr7996772wrc.176.1499723366011;
	Mon, 10 Jul 2017 14:49:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.66 with HTTP; Mon, 10 Jul 2017 14:49:25 -0700 (PDT)
Received: by 10.223.173.66 with HTTP; Mon, 10 Jul 2017 14:49:25 -0700 (PDT)
In-Reply-To: <CAMLuUbX=eGPsHcSLDdSPNZxZZiQrWb6nE259DxsTv6nBMnTBQg@mail.gmail.com>
References: <CAMLuUbW8ZL3AcvU2ViMdMb-eyfihmFWFxEcsCMBfeZhm0kTAvg@mail.gmail.com>
	<CAMLuUbX5OBj6Odz-K27CsWVtoQwoBsukpYfNA8bSzS-tzzv_Ag@mail.gmail.com>
	<CAMLuUbXJ9YSf8bd8dQ3PsMZh3yZgf+Co1Q58sGUC551VaD3JkQ@mail.gmail.com>
	<CAMLuUbUGL99KWx9k9JAS4p6eZAcuiNFrfd_KOnHeTnumWesqww@mail.gmail.com>
	<CAMLuUbVA5+3oZf-skxQzTxusVTaRaHbuMH4p-pG-frt581YaYA@mail.gmail.com>
	<CAMLuUbW9G8v+kEQPnPQSQLzSEQJBRhnE97BESr_3WYoJb56HOw@mail.gmail.com>
	<CAMLuUbXQaXVxf5b2idB8ADEFkj7nBjD15+wvpdS5s4n6JroCpA@mail.gmail.com>
	<CAMLuUbV8YtPa25s9v2JSyocAEsL7ZXy2H_GFs6jLRjtGn_6bFQ@mail.gmail.com>
	<CAMLuUbX=eGPsHcSLDdSPNZxZZiQrWb6nE259DxsTv6nBMnTBQg@mail.gmail.com>
From: Brownson Obele <brownson4u@gmail.com>
Date: Tue, 11 Jul 2017 06:49:25 +0900
Message-ID: <CAMLuUbUdZKf9N2q5VQ_D3WHyysaxLw_kFU-JcKu6mQtW87kUQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 10 Jul 2017 21:49:26 -0000
Content-Type: text/plain; charset="UTF-8"

   1. The main python module i am trying to add to my yocto build image is
   LDTP (https://github.com/ldtp/ldtp2). Using devtool, i have been able to
   create a recipe for it which seems to build without any errors. It is only
   when i try to run ldtp on the target that i see that certain dependencies
   are missing.
   2. So i am currently stuck at creating recipes for the dependencies.
   3. Right now, below is where i am stuck
      1. When i run ldtp, it trys to do an import from gi.repository XXX
      and then complains that there is no module called "*gi.repository*" but
      I have a recipe python-pygobject_2.28.3.bb which i expect to build
      and then install (create) the gi folder and its contents on the target.
      Somehow this is not happenning and i'm stuck trying to find out why.
      2. The python-pygobject was not created by myself but seems to have
      been created from this tarball http://ftp.acc.umu.se/pub/
      GNOME/sources/pygobject/2.28/pygobject-2.28.3.tar.gz
      <http://ftp.acc.umu.se/pub/GNOME/sources/pygobject/2.28/pygobject-2.28.3.tar.gz>
      3. I have unzipped the tarball and checked to see that it does
      contain the required gi folder  which in turn contains a
repository folder,
      makefiles etc but when i check my bitbake output in the
      *.../work/my_target_board/python-pygobject/2.28.3-r0/packages-split/python-pygobject/usr/lib/python2.7/site-packages*
 folde,
      the gi folder etc is missing which means that they are not a part of the
      packages packaged/installed.
   4. What could i be missing? Any help in this regard will be highly
   appreciated.

Thank you

Brownson

