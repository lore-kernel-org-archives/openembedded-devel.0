Return-Path: <winfried_mb2@xmsnet.nl>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Jul 2016 11:51:28 UTC
Received: from smtp-1.concepts.nl (smtp-1.concepts.nl [213.197.30.124])
	by mail.openembedded.org (Postfix) with ESMTP id 85D7260797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:51:28 +0000 (UTC)
Received: from [2001:838:2:1::30:241] (helo=webmail.xmsnet.nl)
	by smtp-1.concepts.nl with esmtp (Exim 4.80.1)
	(envelope-from <winfried_mb2@xmsnet.nl>)
	id 1bMZVf-000BvA-KJ; Mon, 11 Jul 2016 13:36:23 +0200
MIME-Version: 1.0
Date: Mon, 11 Jul 2016 13:37:01 +0200
From: Winfried <winfried_mb2@xmsnet.nl>
To: daniel.mcgregor@vecima.com, openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Message-ID: <fd5cee43db0bd882f662d5cd2f3d0c34@xmsnet.nl>
X-Sender: winfried_mb2@xmsnet.nl
User-Agent: Roundcube Webmail/1.0.3
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1bMZVf-000BvA-KJ
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: winfried_mb2@xmsnet.nl
Subject: [meta-java] gcc6 support breaks build for gcc < 6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2016 11:51:30 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Commit 	33ddb28a6428b02ddcc82d1954ecf27cd426fbb5 (openjdk-8: make GCC6 
happy) adds gcc option -fno-lifetime-dse, which was added in gcc6. This 
breaks the compilation of openjdk-native on hosts where gcc4 or gcc5 is 
the default compiler.

If this is intentional, I think the README file should mention that 
meta-java requires gcc6. Better would be to add the '-fno-lifetime-dse' 
option only if gcc >= 6 is used for native compilation (if that is 
possible).

regards,
W. Dobbe



