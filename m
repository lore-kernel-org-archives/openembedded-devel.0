Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6IpQ-0005sW-LO
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 11:47:40 +0100
Received: by mail-vc0-f181.google.com with SMTP id d16so2032572vcd.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 02:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=OMgFo1/lmHNYFo3+TIl7e+9d3RIyI9bM8FLA3Fbq3/Y=;
	b=Pzltf2DROlMsf/JWGFipPqpZM3EGM7slEYbwEyrhIF8PpYtoJyAjsNCUR+byIgI8nt
	ZPWKyXZgXOGG3zLMKn+M++SkYAvBqcUDaKu/Wi4kWP+sqbpbz89aRojRrSx4T99LZvgf
	nXwTdk0UMvZ/kcLBEDJz8MUCUXceIeXeHo5jxon0ftFl/3FnzzLpgzpWSm8Y7jF1ia/q
	X70MaYbRJZg2A3q8k8fVbNZkk9iJzz8iQZ0xNCD0PTAZdAAu5hEbolzl/w2mw3OoP9KB
	lEG7DPlGC8H7uYY6bzZIGK3iMU+NpHJA4BXgC7JtQ5ED3PfxK8en8Lv2p8CAW6F8d1a/
	Kvng==
X-Received: by 10.58.107.235 with SMTP id hf11mr2540648veb.16.1360924296409;
	Fri, 15 Feb 2013 02:31:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Fri, 15 Feb 2013 02:31:15 -0800 (PST)
In-Reply-To: <CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Feb 2013 10:31:15 +0000
Message-ID: <CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQloJN6b8/bbSOSL3yBjFeIeUPp+41+fxtIYlWO2i/rZ/mae3dYIZd21707HCAUMsOX0XF3B
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Fri, 15 Feb 2013 10:47:40 -0000
Content-Type: text/plain; charset=UTF-8

On 15 February 2013 05:30, Sankar H Malarmani <sankar.m@hardcube.in> wrote:
> Yes, you are right.. I removed those trailing slashes and now it throws me
> new set of errors.. It was giving errors in RDEPENDS..
> As suggested in wiki I replaced RDEPENDS with RRECOMMENDS in my
> obconf_2.0.3+git.bb. But i'm getting the following list of errors.

In the last week or so oe-core was changed to warn if you specify
RDEPENDS or RRECOMMENDS without a package identifier.  For example,
this is wrong:

RRECOMMENDS = "foo"

But this is right:

RRECOMMENDS_obconf = "foo"

Ross


