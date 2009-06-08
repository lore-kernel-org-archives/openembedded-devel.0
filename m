Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MDezL-0000Qw-E0
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 15:34:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8071F4D4EFF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2009 09:24:42 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14762-04 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  8 Jun 2009 09:24:42 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5DA7A3C5184
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2009 09:24:42 -0400 (EDT)
Message-ID: <4A2D111A.3030003@cbnco.com>
Date: Mon, 08 Jun 2009 09:24:42 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <Pine.LNX.4.64.0906071637260.27204@juice.ott.cti.com>	<1244407406-23717-1-git-send-email-msmith@cbnco.com>
	<1244454759.2611.178.camel@mill.internal.reciva.com>
In-Reply-To: <1244454759.2611.178.camel@mill.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] busybox: Split syslog initscript into busybox-syslog
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
X-List-Received-Date: Mon, 08 Jun 2009 13:34:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Sun, 2009-06-07 at 16:43 -0400, Michael Smith wrote:
>> +# Make busybox recommend busybox-syslog for those images that expect it
>> +RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
> 
> I guess it'd be a good idea to make this conditional on
> CONFIG_SYSLOGD=y.  Otherwise, folks who build with syslogd off will see
> a confusing "unsatisfied recommendation" diagnostic whenever they
> install busybox.

Hi Phil,

I think you had suggested using add_task to insert a Python block after 
do_fetch and before do_compile to modify RRECOMMENDS_${PN} conditionally 
based on ${WORKDIR}/defconfig.

What I'm wondering is how would that modification get persisted if, say, 
bitbake failed during do_compile, and then I restarted it? Would it 
think from the stamp that it's already done do_mangle_rrecommmends, and 
not bother running it again? Then RRECOMMENDS_${PN} would go back to 
whatever it was at parse time, i.e. no busybox-syslog. Is there a way 
around that?

Thanks,
Mike


