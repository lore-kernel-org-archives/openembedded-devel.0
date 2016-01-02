Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB936612D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Jan 2016 21:01:44 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 77so97340254ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2016 13:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gcuZV+aqzIs66XvqUrfXN2b7Ylx8Bk1T7bPvBdJkOP4=;
	b=0dyvsmEFH4TaDb+fLeHcyW2l/vx6EnM9KxAqdqdZNKYozNt14oQaYtevDuePN0gl2C
	ZugiGcT8uwqP9yI8T14HJsLVci8+FpJU4pjLMFZgsQ7tMJSL7H7RNOTAKA4aTG99TDL7
	4G+w83gZAWJ+8aqp2VKhuoNzKjHOxlFNoTXOJ8mCgKAJqxorpf5zLBiFLL0UNJ5RlRe/
	I7+X3St8PABwzz/ck8lfpciU20At4aMl8fCGFO/QIcvUwS3q6qdPhznsQGiERPYf+458
	am6rvyDGLhNpDi2R225KoKCUTXpV2Sdm/GULOZrn5/ZGJCxBVytGv1yOMe9be0vJAdxv
	kATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gcuZV+aqzIs66XvqUrfXN2b7Ylx8Bk1T7bPvBdJkOP4=;
	b=WiiA/zinKAglh7Q2Jn00FmTRtxhNeBCoq+7RA/qCA3AFA+xCqgNxUTQLi7whzNCifd
	d4OVNdgEXaSg2yIE8h8sdcEM2vrIeMkedw+AUmxW3LLYnxCiB+6k0o88YWi+gZsAWFrX
	u1jmqg8J2m1wSWRAoDFNzfGuxwKKOE4ATfVUZJWh3vm2tdaGPhdLfZDW05ZDXMueB4ol
	zE6PaC0giAkKDu4vA935M9vTGjU8kcotRz43Pew3ITe2i87NzpXKy+5SXfU40+9K2hm2
	ED0c7qNGcc0oLLm9jk3k62DROAjC+URztYOxwXuIKpx45SdJAdv0LNdVAlPohhtaro0q
	EbvA==
X-Gm-Message-State: ALoCoQlRDs2NPVSPnIyUBoFQfHxaXQAGOe+f8LmzeZX51qP+zYj+sqdZLeCg4Mro07NPEidx8rqOvh5cvjHmi5NeZ7CxLrRtCW9g41QD1cJyktVK9dA9yt8=
X-Received: by 10.107.135.104 with SMTP id j101mr44563140iod.133.1451768505000;
	Sat, 02 Jan 2016 13:01:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 2 Jan 2016 13:01:25 -0800 (PST)
In-Reply-To: <1451388119.1472.230.camel@pbcl.net>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<1450910987.2002.86.camel@pbcl.net>
	<CAJTo0Lbrb-yu=71a+7YnF0pSkiNxB26U7xh7dbS7Jr8DPEJmag@mail.gmail.com>
	<1451388119.1472.230.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 2 Jan 2016 21:01:25 +0000
Message-ID: <CAJTo0LbbzumOSU=shtASvr-BtoWGr5t0BaGe52XM1r4E=L-E5Q@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Delete all .la files?
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
X-List-Received-Date: Sat, 02 Jan 2016 21:01:45 -0000
Content-Type: text/plain; charset=UTF-8

On 29 December 2015 at 11:21, Phil Blundell <pb@pbcl.net> wrote:

> Oh, yes, you're right.  In fact I don't build openjade-native
> routinely, but a bit of git archaeology reveals that I do have the
> following patch in my tree as well.
>

You're my hero, thanks. :)

Ross

