Received: from [209.85.221.136] (helo=mail-qy0-f136.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M2Vdv-0003Jb-VT
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 21:22:00 +0200
Received: by qyk42 with SMTP id 42so2693696qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 12:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rGOAftTlC84VQdaDYkN0AzKt8GNo2V9n2r167rbt/Wg=;
	b=DIgHxwlnK0ap8riX8l7q+yCitfTDWnCFuCISXPWb1ztm6IcgV888crxsaYjQ6NR+sE
	B08zoafIiRh9W5cNQeammQANI35R5noTgIQEpkH0mDFDjVMLnrR1eY4iPSyPJj7BA2rf
	GfLQVyOP5K1yMrWRZ9TXuHiXDy8JiuS2bGuCI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ai2Od1rXdVJjbtnCBmJsn4I5b8Qoi6wt6ZHJyFJXolFgRaO4tm9bn6EWsL3BJ8Hafm
	MQoV8TeyWYBJYR+9+66rX6q8snGPticY/r/9X1Fg2xtVyx22e1cfx+uHQJb9PYQcHsbT
	cCPQqQnzyi+BsSa0bPw9IgXQQCSHcs//kSyZg=
MIME-Version: 1.0
Received: by 10.231.39.141 with SMTP id g13mr310965ibe.34.1241810143415; Fri, 
	08 May 2009 12:15:43 -0700 (PDT)
In-Reply-To: <be7a9f3d0905071835x5d551897l84bf64f9133c13e4@mail.gmail.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
	<4A033D54.2000709@cbnco.com>
	<c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
	<4A035FAB.4040405@cbnco.com>
	<be7a9f3d0905071835x5d551897l84bf64f9133c13e4@mail.gmail.com>
Date: Fri, 8 May 2009 21:15:43 +0200
Message-ID: <c384c5ea0905081215j21443cdes8ab78f31d0bda632@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 May 2009 19:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Fri, May 8, 2009 at 3:35 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Thu, May 7, 2009 at 7:24 PM, Michael Smith <msmith@cbnco.com> wrote:
>
>> I'd prefer not to work with grub2 for now. From the website, it looks like
>> it might still be a bit alpha. Grub 0.9x is also alpha, but at least I've
>> already learned some of its secrets. :)
>
GRUB is a bootloader. Stability is extremely important and any 0.9x
has worked fine.

> Not really; it is the probably choice of Debian for next release and
> it has few missing features[1] only. It adds much nice features and is
> a more clear codebase.
>
> I'd say that technically speaking grub2 is the right choose for OE
> since it will demand less work to maintain and keep it up to date.
>
GRUB1 just works - no need to maintain (unless new filesystems appear
- I think btrfs etc.).

I think GRUB 1 or 2 *highly* depends on the application, and again, we
should be able to
handle both, by preference of the OE developer / user.

My 0.02EUR,

Regards
-- 
Leon


