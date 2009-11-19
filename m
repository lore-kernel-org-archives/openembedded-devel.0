Received: from aa012msr.fastwebnet.it ([85.18.95.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1NB0pr-0008E2-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 07:49:46 +0100
Received: from [193.100.100.18] (27.253.111.36) by aa012msr.fastwebnet.it
	(8.5.016.6)
	id 4B033DE6002A9F29 for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 07:46:06 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2009 07:46:17 +0100
Message-Id: <1258613177.16656.3.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 85.18.95.72
X-SA-Exim-Mail-From: pisa.t@teledata-i.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Building problems
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
X-List-Received-Date: Thu, 19 Nov 2009 06:49:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi ALL,
I get suddenly a building problem.
this is the output:


paolo@ubuntu2:~/oe/stuff/build$ bitbake x11-image
Traceback (most recent call last):
  File "/home/paolo/oe/stuff/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/home/paolo/oe/stuff/bitbake/bin/bitbake", line 123, in main
    cooker.parseConfiguration()
  File "/home/paolo/oe/stuff/bitbake/lib/bb/cooker.py", line 69, in
parseConfiguration
    self.parseConfigurationFile( os.path.join( "conf",
"bitbake.conf" ) )
  File "/home/paolo/oe/stuff/bitbake/lib/bb/cooker.py", line 405, in
parseConfigurationFile
    bb.event.fire(bb.event.ConfigParsed(self.configuration.data))
  File "/home/paolo/oe/stuff/bitbake/lib/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 4, in tmpHandler
  File "<bb>", line 18, in check_sanity
NameError: global name 'os' is not defined
paolo@ubuntu2:~/oe/stuff/build$ 


Any suggestion?

Thanks in advance,
Paolo



