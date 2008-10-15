Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KqB14-0004wB-Ak
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 20:22:38 +0200
Received: (qmail 18550 invoked by uid 813007); 15 Oct 2008 18:17:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Oct 2008 18:17:28 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2008 20:17:33 +0200
User-Agent: KMail/1.10.1 (Linux/2.6.27; KDE/4.1.2; x86_64; ; )
References: <200810010447.44667.zecke@selfish.org>
	<200810151934.46076.zecke@selfish.org> <gd5aj9$h8u$1@ger.gmane.org>
In-Reply-To: <gd5aj9$h8u$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200810152017.34100.openembedded@haerwu.biz>
Subject: Re: RFC: Making it mandantory to have a checksums.ini entry
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
X-List-Received-Date: Wed, 15 Oct 2008 18:22:38 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Wednesday 15 of October 2008 19:51:36 Koen Kooi napisa=C5=82(a):

> Step 1)
> 	go to TMPDIR and locate the checksums.ini there
>
> Step 2)

This step can be ignored.

> Step 3) combine the checksums.ini from OE and yours:

$ cat TMPDIR/checksums.ini >>=20
/OE/org.openembedded.dev/conf/checksums.ini

> Step 4)
> 	sort the result and apply it to OE

$ cd /OE/org.openembedded.dev/conf/
$ python ../contrib/source-checker/oe-checksums-sorter.py \
  checksums.ini >tmp
$ mv tmp checksums.ini

> Step 5)

inspect the results:

$ git diff checksums.ini

> The diff should only contain additions (removals and replacements are
> a sign of corruption somewhere).

Thats how I handle that stuff.

=2D-=20
JID: hrw@jabber.org




