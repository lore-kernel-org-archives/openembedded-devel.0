Received: from asmtpout027.mac.com ([17.148.16.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NYewi-0004I7-4a
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 13:18:35 +0100
MIME-version: 1.0
Received: from [87.201.169.253] by asmtp027.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWP00DTA5YUWQ00@asmtp027.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	23 Jan 2010 03:16:10 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001230038
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <4B55FC07.3080504@paulwilsonconsulting.com>
Date: Sat, 23 Jan 2010 15:16:04 +0400
Message-id: <C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<1263888546.2678.17.camel@ubuntu-desktop>
	<4B55FC07.3080504@paulwilsonconsulting.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.102
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Bitbake build error on Fedora 12 x86 64-bit
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
X-List-Received-Date: Sat, 23 Jan 2010 12:18:35 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,
                  I get the following error when attempting to build overo on Fedora 12 x86 64-bit version. 

Can you tell me how you can resolve this?

bitbake omap3-console-image

Traceback (most recent call last):
  File "/tool/overo-oe/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/tool/overo-oe/bitbake/bin/bitbake", line 123, in main
    cooker.parseConfiguration()
  File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 68, in parseConfiguration
    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
  File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 404, in parseConfigurationFile
    bb.event.fire(bb.event.ConfigParsed(self.configuration.data))
  File "/tool/overo-oe/bitbake/lib/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 4, in tmpHandler
  File "<bb>", line 18, in check_sanity
NameError: global name 'os' is not defined

Best regards,

Elvis Dowson


