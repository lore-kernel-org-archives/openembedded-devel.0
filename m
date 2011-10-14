Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1REiOU-0005oh-QO
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 16:05:50 +0200
Received: by bkat8 with SMTP id t8so2013758bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 07:00:05 -0700 (PDT)
Received: by 10.204.145.28 with SMTP id b28mr6907610bkv.76.1318600805460;
	Fri, 14 Oct 2011 07:00:05 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id u10sm8599753bkv.3.2011.10.14.07.00.04
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 07:00:04 -0700 (PDT)
Message-ID: <4E984064.3010306@dresearch-fe.de>
Date: Fri, 14 Oct 2011 16:00:04 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.3.2
Cc: Dirk Nilius <nilius@dresearch-fe.de>
Subject: postinst problem: module vs. update-rc.d
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
X-List-Received-Date: Fri, 14 Oct 2011 14:05:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have a problem with a package that needs to install a kernel module and an initscript.

The recipe contains

  inherit module update-rc.d

The generated postinst script is

  #!/bin/sh
  if [ -n "$D" ]; then
        exit 1
  else
        depmod -a 2.6.24.7
        update-modules || true
  fi
  if test "x$D" != "x"; then
        OPT="-r $D"
  else
        OPT="-s"
  fi
  update-rc.d $OPT somescript start 90 S . stop 10 0 1 6 .

The 'exit 1' leads to an error if $D contains a nonzero length string (what is the case in the OE image creation step at the build host) and suppresses the execution of the second (update-rc.d) part.

Because of this error the postinst is run a second time when the target device boots the first time ("opkg-cl configure" from /etc/rcS.d/S40configure).

The problem is that the update-rc.d execution (and therefor the creation of the new symlink into rcS.d) is done from within rcS itself. So the rcS.d/S90somescript will *not* be executed at this boot. :(

We see two possible solutions.

A) Don't use "inherit module update-rc.d" but write the pkg_postint ourselfs.

B) Create two packages (one for the module, one for the initscript) with a runtime dependency.

I don't like both of them. Any other ideas? Is it possible to force the order of postinst fragments (update-rc.d code before module code)?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


