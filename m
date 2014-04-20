Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id AEB8665D50
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 20:21:55 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so2834822ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=kGGIvhfhkgOmyFjCvk4+TZoVMJY9v/CD2uzXNJVCAq4=;
	b=b2KXZzgj+rURbv99QPOjA8IRutLPjUpRDQy4Yub0SRprP5KjShgnONZaJ9SaQbVmYD
	Uk4hqBpvAy/k/82G0ZYqP8VkrwK402IWeFwC+5872q/0E4ZvPc9BhHnzccJKtXZGDDx7
	pWkyDXikOs5zp/quP2UHigBJHDG9l+xWuIwKnkogqrU2+CL5upIoEESb00eNjlwMsXCn
	h0cY6pjt2cc5Qb86F/MSOo3OTLNyI7ykbhdXbh7bqlSmkcKJf+TXsx8oUA7mR31rLbdm
	FWZY5mLcAxQ/Eg0itbbzUn7fMgbIRlQwwMYjgoNyRXo5Cvu+u1cXe9sxdKRldPDULiOA
	/UyQ==
MIME-Version: 1.0
X-Received: by 10.236.87.139 with SMTP id y11mr47609125yhe.27.1398025316444;
	Sun, 20 Apr 2014 13:21:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sun, 20 Apr 2014 13:21:56 -0700 (PDT)
In-Reply-To: <20140420103441.GL2486@jama>
References: <1397581965-24301-1-git-send-email-jacob.kroon@mikrodidakt.se>
	<20140420103441.GL2486@jama>
Date: Sun, 20 Apr 2014 17:21:56 -0300
X-Google-Sender-Auth: 6sIS7TvJb20iI4onj62XUDJWHd4
Message-ID: <CAP9ODKoAOAOz0QmXDeZdGU4B4Z69wRUJZ66y3BD33WhWD3Txrw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] populate_sdk_qt5.bbclass: Fix PACKAGE_GROUP deprecation warning
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
X-List-Received-Date: Sun, 20 Apr 2014 20:22:02 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

On Sun, Apr 20, 2014 at 7:34 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Apr 15, 2014 at 07:12:45PM +0200, Jacob Kroon wrote:
>> Fixes the following warning:
>>
>> WARNING: PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead
>
> It's correct patch, but I'm a bit tempted to take this patch after
> branching daisy, because some people are using latest meta-qt5 with
> older oe-core releases and this undoing this change is easy to miss
> (unlike e.g. cmake .bbappends which fail when not updated for correct
> oe-core releases).
>
> What do you think?
>
> Alternatively we can add wiki page about using latest meta-qt5 with
> older oe-core and just document this there.

I am one of those guys using it with older releases. However I think
we ought to have it clean so I am in favor of merging as this is
really a nice fix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

