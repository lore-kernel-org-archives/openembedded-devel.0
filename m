Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PSUBC-0007Fz-M6
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 13:40:31 +0100
Received: by fxm11 with SMTP id 11so585039fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 04:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/wvuqUyyJN+BrGPhSZpRtkALREEJEUUoeHf1oJR5sHs=;
	b=W6/NuZdQT2mdnKBoKyW+S1dGb3EQci2WtZDTDlUI1j1QR/ckTdmcyJSol5r6PNjouE
	/Ikz8SUB/J7U1sFX83YfSPGVEdGZLAnwr0QCm9TLOjfK69Txlp7NRSAiXYhIKAuVIQn+
	M4CHi7uPfnvWu7hzJiGpME9Nj3QDb3WtmjML8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RNmWwue2c5rA7aIA/wpw3Zww6oyV/pzAEen9QLCh8RjOBbQS2rZOApSh3sB1oXHCQ4
	+v/2fzyMCSrgF8Xjbg6ZNWPLSzZnL7MmwiX+LyPOk0FRwO3A2QOBOPE/dN+5XNWFnH8V
	CujtLKzNjyuShZy7MhqElzQxyAvIHmQf2dw74=
Received: by 10.223.83.133 with SMTP id f5mr1786219fal.101.1292330334366;
	Tue, 14 Dec 2010 04:38:54 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm2096489fav.2.2010.12.14.04.38.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Dec 2010 04:38:53 -0800 (PST)
Date: Tue, 14 Dec 2010 13:39:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101214123927.GB6662@jama>
References: <1292284879-11158-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1292284879-11158-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc-4.5.inc: Revert PR 42172 backport
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
X-List-Received-Date: Tue, 14 Dec 2010 12:40:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 13, 2010 at 04:01:19PM -0800, Khem Raj wrote:
> * This fixes the gcc ICE as seen compiling samba
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I can confirm that with this and your other samba patch it 
compiles now fine on armv4t (om-gta02), Thanks

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


