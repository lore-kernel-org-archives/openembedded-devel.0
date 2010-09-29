Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1P0w70-0003Ux-ED
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 14:50:19 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1P0w6j-0007EZ-PI
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 14:50:01 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id C2ED86A125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 14:49:56 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 14:49:52 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <201009291449.52274.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1P0w6j-0007EZ-PI
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: module_strip.bbclass and get_kernelmajorversion
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
X-List-Received-Date: Wed, 29 Sep 2010 12:50:19 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

recipes inheriting 'module' are triggering this error:

NOTE: <type 'exceptions.NameError'>:name 'get_kernelmajorversion' is not 
defined while evaluating:
	if test -e ${PKGD}/lib/modules; then
		if [ "${KERNEL_MAJOR_VERSION}" == "2.6" ]; then

This is because module.bbclass inherits module-base, which inherits 
module_strip.
And module_strip uses get_kernelmajorversion, which is defined by 
linux-kernel-base.bbclass.
So as long as both module_strip and linux-kernel-base are both inherited, 
like kernel.bbclass does, everything is fine.
But with module.bbclass, get_kernelmajorversion is missing.

Should module_strip.bbclass inherit linux-kernel-base?
Or is there a better fix?

Rgds, Pieter


