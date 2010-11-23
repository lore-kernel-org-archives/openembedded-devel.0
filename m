Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PKthU-0008UD-9r
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:18:42 +0100
Received: by bwz10 with SMTP id 10so7086409bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=/bgqTaLc2FQoYCcQ8WpwHkqMZFaOgimRN4J15elsJHc=;
	b=LNKLzkB6kelWVz5ks4hjOXjz9Bbx2nM0fvxxp/mVodOxt4xoxotVdbLRnJ1hoej0RU
	T2ObY9uO7NvwTrBv2HUj6cHALQ0F5e6tjCFDWs8LBprlKATxrnshhSDK7d3j9cPbNLFS
	TUoZF9CHdUC+pgpGMtWu41nHEhs35VgIU68OY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=UcZ5U0bCsfB0qu4zTnuwGqtn6HyP+6WNY61DgiFlWpxKi4hs+2W5QVCVH51f3xqo7X
	PEZdu7Qt6VI9BgryHrWqI/Lwp0ZO/7DZ/bv+s8wI7eyPvzmjrLpNxam4x5sVQj6qnxiM
	QP2kFWsx2BbV0hh06l6HYbhhMFhq5zpJvgE/4=
Received: by 10.204.71.65 with SMTP id g1mr6850134bkj.23.1290521833745;
	Tue, 23 Nov 2010 06:17:13 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l3sm1017478fan.0.2010.11.23.06.17.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Nov 2010 06:17:08 -0800 (PST)
Date: Tue, 23 Nov 2010 15:17:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101123141703.GE3274@jama>
References: <1290521490-1975-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1290521490-1975-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] micro: update prefered binutils for arm
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
X-List-Received-Date: Tue, 23 Nov 2010 14:18:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 23, 2010 at 03:11:30PM +0100, Eric Bénard wrote:

> * with this, the build finish but image creation fails with :
> http://tinderbox.openembedded.net/public/logs/task/10935754.txt

this should be fixed with
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=237192e0a83e5a629133e387c2aa9e5dc322982a

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


