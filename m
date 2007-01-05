Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H2jb6-0006l2-TU
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jan 2007 08:34:40 +0100
Received: by nf-out-0910.google.com with SMTP id l24so7615446nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2007 23:33:21 -0800 (PST)
Received: by 10.49.68.6 with SMTP id v6mr14932055nfk.1167982401258;
	Thu, 04 Jan 2007 23:33:21 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id y24sm95188486nfb.2007.01.04.23.33.20;
	Thu, 04 Jan 2007 23:33:21 -0800 (PST)
Date: Fri, 5 Jan 2007 09:33:34 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <76520598.20070105093334@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Fixing ipkg-make-index slowness
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
X-List-Received-Date: Fri, 05 Jan 2007 07:34:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello ,

      I bragged some time ago on IRC that I sped up ipkg-make-index
few times, and recently, question of ipkg-make-index slowness was
brought on ML too. So, I grasped my old patches wanting to submit it,
but of course it appeared not that easy. I've identified two causes of
slowness, each discussed separately below.

      All benchmarking was done on ipk repo of 5886 files and 245MB
total size, by running "bitbake package-index".


1. md5sum thrashing

In the summer, RP introduced patch for i-m-i ironically called
index_speedup.patch:
http://www.openembedded.org/bonsai/view/rev/17477/
It does following: If there's already Packages file exists, i-m-i
takes metadata from it, instead of parsing ipk's themselves. Before
this patch, such a cache was used simply when ipk file's name matched
filename recorded in Packages. RP added check for filesize, and also
for md5sum of the ipk's content. That means if you have Packages
file, and want to index few new ipk's, i-m-i will happily thrash over
each byte of entire package repo you have (like 26Gb). On my
repo running "bitbake package-index" with already existing and
up-to-date Packages led to:

i-m-i/md5sum
real    2m1.219s

i-m-i/no-md5sum
real    0m53.294s


Richard, what were the reasons for such conservative file matching?
Filename matching should be just enough, as per OE convention, any
package source changes leading to changes in the package metadata must
lead to bumping of package recipe's PR, and that in turn updates package
filename. Whoever don't follow PR update convention either call for
trouble, and no checks could really help them, or know what they do
(like bother to rebuild Packages from scratch). In this regard,
checking ipk size is the great convenience for adventurous, because
it's really high probability that update of any package metadata will
lead to change of file size due to compression. In other words, I
propose to remove md5sum check.


2. Unix process thrashing

Ok, that was cause of slowdown with already made Packages. Now, major
annoyance is (re)creating it or adding large number of packages. This
due to ar, tar, gz, being spawned for each ipk. Multiple Unix process
handling inefficiency by thousands files, and we get what we have.

So, I just took tarfile module from Python 2.3+, created arfile which
is not in Python, and I even failed to google it, and made them work
recursively one on another. Results:

i-m-i/spawn
real    14m30.239s

i-m-i/tarfile
real    5m21.950s

(Btw, I swear I was getting 6-7 times speed when I initially tried it
on Familiar buildtree.)

There's a small regression though: with this change, only deb-style
ipk's are supported. This shouldn't be an issue, as OE (and current
ipkg) generates exactly such ipks. And I envy people who used to know
and still remember what is the other ipk format ;-).

The patch is posted as:
http://bugs.openembedded.org/show_bug.cgi?id=1751


I hope that this analysis and changes/patches proposed will be of use
to someone.

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



