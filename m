Return-Path: <winfried_mb2@xmsnet.nl>
Received: from smtp-2.concepts.nl (smtp-2.concepts.nl [213.197.30.125])
	by mail.openembedded.org (Postfix) with ESMTP id 73E75606D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:56:22 +0000 (UTC)
Received: from [2001:838:2:1::30:241] (helo=webmail.xmsnet.nl)
	by smtp-2.concepts.nl with esmtp (Exim 4.80.1)
	(envelope-from <winfried_mb2@xmsnet.nl>) id 1bMwIX-00016e-TN
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2016 13:56:21 +0200
MIME-Version: 1.0
Date: Tue, 12 Jul 2016 13:56:59 +0200
From: Winfried <winfried_mb2@xmsnet.nl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
References: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
Message-ID: <a53144a4c8faa1ec968e6aefdad47e01@xmsnet.nl>
X-Sender: winfried_mb2@xmsnet.nl
User-Agent: Roundcube Webmail/1.0.3
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1bMwIX-00016e-TN
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
X-List-Received-Date: Tue, 12 Jul 2016 11:56:29 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

>>> | ERROR: Function failed: do_configure (log file is located at 
>>> /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.2980
>>> 
>>> I'm running on ubuntu 14.04 with gcc4.8 and openjdk 1.8, i don't 
>>> think it's a side effect of the gcc6 patch,  but in your opinion, i 
>>> forgot something?
>>> 
>> 
>> this is building openjdk-8-native package. So you need to add a
>> bbappend for openjdk-8-native_72b05.bb as well
> 
> already done:
> 
> ➜  openjdk git:(develop) cat openjdk-8-native_72b05.bbappend
> CFLAGS_remove = "-fno-lifetime-dse"
> CXXFLAGS_remove = "-fno-lifetime-dse"
> 
> openjdk-8 is not a recipe, correct? any suggestion?
> 
> thank you. jacob

Here is the .bbappend that works for me:


wdobbe@tc-linux-build2:~/yocto/peek-krogoth/sources/meta-peek/recipes-core/openjdk> 
cat openjdk-8-native_%.bbappend

CFLAGS_remove = "-fno-lifetime-dse"
CXXFLAGS_remove = "-fno-lifetime-dse"

