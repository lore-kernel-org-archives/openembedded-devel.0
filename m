Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NfCOO-00028B-N2
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 14:14:11 +0100
Received: by bwz26 with SMTP id 26so1124568bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 05:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=pK07tg0E9Q/o9549rGGqtKeggTD4s+3pI3fqs8S/A8o=;
	b=P6+UPHpBkhJ9IzMESFM8P9x8+Cs/cyi5gwYgXQL782GxyJ3A2EmXwZchNH1Mt0SVig
	c94AieG6L0s6+YK+kTZSs15+I65ZL9kth1pOwYqQvxTZahzrs0XGRbeWthlVkILvtDp1
	QqgJji+IcjIcPSfPCJko9SSJCX4F1LHGieR/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oKNyooNHmViMAyRazv3GK8b077O+ucwPgZtXKxqxq6nS5x6f/jPB4ykqfNEig13zNx
	6GtW+L6iDtlpCnhYlllLbzkfgx2Irv024Bp/RUJBBNWGrey5SPLk8bQDus/ow/IvoWZW
	iQ5PA4s84J2pA6Wb1z0Ekq9PrY2WPbQIr3/Ow=
Received: by 10.102.235.8 with SMTP id i8mr200278muh.31.1265807493367;
	Wed, 10 Feb 2010 05:11:33 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e8sm7067902muf.35.2010.02.10.05.11.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 05:11:31 -0800 (PST)
Date: Wed, 10 Feb 2010 14:11:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100210131122.GB3378@jama>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-4-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-5-git-send-email-Martin.Jansa@gmail.com>
	<hkgqat$53c$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hkgqat$53c$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 4/6] pixman: add version 0.17.4 with neon patches
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
X-List-Received-Date: Wed, 10 Feb 2010 13:14:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2010 at 11:02:07AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> This one fails to build for armv7a with some weird libtool problem

Does that error look like:

/bin/sh ../arm-oe-linux-gnueabi-libtool --tag=CC   --mode=link arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t -mthumb-interwork -mthumb  -isystem/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall -fno-strict-aliasing -fvisibility=hidden  -L/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib -Wl,-rpath-link,/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu -o gradient-test gradient-test.o gtk-utils.o -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lglib-2.0   -L.. ../pixman/libpixman-1.la
arm-oe-linux-gnueabi-libtool: link: cannot find the library `/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la' or unhandled argument `/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la'
make[2]: Leaving directory `/home/projects/OE/tmpdir-dev-shr/work/armv4t-oe-linux-gnueabi/pixman-0.17.4-r1/pixman-0.17.4/test'

If yes than it's because
-lpangocairo-1.0 -lcairo from GTK_LIBS have /home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la 
in their own .la files and this way it creates circular dependency, which fails when armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la
is removed during upgrade.

Removing those 2 libs from GTK_LIBS works as well as removing libpixman-1.la reference from their staged .la files.

Please advise how to fix it properly.

BTW: this is not new issue with 0.17.4, I had that before (and tried to resolve it with latest cleanup of old libpixman-native recipes)

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


