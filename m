Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OJfaS-000160-2o
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 06:29:53 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 2A1AEF8C6B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jun 2010 00:25:39 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Wed, 02 Jun 2010 00:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=wfQGU3DI+dRDbHZmOmSbE57hU9M=;
	b=amZU2x67PMdwkgeGp9/i4ofz+gfakjMWMXe75/lTql+XOfW1iO8Ng3r7OIwOhedmycHigndDmw7a54cOdNmfPKC+XrO6TM4YDXMQJwJMaJDFxKelWtYcg/b+3tA7XbYPyG7jRp7hPZVpspa2RVfAtIKKyGclM9uAi06QWwe/m5I=
X-Sasl-enc: wFULN6FRXgmubeRFb54zC4FdLgTQnHrjwiHvl+eMW+kS 1275452738
Received: from [192.168.1.35] (hnvr-4d07a615.pool.mediaWays.net [77.7.166.21])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 83F874A008F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jun 2010 00:25:38 -0400 (EDT)
Date: Wed, 2 Jun 2010 06:27:07 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1275435453-1118-1-git-send-email-vjensen@gmx.de>
Message-ID: <alpine.LNX.2.00.1006020624130.5274@asterix.crazy-teaparty.dyndns.org>
References: <1275435453-1118-1-git-send-email-vjensen@gmx.de>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.29
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-n1200_2.6.27-rc9+git: change KERNEL_OUTPUT to a relative path
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
X-List-Received-Date: Wed, 02 Jun 2010 04:29:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Wed, 2 Jun 2010, Vitus Jensen wrote:

> deploy method in kernel.bbclass automatically adds {S}
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>

Without this patch do_deploy fails (cannot stat {S}/{S}/arch/powerpc/....)

n1200 is now a (the only) buildable ppc603e-based machine :-o

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


