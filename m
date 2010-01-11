Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1NUL8M-0005Jr-IS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 15:20:45 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 11 Jan 2010 15:18:34 +0100
X-TM-IMSS-Message-ID: <9929c1550001b77a@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 9929c1550001b77a for
	<jaap.dejong@nedap.com>; Mon, 11 Jan 2010 15:18:30 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100111094046.GQ17224@jama>
References: <loom.20100109T213305-664@post.gmane.org>
	<20100109221158.GA1444@rhein.zuhause.netz>
	<loom.20100111T101557-577@post.gmane.org> <20100111094046.GQ17224@jama>
Date: Mon, 11 Jan 2010 15:18:33 +0100
Message-ID: <1263219513.3293.6.camel@nvc1511>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 11 Jan 2010 14:18:34.0063 (UTC)
	FILETIME=[F555B5F0:01CA92C8]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
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
X-List-Received-Date: Mon, 11 Jan 2010 14:20:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Henning,

My approach after many unsuccessful attempts:

	- install
		apt-get install sun-java6-jdk
	- edit local.conf 
		ASSUME_PROVIDED += " ecj-initial "
		ASSUME_PROVIDED += " virtual/java-initial "
		ASSUME_PROVIDED += " virtual/java-native "
		ASSUME_PROVIDED += " virtual/javac-native "
		PREFERRED_PROVIDER_classpath = "classpath"
		PREFERRED_VERSION_classpath = "0.97.2"
	- bitbake cacao

Could not get jamvm nor classpath 0.98 compiled.

Regards,
Jaap


On Mon, 2010-01-11 at 10:40 +0100, Martin Jansa wrote:
> On Mon, Jan 11, 2010 at 09:27:00AM +0000, Chris Veigl wrote:
> > 
> > Dear Henning,
> > 
> > thank you for the fast response,
> > 
> > > jamvm 1.5 needs classpath-0.98, we don't use classpath-0.98  yet as default
> > > because there were some issues with cacao. So add
> > > PREFFERED_VERSION_classpath = "0.98" 
> > > to your local.conf and it should work.
> > 
> > after my first rebuild i did not notice any effect,
> > then i relalized the type in "PREFERRED_VERSION_classpath" ;-)
> > 
> > after that changed, i still got the same error,
> > because the problem happens at the config of classpath_native... 
> > 
> > i then deleted my tmp folder and gave it another try, using
> > the settings recommended at http://wiki.openembedded.net/index.php/Java :
> > 
> > PREFERRED_VERSION_jamvm-initial = "1.4.5"
> > PREFERRED_VERSION_classpath-initial = "0.93"
> > 
> > PREFERRED_VERSION_jamvm-native = "1.5.3"
> > PREFERRED_VERSION_classpath-native = "0.98"
> > 
> > PREFERRED_VERSION_jamvm = "1.5.2"
> > PREFERRED_VERSION_classpath = "0.98"
> > 
> > PREFERRED_VERSION_libecj-bootstrap = "3.4"
> > 
> > 
> > Unfortunately, i ran into a different error using this configuration:
> > 
> > task 1610 of 7888 (ID: 3738,
> > /media/disk/overo-oe/org.openembedded.dev/recipes/classpath/classpath-
> > native_0.98.bb,
> > do_compile)
> > ERROR: function do_compile failed
> > 
> > /media/disk/overo-oe/tmp/staging/i686-linux/usr/bin/java-initial -classpath
> > antlr.Tool -o ../tools/generated/gnu/classpath/tools/gjdoc/expr/ \
> > | 	  ./gnu/classpath/tools/gjdoc/expr/java-expression.g
> > | Unrecognised command line option: -o
> 
> git pull.. se my commit yesterday
> 
> > any ideas what is going wrong now ?
> > regards,
> > chris
> 
> Regards,
> 




