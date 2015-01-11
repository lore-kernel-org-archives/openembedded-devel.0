Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id B4D74609B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 15:23:05 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id F222DD40346
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:23:02 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 90DA5D4025E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:23:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DEAR_SOMETHING autolearn=no version=3.3.2
Received: from mail.itconsulting-heinold.de (e179143209.adsl.alicedsl.de
	[85.179.143.209]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:23:00 +0100 (CET)
Date: Sun, 11 Jan 2015 16:22:48 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150111152245.GC2465@mail.itconsulting-heinold.de>
References: <CAOg63ZwrYDg+n=631P18+9VFLQVkBPgQdLvWkQnnQxnOJ=sz8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOg63ZwrYDg+n=631P18+9VFLQVkBPgQdLvWkQnnQxnOJ=sz8w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: openjdk-7 failed with exit code '1' for angstrom linux image V2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Jan 2015 15:23:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 11, 2015 at 09:31:08AM +0530, Nikhil Gend wrote:
> Dear Sir,
> 
> I am building angstrom linux image V2.3 for toradex colibri-t20 module and
> I got error while compiling openjdk-7 as
> 

> |      12836 Segmentation fault      (core dumped) | qemu-arm -cpu cortex-a8 -s 2097152 ./mkbc - bytecodes_arm.s
> | make[7]: *** [bytecodes_arm.s] Error 139
> | make[7]: *** Waiting for unfinished jobs....


We are using qemu to build the arm bytycode assembler unfornatly the update of qemu in openembedded-core breaks the build
and nobody had the time to look deeper into it. As a workaround you try to revert the qemu updates on your local branch.

Bye Henning

