Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KIibQ-0001TL-Dg
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 13:21:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KIiak-0002nE-3O
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 11:21:10 +0000
Received: from wlan142160.mobiel.utwente.nl ([130.89.142.160])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 15 Jul 2008 11:21:10 +0000
Received: from k.kooi by wlan142160.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Jul 2008 11:21:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 15 Jul 2008 13:20:59 +0200
Message-ID: <g5i16r$tb9$1@ger.gmane.org>
References: <d9a6586e0807150126w6ceb8a0aj5a5b6bab4cb42cfc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan142160.mobiel.utwente.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
In-Reply-To: <d9a6586e0807150126w6ceb8a0aj5a5b6bab4cb42cfc@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: help with bitbake recipe
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
X-List-Received-Date: Tue, 15 Jul 2008 11:21:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Shawn Rutledge wrote:
> I'm trying to build some Chicken Scheme ipk's for OpenMoko.  It's
> making them, but putting some docs in the main package, and not enough
> stuff in the chicken-doc package.  Judging from other bb files it
> looks like the thing to do is something like this, at the end:
>
> FILES_chicken-doc = "${prefix}/share/chicken/doc ${prefix}/share/info
> ${prefix}/share/man"
>
> or maybe
>
> FILES_${PN}-doc = "${prefix}/share/chicken/doc ${prefix}/share/info
> ${prefix}/share/man"

Try altering FILES_${PN}, since that gets packages before ${PN}-doc

>
> However that's not taking effect:
>
> /var/media/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/chicken-3.3.0-r0
> [neutron][01:08:10 AM] grep -r FILES_chick * 2>/dev/null
> staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken:FILES_chicken:
> /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc /usr/com
> /var /bin/* /sbin/* /lib/*.so* /usr/share/chicken /usr/lib/chicken/*
> /usr/share/pixmaps /usr/share/applications /usr/share/idl
> /usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers
> staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-dbg:FILES_chicken-dbg:
> /usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug /usr/lib/.debug
> /bin/.debug /sbin/.debug /lib/.debug /usr/lib/chicken/.debug
> /usr/lib/matchbox-panel/.debug
> staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-dev:FILES_chicken-dev:
> /usr/include /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.a /usr/lib/*.o
> /usr/lib/pkgconfig /lib/*.a /lib/*.o /usr/share/aclocal
> staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-doc:FILES_chicken-doc:
> /usr/share/doc /usr/share/man /usr/share/info /usr/share/gtk-doc
> /usr/share/gnome/help
> staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-locale:FILES_chicken-locale:
> /usr/share/locale
>
> I keep trying by doing
> bitbake -vD chicken -c rebuild

bitbake -b chicken_3.3.0.bb -c install -f ; bitbake -b chicken_3.3.0.bb 
-c package_write

regards,

Koen



