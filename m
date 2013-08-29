Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 93EF46BE1F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 22:04:21 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id i7so1394140oag.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AynvBRdFR/yDKzQMDYHlkKA4wyxPuifpv6UwqHLPBLw=;
	b=BSNtjhjTF8bw++NX8Zrg9YYs0e6HiGURSlkMasHKzS6nw/ujjjITHaiglSh+kdJ2+u
	fKylYln95bg7IJwoOEFJO+yRa2KzHPCQ4HB9g6JmdxLecjHoyItZKhyAPEAVheEPhnyN
	FF2deLXq+JPpsUsKZfmj5B/Lt/MoJcZ4H5try7jS6q5pNkYqFeBmECNSTVIgQZnCMpPn
	kfkJuasj5+6zXZIfYD6COsqapdV/Ux8YINNfyq+SHNgwIA73d4tKq097/CimGhbvi8we
	7RqDunGL/wrO1XQR0NwpIEGx0hYjDiwhj+WJqO19cHP01rTc2DDZJYS08tK93GZ4s4SB
	nMqw==
MIME-Version: 1.0
X-Received: by 10.60.131.41 with SMTP id oj9mr4282710oeb.40.1377813861581;
	Thu, 29 Aug 2013 15:04:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 29 Aug 2013 15:04:21 -0700 (PDT)
In-Reply-To: <21550950.hdvkljmBJI@helios>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
	<1419577.68pc7GzaiK@helios>
	<C76898E3-8DF0-4327-9A24-510259D58C39@gmail.com>
	<21550950.hdvkljmBJI@helios>
Date: Thu, 29 Aug 2013 19:04:21 -0300
X-Google-Sender-Auth: 92gZzkSjmAfRVJd2g65yNjnxySw
Message-ID: <CAP9ODKq=xEisqSgnUwSoSbRjv60f7j_trQ_yqP=bo8hw-TbsqQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] busybox: remove bbappend
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
X-List-Received-Date: Thu, 29 Aug 2013 22:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 26, 2013 at 6:53 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 26 August 2013 14:39:10 Khem Raj wrote:
>> On Aug 24, 2013, at 2:47 AM, Paul Eggleton <paul.eggleton@linux.intel.com>
>> wrote:
>> > On Friday 23 August 2013 10:36:15 Khem Raj wrote:
>> >> On Aug 23, 2013, at 4:33 AM, Paul Eggleton
>> >> <paul.eggleton@linux.intel.com> wrote:
>> >>> This bbappend has effectively been merged into OE-Core, although the
>> >>> log buffer size is the busybox default rather than 64K - layers may
>> >>> change this either by providing their own /etc/default/busybox-syslog
>> >>> file (when using systemd) or modifying the
>> >>> CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build time
>> >>> config
>> >>
>> >> I think it would be better if we added this option via a kconfig fragment
>> >> in OE-Core if DISTRO_FEATURES contained systemd and then remove this from
>> >> here. I say this because otherwise size of circular buffer goes back to
>> >> 16k from 64k and may not be enough to hold valuable info.
>> >
>> > Why is this specific to systemd?
>>
>> It probably is not. Otavio added it, so I am CCing him
>> however this is default used in many distros, just to keep enough
>> messages around while you can affort 64K buffer which is not a huge ask
>> these days.
>
> If it's generally useful and not specific to systemd (and it seems it isn't the
> latter) I'd have to say I agree, let's set the default in our busybox
> defconfig.

+1

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

