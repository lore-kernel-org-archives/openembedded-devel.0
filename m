Received: from qmta14.westchester.pa.mail.comcast.net ([76.96.59.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <buckleyassoc@comcast.net>) id 1NpCcO-00077y-U7
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 04:30:01 +0100
Received: from omta11.westchester.pa.mail.comcast.net ([76.96.62.36])
	by qmta14.westchester.pa.mail.comcast.net with comcast
	id rCEY1d0020mv7h05EFRyfg; Wed, 10 Mar 2010 03:25:58 +0000
Received: from sz0029.wc.mail.comcast.net ([76.96.58.79])
	by omta11.westchester.pa.mail.comcast.net with comcast
	id rFRy1d00H1iZpPQ3XFRyeF; Wed, 10 Mar 2010 03:25:58 +0000
Date: Wed, 10 Mar 2010 03:25:58 +0000 (UTC)
From: John Buckley <buckleyassoc@comcast.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <536913655.6343051268191558593.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
In-Reply-To: <131205683.6342631268191494439.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
X-Originating-IP: [24.2.192.205]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Linux)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.59.212
X-SA-Exim-Mail-From: buckleyassoc@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake failure after git pull
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
X-List-Received-Date: Wed, 10 Mar 2010 03:30:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


Hello, 
I just did a "git pull" into my gumstix overo-oe repository and now bitbake is giving me errors. Any ideas on where to start? 
Here is the error listed below after I successfully completed a git pull. 

- JohnBuckley 

jgb@jgb-desktop:~/overo-oe/user.collection/recipes/vidplayr2$ bitbake -c clean vidplayr 
Traceback (most recent call last): 
File "/home/jgb/overo-oe/bitbake/bin/bitbake", line 143, in <module> 
main() 
File "/home/jgb/overo-oe/bitbake/bin/bitbake", line 123, in main 
cooker.parseConfiguration() 
File "/home/jgb/overo-oe/bitbake/lib/bb/cooker.py", line 68, in parseConfiguration 
self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) ) 
File "/home/jgb/overo-oe/bitbake/lib/bb/cooker.py", line 404, in parseConfigurationFile 
bb.event.fire(bb.event.ConfigParsed(self.configuration.data)) 
File "/home/jgb/overo-oe/bitbake/lib/bb/event.py", line 67, in fire 
if tmpHandler(event) == Handled: 
File "tmpHandler(e)", line 4, in tmpHandler 
File "<bb>", line 18, in check_sanity 
NameError: global name 'os' is not defined 
jgb@jgb-desktop:~/overo-oe/user.collection/recipes/vidplayr2$ 


