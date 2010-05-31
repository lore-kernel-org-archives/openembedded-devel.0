Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OJCLW-0003Bk-Db
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 23:16:32 +0200
Received: by wyf22 with SMTP id 22so188790wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 14:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=0qSUvw2hz6BCvtq067mqFKONYHta5ISQ9G3eb7nzUYU=;
	b=wgmX7yP7UJhxlsYx9sM0R7jLxh0f8Q96lsmJwaU1Z9WH/Tz+wWZlKOVXqEgcIq+h3o
	S/hPe2+UNReaHq8k+jUl83G9s3Yhsb4/UHK+VgzIM3T4FY0c/EjDbFlLLZQmmKwK32zw
	qni1YCc6khbYUR4MarTNsbHyGCxKNeQoOHecc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=A5MygdFKdQ1vQpJXpCXtqQtTMXyq8TQd24Nt62r2v1VCeoOpsAzoa28kJhk84B+DZQ
	G4fIBBOS/ZtkEGvS2hBN985dGj197g+SvR5bOF5vGNuqJ1AxdvjSAjK3DbBEvy5GWsPI
	HcObOP7NcWCGrVWWEo1BpakKBsDXr2nlxdWMY=
MIME-Version: 1.0
Received: by 10.216.87.80 with SMTP id x58mr4710340wee.96.1275340337073; Mon, 
	31 May 2010 14:12:17 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 31 May 2010 14:12:16 -0700 (PDT)
Date: Mon, 31 May 2010 17:12:16 -0400
Message-ID: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gitver problems
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
X-List-Received-Date: Mon, 31 May 2010 21:16:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm trying to put together some examples of using srctree/gitver, and
running into a few issues.

My example is in a bitbake overlay:

git://git.bec-systems.com/openembedded.custom
http://cgit.bec-systems.com/cgit.cgi/openembedded.custom/

This overlay includes a submodule for:

git://git.bec-systems.com/openembedded.custom
http://cgit.bec-systems.com/cgit.cgi/autotools-demo/

and a recipe to build the above submodule:

http://cgit.bec-systems.com/cgit.cgi/openembedded.custom/tree/recipes/autotools-demo/autotools-demo.bb

===================
# recipe to build the ics-test-app in the working tree

inherit srctree gitver autotools

PV = "${GITVER}"
S = "${OEDIR}/openembedded.custom/work/autotools-demo"
==================


When I try 'bitbake autotools-demo', I get the following:

cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
NOTE: Handling BitBake files: / (4602/8385) [54 %]ERROR: 'NoneType'
object has no attribute 'startswith' while parsing
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb
NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
attribute 'startswith' while evaluating:
${@get_git_pv('/scratch/oe/oe-build/oe/openembedded.custom/work/autotools-demo',
d)}
NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
attribute 'startswith' while evaluating:
${GITVER}
NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
attribute 'startswith' while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
attribute 'startswith' while evaluating:
${FILE_DIRNAME}/${PF}/${MACHINE}
ERROR: 'NoneType' object has no attribute 'startswith' while parsing
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb
NOTE: Handling BitBake files: \ (8384/8385) [99 %]Command execution
failed: Traceback (most recent call last):
  File "/scratch/oe/oe-build/oe/bitbake/lib/bb/command.py", line 85,
in runAsyncCommand
    self.cooker.updateCache()
  File "/scratch/oe/oe-build/oe/bitbake/lib/bb/cooker.py", line 802,
in updateCache
    if not self.parser.parse_next():
  File "/scratch/oe/oe-build/oe/bitbake/lib/bb/cooker.py", line 995,
in parse_next
    raise ParsingErrorsFound
ParsingErrorsFound

Any suggestions as to what might be going wrong with gitver?

Thanks,
Cliff


