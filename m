Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9EC703AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 16:35:31 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so9170128wes.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HBM17DrCGynBjc+XcQFfrAXuc2kQH8DxHXNKYv4dwAw=;
	b=wOH2byvEweltuhDgQqwBr6KpnB8XZCR8nCVquPLRqMRt30zE4DNfmQSdtZF74fnixs
	0gJ/xS+iNssBByOloiB1f+TdVQw+oG6rTwYLH2u+mFDOZhOyBPp8TdM/2WINLexDKXo/
	/9ohHxRavdhhnPL7EjFX28PW6F59huVWjMYnh0Oc9z23e1rgVISIX14ZMtlxbgV67SJF
	3v5eIbFFnYRh4V6ZN8Ohcd+ZNP73/NzdW1lpiSIDcNW6LXUCGUOB+HlyOV5YCXExxwrA
	kXeB+1Y+Jw5VYXOPbhTBTdw/GKNsqhz54XuYCWnh1WT2QKOo4k9rBu/QcNWqVvzAmfcY
	RSVg==
MIME-Version: 1.0
X-Received: by 10.180.81.1 with SMTP id v1mr20267161wix.10.1405010127923; Thu,
	10 Jul 2014 09:35:27 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Thu, 10 Jul 2014 09:35:27 -0700 (PDT)
In-Reply-To: <CALmOhgngis1Qc8GeLhpjYpb1-m1GNXtseuji+e4pnNiAXr7ByQ@mail.gmail.com>
References: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
	<CAOLEWZXqQ_tnZEiVi5JxLbWGktAXNnTWexw_+C0WY+GbyW6V0w@mail.gmail.com>
	<53A9E471.8080500@linaro.org>
	<CAOLEWZUbT17s1pxuxK7Tkvvf6Jk2AO2w5dk2iWuAVCfzTkpPsA@mail.gmail.com>
	<CALmOhgngis1Qc8GeLhpjYpb1-m1GNXtseuji+e4pnNiAXr7ByQ@mail.gmail.com>
Date: Thu, 10 Jul 2014 09:35:27 -0700
Message-ID: <CAOLEWZUh-XwsLBy=rBZq85zEfgO5owTXjkh6jQ6kdB1dN_pQ+Q@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][MASTER][PATCH] lxdm: add libpam DEPENDS
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
X-List-Received-Date: Thu, 10 Jul 2014 16:35:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi Trevor:

Not for a few days anyway, I got side-tracked with auditing Behan's course
this week (among other things) but I could add some of the things we talked
about if you're okay with that.  Can we chat about it on IRC either later
today or tomorrow maybe?  Otherwise I'll take a look this weekend and see
what makes sense.  I guess I need to warp my brain away from risk
management and think about OE stuff again...

Steve


On Thu, Jul 10, 2014 at 8:09 AM, Trevor Woerner <trevor.woerner@linaro.org>
wrote:

> Hi Steve,
>
> On 25 June 2014 00:16, Stephen Arnold <stephen.arnold42@gmail.com> wrote:
> > Yeah, it would certainly make more sense with a packageconfig option for
> > that; currently it doesn't work either with or without the "pam" feature
> due
> > to the missing plugins.  So if you want hard deps, then the plugins need
> to
> > be included as rdeps.  Otherwise, adding an appropriate packageconfig
> option
> > to the flexible depends sounds good.
> >
> > I still need an init script anyway, so...
>
> Just curious to know if you're still working on this? It doesn't look
> to me as though pam is optional with lxdm (?)
>
> Best regards,
>     Trevor
>

