Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id B76667568B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 14:25:09 +0000 (UTC)
Received: by qgeu36 with SMTP id u36so2925536qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 07:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vcG311h/6vchBfnqY5OORslfphhsSCm0x3hgS5sriDs=;
	b=XESFoPr15U6rfAIwHpebYyKAm4MIlcqurd3PRRYO3tiVr07KVLMq/ORSjGyz/kbSva
	Y3PDgTVYUlY8g0c089ajRSG7+FsOCzeYtD30nXPBYJFTfG3zrQmGBewTVnQIMHjaY9Cm
	/Gp6V8qbq60YalRN5Iu9fUOMvXg4bIMmtcLKrk9i2tH5NiEWXrSiWr16t9Y8Ql0yC78L
	+vGFaeyKukWFUVjxPX0xj/ze+XUK7TTsXvAWoJFkx1MEya9o49FKEJs3VHHlsaSzDP1e
	4w1XEfHi+0CIcz3uyMc9LBS0mnLqmOrrXbJzlpp0dngvaLeL9Fn93+90c/tStK9anGgL
	Uo7A==
X-Gm-Message-State: ALoCoQkfclo7Z+M72g1MzCAAIDehbC18LLAdGFAsFCSMJNpEJjhfD9TgV4xDiYt8C3L3z/RHpZ/Y
X-Received: by 10.55.18.144 with SMTP id 16mr58195938qks.17.1434378310095;
	Mon, 15 Jun 2015 07:25:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 07:24:49 -0700 (PDT)
In-Reply-To: <CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
References: <557E9EFE.1030703@linux.intel.com>
	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 15:24:49 +0100
Message-ID: <CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Mon, 15 Jun 2015 14:25:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 June 2015 at 12:53, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
>
wrote:

> So we are loosing last working browser around - what get's better
> except later is greater?
>

If you actually compare the build dependencies, you'll see that Midori and
Epiphany are actually almost identical.

We need to upgrade WebKit as the release we're shipping has known security
flaws and is very old - and the community is rightly moaning about that.
However Midori doesn't build with a recent WebKit... if you have an
alternative solution then your thoughts are welcome.

Ross

