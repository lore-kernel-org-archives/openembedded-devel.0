Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1ONVen-0003Cx-T4
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 20:42:15 +0200
Received: by bwz14 with SMTP id 14so1225868bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 11:37:50 -0700 (PDT)
Received: by 10.204.8.198 with SMTP id i6mr1999388bki.66.1276367870745;
	Sat, 12 Jun 2010 11:37:50 -0700 (PDT)
Received: from is.home (93-81-71-54.broadband.corbina.ru [93.81.71.54])
	by mx.google.com with ESMTPS id v3sm10870224bkz.22.2010.06.12.11.37.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 12 Jun 2010 11:37:49 -0700 (PDT)
Sender: Yuri Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jun 2010 22:37:42 +0400
User-Agent: KMail/1.13.1 (Linux/2.6.32-std-def-alt9; KDE/4.4.1; i686; ; )
MIME-Version: 1.0
Message-Id: <201006122237.42920.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: neon, gssapi and host's krb5-config
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
X-List-Received-Date: Sat, 12 Jun 2010 18:42:15 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello!

I've problem with neon-0.25.5 (0.26 was not checked). Neon's configure is 
catching my host's krb5-config and hosts includes. This causes QA error.

I've tried disabling gssapi in neon (--without-gssapi). This disables 
looking for kerberos includes and libs. And this helps me.

So question is: do anybody uses neon with kerberos or gssapi?

Can I disable gssapi in neon?
Should I provide neon-gssapi-0.25.5.bb?

-- 
Yuri Bushmelev


