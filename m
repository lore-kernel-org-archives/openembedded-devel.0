Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P2hg5-00042U-If
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 11:49:53 +0200
Received: by iwn2 with SMTP id 2so6667956iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=PWbusjaXv3fKMhaO95TtCtuvy4EiLSP5xn3sx3g5d9g=;
	b=I4C21QPKO0SfnNb38gq4QP2oQXdyQVsRmndp18gCzgv3GIz8B9lJB/wkZ2VrfNtPuX
	e1P3YPO2q6Ci93wYSUmUGTJCwt/noDNhbNoytQhjVbfCrwWZZOynZWPoCGO9Ey4h+sBA
	rZTbd5ChW7dCwa0sCm/y+tczbj+lj2FCjU43E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PT9kDfir98k9x3yA4zq2hyIxEBQ5+SdkFKd3J88mS6vGcXOuoOshNkIVhgY8OATEWi
	UM8hb7tVfBU98iFj7bMyXv9CEN710zqAnQeaJ7nJ9ALovjTlo34/wg56/wl+yGcmveK4
	u7TDrPLjj0tT146dBzvoNvSv+G6scKWSK3aIE=
MIME-Version: 1.0
Received: by 10.231.167.130 with SMTP id q2mr9898667iby.163.1286185768517;
	Mon, 04 Oct 2010 02:49:28 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 4 Oct 2010 02:49:28 -0700 (PDT)
In-Reply-To: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
References: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
Date: Mon, 4 Oct 2010 11:49:28 +0200
Message-ID: <AANLkTi=OtUEUO=55HLreQSEH32FBYyiTnOOqY0HCVUsu@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
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
X-List-Received-Date: Mon, 04 Oct 2010 09:49:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/4 Jan Paesmans <jan.paesmans@gmail.com>:
> Hello all,
>
> When building an image for one of my devices for the first time,
> bitbake always seems to have a problem with building
> gcc-cross-initial. It has the following error:
>
> | In file included from
> /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/sparseset.c:22:
> | /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/system.h:418:
> error: conflicting types for 'strsignal'
> | /usr/include/string.h:564: note: previous declaration of 'strsignal' was here
>
> However, when I restart the exact same bitbake command, the build
> continues without a problem.
>
> I run massive parallel builds with 8 bitbake threads and make -j 8, so
> I suspect that this has something to do with it. One of the tasks the
> is started before is linux-libc-headers_2.6.31.bb, do_package_stage.
> Could it be that this task hasn't finished yet while the
> gcc-cross-initial needs it?
>
> Regards,
>
> Jan
>

It seems to pick up a header file from the host.
It could also be dependent of glibc-initial or so.
What happens if you build from scratch with 1 thread and -j 1 ?

Frans


