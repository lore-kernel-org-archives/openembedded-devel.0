Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USRhD-0006UY-EL
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 14:43:11 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz11so1284822vcb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 05:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=K6TaRApfDVWx7Kx7pCufYmBXQu7mP8f8z2uwj5qTAwk=;
	b=IpbdI/6PjqrQz9fiHqMU76jLuLsGQ4IJcMGkXys8FQXQjUKDm6dU5WHfMtaa2AKd9o
	tdN/X553wpkwwRc0WQ44xbjvArV+lCs8qVXSqyIbscMhgvavYEWVzNrk2Y/GwGvESW2C
	t32CnJJVz9prsYgvdN8W2Eg0kVqjGM0QPRlbN6EsM8EalzWCqmHUV0eXzTNxOwS5qouo
	x6M78stOF8owpQuLgXyEvVAvpXVXjQ3bFHuJY+OMyF4vqtM2dhhlhvIRAGjWURewUpHQ
	Le82mrNQLX7cjnOsx9BHfmXS2HvfkpdyziYHi9M6zmYWtn9UM5/0yyWJ6sNcDlSzIAy3
	fDAg==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr4039927vds.27.1366201508453;
	Wed, 17 Apr 2013 05:25:08 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 17 Apr 2013 05:25:08 -0700 (PDT)
In-Reply-To: <20130413144435.GF2477@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
	<20130109132813.GJ3722@jama.palm1.palmone.com>
	<CALbNGRTEiLQ8JkN1PvRc6k2rbuvnozP79ywYudMaUyXNViGpSg@mail.gmail.com>
	<CAJTo0LZT_b4mRrYJOVJzfTzgU4-ipZhswQme-=FqFNGD6q845g@mail.gmail.com>
	<20130413144435.GF2477@jama>
Date: Wed, 17 Apr 2013 14:25:08 +0200
Message-ID: <CALbNGRRxMU9YTQK=Uj3CX=S+AV+r9n=xWYDBrc5=T+cTZ1c3VQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Wed, 17 Apr 2013 12:43:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2013 at 4:44 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Jan 09, 2013 at 04:25:40PM +0000, Burton, Ross wrote:
>> On 9 January 2013 15:17, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om> wrote:
>> > 2. bitbake libnotify3 -> Tons of: 'WARNING: The recipe libnotify3 is
>> > trying to install files into a shared area when those files already
>> > exist. Those files and their manifest location are:
>> >    /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/lib/libnotify.a
>> >    Matched in manifest-overo-libnotify
>>
>> The current libnotify doesn't actually depend on GTK+ 2 or GTK+ 3
>> (well, the tests do, but that's trivially resolved with an
>> upstreamable patch to add --disable-tests), so we don't need two
>> recipes.
>>
>> Speaking of GTK+ 3, I'm about to start pushing a series to add it to oe-=
core.
>
> Is someone working on making libnotify and libnotify3 playing nice
> together? Would be nice to fix it before branching..
Running tests for this and hope to send a patch today afternoon

Andreas


