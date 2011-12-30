Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RggYB-0008S7-VG
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 18:47:28 +0100
Received: by eeit10 with SMTP id t10so8813216eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 09:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=oLGiFv+jHdRUmMIB1d4Qi4B+X/PIow8Q/pp3jALmkXI=;
	b=d8DwwIE4PHfoCBtt9cbI9DDZ9FMsk0sSYfZ42PiHDeDjTlXWVV2YW1A0lb4kjbiAb9
	vDCGq99vnXuPBPbM7yjdM+YQaYvj5851fdtrIxZoHU1YHkPehoQmT7h59pXzdKxwxJUR
	N4E5X4vbT1wFkXz8ugLtEgdr+gmrblLgEpOH8=
MIME-Version: 1.0
Received: by 10.205.136.205 with SMTP id il13mr9382236bkc.37.1325266811293;
	Fri, 30 Dec 2011 09:40:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Fri, 30 Dec 2011 09:40:11 -0800 (PST)
In-Reply-To: <jdksmv$83n$1@dough.gmane.org>
References: <cover.1325263010.git.otavio@ossystems.com.br>
	<jdksmv$83n$1@dough.gmane.org>
Date: Fri, 30 Dec 2011 15:40:11 -0200
X-Google-Sender-Auth: bm8pVCBzhPu4VoHlq8NuQiY3Ml8
Message-ID: <CAP9ODKrwPeDTXoi-KxOWs3s_HcoX8n-F4WB7PYCc8m99hEVK+g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v3 0/3] Move xserver-nodm-init systemd support to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 17:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 30, 2011 at 15:34, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Still missing a few:
>
> koen@dominion:/OE/tentacle/sources/openembedded-core$ for i in ../* ; do
> echo $(basename $PWD); git grep xserver-nodm-init | grep -v
> distro_tracking_fields ; cd $i ; done
> openembedded-core
> meta/conf/multilib.conf:BBCLASSEXTEND_append_pn-xserver-nodm-init = "
> ${MULTILIBS}"
> meta/recipes-sato/tasks/task-core-x11.bb:# elsa, xserver-nodm-init
> meta/recipes-sato/tasks/task-core-x11.bb:
> VIRTUAL-RUNTIME_graphical_init_manager
> ?= "xserver-nodm-init"
>

This is OE-Core ...


> ...

recipes-images/angstrom/efl-nodm-image.bb:    xserver-nodm-init \
>

I don't use angstrom, sorry.
 ...
  meta-efl/recipes-efl/efl/elsa_svn.bb:RCONFLICTS_${PN} +=
"xserver-nodm-init"

> meta-efl/recipes-efl/efl/elsa_svn.bb:RREPLACES_${PN} +=
> "xserver-nodm-init"
> meta-efl/recipes-efl/efl/elsa_svn.bb:RCONFLICTS_${PN}-systemd +=
> "xserver-nodm-init"
> meta-efl/recipes-efl/efl/elsa_svn.bb:RREPLACES_${PN}-systemd +=
> "xserver-nodm-init"
> meta-oe/recipes-core/tasks/task-x11_1.0.bb:# elsa, xserver-nodm-init
> meta-oe/recipes-core/tasks/task-x11_1.0.bb:
> VIRTUAL-RUNTIME_graphical_init_manager
> ?= "xserver-nodm-init"
>

Fixed on this patchset.


> meta-openpandora
> meta-shr
> meta-smartphone
> meta-shr/conf/distro/shr.conf:VIRTUAL-RUNTIME_graphical_init_manager =
> "xserver-nodm-init"
> meta-ti
> recipes-misc/images/cloud9-gfx-image.bb:
>  xserver-nodm-init \
> meta-xilinx
> koen@dominion:/OE/tentacle/sources/openembedded-core$
>

Meta-TI and Meta-SHR isn't on my business too ... sorry.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

