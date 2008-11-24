Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L4fcH-0001bR-IY
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 18:52:57 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1L4fZS-00017v-Gf
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 17:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 24 Nov 2008 17:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Nov 2008 17:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 24 Nov 2008 18:48:48 +0100
Message-ID: <ggepe0$f3b$2@ger.gmane.org>
References: <f96d234e0811240758l7ac33a24m1d2f90f4f5153346@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
In-Reply-To: <f96d234e0811240758l7ac33a24m1d2f90f4f5153346@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Error, DISTRO_PR has changed (.1 to ) when switching from Angstrom glibc to uclibc
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
X-List-Received-Date: Mon, 24 Nov 2008 17:52:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-11-08 16:58, Cliff Brake wrote:
> I get this when I set ANGSTROM_MODE="uclibc" and restart a build with
> an existing tmp directory created for a glibc build.  I like re-using
> the same tmp directory for mixed glibc/uclibc builds to save
> rebuilding a few packages, but the savings is probably negligible.
> This obviously requires DISTRO_PR to track in glibc and uclibc conf
> files, IE:
>
> diff --git a/conf/distro/include/angstrom-uclibc.inc
> b/conf/distro/include/angstrom-uclibc.inc
> index c26613b..29a50cd 100644
> --- a/conf/distro/include/angstrom-uclibc.inc
> +++ b/conf/distro/include/angstrom-uclibc.inc
> @@ -36,3 +36,5 @@ TARGET_LINK_HASH_STYLE = "-Wl,--hash-style=gnu"
>
>   CXXFLAGS += "-fvisibility-inlines-hidden"
>
> +DISTRO_PR = ".1"
> +
>
> As I not aware how DISTRO_PR is intended to be used, which way do we want to go:
>
> 1) force separate tmp dirs for glibc and uclibc builds?
> 2) keep DISTRO_PR in sync for Angstrom glibc, uclibc, eglibc distros?

3) put DISTRO_PR in angstrom-2008.conf

regards,

Koen



