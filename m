Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 48C30739CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 14:08:49 +0000 (UTC)
Received: by ykp9 with SMTP id 9so811104ykp.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=hAY3o9gZYswwRm2IhwIrqENQG7p7mkm8ne5EPzvgn5A=;
	b=Av4bokNh4x3Digb2A+34x9RMtK7SWuUiTF4JuvULgAuezNRpTBl2kZbf4VjMJAxFmg
	J/BJXShjecnCAF9xqLFP3ZkD8yKo2Cbhf9RfVGWnGAliXPszlKJhMNYocyX0WTbzVvut
	iAWRJg+OEcX+WQBK42/szbnaAwR74JjQOL64hezWcvQ30rWScMcwOG90+l0hlE6gEzSg
	VE/xHSDfv2bj46whEwG9fYFdZiU/ACtAe27MrMW/eUs9oByP4WxZTV06EpmXnH6Dz/gT
	krt7tm1+MUOu1SkAv7GOpER3nFHL/gQA3uIRz2ILiouahktM67GxzXeslIAcDu3lPrzP
	zdvA==
MIME-Version: 1.0
X-Received: by 10.170.133.13 with SMTP id z13mr4069653ykb.30.1425996530905;
	Tue, 10 Mar 2015 07:08:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Tue, 10 Mar 2015 07:08:50 -0700 (PDT)
In-Reply-To: <1425989994-22071-1-git-send-email-magnus@minimum.se>
References: <1425989994-22071-1-git-send-email-magnus@minimum.se>
Date: Tue, 10 Mar 2015 11:08:50 -0300
X-Google-Sender-Auth: tEd5oghwAjeufW0OOQLOxR5LrPY
Message-ID: <CAP9ODKpy9HsOfQF+Shy7HON7k34+RJ97d=azmGt=hrvkhE50jw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] initials: silence "populate_sysroot manifest not found" warnings
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
X-List-Received-Date: Tue, 10 Mar 2015 14:08:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 9:19 AM, Magnus Olsson <magnus@minimum.se> wrote:
> A number of recipes in meta-java use autotools.bbclass for building; internally
> it uses the sstate-control populate_sysroot manifests to locate and copy
> aslocals for configure dependencies as part of the do_configure step.
> The manifest path differs depending on if it's a native package or not so
> autotools.bbclass looks at the package name to determine if its native or not
> (it's native if it ends with "-native").
>
> The warnings are emitted because a few (native) recipes in meta-java (such as
> cacao-initial, classpath-initial and more) are incorrectly being classified as
> non-native by autotools.bbclass, which makes it look for the manifest in the
> wrong place and finally gives up with the warning:
>
> WARNING: /home/oe/tmp-glibc/sstate-control/manifest-mymachine-libecj-bootstrap.populate_sysroot not found
>
> This happens for cacao-initial, classpath-initial, ecj-initial, libecj-boostrap,
> jamvm-initial and jikes-initial since they are all native and rely on autotools.
>
> This patch renames the recipes so they end with -native, e.g ecj-initial-native.
> It also updates the recipes so they DEPEND on the corresponding new name. This
> helps autotools.bbclass to properly classify the recipes are native and silence
> the warnings.
>
> Signed-off-by: Magnus Olsson <magnus@minimum.se>

What about the target packages? instead a class extend could be used.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

