Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RYZso-0000Jg-OJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Dec 2011 10:03:14 +0100
Received: by eaao14 with SMTP id o14so980706eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Dec 2011 00:56:25 -0800 (PST)
Received: by 10.213.9.204 with SMTP id m12mr96699ebm.52.1323334585317;
	Thu, 08 Dec 2011 00:56:25 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id x12sm15483952eef.9.2011.12.08.00.56.24
	(version=SSLv3 cipher=OTHER); Thu, 08 Dec 2011 00:56:24 -0800 (PST)
Message-ID: <4EE07BB8.1000101@dresearch-fe.de>
Date: Thu, 08 Dec 2011 09:56:24 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <4EDF6C9E.6050806@dresearch-fe.de>
In-Reply-To: <4EDF6C9E.6050806@dresearch-fe.de>
X-Enigmail-Version: 1.3.3
Subject: Re: [master/2011.03-maintenance] module-init-tools-cross-3.12-r6: task do_compile: Failed (solution)
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
X-List-Received-Date: Thu, 08 Dec 2011 09:03:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.12.2011 14:39, Steffen Sledz wrote:
> This problem occurs with the current master (a4f35de0f6ca17e92763d5a5f32422c56e5d8882) *and* the 2011.03-maintenance branch (672af8093cf33d8b90e9186986ba5c95fc7a0a0a).
> 
> To reproduce it i used the current Kaeilos setup and made a clean build.
> 
> ------------------->snip<--------------------
> 14:11 sledz@~/work/kaeilos/build/kaeilos $ MACHINE=beagleboard bitbake module-init-tools-cross
> ...
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "2011.03-maintenance"
> METADATA_REVISION = "672af80"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "kaeilos"
> DISTRO_VERSION    = "2009.2-test-20111207"
> TARGET_FPU        = "hard"
> ...
> | gcc  -isystem/home/sledz/work/kaeilos/build/kaeilos/tmp/sysroots/x86_64-linux/usr/include -O2 -g -Wunused -Wall -static -L/home/sledz/work/kaeilos/build/kaeilos/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/sledz/work/kaeilos/build/kaeilos/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/sledz/work/kaeilos/build/kaeilos/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o insmod.static insmod.o libmodtools.a
> | /usr/lib64/gcc/x86_64-suse-linux/4.6/../../../../x86_64-suse-linux/bin/ld: cannot find -lc
> | collect2: ld returned 1 exit status
> | make: *** [insmod.static] Error 1
> | make: *** Waiting for unfinished jobs....
> | mv -f .deps/tables.Tpo .deps/tables.Po
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> NOTE: package module-init-tools-cross-3.12-r6: task do_compile: Failed
> ERROR: Function 'do_compile' failed (see /home/sledz/work/kaeilos/build/kaeilos/tmp/work/armv7a-kaeilos-linux-gnueabi/module-init-tools-cross-3.12-r6/temp/log.do_compile.5337 for further information)
> ------------------->snip<--------------------
> 
> (complete compile log is attached)

The cause for this problem was a missing package glibc-devel-static at my new installed openSUSE 12.1 build host.

Sorry for the annoyance.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


