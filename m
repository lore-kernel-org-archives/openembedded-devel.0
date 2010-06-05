Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKmSD-0004bP-EB
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 08:02:01 +0200
Received: by fxm9 with SMTP id 9so1227061fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gfrSkahHAVrq8oIVcJfm/4mXoF8pVwHu6jraAQ8Vtwo=;
	b=SAI5y2kO9XKqPrkZBDGDrSd1JnPF6I6bB0giZmnUunGLaTYhXHjSLJR/jn/UxgTAv9
	eRh07GINQQVTUbIivx8NznAmJJc9jj7FuW68zYCEADvcJrs2OCCltz46BPh1hrZhRqTm
	drTfWLN8DwrcwpRU87n0bbr/diM/3HX4HipL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vy5gmf23bTGtSmCNGqWZACuyEeQyfezIjA7txP668v1VE4rW7IlfKP+KQKOHSo7Ywr
	ov3s+o7uNrte9xREo/QS7DqJyLUkmqv2ExX/dqxw9kCOSPeJmuTCf/X/FtdBiUGwaS3T
	0swt8cJeJvpL/w7TlHIJdF+QxnDRs6bsqIkr4=
Received: by 10.223.24.133 with SMTP id v5mr12679874fab.46.1275717459904;
	Fri, 04 Jun 2010 22:57:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm8831044far.6.2010.06.04.22.57.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 22:57:39 -0700 (PDT)
Date: Sat, 5 Jun 2010 07:57:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100605055722.GR16035@jama>
References: <A24693684029E5489D1D202277BE89445316FB43@dlee02.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <A24693684029E5489D1D202277BE89445316FB43@dlee02.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: We need newer ncurses Was: Host Environment affect on target builds
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
X-List-Received-Date: Sat, 05 Jun 2010 06:02:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 04, 2010 at 08:19:13PM -0500, Ambrose, Martin wrote:
> Hello.
> 
> I don't really understand why some recipes depend on the host environment.
> 
> For example, on my Fedora 12 machine I have:
>     $ yum info ncurses-devel | grep Release
>     Release    : 3.20090207.fc12
>     $ ncurses5-config --libs
>     -lncurses
> 
> And on my Fedora 13 machine this is a bit newer
>     $ yum info ncurses-devel | grep Release
>     Release    : 7.20100130.fc13
>     $ ncurses5-config --libs
>     -lncurses -ltinfo
> 
> The newer version lists tinfo library in addition to ncurses. Don't know why but OK.
> The problem is the configure (autoconf) portion of recipes (here alsa-utils) uses this executable
> to determine library linkage dependencies. So I get a build error even though this is for the target (here arm).
>     /opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -ltinfo
> 
> This seems counter intuitive to me. Is this expected? Or maybe I missed something in setting up my OE environ.

It's not expected and it shouldn't use ncurses*5-config from host, but
from ncurses-native. But for some reason ncurses-native_5.4.bb does not
stage ncurses*5-config and then alsa-utils-1.0.20/configure.in
AC_CHECK_PROG([ncursesw5_config], [ncursesw5-config], [yes])
finds ncurses5-config from your host instead of from staging..

According to ncurses-5.6/ANNOUNCE it's available in 5.6 and newer.

So to fix this, we need newer ncurses/ncurses-native in OE, or hack
configure.in to ignore ncurses5-config ncursesw5-config..

BTW: 5.4 is >6years old, 5.7 ~2years old (latest)

Is someone already working on newer ncurses recipes?

Regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


