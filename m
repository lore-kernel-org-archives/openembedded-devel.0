Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1Lodj1-0002YD-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 15:09:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 59A71148005;
	Tue, 31 Mar 2009 15:07:43 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3G6X3ifsKYZ5; Tue, 31 Mar 2009 15:07:43 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9924.dip0.t-ipconnect.de
	[217.95.153.36])
	by mx51.mymxserver.com (Postfix) with ESMTP id 6AE92148008;
	Tue, 31 Mar 2009 15:07:42 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id D85A21E0122; Tue, 31 Mar 2009 15:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 7B8E71E0100;
	Tue, 31 Mar 2009 15:07:38 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2009 15:06:49 +0200
User-Agent: KMail/1.9.7
References: <49D21128.30201@gmx.net>
In-Reply-To: <49D21128.30201@gmx.net>
MIME-Version: 1.0
Message-Id: <200903311506.49362.hs4233@mail.mn-solutions.de>
Subject: Re: ugly OE issue with RDEPENDS
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
X-List-Received-Date: Tue, 31 Mar 2009 13:09:57 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> The odd thing that happens here is: jamvm (which I want to
> build) is a provider for java2-runtime but this does not
> interest OE and it builds another provider for java2-runtime
> instead. In my case this is openjdk-6, a recipe takes a very
> long time to built.

As a local hack, you might be able to shortcut bitbake by putting 
this in your default.conf:

ASSUME_PROVIDED += "openjdk-6"

Maybe should instead say ASSUME_PROVIDED += "java2-runtime", but 
then "bitbake world" wouldn't make jamvm. But you can 
specify "bitbake jamvm world" instead.



This hack doesn't solve the underlying problem, but should cure 
your sympton in the meantime.


