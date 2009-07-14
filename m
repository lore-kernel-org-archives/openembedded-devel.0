Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MQoHd-0003YJ-Rq
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 22:07:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MQo4k-0006M4-Fh
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 19:54:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 19:54:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 19:54:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 14 Jul 2009 21:53:51 +0200
Message-ID: <h3inof$jm9$1@ger.gmane.org>
References: <1247599483.7178.11.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <1247599483.7178.11.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] glibc: install correct stubs (fixes midori crash)
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
X-List-Received-Date: Tue, 14 Jul 2009 20:07:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-07-09 21:24, Stanislav Brabec wrote:
> Attached patch prevents overwriting of a real stub include file by a
> dummy stub file. Patch is tested only with the latest glibc from the
> angstrom.
>
> Dummy stub include causes mis-compilation of undefined number of
> packages, increment of DISTRO_PR may be considered as useful.
>
> I am not sure, why this line was there. Correct stub file is generated
> by make install, at least in the current version of glibc.
>
> --- a/recipes/glibc/glibc-stage.inc
> +++ b/recipes/glibc/glibc-stage.inc
> @@ -8,7 +8,6 @@ do_stage() {
>   	install -d ${STAGING_INCDIR}/gnu \
>   		   ${STAGING_INCDIR}/bits \
>   		   ${STAGING_INCDIR}/rpcsvc
> -	install -m 0644 ${S}/include/gnu/stubs.h ${STAGING_INCDIR}/gnu/
>   	install -m 0644 ${B}/bits/stdio_lim.h ${STAGING_INCDIR}/bits/
>   	install -m 0644 misc/syscall-list.h ${STAGING_INCDIR}/bits/syscall.h
>   	for r in ${rpcsvc}; do
>
> Review of compilation logs shows that at least following packages are
> referring stub functions: glib-2.0, coreutils, module-init-tools,
> openssh, rsync, e2fsprogs, libpcap, pth, python, rxvt-unicode, tar,
> tcpdump.
>
> Example of mis-compiled package:
>
> midori fails due to GIO mis-compilation. GIO (glib-2.0) incorrectly
> thinks, that inotify_init1 is implemented. But it is not true on systems
> compiled with kernel headers<  2.6.27. GIO fails to initialize change
> notification, which normally never happens.
>
> Note:
>
> Kernel added several new functions since 2.6.23 (e. g. inotify_init1).
> It would be nice to reflect it somehow: update linux-libc-headers and
> either keep minimal supported kernel in the build as low as possible
> (makes a bit slower glibc), move affected packages from platform to
> machine feeds or create different repos with different minimal kernel
> version. What do you think about it?

Apply the patch, bump glibc PR and angstrom distro PR.

regards,

Koen



