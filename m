Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1NpKwS-0005NM-3A
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 13:23:17 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 1D0B3491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 12:52:35 +0100 (CET)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 10 Mar 2010 12:53:25 +0100
Message-ID: <4B978814.30307@dresearch.de>
Date: Wed, 10 Mar 2010 12:52:52 +0100
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <536913655.6343051268191558593.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
In-Reply-To: <536913655.6343051268191558593.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
X-OriginalArrivalTime: 10 Mar 2010 11:53:25.0173 (UTC)
	FILETIME=[4A640E50:01CAC048]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake failure after git pull
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
X-List-Received-Date: Wed, 10 Mar 2010 12:23:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

> Hello, 
> I just did a "git pull" into my gumstix overo-oe repository and now bitbake is giving me errors. Any ideas on where to start? 
> Here is the error listed below after I successfully completed a git pull. 
> 
> - JohnBuckley 
> 
> jgb@jgb-desktop:~/overo-oe/user.collection/recipes/vidplayr2$ bitbake -c clean vidplayr 
> Traceback (most recent call last): 
> File "/home/jgb/overo-oe/bitbake/bin/bitbake", line 143, in <module> 
> main() 
> File "/home/jgb/overo-oe/bitbake/bin/bitbake", line 123, in main 
> cooker.parseConfiguration() 
> File "/home/jgb/overo-oe/bitbake/lib/bb/cooker.py", line 68, in parseConfiguration 
> self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) ) 
> File "/home/jgb/overo-oe/bitbake/lib/bb/cooker.py", line 404, in parseConfigurationFile 
> bb.event.fire(bb.event.ConfigParsed(self.configuration.data)) 
> File "/home/jgb/overo-oe/bitbake/lib/bb/event.py", line 67, in fire 
> if tmpHandler(event) == Handled: 
> File "tmpHandler(e)", line 4, in tmpHandler 
> File "<bb>", line 18, in check_sanity 
> NameError: global name 'os' is not defined 
> jgb@jgb-desktop:~/overo-oe/user.collection/recipes/vidplayr2$ 

Try bitbake --version. If your bitbake is older than 1.8.18 you'll run 
into that error. At least that's what happened to me.

Regards,
Thilo

-- 
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Amtsgericht: Berlin Charlottenburg, HRB:54412
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77 http://www.dresearch.de


