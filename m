Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUPZE-0000IR-El for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 20:04:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUPWw-0002Lf-9M
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 20:02:22 +0100
Received: from s207-6-220-230.bc.hsia.telus.net ([207.6.220.230])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 20:02:22 +0100
Received: from dfoley by s207-6-220-230.bc.hsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 20:02:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@techsol.ca>
Date: Mon, 11 Jan 2010 11:01:49 -0800
Message-ID: <4B4B759D.3040609@techsol.ca>
References: <loom.20100109T213305-664@post.gmane.org>	<20100109221158.GA1444@rhein.zuhause.netz>	<loom.20100111T101557-577@post.gmane.org>
	<20100111094046.GQ17224@jama> <1263219513.3293.6.camel@nvc1511>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s207-6-220-230.bc.hsia.telus.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1263219513.3293.6.camel@nvc1511>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building classpath / ecj-initial fails
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
X-List-Received-Date: Mon, 11 Jan 2010 19:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jaap de Jong wrote:
> Hi Henning,
> 
> My approach after many unsuccessful attempts:
> 
> 	- install
> 		apt-get install sun-java6-jdk
> 	- edit local.conf 
> 		ASSUME_PROVIDED += " ecj-initial "
> 		ASSUME_PROVIDED += " virtual/java-initial "
> 		ASSUME_PROVIDED += " virtual/java-native "
> 		ASSUME_PROVIDED += " virtual/javac-native "
> 		PREFERRED_PROVIDER_classpath = "classpath"
> 		PREFERRED_VERSION_classpath = "0.97.2"
> 	- bitbake cacao
> 
> Could not get jamvm nor classpath 0.98 compiled.
> 
> Regards,
> Jaap

Not sure if this is the right answer, but I also could not build ecj-initial 
until I changed "-Xmx1024m" to "-Xmx512m" in recipes/ecj/files/ecj.in
and I think rebuilding ecj-bootstrap-native and ecj-initial worked for me.


> 
> 
> On Mon, 2010-01-11 at 10:40 +0100, Martin Jansa wrote:
>> On Mon, Jan 11, 2010 at 09:27:00AM +0000, Chris Veigl wrote:
>>> Dear Henning,
>>>
>>> thank you for the fast response,
>>>
>>>> jamvm 1.5 needs classpath-0.98, we don't use classpath-0.98  yet as default
>>>> because there were some issues with cacao. So add
>>>> PREFFERED_VERSION_classpath = "0.98" 
>>>> to your local.conf and it should work.
>>> after my first rebuild i did not notice any effect,
>>> then i relalized the type in "PREFERRED_VERSION_classpath" ;-)
>>>
>>> after that changed, i still got the same error,
>>> because the problem happens at the config of classpath_native... 
>>>
>>> i then deleted my tmp folder and gave it another try, using
>>> the settings recommended at http://wiki.openembedded.net/index.php/Java :
>>>
>>> PREFERRED_VERSION_jamvm-initial = "1.4.5"
>>> PREFERRED_VERSION_classpath-initial = "0.93"
>>>
>>> PREFERRED_VERSION_jamvm-native = "1.5.3"
>>> PREFERRED_VERSION_classpath-native = "0.98"
>>>
>>> PREFERRED_VERSION_jamvm = "1.5.2"
>>> PREFERRED_VERSION_classpath = "0.98"
>>>
>>> PREFERRED_VERSION_libecj-bootstrap = "3.4"
>>>
>>>
>>> Unfortunately, i ran into a different error using this configuration:
>>>
>>> task 1610 of 7888 (ID: 3738,
>>> /media/disk/overo-oe/org.openembedded.dev/recipes/classpath/classpath-
>>> native_0.98.bb,
>>> do_compile)
>>> ERROR: function do_compile failed
>>>
>>> /media/disk/overo-oe/tmp/staging/i686-linux/usr/bin/java-initial -classpath
>>> antlr.Tool -o ../tools/generated/gnu/classpath/tools/gjdoc/expr/ \
>>> | 	  ./gnu/classpath/tools/gjdoc/expr/java-expression.g
>>> | Unrecognised command line option: -o
>> git pull.. se my commit yesterday
>>
>>> any ideas what is going wrong now ?
>>> regards,
>>> chris
>> Regards,
>>



