Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8I5o-0001Wq-SK
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:43:30 +0200
Received: by iwn2 with SMTP id 2so2903434iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 12:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=reqgI7jJlPpQ7ITwaHHNySVpk+RPrnlqv1tm6apd0Rw=;
	b=OXWVCrBDjzZNN5/xKOBryLXBYTU5j4fEhM1k09dgBOA8PObdqBrsnvs4E9x5EUFA+a
	VILhpLIFeSoaAWDYc8V95l0vyf70M0FQhwmT8ni9oSdnXccY2CZlVEUiQgPUW0zB+qJO
	UMU3aluXXzK2fjo4IgXzXTt91en7MsCgcq5yI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=oCckzScNaR3gE6+eiKITa5E7Wdn6YSalAjJhxwSCXZS9MeGKVzdwBO1MoSVZyNcSLQ
	4NJVF38NZtRjMc2PIPiaIMkm/VACzAl1rNmliU/SlpwgCgL11y3kecb33HxTQGRicy3F
	PALQT+5I1Ib9Pp0mhUPJVbDv76vOEobRqFgUg=
MIME-Version: 1.0
Received: by 10.231.167.196 with SMTP id r4mr5305565iby.29.1287517363296; Tue,
	19 Oct 2010 12:42:43 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 12:42:43 -0700 (PDT)
Date: Tue, 19 Oct 2010 21:42:43 +0200
Message-ID: <AANLkTimo5eSBO0MGTGzKpzteL0=Hv3fc7M5Fr7xwEXaH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: weird/wrong parsing error
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
X-List-Received-Date: Tue, 19 Oct 2010 19:43:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was authoring a patch for rtorrent but forgot a / in the file:// (so
I only typed file:/)

This gave me the error log below.
It starts off saying Unable to open the bb file and only much later
there is a MailformedURL message.
This is fairly misleading (I started to check first if the file was
there); suggest to improve the error message.

Frans

frans@linux-suse:~/oe/openembedded/recipes/libtorrent> bitbake rtorrent
NOTE: Handling BitBake files: / (4907/7170) [68 %]ERROR: Unable to
open /home/frans/oe/openembedded/recipes/libtorrent/rtorrent_0.8.6.bb
Traceback (most recent call last):
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 966, in parse_next
    fromCache, skipped, virtuals = cooker.bb_cache.loadData(f,
cooker.get_file_appends(f), cooker.configuration.data, cooker.status)
  File "/home/frans/oe/bitbake/lib/bb/cache.py", line 210, in loadData
    bb_data = self.load_bbfile(fn, appends, cfgData)
  File "/home/frans/oe/bitbake/lib/bb/cache.py", line 487, in load_bbfile
    raise
  File "/home/frans/oe/bitbake/lib/bb/cache.py", line 482, in load_bbfile
    bb_data = parse.handle(bbfile, bb_data) # read .bb data
  File "/home/frans/oe/bitbake/lib/bb/parse/__init__.py", line 78, in handle
    return h['handle'](fn, data, include)
  File "/home/frans/oe/bitbake/lib/bb/parse/parse_py/BBHandler.py",
line 158, in handle
    return ast.multi_finalize(fn, d)
  File "/home/frans/oe/bitbake/lib/bb/parse/ast.py", line 372, in multi_finalize
    finalize(fn, d)
  File "/home/frans/oe/bitbake/lib/bb/parse/ast.py", line 314, in finalize
    bb.utils.simple_exec("\n".join(code), {"d": d})
  File "/home/frans/oe/bitbake/lib/bb/utils.py", line 354, in simple_exec
    exec(code, _context, context)
  File "<string>", line 3, in <module>
  File "__anon_416_classes_base_bbclass", line 71, in
__anon_416_classes_base_bbclass
  File "utils.bbclass", line 4, in is_machine_specific
  File "/home/frans/oe/bitbake/lib/bb/fetch/__init__.py", line 212, in init
    urldata[url] = FetchData(url, d)
  File "/home/frans/oe/bitbake/lib/bb/fetch/__init__.py", line 480, in __init__
    (self.type, self.host, self.path, self.user, self.pswd, self.parm)
= decodeurl(data.expand(url, d))
  File "/home/frans/oe/bitbake/lib/bb/fetch/__init__.py", line 65, in decodeurl
    raise MalformedUrl(url)
MalformedUrl: file:/aclocal.patch

NOTE: Handling BitBake files: \ (7168/7170) [99
%]/home/frans/oe/openembedded/recipes/libtorrent/rtorrent_0.8.6.bb
NOTE: Handling BitBake files: \ (7169/7170) [99 %]ERROR: Command
execution failed: Traceback (most recent call last):
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 85, in runAsyncCommand
    self.cooker.updateCache()
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 783, in updateCache
    if not self.parser.parse_next():
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 960, in parse_next
    def parse_next(self):
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 994, in parse_next
    raise ParsingErrorsFound
ParsingErrorsFound


