Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1P2jL3-0004Os-NE
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 13:36:15 +0200
Received: by eyb7 with SMTP id 7so1729220eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Xa3BmJqvMr4B/W6lcSR01VTcUynMt/1mbO+Hl4WkAD0=;
	b=w1ksOXKgtTKxKZaewankRe19/F6e5nbtsN81np+T2xfA3YfHlN5fLK9I69FD8ajVHN
	bkMHSKj3fIphgbKJ9dRwtzZbCOPTNi7nzHbiR0MK72jH4B1uSqMxlg/5wRdtfchxXKXJ
	xd4iddAuceIjJDUUuHpF/Ar1pQ/FQWui9ykpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IyRtXiIhjwnhzSpgyx38sl5bLVw2/W/o6ax6mZSqkUNI21ksmbmJFKB4U0cNxvN9Q+
	MS6tHPMdY+0u7TuQI9aRmyVF4SGpazIMNMdD51/ucMemYcIrR8w89rqyMEi2/+8D1Y+e
	tizsPC4mmq3pJ76nDG/gkeKnGscIegw7h9NsQ=
MIME-Version: 1.0
Received: by 10.213.82.11 with SMTP id z11mr8111191ebk.29.1286192157157; Mon,
	04 Oct 2010 04:35:57 -0700 (PDT)
Received: by 10.213.17.74 with HTTP; Mon, 4 Oct 2010 04:35:57 -0700 (PDT)
In-Reply-To: <AANLkTi=OtUEUO=55HLreQSEH32FBYyiTnOOqY0HCVUsu@mail.gmail.com>
References: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
	<AANLkTi=OtUEUO=55HLreQSEH32FBYyiTnOOqY0HCVUsu@mail.gmail.com>
Date: Mon, 4 Oct 2010 13:35:57 +0200
Message-ID: <AANLkTim7VY0uUKb_uu42n3gFw-37ozVC4KOM=6NzsGec@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
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
X-List-Received-Date: Mon, 04 Oct 2010 11:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 4, 2010 at 11:49 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/4 Jan Paesmans <jan.paesmans@gmail.com>:
>> Hello all,
>>
>> When building an image for one of my devices for the first time,
>> bitbake always seems to have a problem with building
>> gcc-cross-initial. It has the following error:
>>
>> | In file included from
>> /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/sparseset.c:22:
>> | /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/system.h:418:
>> error: conflicting types for 'strsignal'
>> | /usr/include/string.h:564: note: previous declaration of 'strsignal' was here
>>
>> However, when I restart the exact same bitbake command, the build
>> continues without a problem.
>>
>> I run massive parallel builds with 8 bitbake threads and make -j 8, so
>> I suspect that this has something to do with it. One of the tasks the
>> is started before is linux-libc-headers_2.6.31.bb, do_package_stage.
>> Could it be that this task hasn't finished yet while the
>> gcc-cross-initial needs it?
>>
>> Regards,
>>
>> Jan
>>
>
> It seems to pick up a header file from the host.
> It could also be dependent of glibc-initial or so.
> What happens if you build from scratch with 1 thread and -j 1 ?

Then it works. I'll try checking the dependencies for glibc-initial.

Jan
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


