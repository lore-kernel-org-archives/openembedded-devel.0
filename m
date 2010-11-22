Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PKg6L-0008Dn-Kq
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 00:47:14 +0100
Received: by wyb40 with SMTP id 40so790563wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ZqtSvetx9U4+WqZoFwrdikjrhLvJ6HUrBblC+tkF0t0=;
	b=shTb4vpvo9Km+PaUzedpbCrpalfO6GhIDZbyH3Oyu5cV/Hh9mpA8jFRT+WqTL5xWg/
	O+eoU68NgV/xooZPtIhwOKBrAL7SB70R2U+YsDq9VuCw7DEDvziwOdQvDB7R7UHEH0kf
	j+fERF0GAwNbgObhBWGexhefSZ0j4lU12ouBU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JWmia3NOn1XwsM2x0oIZFoB4MzqbRQo/PXGdj7TjRy3/q4xB+0ZOeqxJTq0dnlnIjY
	yZTMZONZXVwBfTaRf5Z9Cf9XAXa0g5TrO/8miVy5oGfl5qPcPFjLQmrDDTGvPpX4hkm/
	TCmR12ZIGQN/1+nFMeq7Solr3GIhnNj3bB+Kc=
MIME-Version: 1.0
Received: by 10.216.36.146 with SMTP id w18mr5670790wea.70.1290469560980; Mon,
	22 Nov 2010 15:46:00 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Mon, 22 Nov 2010 15:46:00 -0800 (PST)
Date: Tue, 23 Nov 2010 00:46:00 +0100
Message-ID: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Mon, 22 Nov 2010 23:47:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

in log.do_configure of automake-native-1.11.1-r3.1 I see

checking for perl... /usr/bin/perl
checking whether /usr/bin/perl supports ithreads... yes

In fact I have in my
 /oe/build/tmp/sysroots/i686-linux/usr/share/automake-1.11/Automake/Config.pm

our $APIVERSION = '1.11';
our $PACKAGE = 'automake';
our $VERSION = '1.11.1';
our $libdir = '/oe/build/tmp/sysroots/i686-linux/usr/share/automake-1.11';
our $perl_threads = 1;

Well, that seems just fine but since some days building on a Gentoo
host, whose perl is compiled without threads support (no 'ithreads'
use flag) I trigger a nasty error:

NOTE: package libx11-1_1.4.0-r9.0: task do_configure: Started
ERROR: Logfile of failure stored in:
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/libx11-1_1.4.0-r9.0/temp/log.do_configure.4482
Log data follows:
| This Perl not built to support threads
| Compilation failed in require at
/oe/build/tmp/sysroots/i686-linux/usr/bin/automake line 139.
| BEGIN failed--compilation aborted at
/oe/build/tmp/sysroots/i686-linux/usr/bin/automake line 144.
| This Perl not built to support threads
| Compilation failed in require at
/oe/build/tmp/sysroots/i686-linux/usr/bin/automake line 139.
| BEGIN failed--compilation aborted at
/oe/build/tmp/sysroots/i686-linux/usr/bin/automake line 144.
NOTE: package libx11-1_1.4.0-r9.0: task do_configure: Failed

Note that in the host   /usr/share/automake-1.11/Automake/Config.pm I have

our $perl_threads = 0;

So it seems to me that something is getting mixed between perl-native
and perl on host :/

Any idea?

Regards

Andrea


