Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J3Mvg-0008Ny-8E
	for Openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 03:39:04 +0100
Received: by fg-out-1718.google.com with SMTP id 22so20072fge.20
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 18:34:30 -0800 (PST)
Received: by 10.86.97.7 with SMTP id u7mr3697315fgb.39.1197686070035;
	Fri, 14 Dec 2007 18:34:30 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id j12sm13388051fkf.2007.12.14.18.34.28
	(version=SSLv3 cipher=OTHER); Fri, 14 Dec 2007 18:34:29 -0800 (PST)
Date: Sat, 15 Dec 2007 04:39:23 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <164348748.20071215043923@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] ANGSTROM_MODE -> SYSTYPE
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
X-List-Received-Date: Sat, 15 Dec 2007 02:39:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Openembedded-devel,

   ANGSTROM_MODE config variable has proven to be very useful and
successful feature during the Angstrom evolution. IMHO, it is worth
generalization of its meaning and naming to become a generic
additional OE distro configuration parameter. So, I'd like to propose
it to be renamed to SYSTYPE, with the description "Select particular
system variant of a distribution which supports such feature, e.g.,
underlying libc type."

  Obviously, it wouldn't be limited to libc type, but intended to be a
generic sub-parameter of a distro, it could be debug/release type,
size type (minimal/standard/extended), whatever. The usage idea is to
have standard name for such generic parameter, plus semantically it
should be expected that a distro allows to build different SYSTYPE's
side-by-side in the same build dir (like Angstrom does for libc
variants).


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



