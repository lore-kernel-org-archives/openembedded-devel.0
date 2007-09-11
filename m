Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IV0IH-0005Qr-51
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2007 09:36:21 +0200
Received: by fk-out-0910.google.com with SMTP id 18so1708427fks
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2007 00:33:19 -0700 (PDT)
Received: by 10.82.134.12 with SMTP id h12mr5920672bud.1189495999650;
	Tue, 11 Sep 2007 00:33:19 -0700 (PDT)
Received: by 10.82.119.6 with HTTP; Tue, 11 Sep 2007 00:33:14 -0700 (PDT)
Message-ID: <74d0deb30709110033t3256fb15v76dc5b7cf51b46f6@mail.gmail.com>
Date: Tue, 11 Sep 2007 09:33:14 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: [rfc] stamp removal
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
X-List-Received-Date: Tue, 11 Sep 2007 07:36:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I was wondering whether it would be a nice touch to have tasks that
remove other task's results remove the other tasks's stamps, too.
Example: do_package removes the image dir, so it could remove the
do_install stamp. do_rm_work removes the complete workdir, so it could
remove the do_fetch ... do_package stamps, etc.

I'm often running into errors because bitbake makes certain
assumptions about what is in the work dir just by looking at the
stamps, and currently stamps and workdir state are not always in sync.
Example actions are doing one of the configure/compile/package_write
steps when I forgot that rm_work already had kicked in or doing
package_write to repackage after code changes (currently I manually
have to do_install, too).

regards
Philipp


