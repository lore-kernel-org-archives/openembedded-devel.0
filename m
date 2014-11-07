Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id C585665D4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:22:09 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id a108so2384225qge.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UH9rjRzgKdYm42WX/bYyHgIj21LgxsFMO8T4OoUDbPI=;
	b=kqbkWYArN8UZ4JcfdmD8OmDjuu4YCHtPAkSRtSdHqyQCl/sK4sJOLeFPkq7ujXG341
	2jcff6t/xO90Ie80vUmPl+2/bJNslVHDgJhf8Y9ofownS+zumgMMmxaQxSCtvQ8uvwPh
	6zQR+kyo7anRf648xhF0P/qADoqyfCNKZMb8DMzX6NTYatgMMYBcF/bRlLpPk1hK5Wpj
	6yV2qNAqN9FQZwCgrmsyeVWRvUIij9KSGtP1Q7BSXqBjrWyCNxRExFAQAy6fgABAeWZH
	6BhqJSooAV7CD/+DGVuc2BXNMopsvRq7nVGqESi++IdCE9b27i2Yfpl+Uqq5wwY4Nd+b
	EWRw==
X-Gm-Message-State: ALoCoQnvEZLun0RwtoUxbVs8dh2QMD1f4Yxd6gTJ1v3rTqp+1bcj0/L1MK5uUwGqFTn+umhWmE7z
X-Received: by 10.224.138.2 with SMTP id y2mr13663688qat.52.1415370129829;
	Fri, 07 Nov 2014 06:22:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 06:21:49 -0800 (PST)
In-Reply-To: <CAP9ODKrDn-FjOh1nT9j5krPBYvK5G4xpEVBfumxHybW2tP5UMQ@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
	<CAP9ODKrDn-FjOh1nT9j5krPBYvK5G4xpEVBfumxHybW2tP5UMQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 14:21:49 +0000
Message-ID: <CAJTo0LbmuNsdh-D+mzy67+zVJJDJPVT_Nkq3h8HkedqmzTDnJw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 14:22:17 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 11:47, Otavio Salvador <otavio@ossystems.com.br> wrote:

> Besides, having it enabled in our autobuilders will also greatly
> improve code quality as LLVM is sometimes more picky than GCC. In
> Debian the exercise of rebuilding the whole archive using LLVM has
> been very useful and has identified several code issues which has been
> (or are in the process of being) fixed. Also to add on that, I think
> the sooner it is done the better so we can solve issues early on the
> release cycle.
>

As a side project I ended up using clang as host gcc.  It was amazing how
often that failed, so don't expect using clang as gcc-cross work straight
away.

Ross

