Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1RtLDf-0002sW-JI; Fri, 03 Feb 2012 16:38:35 +0100
Received: by lahc1 with SMTP id c1so1874045lah.6
	for <multiple recipients>; Fri, 03 Feb 2012 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=bZjEvC59vM6leJa3k00IoUakBR5q8gHbowcbnuZTDCs=;
	b=NyDsbTMfDGFODmGi8Xbc2h1hhsWYualWgynvhIRGc5cGB0qJ4mEltn9tvJc4cZxQ9x
	XI+4ClAk0HdPkL2OStOo8mU/0XgkJIfgU/xdSXO9ckkAV8nKVf12f8G+Yiv4fKIe8KTb
	jDBNoo26qHpF/n8TkN/au3h97Kht/29NkQ7Xo=
MIME-Version: 1.0
Received: by 10.152.114.169 with SMTP id jh9mr3918456lab.20.1328283037520;
	Fri, 03 Feb 2012 07:30:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Fri, 3 Feb 2012 07:30:37 -0800 (PST)
In-Reply-To: <20120203131451.GJ3893@jama.jama.net>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
Date: Fri, 3 Feb 2012 13:30:37 -0200
X-Google-Sender-Auth: 5eNbFFlN3crXFaaFtJAY8fh-gfc
Message-ID: <CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Fri, 03 Feb 2012 15:38:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 3, 2012 at 11:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> Can we move this only to packages which are really depending on systemd
> compiled?
>
> I have use-case where
> small cpio image has busybox
> busybox depends on systemd just because of this
> systemd depends on kernel (because RRECOMMENDS on modules)
> kernel depends on that cpio image which is used as ramdisk
>
> So in order to finish cpio.do_rootfs I have to finish kernel and kernel
> fails to build because doesn't have cpio available yet (DEPENDS = "cpio"
> is not enough because doesn't need do_rootfs to finish AFAIK).
>

I understand your use case but it seems in this case you ought to override
it in a bbappend. It doesn't seems right as this is the exception, not the
rule. If we don't depends on it, we can end with the binaries being not
available in case a rootfs generation.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

