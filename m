Received: from bay0-omc4-s23.bay0.hotmail.com ([65.54.190.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NqSCG-0006LJ-82
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 15:20:13 +0100
Received: from BAY127-W19 ([65.54.190.199]) by bay0-omc4-s23.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 13 Mar 2010 06:17:07 -0800
Message-ID: <BAY127-W193ABA8169925C266555F8D8300@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Sat, 13 Mar 2010 19:17:07 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Mar 2010 14:17:07.0417 (UTC)
	FILETIME=[DCE35490:01CAC2B7]
X-SA-Exim-Connect-IP: 65.54.190.225
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_SORBS_WEB,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: permission error
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
X-List-Received-Date: Sat, 13 Mar 2010 14:20:13 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


When I try to bitbake any recipe I get an error of Permission denied while =
owner of directory is that  user which is loged in.
How to fix this error .
Log follows.

[Saleh@localhost root]$ bitbake x-11-image
Traceback (most recent call last):
  File "/sdr/bitbake/bin/bitbake"=2C line 143=2C in <module>
    main()
  File "/sdr/bitbake/bin/bitbake"=2C line 123=2C in main
    cooker.parseConfiguration()
  File "/sdr/bitbake/lib/bb/cooker.py"=2C line 68=2C in parseConfiguration
    self.parseConfigurationFile( os.path.join( "conf"=2C "bitbake.conf" ) )
  File "/sdr/bitbake/lib/bb/cooker.py"=2C line 402=2C in parseConfiguration=
File
    bb.fetch.fetcher_init(self.configuration.data)
  File "/sdr/bitbake/lib/bb/fetch/__init__.py"=2C line 93=2C in fetcher_ini=
t
    pd =3D persist_data.PersistData(d)
  File "/sdr/bitbake/lib/bb/persist_data.py"=2C line 52=2C in __init__
    bb.mkdirhier(self.cachedir)
  File "/sdr/bitbake/lib/bb/__init__.py"=2C line 138=2C in mkdirhier
    if e.errno !=3D 17: raise e
OSError: [Errno 13] Permission denied: '/home/saleh'

 		 	   		 =20
_________________________________________________________________
Hotmail: Free=2C trusted and rich email service.
https://signup.live.com/signup.aspx?id=3D60969=

