Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1Q8GNU-0003Vb-7a
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 20:25:52 +0200
Received: from homiemail-a18.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id B35101788E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2011 11:23:43 -0700 (PDT)
Received: from homiemail-a18.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a18.g.dreamhost.com (Postfix) with ESMTP id E9F94250075
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2011 11:23:40 -0700 (PDT)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:content-type:
	content-transfer-encoding; q=dns; s=gumstix.com; b=UZPJFjLZsvUk4
	NoGGcPslZcRHmCWI5Yrf9VhVQ+d3Y0qKqOSj75cZl6caAkcd9NFv+EUoWWbRSCdx
	0/37mfpwrKsNwggv+zCVbSyXWj+WzXOaq9uZhgpjI7lQ1QFfKtpCbf4Odzk8+yze
	s5vw3snk8wOefFRgXS65ePRgTqg08o=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:content-type:
	content-transfer-encoding; s=gumstix.com; bh=ZjbFtANOp2xdnr49/7z
	t9kVl9T0=; b=LPla7Fpuv+AcsuQ1u2uOYX6fCagXX79x+dySt4iSo92O3tWkE8o
	FLmUMAoR6MIgak7rHmrSUS7RC4XHFEm0zY9Iu1afvA4ZMAACW/2lNX1aWoq/m5bH
	Lvt5qF6Nv5K5bCmMtRtNvOPzCsvg/xGOjvCx2FuZoaD91C7W0p4Iygp0=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPSA id BA317250079
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2011 11:23:40 -0700 (PDT)
Message-ID: <4D9F52B0.9030808@gumstix.com>
Date: Fri, 08 Apr 2011 11:23:44 -0700
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: firefox fails at xpidl: missing glib
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
X-List-Received-Date: Fri, 08 Apr 2011 18:25:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to bitbake firefox with this configuration.

> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "unstable"
> METADATA_REVISION = "219f1e9"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "overo"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v20110408"
> TARGET_FPU        = "hard"

But it fails  in the directory 
...work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/xpcom/typelib/xpidl

> gcc -o host_xpidl.o -c -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=\"md/_linux.cfg\"  -I. -I. -I../../../dist/include -I../../../dist/include/nsprpub  -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr xpidl.c
> xpidl_idl.c
> gcc -o host_xpidl_idl.o -c -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=\"md/_linux.cfg\"  -I. -I. -I../../../dist/include -I../../../dist/include/nsprpub  -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr xpidl_idl.c
> xpidl_util.c
> gcc -o host_xpidl_util.o -c -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=\"md/_linux.cfg\"  -I. -I. -I../../../dist/include -I../../../dist/include/nsprpub  -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr xpidl_util.c
> xpidl_header.c
> gcc -o host_xpidl_header.o -c -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=\"md/_linux.cfg\"  -I. -I. -I../../../dist/include -I../../../dist/include/nsprpub  -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr xpidl_header.c
> In file included from xpidl.c:42:
> xpidl.h:49: fatal error: glib.h: No such file or directoryIn file included from xpidl_util.c:42:
> xpidl.h:49: fatal error: glib.h: No such file or directory

cp sysroots/x86_64-linux/usr/include/glib-2.0/glib.h 
sysroots/x86_64-linux/usr/include/ got me to another missing header 
error. Comparing the log of my last successful build, this is missing.

> -pthread -I/home/neil/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libIDL-2.0 -I/home/neil/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/home/neil/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include

What would cause these includes to be omitted?

--
Neil





