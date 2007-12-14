Received: from [209.85.162.179] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <giacoman@gmail.com>) id 1J3CW7-0007U9-2r
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2007 16:31:59 +0100
Received: by el-out-1112.google.com with SMTP id v27so199001ele.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 07:27:27 -0800 (PST)
Received: by 10.150.134.7 with SMTP id h7mr1170059ybd.97.1197646047088;
	Fri, 14 Dec 2007 07:27:27 -0800 (PST)
Received: by 10.150.95.6 with HTTP; Fri, 14 Dec 2007 07:27:27 -0800 (PST)
Message-ID: <7f3c88400712140727w27994b6dud37386874ebfade9@mail.gmail.com>
Date: Fri, 14 Dec 2007 09:27:27 -0600
From: "Eduardo Giacoman" <giacoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Help with bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2007 15:31:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I'm new to OpenEmbedded and I've got an error which cannot find the
solution. I followed the GettingStarted guide and set up everything, but
when i do "bitbake gpe-image" or just "bitbake" it gives me the following:

$ bitbake gpe-image
Traceback (most recent call last):
  File "/stuff/bitbake/bin/bitbake", line 134, in <module>
    main()
  File "/stuff/bitbake/bin/bitbake", line 114, in main
    cooker = bb.cooker.BBCooker(configuration)
  File "/stuff/bitbake/lib/bb/cooker.py", line 65, in __init__
    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
  File "/stuff/bitbake/lib/bb/cooker.py", line 353, in
parseConfigurationFile
    bb.fetch.fetcher_init(self.configuration.data)
  File "/stuff/bitbake/lib/bb/fetch/__init__.py", line 97, in fetcher_init
    pd.delDomain("BB_URI_HEADREVS")
  File "/stuff/bitbake/lib/bb/persist_data.py", line 66, in delDomain
    self.connection.execute("DROP TABLE IF EXISTS %s;" % domain)
sqlite3.OperationalError: attempt to write a readonly database

I googled it but only found 2 posts that said it needed to install sqlite >
3.3.0, so I apt-get installed sqlite3 but still have the same problem.

$ sqlite3 -version
3.4.2

Also tried apt-get install sqlite but version was 2.8.17, and then removed
them and install from source latest (3.5.3).
Any help will be appreciated,

Eduardo Giacoman

