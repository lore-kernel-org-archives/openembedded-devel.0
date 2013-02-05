Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2jmt-0007ib-4R
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 15:46:25 +0100
Received: by mail-oa0-f51.google.com with SMTP id h2so208404oag.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Ottxf5vemfYTCHlMx3f8IeVd5E+/CynxxxYuDmCE/Rs=;
	b=pyuOxjLdFZj5a6oMzKqJpOaBJnmO+0lU8dQaNfdb2OBxtuijMGLypEBEuBeWGesKPi
	Ke0DGc4yBXbOjH/2Ud0rCWaV5We5XU6/HVFGPA3s7AO4lk6Va/LqyRb1EX2YVqALFitd
	nUvODjVR5vP6vX0rIZFv2jNBnKQ+AATVsH1KcSXWW4W9LCVMSj4PtdeBA74AxQGNnKlo
	aLGlPZTWjpLUY8qQzy6asHcOltBbxa+gRgnXoAi0fCJ3sSxx8zIzcaE2FIeUbSNhahYn
	p8+lzp7xf5QkPRtifkm4GxGP18030PIaXnijFX5a2fhh/6kHd9fyqMY4iNt9M3efvU/d
	kx4g==
MIME-Version: 1.0
X-Received: by 10.182.38.69 with SMTP id e5mr18498776obk.79.1360074629014;
	Tue, 05 Feb 2013 06:30:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 06:30:28 -0800 (PST)
In-Reply-To: <20130205101312.GG3271@jama>
References: <1359998364-9245-1-git-send-email-otavio@ossystems.com.br>
	<20130205101312.GG3271@jama>
Date: Tue, 5 Feb 2013 12:30:28 -0200
X-Google-Sender-Auth: n-hzCw-7a9nmFg0wAnAtrl7vgyk
Message-ID: <CAP9ODKp0-iwtJhuJKUxQ49-YxqtWKgEs+Drcsrge+kD5kNTh4A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] samba: Split libnss-winbind package
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
X-List-Received-Date: Tue, 05 Feb 2013 14:46:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 8:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Feb 04, 2013 at 03:19:24PM -0200, Otavio Salvador wrote:
>> This allows for applications to resolv wins without the winbindd and
>> sambad.
>
> Is this for master?
>
> 2013-02-05 11:09:04 URL:http://patchwork.openembedded.org/patch/44029/mbox/ [2894] -> "pw-am-44029.patch" [1]
> Applying: samba: Split libnss-winbind package
> error: patch failed: meta-oe/recipes-connectivity/samba/samba-basic.inc:36
> error: meta-oe/recipes-connectivity/samba/samba-basic.inc: patch does not apply
> Patch failed at 0001 samba: Split libnss-winbind package
> The copy of the patch that failed is found in:
>    /OE/meta-openembedded/.git/rebase-apply/patch
> When you have resolved this problem, run "git am --resolved".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> Looks almost the same as:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/043763.html

Sorry; I sent v2 which applies properly in master.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


