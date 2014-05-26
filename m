Return-Path: <ashcharles@gmail.com>
Received: from mail-vc0-f169.google.com (unknown [209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id ED4486FA50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 22:09:46 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ij19so9898770vcb.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 15:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OD359JnAYWWuNwASdmi2qwKCK+PBdCFiWEMb3w8YAmI=;
	b=KTlUROt5t9lYt/2+Ql2XVQ/qHlaHjrYKYT+bs7wg+eMFKbdQecT2D1K7rONQxs/DJi
	MMp6qfqGL/tLw2tAjjlIPqKUFH22ixgZ+GXnScYuUTxez+f3kF5Zl3ijAPa7Y8IulYGQ
	BG7577B/klBVS1IplJ6KAbcsNfJ1abGRj1N32WjXESmmfgNi4IY9r839v0diAYG0zPrJ
	ARcuW5sVu6Phoi/oU9E6BLLhvbnAzOF7nPUss17dNOitprEKpXKioyPrxg4XOjb/btEp
	gDptYbOuuifo35cTUni+KRQuWdp8ri3ajBdJLf8uLpWSK92LbMiBLP0Mm53iHBFmf1YO
	ePQw==
X-Received: by 10.221.37.1 with SMTP id tc1mr13692769vcb.32.1401142187351;
	Mon, 26 May 2014 15:09:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.227.67 with HTTP; Mon, 26 May 2014 15:09:17 -0700 (PDT)
In-Reply-To: <CAP9ODKoyYcRb7jJ9GWWvqLNCJ5Sy5fhYLL8vNG6vSRyBpmeCtw@mail.gmail.com>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
	<CAP9ODKoyYcRb7jJ9GWWvqLNCJ5Sy5fhYLL8vNG6vSRyBpmeCtw@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 26 May 2014 15:09:17 -0700
Message-ID: <CAK8F28mJTm+xHD8uyzF00xUpz=q7fpn4EC4Ao-tUqX-eQquZBQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Mon, 26 May 2014 22:09:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi Otavio,
On Mon, May 26, 2014 at 1:31 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> You cannot remove the PR without a new version coming out; if you do,
> package feeds will get the  revision going backwards.
Oh duh!  Thanks.
>
>> +do_compile_prepend() {
>> +    ln -s ${S}/po po
>> +}
>
> This is not the right fix. Please fix the po/Makefile to use $(srcdir)
> and like so you don't need to link it over.
Okay---that makes sense.  I'll send a v2 with these fixes.

Thanks for the feedback.
--Ash

