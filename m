Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kmqi9-0004F8-9k
	for openembedded-devel@openembedded.org; Mon, 06 Oct 2008 16:05:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kmqdn-0000fl-Jh
	for openembedded-devel@openembedded.org; Mon, 06 Oct 2008 14:00:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Oct 2008 14:00:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Oct 2008 14:00:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Oct 2008 16:00:44 +0200
Message-ID: <gcd5mc$5hl$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: [RFC] granular library packaging
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
X-List-Received-Date: Mon, 06 Oct 2008 14:05:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I tried to come up with a way to make splitting up library packages a 
bit easier an used this in the opencv recipe:

python populate_packages_prepend () {
	cv_libdir = bb.data.expand('${libdir}', d)
	cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
	do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV 
%s development package', extra_depends='${PN}-dev', allow_links=True)
	do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV 
%s development package', extra_depends='${PN}-dev')
	do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s 
development package', extra_depends='${PN}-dev')
	do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s 
library', extra_depends='', allow_links=True)
}

FILES_${PN} = "${bindir}"
FILES_${PN}-dbg += "${libdir}/.debug"
FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"

The advantages of this:

* all libs get their own package
* .so, .a and .la files end up in the right package
* lib<foo>-dev depends on the headers in ${PN}-dev keeping the depchains 
intact

The downsides:

* populate_packages_prepend runs *before* do_strip, so there's on big 
-dbg package to rule them all
* doesn't handle granular pkgconfig files.

I had a chat with Richard about it and we agreed that this needs some 
more thought, especially wrt depencies and granular packaging. My 
motivation for splitting things is to make using gdb less space-heavy 
due to pulling in a huge -dbg package that depends on extra, unneeded 
libs. As I pointed out above, that is sadly the case here since do_strip 
runs too late.

So, what are your opinions on splitting -dev and -dbg packages and would 
something like this be acceptable to put in lib_package.bbclass?

Note that a regexp based FILES is a related, but different discussion.


regards,

Koen




