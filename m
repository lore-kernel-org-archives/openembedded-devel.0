Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JGiqp-0007a7-VS
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2008 23:41:16 +0100
Received: by ug-out-1314.google.com with SMTP id i24so835049ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2008 14:41:17 -0800 (PST)
Received: by 10.67.116.18 with SMTP id t18mr3918986ugm.85.1200868877351;
	Sun, 20 Jan 2008 14:41:17 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id e5sm6292961ugf.8.2008.01.20.14.41.16
	(version=SSLv3 cipher=OTHER); Sun, 20 Jan 2008 14:41:16 -0800 (PST)
Date: Mon, 21 Jan 2008 00:50:51 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <15810137585.20080121005051@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Cc: gpe-list@linuxtogo.org
Subject: [RFC] Making libmimedir-0.4.2 default in OE
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
X-List-Received-Date: Sun, 20 Jan 2008 22:41:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Currently, libmimedir-0.3.1 is marked DEFAULT_PREFERENCE = "1". That
version of the lib has at least 2 serious bugs:

1. Arbitrary cutting off of NOTE field during parsing.
2. Parsing only one value from CATEGORIES field.

  This essentially makes it not suitable for VCARD (at least) parsing
at all. Both issues were fixed in 0.4.2 (tested).

  So, I'd like to propose to remove mentioned DEFAULT_PREFERENCE and
make other steps as needed to make 0.4.2 the default version.


  Other possible changes regarding this lib:

1. Drop 0.3.1 as too buggy. (Caveat: 0.3.1 is the last version from
original author, 0.4 serious are being maintained by GPE project).

2. There appears to be (at least) two libmimedir's, another one is
http://sourceforge.net/projects/libmimedir/ (at 0.5, versions up to
0.4 were part of synce project). Debian names package for the lib in
question "libmimedir-gnome", we may want to disambiguate too.
http://packages.qa.debian.org/libm/libmimedir-gnome.html

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



