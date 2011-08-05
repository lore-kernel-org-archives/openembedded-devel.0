Received: from mail2.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1QpRKE-0006T0-VA
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 22:48:59 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	4CFAF5AF6C2_E3C5631B for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2011 20:44:33 +0000 (GMT)
Received: from mail.multitech.com (unknown [192.168.11.244])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	1FDE65AF6C1_E3C5631F for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2011 20:44:33 +0000 (GMT)
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from [192.168.52.113] ([192.168.52.113]) by mail.multitech.com with
	Microsoft SMTPSVC(5.0.2195.7381); Fri, 5 Aug 2011 15:43:54 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
	<20110805151726.GB15632@rhein.zuhause.netz>
	<CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
Date: Fri, 05 Aug 2011 15:44:30 -0500
Message-ID: <1312577070.14079.26.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 05 Aug 2011 20:43:54.0606 (UTC)
	FILETIME=[641FD8E0:01CC53B0]
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Fri, 05 Aug 2011 20:48:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 11:38 -0400, George C. Huntington, III wrote:
> I posted a patch that makes the wrapper script return the error code
> if it
> fails after 5 retries.  it is on patchwork.
> http://patches.openembedded.org/patch/7249/
> 
> I don't know if anyone has reviewed it, but it worked for me.

I gave it a try and now the classpath build errors out earlier:

| Adding java source files from srcdir '..'.
| Adding java source files from VM directory ../vm/reference
| javac -Xlint:unchecked,cast,divzero,empty,finally,overrides  -J-Xmx768M -source 1.5 -target 1.5 -bootclasspath '' -classpath ../vm/reference:..:../external/w3c_dom:../external/sax:../external/relaxngDatatype:../external/jsr166:.:: -d . @classes
| Unrecognized option : ../vm/reference:..:../external/w3c_dom:../external/sax:../external/relaxngDatatype:../external/jsr166:.::
| make[1]: *** [compile-classes] Error 255
| make[1]: *** Waiting for unfinished jobs....
| touch resources
| make[1]: Leaving directory `/home/jjg/projects/angstrom-oe-2011.03/build/tmp/work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r4/classpath-0.98/lib'
| make: *** [all-recursive] Error 1
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package classpath-0.98-r4: task do_compile: Failed

Jesse



