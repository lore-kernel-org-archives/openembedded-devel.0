Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HM92C-0007C2-Db
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Feb 2007 21:34:53 +0100
Received: by nf-out-0910.google.com with SMTP id l24so296507nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2007 12:34:51 -0800 (PST)
Received: by 10.49.64.18 with SMTP id r18mr1837963nfk.1172608491247;
	Tue, 27 Feb 2007 12:34:51 -0800 (PST)
Received: from CUBE ( [82.193.98.4])
	by mx.google.com with ESMTP id a24sm3128118nfc.2007.02.27.12.34.50;
	Tue, 27 Feb 2007 12:34:50 -0800 (PST)
Date: Tue, 27 Feb 2007 22:35:00 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <407130732.20070227223500@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Tue, 27 Feb 2007 20:34:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  OE has base_conditional() function which is kind of C's ternary ?:
operator, with equality of two value as a condition (it is a bit
misnamed in this respect, it'd rather be base_equals() ).

  There're few other such conditional functions, for example for set
containment check. What we lack however is simple numeric less/greater
check. Having it would be important for us to continue started work of
using generalized machine feature checks to decide on some aspects of
image/package building, instead of hardcoding tests for specific
machines.

  So, hitting such need yet another time, I proceeded to add
base_less_or_equal() to base.bbclass, and used it to tweak locale
package install for Angstrom:

# Also, it appears that no locales fit in 16Mb for now. "C" locale rules!
IMAGE_LINGUAS = '${@base_less_or_equal("ROOT_FLASH_SIZE", "16", "", "en-gb", d)}'

  This shows common usecase, and makes clear why exactly
base_less_or_equal() was added - I don't have a usecase for
base_less() now at all.


  This code was committed, as it doesn't affect any existing aspect of
OE. Please feel free to tweak it, and of course use!


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



