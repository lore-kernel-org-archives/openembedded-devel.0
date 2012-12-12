Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TikUZ-00087e-41
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 12:29:16 +0100
Received: by mail-wi0-f170.google.com with SMTP id hq7so2907205wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hngCMq4Sc644WrA3ZlXUoatZJCrjMqOGc+CAWUgWMLQ=;
	b=TeqvBM9qWLdw9ryOyyJHmsrWVYObupt/ljmaG+7VNBCK6X9gfz4f8BR/Fc03PXQdxe
	gMuIqyOUQmacd0pfFba7XL7//vqnVKbvM87gOLg0miYD+LR6DqPzx/XzfZEfAWC5weSY
	DdaQ5WuQ7w8m3G6e40ID9UGhTYgE3Tkwi56DfNFMvjZ0kdjChVZavNTSFQQsOMfcmYDs
	sJD/GT7YRWM2K0f/0LTMF+e6IQ9gSrG26Kfr7MgHrlmdEEppi8Ty1VJJipodZLfxCaz3
	MhUAJ3BgwSn9PAvzMxmWcL+Ur3/v+e6tzPBMZrjntfiK6hiZ2qI/6NmhkkOGEzPJ7PR8
	F9DQ==
MIME-Version: 1.0
Received: by 10.180.7.199 with SMTP id l7mr2349598wia.15.1355310854025; Wed,
	12 Dec 2012 03:14:14 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 12 Dec 2012 03:14:13 -0800 (PST)
In-Reply-To: <CAJTo0LYOB_dJZygwvp9S8BJ7eAxjVkZJk-m4BOzf2nHAa-9Zuw@mail.gmail.com>
References: <CAP9ODKqQGbR83_sXRzs=ATNLvZu9JF=HHPQcvM0j37cYV=jExw@mail.gmail.com>
	<CAJTo0LYOB_dJZygwvp9S8BJ7eAxjVkZJk-m4BOzf2nHAa-9Zuw@mail.gmail.com>
Date: Wed, 12 Dec 2012 12:14:13 +0100
Message-ID: <CA+chaQfuvaEKQnph6mOpZq=bCCKNe=yXd9g6dPkXjfq7aK_wyA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: udev (master and danny)
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
X-List-Received-Date: Wed, 12 Dec 2012 11:29:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 12, 2012 at 12:09 PM, Burton, Ross <ross.burton@intel.com> wrote:
> results in
> meta-oe's udev 182 being used, which fails to boot on atom-pc from a
> hddimg, hanging at "waiting for removable media" (nothing is

There is patch to remove udev from meta-oe, but that merge of udev in
oe-core kept significant diff between both 182 version, no idea why it
wasn't taken into account when 182 was introduced in oe-core..

I'm using udev from systemd recipe so I'm not really interested in
udev recipe in meta-oe.

Cheers,


