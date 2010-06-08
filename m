Received: from mail-pz0-f178.google.com ([209.85.222.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OM0ju-0005Y2-4Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 17:29:19 +0200
Received: by pzk8 with SMTP id 8so417501pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=JsWQZm8CWd3b/LnwT4H7a+TUtgmiChsResYTcpCMYOw=;
	b=kTXUm7VO17NGBOXButdZyx9ui88svV8/H0mxk03xPv1axw8eVwCl52NC+3vUipSE2O
	u1y8WO63M661hmH6En4LOaJGoLoLwyFd8K5AEaVJuAy3GN2EPFPhLaY/ny7FmHpHblFG
	dBlqGBBNHVuTYRYm05volwrz7bTZDfcclXAio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=EGmhJWTaw2pvq6HgEl2OLAmaxPwUfsoMeHLiQzwbe3EmBynumYZGEvEVSvMX/rJahu
	8/7IdpqKVA45udPfmfDzrU2AdqUfBGoZdqTLlwLspnabmK1+18hB/amfkhtEqWcsHoz8
	goLBYF+Qc9GsE4s84Ty9Ugofqo1jyGCi69RY4=
Received: by 10.224.30.135 with SMTP id u7mr9477908qac.197.1276010693788; Tue, 
	08 Jun 2010 08:24:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Tue, 8 Jun 2010 08:24:25 -0700 (PDT)
In-Reply-To: <BAY127-W2325648E02B2D81BA370B0D8D60@phx.gbl>
References: <BAY127-W2325648E02B2D81BA370B0D8D60@phx.gbl>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Jun 2010 08:24:25 -0700
X-Google-Sender-Auth: itrVmrqi2yErK4QQLIqyF4gaEWY
Message-ID: <AANLkTikPVypcRj0ZCyB6wNveS9CClBQZLiQCSL5uwR9e@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.178
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: path error in bitbake file
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
X-List-Received-Date: Tue, 08 Jun 2010 15:29:19 -0000
Content-Type: text/plain; charset=UTF-8

As you'd know if you'd read the manuals, local paths are specified with
file://.  file:///sdr/GPP_node is what you want.

On Tue, Jun 8, 2010 at 8:05 AM, saleh usman <salehusman@hotmail.com> wrote:

>
> I want to give a path of a directory /sdr/GPP_node in bitbake recipe in
> which source files are placed. I did this as
>
> SRC_URI = "/sdr;module=GPP_node"
>
> But it is showing error as shown below. kindly tell me the exact format for
> this path.
>
>
> NOTE: Running task 1783 of 3200 (ID: 1081,
> /sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node_svn.bb,
> do_fetch)
> NOTE: Task failed: Malformed URL: /sdr;module=GPP_node
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /sdr/ossie_collection/packages/ossie-nodes/
> ossie-gpp-node_svn.bb do_fetch failed
> ERROR: Task 1081 (/sdr/ossie_collection/packages/ossie-nodes/
> ossie-gpp-node_svn.bb, do_fetch) failed
> NOTE: Tasks Summary: Attempted 1782 tasks of which 1782 didn't need to be
> rerun and 1 failed.
> ERROR: '/sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node_svn.bb'
> failed
>
>
> Saleh
>
> _________________________________________________________________
> Hotmail: Trusted email with powerful SPAM protection.
> https://signup.live.com/signup.aspx?id=60969
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

