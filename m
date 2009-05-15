Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christian.glindkamp@taskit.de>) id 1M4scK-0004gk-VH
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 10:18:09 +0200
Received: from localhost.localdomain (port-87-234-225-18.static.qsc.de
	[87.234.225.18])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0MKv5w-1M4sVa2XxI-0001qu; Fri, 15 May 2009 10:11:11 +0200
Received: from christian.taskit.de (unknown [192.168.4.114])
	by localhost.localdomain (Postfix) with ESMTP id AAAB87B742
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 10:09:09 +0200 (CEST)
Date: Fri, 15 May 2009 10:11:09 +0200
From: Christian Glindkamp <christian.glindkamp@taskit.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090515101109.10cde089@christian.taskit.de>
In-Reply-To: <4A0BE509.8010406@gmx.net>
References: <20090514101502.133dd3e0@christian.taskit.de>
	<4A0BE509.8010406@gmx.net>
X-Mailer: Claws Mail 3.7.1 (GTK+ 2.14.4; i486-pc-linux-gnu)
Mime-Version: 1.0
X-Provags-ID: V01U2FsdGVkX19Rt0EPLbQ5LAL/bFBluO2hVbkDL+mVC6HqzRs
	zkK6mHtO6EfBk8Af23QJnh/Mz9jVIeBSuVBEGkOqzF26gusdnY
	6TaDjyJV798OmpCkTjfvQ==
Subject: Re: [PATCH] cacao: add missing patch
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
X-List-Received-Date: Fri, 15 May 2009 08:18:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Robert,

I think this should also go to the stable branch.

Regards,
Christian

On Thu, 14 May 2009 11:31:53 +0200
Robert Schuster <theBohemian@gmx.net> wrote:

> Hi Christian,
> sorry for this glitch. I added the missing file.
> 
> Regards
> Robert
> 
> Christian Glindkamp schrieb:
> > In revision af5fcda66139e002d098c0df952b43c455806aba the patch
> > cacao-disable-stackbase-check.patch was added to SRC_URI of all
> > cacao recipes without committing the patch itself. This patch
> > adds it to make cacao buildable again. The patch comes from the
> > jalimo overlay.
> > 
> > Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
> > ---
> >  .../files/cacao-disable-stackbase-check.patch      |   12 ++++++++++++
> >  1 files changed, 12 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/cacao/files/cacao-disable-stackbase-check.patch
> > 
> > diff --git a/recipes/cacao/files/cacao-disable-stackbase-check.patch b/recipes/cacao/files/cacao-disable-stackbase-check.patch
> > new file mode 100644
> > index 0000000..8eb2089
> > --- /dev/null
> > +++ b/recipes/cacao/files/cacao-disable-stackbase-check.patch
> > @@ -0,0 +1,12 @@
> > +Index: cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c
> > +===================================================================
> > +--- cacao-0.99.3+hg20090109.orig/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:15.000000000 +0100
> > ++++ cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:24.000000000 +0100
> > +@@ -1077,7 +1077,6 @@
> > +       c = stat_buf[buf_offset++];
> > +     }
> > +     close(f);
> > +-    if (result < 0x10000000) ABORT("Absurd stack bottom value");
> > +     return (ptr_t)result;
> > +   }
> > + 
> 
> 




