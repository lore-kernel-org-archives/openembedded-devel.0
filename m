Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P5iUH-00039d-5v
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 19:18:05 +0200
Received: by bwz9 with SMTP id 9so1535408bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0YUzHTgTYby++ciBPrjSeKcVhoSFab8HKDZztDkAAUQ=;
	b=lxP9uXSVNUauwEs5Pc7aVw/AKcTROC3KByXQNWnn5DyYlTW8d9ZPwsaPcbqcJ2lSsw
	nvU53wp7UhRJLqUbsT8wUksAOI6YZTmM9D835FmVEUurl5M00M3RLiGaoJQRVxphgO/u
	I4QiAIIQ1H2709zhyoIKd5R5uoTTZYoNK0lQw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wwmaUqHd4EGCdC2BGeA1KPNlwusa0bO3KlPO9whZW+FTJerCVrvIKbJ0Td+dGx1y5k
	+aIaifhSR3yXKR3o+raB/hzwbCF3FSCS7zhz3VmMOlCspb84qP/sdgbOybrL2kI/54Fy
	U6+yn65PfXLbnaGNLBRxRzCHQjiy4IUv6tJJs=
Received: by 10.204.70.67 with SMTP id c3mr6649192bkj.62.1286903860023;
	Tue, 12 Oct 2010 10:17:40 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u4sm4530396bkz.17.2010.10.12.10.17.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Oct 2010 10:17:37 -0700 (PDT)
Date: Tue, 12 Oct 2010 19:17:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101012171736.GB3549@jama>
References: <4CB48C51.9000403@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4CB48C51.9000403@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Remove older freetype versions
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
X-List-Received-Date: Tue, 12 Oct 2010 17:18:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 12, 2010 at 09:26:57AM -0700, Tom Rini wrote:
> Hey all,
> 
> I'd like to remove all versions of freetype before 2.4.3.  The only dist 
> which is pinning freetype currently does so via
> conf/distro/include/preferred-opie-versions.inc and that pins to a 
> non-existent version (it's using OPIE_VERSION which seems wrong).  All 
> of the previous versions have various security issues, including 
> remotely exploitable ones.  Only the very oldest version we have as a 
> D_P -1 so everyone was using 2.3.12 and will be going up to 2.4.3 
> (libraries are compat).

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


