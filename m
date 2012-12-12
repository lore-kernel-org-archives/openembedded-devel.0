Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TilYR-0001KR-8m
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 13:37:08 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so2956200wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 04:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=svWN8/+adzGZJaHeezDKIEOLu9fKIU+ACs20rgIXgZk=;
	b=j1yAeOdZz4zgTb7ZevUf3VuPaqSfJtBht5AHxxqdChm+n1Gkj6nBkF8E4jPs6PKNUu
	f9XdvGmT90oWHcM+NmzI0ccXwWXlIl7njzzzLGy3WDCaBlLcSrIvD+aFygD7vysslng7
	vjbYkiwdVlnpFa/lTQJvHLTpRZzYj/lnZViNPyH9GZdxsguEh50jKJL+6LVn3l71ec7m
	27GdTXBFzUKOUqPAYmGys/0O9HwhcvOYN2thbDulBI1PauwoELoUGBwU0JWUzGnZiltC
	sfXKtnvqBpkSzosDJjJvKSu3yQ18qi5OeiGoB4RB3l75JR56xwSx5YrUYgmYrvvs451h
	Ae2w==
MIME-Version: 1.0
Received: by 10.180.85.194 with SMTP id j2mr1547597wiz.12.1355314937972; Wed,
	12 Dec 2012 04:22:17 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 12 Dec 2012 04:22:17 -0800 (PST)
In-Reply-To: <CAP9ODKpTHJmnih0McoN4CqXFSaFP5f9q3zYLDNhAzeX8FGMtAA@mail.gmail.com>
References: <CAP9ODKqQGbR83_sXRzs=ATNLvZu9JF=HHPQcvM0j37cYV=jExw@mail.gmail.com>
	<CAJTo0LYOB_dJZygwvp9S8BJ7eAxjVkZJk-m4BOzf2nHAa-9Zuw@mail.gmail.com>
	<CA+chaQfuvaEKQnph6mOpZq=bCCKNe=yXd9g6dPkXjfq7aK_wyA@mail.gmail.com>
	<CAP9ODKpTHJmnih0McoN4CqXFSaFP5f9q3zYLDNhAzeX8FGMtAA@mail.gmail.com>
Date: Wed, 12 Dec 2012 13:22:17 +0100
Message-ID: <CA+chaQcdektgXD_ETBTwQR3VTJ8fMitFHaqoy2oeSfx+Tdb+hg@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Dec 2012 12:37:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 12, 2012 at 12:23 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Dec 12, 2012 at 9:14 AM, Martin Jansa <martin.jansa@gmail.com>wrote:
>
>> On Wed, Dec 12, 2012 at 12:09 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > results in
>> > meta-oe's udev 182 being used, which fails to boot on atom-pc from a
>> > hddimg, hanging at "waiting for removable media" (nothing is
>>
>> There is patch to remove udev from meta-oe, but that merge of udev in
>> oe-core kept significant diff between both 182 version, no idea why it
>> wasn't taken into account when 182 was introduced in oe-core..
>>
>> I'm using udev from systemd recipe so I'm not really interested in
>> udev recipe in meta-oe.
>>
>
> And how did you include the init scripts on it?

I mean systemd together with udevd from systemd recipe (so
systemd-udevd.service instead of init script).

Cheers,


