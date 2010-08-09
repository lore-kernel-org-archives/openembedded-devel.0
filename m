Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OiYgr-000658-EK
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 22:11:48 +0200
Received: by gwb15 with SMTP id 15so3779750gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 13:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=C3XpwAx+MzK0TSLn/Jke7df6Qge9dHA+hfsKnOC15TY=;
	b=U3/7oCznXGib0wwDgA/sZo3FDGEq0c+y1atzTUq34ZdZXzjbqP6BkEli9326BOe/B9
	aKuYMZeaeipQAdWL3GHGE/k4bRYup5jZSphY4JjdilxsKC3vHN9uVI+YNtdJTstGsh53
	+53/hUc8wXm6Dp96E8XBtuypGACDysusHWLJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Jxm6lGee1e3qcWqyWp5LOuHQGqs2ovfUvJq8FsdHYUInfALfRz8PmtfNtB3mJ7JCrM
	YeL8uVBnJTxPEwlze3fZTh0a8XSIzQB1+lSPpDbzD9wmfSnjECQLzko3snFFUwpOtlrV
	S7w/u1jRWIYodk2/uBGdt1qgdmIK8kyFeS7sI=
MIME-Version: 1.0
Received: by 10.90.80.4 with SMTP id d4mr11496007agb.11.1281384671077; Mon, 09 
	Aug 2010 13:11:11 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 9 Aug 2010 13:11:11 -0700 (PDT)
Date: Mon, 9 Aug 2010 22:11:11 +0200
Message-ID: <AANLkTins6C3X=pTXeKVn=9m=npXV7vZc9O5xLBaNJNAr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: python native dependencies
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
X-List-Received-Date: Mon, 09 Aug 2010 20:13:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was wondering about some python native dependencies and whether they
are needed.

E.g. python-divmodaxiom_0.5.30.bb depends on python-divmodepsilon-native
It builds and the package works as expected, but still I doubt whether
this is ok.
I'm not a python wiz, but I understand that divmodaxiom needs divmodepsilon.
However should this be a dependency on the -native recipe? I would
have expected that the dependency is on divmodepsilon instead of the
native variant, and that python to generate things uses the staged
version of divmodepsilon.

Is my reasoning correct? If so how should we resolve this?

Frans


