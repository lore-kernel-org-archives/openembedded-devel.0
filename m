Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Nov 2016 08:36:52 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE806FEF3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Nov 2016 08:36:52 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 86AA8D4038D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Nov 2016 09:26:59 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A1F9DD4038C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Nov 2016 09:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Nov 2016 09:26:58 +0100 (CET)
Date: Tue, 8 Nov 2016 09:26:53 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161108082653.GA30886@mail.itconsulting-heinold.de>
References: <bd6b1167-2fc3-fe4f-acfe-d64f0d08e3b9@ripperd.com>
MIME-Version: 1.0
In-Reply-To: <bd6b1167-2fc3-fe4f-acfe-d64f0d08e3b9@ripperd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java] openjre-8 arm JIT jvm
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
X-List-Received-Date: Tue, 08 Nov 2016 08:36:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2016 at 08:55:47PM -0600, Dean wrote:
> Does anyone have this working? The default recipe for ARM architecture only
> builds a zero jvm that runs in interpreted mode. Naturally this is very slow
> on a slowish ARM processor. I have an application that makes heavy use of
> Java and need to upgrade from OpenJDK 7 to 8 as we are having some trouble
> with PKCS11/JCE in OpenJDK 7.
> 
> I did see that Jens had committed OpenJRE-8 with an option to enable shark
> and JIT via LLVM but when asked Jens indicated it was abandoned. I got it
> building but it crashes on startup.
> 
> Anyone else doing this and have any leads, pointers, or recipes for OpenJDK
> 8?
> 
> Thanks,
> 
> Dean

Hi Dean,

the arm32 byte interpreter and jit is developed here http://openjdk.java.net/projects/aarch32-port/ and
fornatly orcale has openend up there closes source arm32 jit too. With thoughts to include it for
java/openjdk 9. So to get fast arm32 java no you need to checkout the mercurial repository from there and
modify the existing recipes.

Bye Henning

