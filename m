Received: from web57908.mail.re3.yahoo.com ([68.142.236.101])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <henryzhang62@yahoo.com>) id 1OCEhh-0002Ye-Id
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 18:22:39 +0200
Received: (qmail 96265 invoked by uid 60001); 12 May 2010 16:12:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1273680722; bh=P6r4EacEV6o7tjFAb16XXBY9Bff9FbCxxoMA7wYl2m0=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=3HW7LAZNq0O25v8793JpoNRQ16KL+eDD3zgeYVKlo6853LXzsxKmCcBQXg4q5bYmnR5OW12tODk2YtKuJgzCBbR50Q4HJP5CAJQ0uxy/l/hq6EoPB+itWJkd/Qo7uZuXOzf7TAICgeSl/vjChjtHfxhIFXWmCe+jE14Lz3gHXCE=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=GnJcBhSWUbNWHtYSpNd1nSmb2u4wUDRUQ/ChJd4dGzhFpHGmzboe4kToAmr86pzs2LJZ0+/z5bIYrdnCm7KyC4hriAlWicMN8iK8AX/07X5pT/6oxmfASARK0H0AZ8v9oFRjL/vM5zyuYERsX2iGSL/5rfpWSKzZhzEnlVhLUGk=;
Message-ID: <693555.95636.qm@web57908.mail.re3.yahoo.com>
X-YMail-OSG: u6oSfm0VM1kXGd5HdWRBnh32IGr_H4sJUbbwhy_5jDXFoT_
	CKlFIjSkldVIAMiIltrQvBRH0nL94eCxHkirAqy1QghGL7VDRoZn22e8KReK
	X1TTNDlulAPTTEv_8N2ELliXuhcqxr3YzTYsuJRmgeLZPs0MNiy.navpemZ5
	9cOm3MSHIxvhQHpRO7olIxbN2vuYoNhfijQef3ltiGT65WILo4kunvLIDgDt
	qwxJ4nPycuetsE.gDghPLlrmzUSEzEG3q333PSmGW7F1lq4p_XFFEXFC8uf9
	bvwnmkFr7IzP9DUUA4grstKR0tQ6IPjMgwOLwQmUi6uH52q18JR2g2uN3KQG
	eOqXSRhkIcm43UfY-
Received: from [70.134.44.229] by web57908.mail.re3.yahoo.com via HTTP;
	Wed, 12 May 2010 09:12:02 PDT
X-Mailer: YahooMailClassic/10.1.11 YahooMailWebService/0.8.103.269680
Date: Wed, 12 May 2010 09:12:02 -0700 (PDT)
From: hong zhang <henryzhang62@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 68.142.236.101
X-SA-Exim-Mail-From: henryzhang62@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ERROR: '/stuff/openembedded/recipes/gnutls/gnutls_2.8.5.bb' failed
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
X-List-Received-Date: Wed, 12 May 2010 16:22:39 -0000
Content-Type: text/plain; charset=us-ascii

List,

I am using bitbake version 1.8.18 and the latest openembedded. DISTRO=angstrom and MACHINE=overo. When I run "bitbake opie-image", stuck on gnutls_2.8.5.db. See following message. Where should I look into for this error? Thanks.

NOTE: Running task 1543 of 5784 (ID: 2573, /stuff/openembedded/recipes/gnutls/gnutls_2.8.5.bb, do_fetch)
NOTE: The checksums for '/stuff/sources/gnutls-2.8.5.tar.bz2' did not match.
Expected MD5: 'e3b2788b79bfc82acbe717e3c54d4e92' and Got: '2a0ceb110d2cc5c4e6c7f747f907d4e0'
Expected SHA256: '9249c29df71551e302e0186f4e1876dd6cc4c6cf2974b432c22525dde815cae8' and Got: 'eb84d6b7e45d29b77bee1c36d75f73aa4dbf89f83913c8c66ad40266cf2b137a'
NOTE: Your checksums:
SRC_URI[md5sum] = "2a0ceb110d2cc5c4e6c7f747f907d4e0"
SRC_URI[sha256sum] = "eb84d6b7e45d29b77bee1c36d75f73aa4dbf89f83913c8c66ad40266cf2b137a"

ERROR: gnutls-2.8.5: ftp://ftp.gnutls.org/pub/gnutls/gnutls-2.8.5.tar.bz2 cannot check archive integrity
ERROR: Error in executing: /stuff/openembedded/recipes/gnutls/gnutls_2.8.5.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing: /stuff/openembedded/recipes/gnutls/gnutls_2.8.5.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /stuff/openembedded/recipes/gnutls/gnutls_2.8.5.bb do_fetch failed
ERROR: Task 2573 (/stuff/openembedded/recipes/gnutls/gnutls_2.8.5.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 1542 tasks of which 1518 didn't need to be rerun and 1 failed.
ERROR: '/stuff/openembedded/recipes/gnutls/gnutls_2.8.5.bb' failed

---henry



      


