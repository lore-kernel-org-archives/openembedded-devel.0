Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ovr78-00024f-MA
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 14:29:27 +0200
Received: by ywa8 with SMTP id 8so41938ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Y5r4vNG8EKfxcOE+s2HdG6kKpQv8l70peVYwsFH1VNo=;
	b=jqU4wqzKW8wg57W7SPRouHzqqBztog0DbzP4Z3w/lecGLTxcX26WP/4PhcTXn5Wm+R
	nzNLpAa+rhIty9LkpcVU8BE5H0pVP7J59jInFlBpA0Zkfh9LkZ2nKkHR7QjIemQDibMg
	1f1CMxdodicfXwNlBoDTFF6g/HzekR7hs+W7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=t8qK080FlDu03zoYlN+u0n3r2cyMf402djlwhjDfBUrE3Oi9zVELp/81trpVRaDZ3a
	BCtp+969bHjAqo7PlCNKiyAvhIOy30hKllS9vYxIapmuCgQpPEIe+MkxFXWy1MRMINJI
	05x1yqVssM/F1Ncbf+RaatVUWdVUfe6QQKUtw=
MIME-Version: 1.0
Received: by 10.100.105.15 with SMTP id d15mr1658837anc.212.1284553715976;
	Wed, 15 Sep 2010 05:28:35 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Wed, 15 Sep 2010 05:28:35 -0700 (PDT)
In-Reply-To: <4C90B821.10203@mlbassoc.com>
References: <4C90B821.10203@mlbassoc.com>
Date: Wed, 15 Sep 2010 14:28:35 +0200
Message-ID: <AANLkTik7C4xZOGMobssYDEAD96kpAUweQAOZ99dsh7a1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: another failure in testing-2010-09-13
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
X-List-Received-Date: Wed, 15 Sep 2010 12:29:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/15 Gary Thomas <gary@mlbassoc.com>:
> MACHINE=qemuarm
> DISTRO=angstrom-2010.x
> TARGET=x11-gpe-image
>
> NOTE: package xf86-input-mouse-1_1.5.0-r14.1: task do_configure: Failed
> | Requested 'xorg-server >= 1.5.99.901' but version of xorg-server is
> 1.4.0.90
>
> As far as I can tell, there is no xorg-server in the tree which
> satisfies these criteria.

Is this a new one for this tag or did it also appear on the previous
tag (or was it first tested with this tag).
I'm not too much into x but I guess you get your server from
xserver-kdrive_1.4.0.90.bb
suspect this only works with the xserver-xorg recipes like xserver-xorg_1.9.0.bb

Frans


