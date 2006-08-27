Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GHFPQ-00089V-AM
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Aug 2006 09:50:22 +0200
Received: by py-out-1112.google.com with SMTP id i75so1675655pye
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2006 00:48:28 -0700 (PDT)
Received: by 10.35.109.2 with SMTP id l2mr9390080pym;
	Sun, 27 Aug 2006 00:48:28 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Sun, 27 Aug 2006 00:48:28 -0700 (PDT)
Message-ID: <74d0deb30608270048t1098d042ne95ed5df666fae7a@mail.gmail.com>
Date: Sun, 27 Aug 2006 09:48:28 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <44F0AD2B.1010401@free.fr>
MIME-Version: 1.0
References: <44F06A3D.8030102@free.fr> <44F0AD2B.1010401@free.fr>
Subject: Re: sysvinit-2.86 fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Aug 2006 07:50:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/26/06, Mohammed Amine SAYA <amine.saya@free.fr> wrote:
> Mohammed Amine SAYA wrote:
> > I got this :
> >
> >  ln:
> > `/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/at91sam9261-linux/sysvinit-2.86-r28/image/etc/rc2.d/S99stop-bootlogd':
> > File exists
> >
> > I tried to fix it in sysvinit-2.86.bb file but with no success.
> > I tried to replace ln -s ../init.d/stop-bootlogd
> > ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd with ln -sf ....
> > but It doesn't work either. I mean It builds successfully but
> > tmp/work/at91sam9261-linux/sysvinit-2.86-r28/image/etc/ is empty !!!
> >
> Hi all,
>
> As I said before, sysvinit don't build successfully so I replaced
>
> ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
>
> with
>
> ln -sf ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
>
>
> But I am not sure that is the right way ? Any comment on this workaround please ?

I think the problem lies here:

NOTE: package sysvinit-2.86-r28: task do_install: started
NOTE: package sysvinit-2.86-r28: task do_install: completed
NOTE: package sysvinit-2.86-r28: task do_package: started
ERROR: function do_install failed

PACKAGEFUNCS in package.bbclass contains do_install as first element,
so do_install is run twice. After removing do_install from
PACKAGEFUNCS, installation works fine.

regards
Philipp


