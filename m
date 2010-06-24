Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fat031c@gmail.com>) id 1ORfQ0-0005Vj-SB
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 07:56:10 +0200
Received: by fxm1 with SMTP id 1so1691145fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:from:to:subject
	:date:mime-version:content-type:x-priority:x-msmail-priority
	:x-mailer:x-mimeole;
	bh=6xDg7WtNXdy0cXq55uQ3aPVeFeDtb8mUuRLIQX/1sKc=;
	b=SVwYJY6ZdeR3IMk12j/1PGwt7sbCoP1qUzHXTqWjU6pi/kyfuFomhgBtCNnew+YtH9
	RD8V05e4bLejZ2kYdNbJBNuIqLX/mXOwmyThlS+4FRBXHCs97q+fBbMkYomb9wt3K345
	dbn/ko12KVMg1+kySFizcAqDtnL9wqRVFdyuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:from:to:subject:date:mime-version:content-type
	:x-priority:x-msmail-priority:x-mailer:x-mimeole;
	b=jEsI+GRZWB+i+AdWhoV5GgqoG8BUzV0opfeHrGl8FiJpQs9QphMVvy1DnOtYg67bRM
	DsCcGlglVMMS2qqRL66s0cdh9svHN/LBOS/aK+nc+N5D0g+4uj6eQPxWjiBi6w0i+9Bz
	wGk9uQEulCuOE/V4hTakJBAy4KMu2L+tKEFpk=
Received: by 10.102.240.16 with SMTP id n16mr2946469muh.100.1277358691650;
	Wed, 23 Jun 2010 22:51:31 -0700 (PDT)
Received: from atverdohlebov ([94.28.104.114])
	by mx.google.com with ESMTPS id s11sm11112455mue.41.2010.06.23.22.51.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 22:51:30 -0700 (PDT)
Message-ID: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru>
From: "Andrew Tverdohlebov" <fat031c@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Jun 2010 16:51:26 +1100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5931
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5931
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fat031c@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to select specific version of dependant component
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
X-List-Received-Date: Thu, 24 Jun 2010 05:56:10 -0000
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Dear openembedded community,

Could you give me a hint how to write a recipe that refers to specific ver=
sion of a library.

For example my package depends on libnet 1.0.2
If I write
DEPENDS +=3D "libnet"
it will take libnet with maximum version number 1.1.2
How can I instruct bitbake to take libnet 1.0.2 ?

In other recipes I saw something like
DEPENDS +=3D "libnet (=3D 1.0.2)"

But it doesn't work in my case for some reason.

Huge thanks in advance,
Andrew
From philip@balister.org Thu Jun 24 09:49:19 2010
Received: from mail.geekisp.com ([216.168.135.169] helo
