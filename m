Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9lCe-0005bs-Rp
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 23:37:25 +0100
Received: by wera1 with SMTP id a1so6358958wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=v4th6j0L43inA/iO9o7XAGtaJSzcce/j5kIMiRHg9oQ=;
	b=f+pGbM4pmkEQ2pBar3gdIY5SbsEQnMPCGGpaAdiyyi8OkDXtP+hwAnwpRZaOn/h6Fu
	/m6qInUpKfd0FIeTXMbnHv7nwc1t3wq/QptjHMgacM8/fUCJHwr+OIoyzCB4wUJPYvQl
	PQlgoL2WWW8agqAv5AufRw7X6qcHHnJKm3wJ+6POvmX2nTXbR6SRU6nFWYCoygC7/VuL
	87EULBV3k94R4OMpjRYZHjldTtpSHM0LBkoPAHMD1W2Wo/b5mWZM8h+2CAiG6gqbywP6
	UfKlBn/4HQwIja9XL/nJJl43Ruic0G5KJjnNDvUAkA17ir1dpIir7BiCbzhfFrFYRic0
	36QA==
Received: by 10.180.97.41 with SMTP id dx9mr23341056wib.9.1332196113179;
	Mon, 19 Mar 2012 15:28:33 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D1A.dip.t-dialin.net.
	[91.10.61.26])
	by mx.google.com with ESMTPS id fw5sm29043430wib.0.2012.03.19.15.28.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 15:28:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2012 23:32:38 +0100
Message-Id: <1332196360-3171-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe v2 0/2] midori: cleanup
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
X-List-Received-Date: Mon, 19 Mar 2012 22:37:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2: 
change order variables/functions as suggested in [1]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/038650.html

Andreas Müller (2):
  midori: remove midori.inc and oe-stylize
  midori: add librsvg-native to DEPENDS

 meta-oe/recipes-connectivity/midori/midori.inc     |   39 ------------------
 .../recipes-connectivity/midori/midori_0.4.4.bb    |   42 +++++++++++++++++++-
 2 files changed, 40 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori.inc

-- 
1.7.4.4



