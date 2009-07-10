Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MPL4s-0007jB-3g
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 20:44:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3A7BF505325
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 14:31:16 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05591-06 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 10 Jul 2009 14:31:16 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 04DE1505657
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 14:31:16 -0400 (EDT)
Message-ID: <4A5788F3.2080805@cbnco.com>
Date: Fri, 10 Jul 2009 14:31:15 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Building xserver-xorg 1.6.1 for i686: libtool error
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
X-List-Received-Date: Fri, 10 Jul 2009 18:44:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On my x86_64 build box, xserver-xorg's configure is generating 
i686-oe-linux-libtool instead of libtool, but the doltlibtool script is 
still looking for plain old libtool.

I worked around it with a symlink.

Wondering if anyone has a pointer where I can look to solve it 
permanently. It looks like libtool.m4 is setting 
ofile=${host_alias}-libtool, but xserver-xorg's acinclude.m4 is "dolt, a 
replacement for libtool" and it doesn't have the same ideas about what 
libtool should be called.

Thanks,
Mike

../doltlibtool --tag=CC   --mode=link i686-oe-linux-gcc 
-march=pentiumpro -DHAVE_DIX_CONFIG_H -Wall -Wpointer-arith 
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations 
-Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN 
-DHAS_STICKY_DIR_BIT -DDBUS_API_SUBJECT_TO_CHANGE

[blah blah blah]

-Wl,-O1 -Wl,--hash-style=gnu  -ldl -o libdix.la  atom.lo colormap.lo

[blah blah]

../doltlibtool: line 17: 
/home/michael/startitup/tmp/work/i686-oe-linux/xserver-xorg-2_1.6.1-r1/xorg-server-1.6.1/dix/../libtool: 
No such file or directory
../doltlibtool: line 17: exec: 
/home/michael/startitup/tmp/work/i686-oe-linux/xserver-xorg-2_1.6.1-r1/xorg-server-1.6.1/dix/../libtool: 
cannot execute: No such file or directory
make[2]: *** [libdix.la] Error 126



$ cat doltlibtool
#!/bin/bash
top_builddir_slash="${0%%doltlibtool}"
: ${top_builddir_slash:=./}
args=()
modeok=false
tagok=false
for arg in "$@"; do
     case "$arg" in
         --mode=compile) modeok=true ;;
         --tag=CC|--tag=CXX) tagok=true ;;
         *) args[${#args[@]}]="$arg" ;;
     esac
done
if $modeok && $tagok ; then
     . ${top_builddir_slash}doltcompile "${args[@]}"
else
     exec ${top_builddir_slash}libtool "$@"
fi


