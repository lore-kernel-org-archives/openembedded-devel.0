Return-Path: <winfried_mb2@xmsnet.nl>
Received: from smtp-2.concepts.nl (smtp-2.concepts.nl [213.197.30.125])
	by mail.openembedded.org (Postfix) with ESMTP id C29AD60797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:18:51 +0000 (UTC)
Received: from [2001:838:2:1::30:241] (helo=webmail.xmsnet.nl)
	by smtp-2.concepts.nl with esmtp (Exim 4.80.1)
	(envelope-from <winfried_mb2@xmsnet.nl>) id 1bMcyw-000539-OX
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2016 17:18:50 +0200
MIME-Version: 1.0
Date: Mon, 11 Jul 2016 17:19:28 +0200
From: Winfried <winfried_mb2@xmsnet.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
X-Sender: winfried_mb2@xmsnet.nl
User-Agent: Roundcube Webmail/1.0.3
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1bMcyw-000539-OX
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: winfried_mb2@xmsnet.nl
Subject: Re: [meta-java] gcc6 support breaks build for gcc < 6
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
X-List-Received-Date: Mon, 11 Jul 2016 15:18:53 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> If you are not using default compiler then you have to take some action
> 
> add
> 
> CFLAGS_remove = " -fno-tree-dse"
> CXXFLAGS_remove = " -fno-tree-dse"
> 
> via a .bbappend in your layer.

Yes, to let meta-java compile with gcc 4.8 I added the following lines 
to a .bbappend file:

CFLAGS_remove = "-fno-lifetime-dse"
CXXFLAGS_remove = "-fno-lifetime-dse"

If that is the final solution, please add this to the README of the 
meta-java layer.

Thanks,
Winfried

