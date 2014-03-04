Return-Path: <net147@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 059896F47E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 03:43:00 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so1897223qcy.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 19:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5DGiegPir0wuyc5fZIsJ8vZ4NeFwcgbBIkzfsGonYAQ=;
	b=FKIJPdyMH8ULyD05yFmlFq5n3BummaJJPhc/sXg2B565ER+vYRA4P1Uuiu2MDyqaTS
	RzWD0Ti3Uh/Pv7GY+XlVc1bPThfKEodZ9GLAfj5yaUerr1nXJYned4eYOZj9sKwX43NS
	pFZYBBA2h0sbM1mwz2rPl5sc/4u49HAsQYGgY4usYvoygKUJq3yKOtfbaLnJUIaiAnzU
	81J0+m1stl+KFymJcpL35KDQHVMvRsuZ5irr6+6mrlfJmhJvOO4onJHBGE7z3MUbLETY
	7chDyXp4hXpjMvyQY+1JfpVFbMV/8fqvaGqtw5RMpkzSL3FSgWozmUqzIR3sel9X546l
	oldg==
MIME-Version: 1.0
X-Received: by 10.140.19.212 with SMTP id 78mr27111281qgh.84.1393904581207;
	Mon, 03 Mar 2014 19:43:01 -0800 (PST)
Received: by 10.96.33.35 with HTTP; Mon, 3 Mar 2014 19:43:01 -0800 (PST)
In-Reply-To: <CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>
	<1393734165-15082-2-git-send-email-net147@gmail.com>
	<CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>
Date: Tue, 4 Mar 2014 14:43:01 +1100
Message-ID: <CANwerB1mFM6ipZW0mS=4OpD0PbdxBTtLgidMLo2R8Pi_XdrS+Q@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v4 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Tue, 04 Mar 2014 03:43:01 -0000
Content-Type: text/plain; charset=UTF-8

On 4 March 2014 06:53, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Sun, Mar 2, 2014 at 1:22 AM, Jonathan Liu <net147@gmail.com> wrote:
>> This adds the necessary target packages for development with all of the
>> Qt 5 modules.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>
> Why are you adding qttools here? this is not need for toolchain use,
> is it? It is need for host.

The QtTools module includes components that may be used by
applications - http://qt-project.org/doc/qt-5/qtmodules.html#qt-tools

Regards,
Jonathan

