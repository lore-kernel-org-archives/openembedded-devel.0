Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NAitw-0001vC-EZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 12:40:47 +0100
Received: by fxm1 with SMTP id 1so1007117fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 03:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Hs74YGTsyyPUoOuAwxjmANVYy6ECPFFDdWiZriUx4aI=;
	b=H+49I6jWddVW544HlkPlK1KnVkL1ypCkeNXqAngv8Ga3juYVwkhmlxDh/HE0BmmCFC
	MjPVJ2IfMGfmZQZlZKFbH+au95qvCZ7wVdz/boFh4wMeAxQRljlBDRmSu9/H50pY+3F6
	E/WMDUKlVpPH/QlTEzqbttg2ygFGfF7rGMkk4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rAGf5PQobRdP1JRX/KOtQ9t/vdekMWfset85ig/CZAmE3WiYT82hGR3qJ5FJKv/UUq
	Vnf0h2T7Bkwjsme5Qgx72+1S662z8NTnFNEDNFRdWR39OX7+rEn8FehEuTooNMDdOy9g
	+K1hWBmIyMazJf4T3qbjH71Z9uNn6QNea62Rc=
Received: by 10.204.48.144 with SMTP id r16mr1063224bkf.170.1258544360714;
	Wed, 18 Nov 2009 03:39:20 -0800 (PST)
Received: from s42.loc (85-127-251-67.dynamic.xdsl-line.inode.at
	[85.127.251.67])
	by mx.google.com with ESMTPS id 16sm617263bwz.7.2009.11.18.03.39.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Nov 2009 03:39:19 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NAiuP-0001iN-Uk; Wed, 18 Nov 2009 12:41:13 +0100
Date: Wed, 18 Nov 2009 12:41:13 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091118114113.GC2919@mx.loc>
References: <he0ijk$kqa$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <he0ijk$kqa$2@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert of 406cd0fee12ad99ba6d6f7d55f743cc4c6697955
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
X-List-Received-Date: Wed, 18 Nov 2009 11:40:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 18, 2009 at 11:34:28AM +0100, Koen Kooi wrote:
>Hi,
>
>Since 406cd0fee12ad99ba6d6f7d55f743cc4c6697955 broke all
>glibc-internal-iconv builds and I'm too lazy/stupid to fix it
>properly for uclibc I reverted this commit.

for unpatched uClibc you could just
TARGET_CPPFLAGS += -D_Exit=_exit


