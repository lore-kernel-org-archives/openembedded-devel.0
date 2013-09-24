Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8D637610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 14:41:30 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id p13so3352150vbe.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=SY5zLzLa7fy87DJS7ML7GXXI9RlmzYWPATC3jD2s+KM=;
	b=PLkp/S2x+jWW+6oFC1L6mgisahl5H9GMWf3+d2+n4UQkuxAdKmUV+H3Cquh80S1UAG
	JFMz3w5Iu7BHlUfJFf7+DpWulFViytTULvSBXxhNm7W+YNQHxMLHpz6JlU0Yiahq9nsc
	EJY7fIkjNfmlCzRkmnC3GqbBuF0IWZzOcAh1Bem/W50+y0ufGRJtJucecN8VyPjCO+XS
	vQw9MnUhsqK5oal3lWeBxZYjPddOnkGITUCtbnXIHme1w/znIxI4TXahIzksfZEnwJXL
	9CEvuEWmfTkINi2eh3DNhHPHEQRNiB3+FMimb0w3UFWy20lXh9pPyj+BHyFHltWxxBxo
	x53w==
X-Gm-Message-State: ALoCoQmOqlOMc/IZGgqLHdOn9EvJF+3EZBltv6LOv9x+2rpRW/0pE1wtp8nlBugjjgIB4UKFwsFO
X-Received: by 10.221.32.133 with SMTP id sk5mr658953vcb.27.1380033692244;
	Tue, 24 Sep 2013 07:41:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 24 Sep 2013 07:41:12 -0700 (PDT)
In-Reply-To: <20130924141853.GD3631@jama>
References: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
	<20130919121131.GE18414@jama>
	<CAJTo0LbtppQegr=Z6M1Ewmd2b7rC5-LSdc6UDFf5Cdxz86=0DA@mail.gmail.com>
	<20130924141853.GD3631@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Sep 2013 15:41:12 +0100
Message-ID: <CAJTo0Laa8Xhzfh8J4s+3zrzHWYrWmddjL8j2zvk0aqQy_xTu9A@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] dleyna: switch to git clones instead of generated tarballs
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
X-List-Received-Date: Tue, 24 Sep 2013 14:41:31 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2013 15:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Sep 24, 2013 at 02:51:39PM +0100, Burton, Ross wrote:
>> On 19 September 2013 13:11, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Thu, Sep 12, 2013 at 04:31:53PM +0100, Ross Burton wrote:
>> >> The tarballs used were the dynamically-generated tarballs from github, which
>> >> recently have changed checksum.  Avoid this problem entirely by fetching from
>> >> git, locked to the relevant tag.
>> >
>> > Merged, thanks!
>>
>> Did you actually push that merge?  I don't see it merged here.
>
> Yes
> http://git.openembedded.org/meta-openembedded/commit/?id=ef3f283609c5b165f5dfa9d6458f3c9ffb53f209

So my .git/config is wonky and doing a git pull isn't actually pulling
origin. whoops.

Ross

