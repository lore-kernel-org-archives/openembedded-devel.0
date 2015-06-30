Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3622E6E646
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:32:52 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so8971834qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=bgrzj9VRJNjv2cKs+KhwYGXj3rikEpa6wzHxuaIR3cU=;
	b=Ki1PhoypsB26JpMCIWRcAaV+zrfqyTMLCQDhHle8QTvZtSZUcouhEE4ieIEJGxaydw
	S+MrOTMhPjZTuyUIiPemUBpz+o1GODoqyiF4qwC7I7IGUeiexnz+Y8W8fLOZY6XznklF
	iIxpfoZc3yTvm7iH1eiJBmBTWklSDTMwGvyzIo41jT8czm9T1qyYwQpcsggEoAdE/3b0
	LKcUnfVJW6ZuhTU/Yq0ZDxPinOGEmZJpAv9Lj/eUmIx7zE5L6j2Ar+/j/g8fJuwhTGbh
	6wxddwGHG9Io1RHDX1qNhVvuBJ9MtkLdzMDZd/2cY+o5QcQBsQBXCVNB8AH/s5PYkIcL
	wOoA==
X-Gm-Message-State: ALoCoQnUiNYPcqL7tZdRSJiLUfgtBoSuXfncvqqtZ9l7271w10/uJI2qmrk5rcNzf+cK4GPOtQrt
X-Received: by 10.55.18.197 with SMTP id 66mr26119248qks.13.1435678373188;
	Tue, 30 Jun 2015 08:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 08:32:33 -0700 (PDT)
In-Reply-To: <5592B122.4020208@mlbassoc.com>
References: <5592B122.4020208@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 16:32:33 +0100
Message-ID: <CAJTo0LamNSDWoNX8YZ7ytqUcMd=yP4Dx=smkfcBU9jf3hnUGpA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] New chromium warnings
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
X-List-Received-Date: Tue, 30 Jun 2015 15:32:55 -0000
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 16:09, Gary Thomas <gary@mlbassoc.com> wrote:

> I'm now seeing these warnings with the latest OE-core:
>   WARNING: chromium: invalid PACKAGECONFIG: component-build
>   WARNING: chromium: invalid PACKAGECONFIG: use-gl
>   WARNING: chromium: invalid PACKAGECONFIG: ignore-lost-context
>
> I looked at the recipes and those config strings are not mentioned
> in the PACKAGECONFIG setup which is what is triggering the error.
>

Can you verify this with bitbake -e?  Maybe a conf file is adding them.

Ross

