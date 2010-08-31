Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1OqOCN-00076e-1P
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 12:36:17 +0200
Received: by gxk2 with SMTP id 2so2595673gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=lMuP+pIvY3e4JeGl+a8nGRf64tZVNaXn9nr0s6MGd0g=;
	b=nT6whJQIA/NUWp0TLNf4yJzidRkIQSDer6cq1ugE156CsrQedqpYi8dsuXnWxd+Gdn
	dgFxFhoT9e0Jg4yUWOQDPVMIjjuT7ui73PMrDEm+PKP5ZFUjjlmuRr62Os/hZt/U+8kG
	CsbnW4EIFtmv0OSSHLM/9xSgYe+38KuHDnrNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=S5k66n6G9xmJ4zvwLAHRWJ4MRMR/UhsR9G7S8WrnB/VVpzfCv1EvQ3g6cf9OanGr42
	xcCWIIr61w1paflU/SVhnrQw3Oj99TTIUK5WFxjRRXUHnBJ93DVVwIfoq2tC3FwMB8TE
	ofLjh1LxqhmlmuZzHXkXQBlf9r0gEsIG3Z3RY=
MIME-Version: 1.0
Received: by 10.151.60.4 with SMTP id n4mr1383790ybk.294.1283250941578; Tue,
	31 Aug 2010 03:35:41 -0700 (PDT)
Received: by 10.231.157.78 with HTTP; Tue, 31 Aug 2010 03:35:41 -0700 (PDT)
In-Reply-To: <4C7CCC1F.7090006@xora.org.uk>
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
	<i5iej2$qi2$1@dough.gmane.org>
	<AANLkTikFZx7DQzBzTFfjQTxCK+zV6k7Mf29WFivEV8vW@mail.gmail.com>
	<4C7CCC1F.7090006@xora.org.uk>
Date: Tue, 31 Aug 2010 12:35:41 +0200
Message-ID: <AANLkTi=XzTQ96qyDOYTUfFZL1VUwJGq+-S_5-f=E6JB_@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Tue, 31 Aug 2010 10:36:23 -0000
Content-Type: text/plain; charset=UTF-8

> There is no such thing as a stable kernel anymore, all 2.6.XX releases
> are classed as unstable, it is upto vendors to stabalise and select API/ABI.

I hope there can be a good teamwork on this difficult integration.
I'm not informed about

>> http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=blob;f=include/net/inet_sock.h;hb=c720c7e8383aff1cb219bddf474ed89d850336e3
>> with
>> http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.32.y.git;a=blob;f=include/net/inet_sock.h;h=47004f35cc7eaf6f2b3cac2779ea7b7ccd5d9c1f;hb=HEAD

comparison.

But, similarly, with DaVinci kernel we have the Kevin Hilman tree
(really close to mainline)
[1] http://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.git
and the Arago one (compatible with DVDSK)
[2] http://arago-project.org/git/projects/linux-davinci.git

Ti accepts patches for Kevin Hilman tree,
instead Ti guarantuees for Arago tree.
So I'm also interested in this topic.
By now [2] is good enough for my needs.

Raffaele


