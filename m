Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P2jqT-0000kD-Vt
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 14:08:46 +0200
Received: by yxg6 with SMTP id 6so1687279yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 05:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ENyhogRNeNjib5ja3ETw4SeC9yEAEYGVkZfBzPsh0So=;
	b=FMNSDVsv6csjpgQAqBOHBV/ZkVNXVN7fXdWUgDbfDXKkZxQvCbcu6gMXVWeaueonNc
	YsV4DJFkKBnjH9k6CGhfddMrAGzYAnVMp7tzLpTyz7JF/G34qdwSmkgHpXqUQsze0NT1
	BODb5d7OzOPgY83s219Iq0hg+q941z6icdMEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ls4B7iSgCSvXexT0J0AXZnNzFWOs3XTcftfP0Qx/7ZWn4XLBq9/TZpagZYwj8Ai7ez
	EUH5VpdUuIeUXVs4wOVmua1SiRpMQ9bRsDqO9Hqfz5XqKqHwzzBDgREDoI3h4twlEIxE
	bktqvACin0Fl4a/OtlzLzxrfnTnxcliTVz48A=
MIME-Version: 1.0
Received: by 10.231.33.12 with SMTP id f12mr10078633ibd.31.1286194098135; Mon,
	04 Oct 2010 05:08:18 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 4 Oct 2010 05:08:18 -0700 (PDT)
In-Reply-To: <AANLkTimWof42k79P=Nz3uLK6uZDx8WQGXHTvjeTboF86@mail.gmail.com>
References: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
	<AANLkTi=OtUEUO=55HLreQSEH32FBYyiTnOOqY0HCVUsu@mail.gmail.com>
	<AANLkTim7VY0uUKb_uu42n3gFw-37ozVC4KOM=6NzsGec@mail.gmail.com>
	<AANLkTimWof42k79P=Nz3uLK6uZDx8WQGXHTvjeTboF86@mail.gmail.com>
Date: Mon, 4 Oct 2010 14:08:18 +0200
Message-ID: <AANLkTik2mzMFztPtfVjLo_XhpzpbSrURa35ykg_1ob8r@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble building gcc-cross-initial first time
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
X-List-Received-Date: Mon, 04 Oct 2010 12:08:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/4 Jan Paesmans <jan.paesmans@gmail.com>:
>>>> I run massive parallel builds with 8 bitbake threads and make -j 8, so
>>>> I suspect that this has something to do with it. One of the tasks the
>>>> is started before is linux-libc-headers_2.6.31.bb, do_package_stage.
>>>> Could it be that this task hasn't finished yet while the
>>>> gcc-cross-initial needs it?
>>>>
>>>> Regards,
>>>>
>>>> Jan
>>>>
>>>
>>> It seems to pick up a header file from the host.
>>> It could also be dependent of glibc-initial or so.
>>> What happens if you build from scratch with 1 thread and -j 1 ?
>>
>> Then it works. I'll try checking the dependencies for glibc-initial.
>
> OK, i think there is something strange going on here.
> In gcc-cross-initial.inc: PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
> In glibc.inc: PROVIDES = "virtual/${TARGET_PREFIX}libc-for-gcc"
> In glibc-initial.inc: DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
> In gcc-cross.inc: DEPENDS = "virtual/${TARGET_PREFIX}libc-for-gcc"
>
> I'd say that there is a circular dependency here.
> Could this explain why the problem occurs in a multi-threaded build
> environment and not in a single threaded one?
> What's the way to solve this? Is there some way in bitbake to synchronize this?
>
> Jan
>>

if there was a circular dependency bitbake would have told you so.
string.h is probably provided by linux-libc-headers; you might try
with your parallel settings to start with a clean tmp; then bitbake
linux-libc-headers; bitbake gcc-cross-initial

Frans


