Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 85AF4731A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:15:51 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id to4so249157329igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 10:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BQEeKR9Tad6pyzNE63ugwbA5R1rM8ZiFfmlrHImeaE8=;
	b=cuboBdIx9XjKL8IXs5FAkzP7OiJn6RpclRgjkKuO1f4OVPDvG93H7WvIeyUrLWqXtU
	DrQoNVBmTO6tw5I2vt2LPi16qJzEtdmjP4HzFRhkeBuRV2x+dGneTBXZsDAfAyGKAo2g
	bnUWLZOPvsv6UcI6xih0BwZulJMWHCx2E5bc2dph+mXzZhWs4me/WfA74TVvBERtyMvB
	bYX2p5+JF8ucUbL5M6LfbdISd0sNLTYtTBqiFDxTeawTu84q3cYZ1lERUX7rYCDAkIm3
	m7ckISpaFN1KfhnqS4OkbCWFYxgkZqHENn7aP7sNy47zGiFUlhtpY8AaT7RNwFFmlJCH
	48dg==
X-Received: by 10.50.155.65 with SMTP id vu1mr84575604igb.11.1451931352675;
	Mon, 04 Jan 2016 10:15:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Mon, 4 Jan 2016 10:15:23 -0800 (PST)
In-Reply-To: <20160104175200.GA5744@jama>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<20160104175200.GA5744@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jan 2016 10:15:23 -0800
Message-ID: <CAMKF1soMFt_EGLUF8T61+7BcaureScErMsDyRdc-ZxLk3x1eFA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Mon, 04 Jan 2016 18:15:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 4, 2016 at 9:52 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Dec 30, 2015 at 02:57:55PM +0100, Koen Kooi wrote:
>> When the host distro uses gold mariadb-native fails to build.
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>  meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
>> index a6826c3..6a55476 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
>>  # https://mariadb.atlassian.net/browse/MDEV-5982
>>  TARGET_CFLAGS += "-fuse-ld=bfd"
>>
>> +BUILD_CFLAGS += "-fuse-ld=bfd"
>> +BUILD_CXXFLAGS += "-fuse-ld=bfd"
>
> Unfortunately this breaks builds on older hosts with older gcc
>
> |   cc1: error: unrecognized command line option '-fuse-ld=bfd'
> http://errors.yoctoproject.org/Errors/Details/25859/
>
> Should we consider Ubuntu-12.04 insanely old?
>

Its still maintained and supported until 2017 I believe.

