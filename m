Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1KElyj-0006EA-3p
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jul 2008 16:09:37 +0200
Received: by wf-out-1314.google.com with SMTP id 23so1337291wfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2008 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=n1WPOYZ2pOzJiZNLNrxmpBECRN9uQf+tf/kcdKNzk3I=;
	b=Mn6YJsQ2H8/2q5wy6Cy9jTIYM/ZLtRKGxtXQaiwHN7yDNSLNGqFeKkf63FWymzcveB
	zSwUx21gJtgeoOV6yfLLAkjl67cS7ioJRXKBK/Ua3G3/IVUPpWEnzktzy8SIe5JD4CE5
	XIr/hdzAhaB7YvTKIbUsDq3qezPyN4D850Wd0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=jddO/Yann83F4fc793x6aPr3ZxZcP1GVuXbP9M22ETMP5qN7/l1GekmHERo4ydom9h
	PjIMeWMKN33VGVY2hnd5iaKMidAaVQgcJJGtFEeg1C9qqrS3TGenQCQ6eg3q3/jgvklG
	MzI/QioQliYxFHoVaB4davTJF0knGKpebZ1xg=
Received: by 10.142.43.7 with SMTP id q7mr260478wfq.11.1215180363400;
	Fri, 04 Jul 2008 07:06:03 -0700 (PDT)
Received: by 10.143.188.9 with HTTP; Fri, 4 Jul 2008 07:06:03 -0700 (PDT)
Message-ID: <bdb0025f0807040706x79f8dbc7m2dfab72ed6fea0f5@mail.gmail.com>
Date: Fri, 4 Jul 2008 11:06:03 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <486DEE07.3060301@unitb.de>
MIME-Version: 1.0
References: <486DEE07.3060301@unitb.de>
Cc: openembedded-issues@lists.openembedded.org
Subject: Re: Bitbake.conf issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 04 Jul 2008 14:09:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

have you set the BBPATH correctly?
I mean export BBPATH=/home/somewhere/:/home/somewhere/openembedded.org
where conf/bitbake.conf is in one of these directories.

On Fri, Jul 4, 2008 at 6:31 AM, Jan Friderici <jan.friderici@unitb.de> wrote:
> Hello,
>
> every time I try tu run bitbake it complains that it can not read
> bitbake.conf. An strace shows that bitbake reads bitbake.conf (in
> or.openembedded.dev) without any problem but still complains about a missing
> bitbake.conf. Any help would be appreciated! Im running bitbake in an vmware
> using ubuntu 8.04.
>
> regards, Jan
>
>
> unitb@unitb-desktop:/opt/oe/build$ bitbake -D -D  nano
> DEBUG: CONF reading /opt/oe/org.openembedded.dev/conf/bitbake.conf
> DEBUG: update_data()
> DEBUG: update_data()
> DEBUG: CONF file 'conf/site.conf' not found
> DEBUG: CONF file 'conf/auto.conf' not found
> DEBUG: CONF including /opt/oe/build/conf/local.conf
> DEBUG: CONF file 'conf/build/i686-linux.conf' not found
> DEBUG: CONF file 'conf/target/sh4-linux.conf' not found
> DEBUG: CONF file 'conf/machine/${MACHINE}.conf' not found
> DEBUG: CONF including
> /opt/oe/org.openembedded.dev/conf/distro/angstrom-2008.1.conf
> DEBUG: BB conf/distro/include/sane-srcdates.inc: handle(data, include)
> DEBUG: BB conf/distro/include/sane-srcrevs.inc: handle(data, include)
> DEBUG: BB conf/distro/include/angstrom-2008-preferred-versions.inc:
> handle(data, include)
> DEBUG: BB conf/distro/include/preferred-gpe-versions-2.8.inc: handle(data,
> include)
> DEBUG: BB conf/distro/include/preferred-e-versions.inc: handle(data,
> include)
> DEBUG: BB conf/distro/include/preferred-xorg-versions-X11R7.3.inc:
> handle(data, include)
> DEBUG: BB conf/distro/include/angstrom.inc: handle(data, include)
> DEBUG: update_data()
> DEBUG: BB conf/distro/include/angstrom-glibc.inc: handle(data, include)
> DEBUG: BB conf/distro/include/angstrom-package-ipk.inc: handle(data,
> include)
> DEBUG: update_data()
> DEBUG: CONF including /opt/oe/org.openembedded.dev/conf/documentation.conf
> DEBUG: CONF including /opt/oe/org.openembedded.dev/conf/sanity.conf
> DEBUG: update_data()
> DEBUG: BB classes/base.bbclass: handle(data, include)
> DEBUG: BB :0: inheriting classes/patch.bbclass
> DEBUG: BB classes/patch.bbclass: handle(data, include)
> DEBUG: BB :0: inheriting classes/siteinfo.bbclass
> DEBUG: BB classes/siteinfo.bbclass: handle(data, include)
> DEBUG: BB classes/packaged-staging.bbclass: handle(data, include)
> DEBUG: BB classes/debian.bbclass: handle(data, include)
> DEBUG: BB classes/multimachine.bbclass: handle(data, include)
> DEBUG: BB classes/sanity.bbclass: handle(data, include)
> DEBUG: BB classes/devshell.bbclass: handle(data, include)
> DEBUG: BB classes/angstrom-mirrors.bbclass: handle(data, include)
> DEBUG: BB classes/insane.bbclass: handle(data, include)
> DEBUG: BB :0: inheriting classes/package.bbclass
> DEBUG: BB classes/package.bbclass: handle(data, include)
> DEBUG: BB classes/testlab.bbclass: handle(data, include)
> DEBUG: BB classes/package_ipk.bbclass: handle(data, include)
> DEBUG: BB classes/sanity.bbclass: handle(data, include)
> DEBUG: Using '/home/unitb/.bitbake/.persist/bb_persist_data.sqlite3' as the
> persistent data cache
> DEBUG: Clearing SRCREV cache due to cache policy of: clear
> ERROR: Unable to open conf/bitbake.conf
>
>
> --
> Jan Friderici
> Entwicklung
> ______________________________
> u n i t b  t e c h n o l o g y
> brunnenstr. 153
> 10115 berlin
>
> fon     +49/30 - 443 192 17
> fax     +49/30 - 443 192 29
> www     http://www.unitb.de
> mail    jan.friderici@unitb.de
> skype    jfr_unitb_de
>
>
>
> _______________________________________________
> Openembedded-issues mailing list
> Openembedded-issues@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-issues
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


