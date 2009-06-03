Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MBrIY-0003O5-5s
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 16:18:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 05A064CDC64
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2009 10:09:36 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13233-06 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  3 Jun 2009 10:09:35 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 749324CDD0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2009 10:09:35 -0400 (EDT)
Message-ID: <4A26841F.2080208@cbnco.com>
Date: Wed, 03 Jun 2009 10:09:35 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
	<1244022557.2611.14.camel@mill.internal.reciva.com>
In-Reply-To: <1244022557.2611.14.camel@mill.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: busybox & syslog init script
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
X-List-Received-Date: Wed, 03 Jun 2009 14:18:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Tue, 2009-06-02 at 21:27 -0400, Michael Smith wrote:
>> 1) split the syslog initscript into busybox-syslog, as is already done for 
>> busybox-httpd and busybox-udhcpd;

> The only practical way to do #1 is to make busybox Depend: on the
> newly-created busybox-syslog package.  Otherwise, folks who do "ipkg
> install busybox" in the expectation of getting the syslog bits will be
> disappointed.

Would RRECOMMENDS have the same effect? It works for rootfs 
(busybox-syslog ends up in the root image). But I don't know if ipkg 
cares about recommends.

I'd prefer RRECOMMENDS to RDEPENDS, because if I don't have 
CONFIG_SYSLOGD=y, I can make busybox-syslog be empty so it won't get 
created and nothing will complain.

Mike


