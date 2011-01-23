Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PgwbA-0003c6-9M
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 10:51:04 +0100
Received: by fxm17 with SMTP id 17so3229978fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 01:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:in-reply-to:references:x-user-agent
	:mime-version:content-type:content-transfer-encoding:subject:from
	:date:to:message-id;
	bh=4HfK5aT9a9wmEJzLosT2IKnRSZ1ru67CEV7Wa7YF/yo=;
	b=IOpzsbY66hQfRHcEmt6N2UUMOur4gXXeZ9X2bQJ/PcmsL3H/j8U03ja6z3nVnrADVS
	x2IAraSjp0XluRqXUqLbYPYXM5HhS8lTzTTHCPOadIaXltsh9LfWhxyLS1xmPlZPdY3i
	tcCZtTNXmTg4lZvWUhWqsR5uZpNvVJdGWDf5A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=in-reply-to:references:x-user-agent:mime-version:content-type
	:content-transfer-encoding:subject:from:date:to:message-id;
	b=LDk3VnSeO2PBzf5MOM/WN4Uap/0WXC0NjLvNv6evKq63HvDsOk07ILUxj7FmfJkLuY
	fbjluqVwY+BAp4+INMhbNoi9cZmWwAQ9AvMJTbWVn+7lwWMX5xU76EenTDosdso7vgKX
	Qvl2Bfh3Ci7j72ax3tHi9Xc3CECfgEBvJAW8s=
Received: by 10.223.72.207 with SMTP id n15mr2839937faj.49.1295776220180;
	Sun, 23 Jan 2011 01:50:20 -0800 (PST)
Received: from [10.145.86.130] (212095007080.public.telering.at [212.95.7.80])
	by mx.google.com with ESMTPS id b7sm4171487faa.18.2011.01.23.01.50.13
	(version=SSLv3 cipher=RC4-MD5); Sun, 23 Jan 2011 01:50:19 -0800 (PST)
In-Reply-To: <1295720592.3850.290.camel@mattotaupa>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
	<1295653195.4105.56.camel@mattotaupa>
	<1295684244.4098.2.camel@mattotaupa>
	<1295720592.3850.290.camel@mattotaupa>
X-User-Agent: K-9 Mail for Android
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 23 Jan 2011 10:51:15 +0100
To: Paul Menzel <paulepanter@users.sourceforge.net>,
	openembedded-devel@lists.openembedded.org
Message-ID: <a8173b20-4a24-4391-9328-72a7797236f0@email.android.com>
Subject: Re: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Sun, 23 Jan 2011 09:51:04 -0000
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

"Paul Menzel" <paulepanter@users.sourceforge.net> wrote:

>Am Samstag, den 22.01.2011, 09:17 +0100 schrieb Paul Menzel:
>> Am Samstag, den 22.01.2011, 00:39 +0100 schrieb Paul Menzel:
>> > Am Freitag, den 21.01.2011, 10:10 -0800 schrieb Khem Raj:
>> > > On Fri, Jan 21, 2011 at 3:22 AM, Paul Menzel wrote:
>> > > >
>> > > > `bitbake -k vdr` was executed with 6db34075 (uClibc 0.9.32-rc2)
>[1] and
>> > > > `minimal-uclibc` for `MACHINE = "beagleboard"`. I guess it is
>related to
>> > > > the uClibc upgrade.
>> > > >
>> > > 
>> > > Did it work before this? I guess not. Upgrade has nothing to do
>with
>> > > it. Its gettext/libiconv issue in the faulty recipe itself I
>believe
>> > 
>> > I just reset to when the recipe was updated [1].
>> > 
>> >         commit f4f7638828b0e06fa7ae37ccba0e1ec294b5c30a
>> >         Author:     Paul Menzel <paulepanter@users.sourceforge.net>
>> >         AuthorDate: Mon Jul 12 21:32:52 2010 +0200
>> >         Commit:     Khem Raj <raj.khem@gmail.com>
>> >         CommitDate: Wed Jan 12 00:05:25 2011 -0800
>> >         
>> >             vdr: update to 1.7.16 from 1.7.10
>> > 
>> > It built fine. Any thoughts?
>> > 
>> > I will try to pinpoint the faulty commit. I am trying to build with
>> > 2a7ddea6 [2] next, which is the commit before the last change to
>the VDR
>> > recipe.
>> 
>> That failed already. Now I will try 260f78b3 y[3].
>
>s/already/also/
>
>The commit since when building fails is a88aca1d [6].
>
>        commit a88aca1d7dfa3a08957dd49cb61bac850f197106
>        Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>        Date:   Wed Jan 12 20:34:55 2011 +0100
>        
>            autotools.bbclass: pass distro_imposed_configure_flags
>            
>            Acked-by: Khem Raj <raj.khem@gmail.com>
>            Acked-by: Tom Rini <tom_rini@mentor.com>
>        Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>
>Any idea?
>
>
>Thanks,
>
>Paul
>
>
>> > [1]
>http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=f4f7638828b0e06fa7ae37ccba0e1ec294b5c30a
>> > [2]
>http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=2a7ddea6f7cd12f88a086e9d3e9228008a102248
>> [3]
>http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=260f78b3e5b171fea66fe7c901f489ea713d2988
>[4]
>http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3de42fccb9d8baa70e37dbdbf8bedf5ecafb9a4d
>(fails)
>[5]
>http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=67d127a52d6565bc90f49e2bff5de80db85b2021
>(works)
>[6]
>http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=a88aca1d7dfa3a08957dd49cb61bac850f197106
>(fails)

Hi Paul,

I will have a look as soon as I am near a computer.
You could see which of nls, ipv6 or largefile configure options trigger. If it is nls then I suspect the intl-proxy package setting (or something such) is set incorrectly.


