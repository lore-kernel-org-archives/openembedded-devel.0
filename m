Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <vjensen@warpmail.net>) id 1J3HnP-0002J6-1A
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2007 22:10:11 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 1A38D7AD4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 16:05:38 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 14 Dec 2007 16:05:38 -0500
X-Sasl-enc: 1oTI5ByrlD4Krt7/DAiVebjqLlCbdsIrifFtMJfipPFr 1197666337
Received: from [192.168.1.5] (i577A5CE9.versanet.de [87.122.92.233])
	by mail.messagingengine.com (Postfix) with ESMTP id BEEEA29F74
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 16:05:37 -0500 (EST)
From: Vitus Jensen <vjensen@warpmail.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2007 22:05:31 +0100
User-Agent: KMail/1.9.1
References: <7f3c88400712140727w27994b6dud37386874ebfade9@mail.gmail.com>
In-Reply-To: <7f3c88400712140727w27994b6dud37386874ebfade9@mail.gmail.com>
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
MIME-Version: 1.0
Message-Id: <200712142205.31994.vjensen@warpmail.net>
Subject: Re: Help with bitbake
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
X-List-Received-Date: Fri, 14 Dec 2007 21:10:12 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hej!

Am Freitag, 14. Dezember 2007 16:27 schrieb Eduardo Giacoman:

> I'm new to OpenEmbedded and I've got an error which cannot find the
> solution. I followed the GettingStarted guide and set up everything, but
> when i do "bitbake gpe-image" or just "bitbake" it gives me the
> following:
>
> $ bitbake gpe-image
> Traceback (most recent call last):
>   File "/stuff/bitbake/bin/bitbake", line 134, in <module>
>     main()
>   File "/stuff/bitbake/bin/bitbake", line 114, in main
>     cooker = bb.cooker.BBCooker(configuration)
>   File "/stuff/bitbake/lib/bb/cooker.py", line 65, in __init__
>     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>   File "/stuff/bitbake/lib/bb/cooker.py", line 353, in
> parseConfigurationFile
>     bb.fetch.fetcher_init(self.configuration.data)
>   File "/stuff/bitbake/lib/bb/fetch/__init__.py", line 97, in
> fetcher_init pd.delDomain("BB_URI_HEADREVS")
>   File "/stuff/bitbake/lib/bb/persist_data.py", line 66, in delDomain
>     self.connection.execute("DROP TABLE IF EXISTS %s;" % domain)
> sqlite3.OperationalError: attempt to write a readonly database
...

There was a patch posted to this mailinglist some time ago.  I've added it 
here for youre convenience:

Index: lib/bb/persist_data.py
===================================================================
--- lib/bb/persist_data.py      (revision 973)
+++ lib/bb/persist_data.py      (working copy)
@@ -57,13 +57,19 @@
         Should be called before any domain is used
         Creates it if it doesn't exist.
         """
-        self.connection.execute("CREATE TABLE IF NOT EXISTS %s(key TEXT, 
value TEXT);" % domain)
+        try:
+            self.connection.execute("CREATE TABLE %s(key TEXT, value 
TEXT);" % domain)
+        except:
+           bb.msg.debug(1, bb.msg.domain.PersistData, "Create table '%s' 
failed" % domain)

     def delDomain(self, domain):
         """
         Removes a domain and all the data it contains
         """
-        self.connection.execute("DROP TABLE IF EXISTS %s;" % domain)
+       try:
+            self.connection.execute("DROP TABLE %s;" % domain)
+        except:
+           bb.msg.debug(1, bb.msg.domain.PersistData, "Delete table '%s' 
failed" % domain)

     def getValue(self, domain, key):
         """



-- 
Vitus Jensen, +49-160-7543437, ICQ 122355880
Stormstr, Hannover, Earth, Milky Way, Universe (current)


