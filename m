Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hachreak@koansoftware.com>) id 1NpKso-0005Ex-Cr
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 13:19:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 868E82C7E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 12:01:55 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIpZ8tQH4FCS
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 12:01:51 +0000 (UTC)
Received: from [192.168.0.200] (unknown [95.236.120.104])
	by wiki.koala.it (Postfix) with ESMTPSA id F04CE2C7DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 12:01:50 +0000 (UTC)
Message-ID: <4B978B57.8050406@koansoftware.com>
Date: Wed, 10 Mar 2010 13:06:47 +0100
From: Leo <hachreak@koansoftware.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; it;
	rv:1.9.1.5) Gecko/20091204 Lightning/1.0b1 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <536913655.6343051268191558593.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
In-Reply-To: <536913655.6343051268191558593.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: hachreak@koansoftware.com
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
X-List-Received-Date: Wed, 10 Mar 2010 12:19:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Il 03/10/2010 04:25 AM, John Buckley ha scritto:
> 
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
> 

Somewhere missing (maybe in bitbake config file): import os
Read this: http://forums.xkcd.com/viewtopic.php?f=20&t=50227
I hope can be useful! :D

      bye bye    .hachreak.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJLl4tXAAoJECf4lwfLs0xJLlUH/2m/dcxQRJM3+IKX8wGhlzpj
sa2vE9wdZ9CiyC8LurtkHwMAlY1MSudHzkwXRsqOA/HR1uKKvHkKsvaFMf7fy8oc
ow6pWRGchArzMiRm/GXnviq7PzzOARipIpUZTeK6qqyvrXinwDwFHS80vf5DoBD8
NrWbVQY4yml7aigGCsILZQMt1XxVg6Rwj7GMSC2g2pHeFq9s0E8krMzLigZJg89l
nH/86qC8AImGRKVaEEk2itJXtTy/UaFMlGgoQ9uD4NXM76Jfsv2DNa13ihpFokGr
h/TSJgNTUXGFsExANCMXCpHMhXUm1AqdmHYFdwxJjabjpWYK/qMafFzR9nUX38g=
=K0B6
-----END PGP SIGNATURE-----


