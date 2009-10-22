Received: from [206.190.36.215] (helo=web53905.mail.re2.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <cwoloszynski@yahoo.com>) id 1N0wyz-0000BX-SI
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 14:41:37 +0200
Received: (qmail 13853 invoked by uid 60001); 22 Oct 2009 12:40:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1256215231; bh=9LZkfXTClEhTCZ6lpa3ah5u18kHVxmpwVg0cU4K2Kfs=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=ErZ9rKKUYlwMuGjqCmpHQCV1SREK459bahEAvV5jDjcnEH/DSha5yZOGvGs69B0zG5+mpWEwBh3OnHAGRhihRY9jjSeS8TH6W6J2RLxaTSyTPnA9Z7/bVI5BNowT5a/1sLSEhgpZ7Y1OuaruzR9KpZHs6D48H9MxbDzz4LqVtsk=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=uH6pFJCMflPcOAxs58KjIfthGhjZZ9++jG5FFx4JLyp9wLDtiB6fYAdmfmRd1S1RdthUX7wIVKTlKiMii4dmVV5zgGNw5CT2CvuOW8/ZwpDIF9hYatP5iK9cc/UCcLKYS28ExUzeVkPyUHx6NhrahvQC6tobjjSednIyTvsmKSA=;
Message-ID: <699461.13009.qm@web53905.mail.re2.yahoo.com>
X-YMail-OSG: 9KuhIEsVM1mzl8dmHqjDDq0usy7Zojdl6H24bb96MLL9wpDyzEpPNQu7feM_LAv8TpewfEn7hZPPlPqB.Bw4207HKMUYyOBxYo02oQeKy9CGTeb5oOmEcciufSuXXUnE.qXu.EYQQ6SoIDfX2WHwMzHTE1CVhFPFNc4UhrTH6xkdkR8p2R_6NRXZdCAWiiz8NDYQloqpFHfi1dGVAgJzbDSrKrPWVl.9rV0ukq3CvdoaXJ.TXxS7saaelEw9LQt2Po9MnKv6Hbnh_R3E3eSG4Nr3_oWL9HhD1CgluFW7vGlfhvWhD3__Z5ySDH4gzxmY4mlWL6MEmYF15yyH9PAxH43Ifnp93JuQikoIl_xUayTv8rGAajBX.WHDEw--
Received: from [68.100.74.251] by web53905.mail.re2.yahoo.com via HTTP;
	Thu, 22 Oct 2009 05:40:31 PDT
X-Mailer: YahooMailRC/182.10 YahooMailWebService/0.7.347.3
Date: Thu, 22 Oct 2009 05:40:31 -0700 (PDT)
From: Charlie Woloszynski <cwoloszynski@yahoo.com>
To: openembedded-devel@lists.openembedded.org,
	gumstix-users@lists.sourceforge.net
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 206.190.36.215
X-SA-Exim-Mail-From: cwoloszynski@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: bitbake gumstix-basic-image error with 'patches' directory
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
X-List-Received-Date: Thu, 22 Oct 2009 12:41:37 -0000
Content-Type: text/plain; charset=us-ascii

I am new to OE and bitbake, so perhaps this is an easy question:

I am using the pixhawk.oe build setup and I invoke 'bitbake gumstix-basic-image'

I get the following output.  Can someone suggest how to 'unstick' this?  Rerunning bitbake results in the same output.


OE:overo charlie@charlie-desktop:~/macfs/pixhawk.oe$ bitbake pixhawk-console-imageNOTE: Handling BitBake files: \ (7409/7409) [100 %]
NOTE: Parsing finished. 7125 cached, 0 parsed, 284 skipped, 2 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 127 of 4046 (ID: 1263, /home/charlie/macfs/pixhawk.oe/org.openembedded.dev/recipes/mpfr/mpfr-native_2.3.1.bb, do_patch)
NOTE: Applying patch 'long-long-thumb.patch' (org.openembedded.dev/recipes/mpfr/long-long-thumb.patch)
NOTE: Task failed: Command Error: exit status: 1  Output:
Importing patch /home/charlie/macfs/pixhawk.oe/org.openembedded.dev/recipes/mpfr/long-long-thumb.patch (stored as long-long-thumb.patch)
mkdir: cannot create directory `patches': File exists
cp: accessing `patches/long-long-thumb.patch': Not a directory
Failed to import patch long-long-thumb.patch
ERROR: TaskFailed event exception, aborting


A quick search in my system for directories called 'patches' shows the following:

OE:overo charlie@charlie-desktop:~/macfs/pixhawk.oe$ find . -name "patches" -print | xargs ls -lddrwxr-xr-x 17 charlie charlie 578 2008-05-04 07:28 ./tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r7.1/binutils-2.18.50.0.7/patches
drwxrwxr-x 10 charlie charlie 340 2009-10-22 04:17 ./tmp/work/i686-linux/autoconf-native-2.63-r8.0/autoconf-2.63/patches
drwxrwxr-x  2 charlie charlie  68 2009-10-22 04:17 ./tmp/work/i686-linux/automake-native-1.10.2-r2.0/automake-1.10.2/patches
drwxrwxr-x  4 charlie charlie 136 2009-10-22 04:25 ./tmp/work/i686-linux/bison-native-2.3-r1/bison-2.3/patches
drwxrwxr-x  5 charlie charlie 170 2009-10-22 04:25 ./tmp/work/i686-linux/flex-native-2.5.31-r2/flex-2.5.31/patches
drwxrwxr-x  7 charlie charlie 238 2009-10-22 04:20 ./tmp/work/i686-linux/gettext-native-0.17-r4/gettext-0.17/patches
drwxrwxr-x  7 charlie charlie 238 2009-10-22 04:19 ./tmp/work/i686-linux/gmp-native-4.2.4-r0.1/gmp-4.2.4/patches
drwxrwxr-x  5 charlie charlie 170 2009-10-22 04:16 ./tmp/work/i686-linux/gnu-config-native-0.1+cvs20050701-r5/config/patches
drwxrwxr-x  5 charlie charlie 170 2009-10-22 04:18 ./tmp/work/i686-linux/libtool-native-2.2.6a-r25.0/libtool-2.2.6/patches
drwxrwxr-x  2 charlie charlie  68 2009-10-22 04:16 ./tmp/work/i686-linux/m4-native-1.4.12-r0/m4-1.4.12/patches
drwxrwxr-x  2 charlie charlie  68 2009-10-22 04:11 ./tmp/work/i686-linux/stagemanager-native-0.0.1-r11/stagemanager-0.0.1/patches



      


