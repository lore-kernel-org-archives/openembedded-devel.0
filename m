Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NxKPU-0000Im-VN
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 15:26:13 +0200
Received: by fg-out-1718.google.com with SMTP id e12so708567fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Ln3F5qQY6INko0FmNMvoitrsQrilC0jou3SvNJHJVS4=;
	b=qvleBClGwcwwTO800Ew8NavRQMc7vzLOfJ2hp8nxpzdc4GzII3AKZtktXOwxrhyDjc
	tc2g2xxE13K71oVbXaYn5q9X0XrCMUcK6pgnfXUdkiusgXYh+l81Zn3rhmTnAVFBVKRm
	AN6mHDHFA1giK3lwfNbLCGnHSL3DILoXhhM2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EpEbowc5FcEsoEhrYh9PjQHrBEeYzqMf/64cIY7KORMuc2nNu981TigXAVHLU3TzYT
	6HB0Tiqf8oEE0oTVkNIo1DSwyCjXg/k+5wTNipp6Wd7G6ZMEk1HjsHwafoiH7QAx4HRk
	MIlAtHKzXMbiYOkwUn1Xv/pvf3vPufF7rAlC4=
Received: by 10.86.239.33 with SMTP id m33mr2080932fgh.31.1270128178454;
	Thu, 01 Apr 2010 06:22:58 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm5630955fxm.5.2010.04.01.06.22.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 06:22:57 -0700 (PDT)
Date: Thu, 1 Apr 2010 15:23:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401132312.GM25489@jama>
References: <20100330122319.f0e46761.ospite@studenti.unina.it>
	<1270127783-21172-1-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <1270127783-21172-1-git-send-email-ospite@studenti.unina.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] frameworkd-config-shr: fix a nasty typo
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
X-List-Received-Date: Thu, 01 Apr 2010 13:26:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2010 at 03:16:23PM +0200, Antonio Ospite wrote:
> A misplaced '-' instead of '_' made bitbake conditional appending fail,
> resulting in fso-abyss being added unconditionally to runtime
> dependencies.

Wow, good catch! I'll apply now.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


