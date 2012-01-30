Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RrrHQ-0005bP-Cm
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 14:28:22 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=L+C+p+R1+dATIwjXjjWWmftG+YdVEaVzSPWw5xv92783NXkws0qzhWgX
	osVkMPLTVFm+qDWFjEKLmWqLH7B91FCCRaMrPs9mHnkdoNvG0L/N4vDgS
	uUWWRljKKddKdp4FLwydYQxR8QDQ8Z02PPraYxwLJt2zeohPlgb4x4Bvu
	r8ONusWknMelBUQnfvaWTWn8/ZQmoLBiJ7QSTCsG5MpRxpz4pZJTLzlqf
	KVv7hQY7QLdWiOCci/9/cJlmExYnn;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1327929630; x=1359465630;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=hsPOe9rBs4RgVflTal7ObJ1VCTgtBQm2QUtK1z/ryLY=;
	b=C3AAoJ/khJ0RDTzFHVwU7FMuIQ2rQ000EjuMbhAPUdDoV4w7joEjFlOP
	j8+FYgfXktC7UPcOr1XYhy0b2KjaQouEPLDk6FiF8BPVjGdwcdHdZaKD0
	OdUiXZ2Rv4GcKwOXcEQ/vt/Wq0uqVhd0LP4Di5prRRrR4z62rH/UB6FOq
	w/qM2hlFFirViwYxYwgckOBnvuZLK+Rk4Uw+NEGCP4XEONHy4jUb+W7VT
	LNWsvWPF1IHu10+IWffCmhLP7tGel;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,591,1320620400"; d="scan'208";a="84836977"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 30 Jan 2012 14:19:24 +0100
X-IronPort-AV: E=Sophos;i="4.71,591,1320620400"; d="scan'208";a="127978342"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 30 Jan 2012 14:19:25 +0100
Message-ID: <4F2698DC.8050607@ts.fujitsu.com>
Date: Mon, 30 Jan 2012 14:19:24 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: oe-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: xterm-recipe has erros in do_configure
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
X-List-Received-Date: Mon, 30 Jan 2012 13:28:22 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

When trying to bitbake the xterm_277 recipe from scratch (empty build
direcotry) I get errors form the do_qa_configure skript that says:

ERROR: This autoconf log indicates errors, it looked at host include
and/or library paths while determining system capabilities.

Probably one of those lines from the logfile is causing this error:
checking for a BSD compatible install... /usr/bin/install -c
checking for xterm... /usr/bin/xterm
checking for X... libraries
/srv/oe-core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/dm814x-evm/usr/lib,
headers
/srv/oe-core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/dm814x-evm/usr/include
checking for pkg-config...
/srv/oe-core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
checking for freetype-config... /usr/bin/freetype-config
checking for FreeType config... /usr/bin/freetype-config
checking for /usr/bin/freetype-config cflags... -I/usr/include/freetype2
checking for /usr/bin/freetype-config libs... -lXft -lfreetype -lz

BTW: I tried to bitbake xterm on another system that had already a
filled build directory. Here we don't get the configure errors, but then
errors during building because it has problems with symbols in fontconfig.

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html


