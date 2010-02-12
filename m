Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jmahonin@cbnco.com>) id 1Nfxtn-0002Cd-LX
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 16:57:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 78E4A64FE67
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 10:47:45 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13266-10 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 12 Feb 2010 10:47:45 -0500 (EST)
Received: from [172.20.22.81] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 329CB64F6CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 10:47:45 -0500 (EST)
Message-ID: <4B75781F.4000202@cbnco.com>
Date: Fri, 12 Feb 2010 10:47:43 -0500
From: Josh Mahonin <jmahonin@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: jmahonin@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] package.bbclass and aggressive library stripping
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
X-List-Received-Date: Fri, 12 Feb 2010 15:57:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I was attempting to use GDB on an OE build, but was given various
warnings about threads being disabled.  I've traced the problem to
package.bbclass stripping out necessary symbols in 'libpthread.so.0',
referenced as section 6 in http://sourceware.org/gdb/wiki/FAQ

I'm admittedly using an out of date OE checkout, but the problem still
appears to be present in trunk as well.  Is it better to create a
special case in package.bbclass just for libpthread, or should a
blacklist be created for other potentially affected libraries as well?

Regards,

Josh


