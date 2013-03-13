Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1UFsPy-0007kV-Av
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 21:36:58 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UFs6V-003Voe-Tg>; Wed, 13 Mar 2013 21:16:51 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.80.1) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UFs6V-000tRf-Mh>; Wed, 13 Mar 2013 21:16:51 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1UFs6T-0004d9-Jt; Wed, 13 Mar 2013 21:16:49 +0100
Date: Wed, 13 Mar 2013 21:16:49 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313201649.GA17269@mi.fu-berlin.de>
References: <20130313161800.GK3260@jama>
MIME-Version: 1.0
In-Reply-To: <20130313161800.GK3260@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: Re: minidlna missing some DEPENDS?
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
X-List-Received-Date: Wed, 13 Mar 2013 20:36:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2013 at 05:18:00PM +0100, Martin Jansa wrote:
> Hi, 
> 
> minidlna build for qemuarm fails with:
> 
> | Linking minidlna
> | arm-oe-linux-gnueabi-gcc: error: getifaddr.o: No such file or directory
> | arm-oe-linux-gnueabi-gcc: error: sql.o: No such file or directory
> | arm-oe-linux-gnueabi-gcc: error: inotify.o: No such file or directory
> | make: *** [minidlna] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/minidlna/1.0.25-r0/temp/log.do_compile.21922 for further information)
> NOTE: recipe minidlna-1.0.25-r0: task do_compile: Failed
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Hi Martin,

it looks more like a parallel build issue.

Bye Henning


