Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HWdcI-0002hO-Fo
	for openembedded-devel@openembedded.org; Wed, 28 Mar 2007 21:15:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2SJFN3s003981;
	Wed, 28 Mar 2007 20:15:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03912-01; Wed, 28 Mar 2007 20:15:20 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2SJFIgo003971
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 28 Mar 2007 20:15:18 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Tim Bird <tim.bird@am.sony.com>
In-Reply-To: <460AABD1.4080409@am.sony.com>
References: <20070320033120.GA8678@thegnar.org>
	<1174574086.5949.32.camel@localhost.localdomain>
	<20070323043126.GA893@thegnar.org>
	<1174641616.5813.9.camel@localhost.localdomain>
	<460AABD1.4080409@am.sony.com>
Date: Wed, 28 Mar 2007 20:15:18 +0100
Message-Id: <1175109319.5829.30.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: bitbake and OE opperation
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
X-List-Received-Date: Wed, 28 Mar 2007 19:15:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-03-28 at 10:54 -0700, Tim Bird wrote:
> Richard Purdie wrote:
> >> What triggers do_configure to be executed and when?
> > 
> > Read base.bbclass. It sets up a number of tasks and a default task,
> > "build". You'd add configure after patch, before compile. compile would
> > be before build. "bitbake somefile" would cause the default task (and
> > its dependent tasks) to be executed. You could also do "bitbake somefile
> > -c configure" to specifically execute the configure task.
> 
> I'm sorry, but I don't understand most of that paragraph.
> 
> I've read the manuals - maybe I missed it, but I have the same question.
> 
> In <oe>/classes/base.bbclass I see:
> 
> BB_DEFAULT_TASK = "build"
> 
> at the top of the file.
> 
> There's no "def build()" or "def do_build()"
> There are the following lines - I don't know if they're related or not:
> 
> addtask build after do_populate_staging
> do_build = ""
> do_build[func] = "1"

These are very much related, it defines that there is a build task (with
an associated function which defaults to empty). It says this build task
depends on a "populate_staging" task.

> In <bitbake>/classes/base.bbclass I see:
> 
> addtask build
> do_build[dirs] = "${TOPDIR}"
> do_build[nostamp] = "1"
> python base_do_build () {
>         bb.note("The included, default BB base.bbclass does not define a useful default task.")
>         bb.note("Try running the 'listtasks' task against a .bb to see what tasks are defined.")
> }

Please ignore <bitbake>/classes/base.bbclass, they're examples in
bitbake and the files in OE take precedence.

> Maybe I'm thinking procedurally, and this is all declarative, but where
> the heck are the actual statements executed during a "build"?

Nothing is executed by "build" itself, the key is in the dependency on
"populate_staging".

> Back to Mark's point, how are the stages "fetch", "compile", "install"
> known to the system, and sequenced.  Are these hardcoded in bitbake?
> I'm guessing not, from the answer above and the structure of the
> "addtask <foo> before|after <bar>" statements.  But I can't find
> anywhere in the bbclass files where this is expressed.
> 
> Please help me understand this.

They're not hardcoded, the sequence is made through the definition of
tasks, each of which depend on each other. Very roughly:

build depends on populate_staging
populate_staging depends on package_write
package_write depends on package
package depends on install
install depends on compile
compile depends on configure
configure depends on patch
patch depends on unpack
unpack depends on fetch

This is all in base.bbclass, albeit rather difficult to isolate on its
own. Tasks like fetch, configure, compile etc. all have functions
associated with them and build is effectively a combination of all of
these.

Incidentally, don't be put off by the "do_" prefix, this is just to
highlight things as tasks when their usage might otherwise be
ambiguous. 

Does that make it clearer?

Regards,

Richard




