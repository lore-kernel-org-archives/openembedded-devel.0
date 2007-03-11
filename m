Received: from [64.233.162.226] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HQDSg-0000nR-AG
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2007 03:07:02 +0100
Received: by nz-out-0506.google.com with SMTP id m22so764504nzf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Mar 2007 18:07:01 -0800 (PST)
Received: by 10.35.97.17 with SMTP id z17mr2244565pyl.1173578821374;
	Sat, 10 Mar 2007 18:07:01 -0800 (PST)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id 36sm6136830nzk.2007.03.10.18.07.00;
	Sat, 10 Mar 2007 18:07:00 -0800 (PST)
Date: Sun, 11 Mar 2007 04:06:57 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <274295013.20070311040657@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Allow to limit generated binary locales to predefined list
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
X-List-Received-Date: Sun, 11 Mar 2007 02:07:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Binary locale generation for the entire locate set provided by GLIBC
takes noticeable amount of time (several hours). While OE allows to skip
binary locale generation at all, that puts development environment
too far away from "release" one.

  The solution would be to allow to optionally constrain set of
generated locales to a predefined list. I had adhoc patch to do that
for few months now, and several people expressed interest in it. So, I
finally took time to clean it up and make list configurable via OE
variable, and submit it: http://bugs.openembedded.org/show_bug.cgi?id=1966

  List is specified using GLIBC_GENERATE_LOCALES variable, which can
be set e.g. in local.conf:

GLIBC_GENERATE_LOCALES = "en_GB,UTF-8 de_DE,UTF-8"

  Format is <locale>,<encoding> pairs separated by space. Format is
actually based on "SUPPORTED" file generated/provided with GLIBC. For
development purposes, encoding can be just "UTF-8", and for Angstrom,
only en_GB locales is required now. Previous default from OZ/Familiar
was "en_GB,UTF-8 de_DE,UTF-8 fr_FR,UTF-8".


  I'd appreciate comments and testing of the patch above.
  

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



