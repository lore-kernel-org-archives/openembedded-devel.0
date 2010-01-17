Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NWVLj-0003yj-NU
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 14:39:30 +0100
Received: by pxi9 with SMTP id 9so1532400pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 05:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=WuPvBN1hUHaUTSrPjyB3QRXMBlJD9g18yeinUNsahSw=;
	b=pDjg1AyOAe5B9saZbgzxwcGwEK8Akg90m7iLi9fEsiUAS6CgBQJSv3GjGGryqbItLF
	JKOaT7v0YDO0WndVHOqg3W1+fxT4ygHXZm06XzFU9OshsKPROwG5BhQVXYffivRXqlni
	j/4wE5ttqq7CwQyARKdJSfwWehFuGd/xsWt6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=d5HsGco819BugA2hJtfk9C/97+5y7gC4wJviP2pniGZA6eEtHzHhB12oPR0Fj48jea
	r3wHkrvaPLHXEhXp06gQwGW0s2CEghD9/TmM7nH75jAZBki/ZGJq9M2RWUXaw/qeRanq
	2V6++vjPsnUVOzrJfCWmmZ0KgcZ2N3GzASzFI=
Received: by 10.142.2.38 with SMTP id 38mr3304203wfb.94.1263735433108;
	Sun, 17 Jan 2010 05:37:13 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.105.23])
	by mx.google.com with ESMTPS id 21sm3362252pzk.7.2010.01.17.05.37.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jan 2010 05:37:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263733818-32111-1-git-send-email-camelguo@gmail.com>
	<201001171430.39964.holger+oe@freyther.de>
Date: Sun, 17 Jan 2010 21:37:02 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6oir0rqmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001171430.39964.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Set preferred glibc to 2.10.1 in conf/distro/micro.conf
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
X-List-Received-Date: Sun, 17 Jan 2010 13:39:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 17 Jan 2010 21:30:39 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Sunday 17 January 2010 14:10:18 Guo Hongruan wrote:
>> * the preferred version of binutils of conf/distro/micro.conf is 2.19=
.51
>> * the preferred version of glibc is 2.6.1 which is defined in
>>  sane-toolchain.inc * the ld produced by binutils-2.19.51 reports tha=
t  =

>> it
>>  can not find the __begin symbol when linking with glibc-2.6.1
>
> It would be really great if you could start to read emails too.
>
> So now we now two ways to cure the symptoms but we have no idea about =
the
> underlying root cause.
>
> Is it too much to ask what the actual error is? The __begin reminds me=
  =

> of a
> bug in the linker script Khem was pointing out?


I guess you are using latest binutils. There has been changes in ld
which surfaced this issue. So either you could switch back to using
older binutils like 2.18 or something. Or you could also port the patch
recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch

That's the cause of the building failure. I think it is better to use th=
e  =

newer version of glibc that to port the patch to glibc-2.6.1


>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


