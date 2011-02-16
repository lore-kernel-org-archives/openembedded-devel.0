Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqgA-0004ae-ER
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:21:02 +0100
Received: by iwn8 with SMTP id 8so1834137iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=+9APrzvkuNCvvooWALvQRCgzG4Cfmk3uhJq/dy3pfyw=;
	b=sOw4AlArDIkrBo1umZOCSHb9HKNzgb8O8OXPtWstOpf+GKJ7i2cVK56oGwlZek3a4A
	7ce17rTyxKEks2CT4ebIqtVP+X83OL8nhS1vD9TnXtIyhrX7VZDNHU9azGTP+h1Z2Eoj
	JzOAYPCYk9N+Xv2BBLRfen1/PPeI73ar1wjRU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=uN/AZrFFFfcohWn0T+BzPcKU6paIz3xuZ0KS182y8Be0Bw0e2WuECCSoJoRfIE3elz
	yaK8F63YXdRcXGuT+91TZFtdojZgyo2qV1pSoyzBK2jsLqcTYYZfnzLFyq6Q3Ns1zvn/
	0AeW1jMDJ6ZarLy4U9vjqlq9X9HZ6W4SX9Zgc=
Received: by 10.42.61.131 with SMTP id u3mr84440ich.514.1297898386984;
	Wed, 16 Feb 2011 15:19:46 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y8sm162007ica.14.2011.02.16.15.19.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:19:46 -0800 (PST)
Date: Wed, 16 Feb 2011 15:19:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20110216231949.GY14525@sakrah.homelinux.org>
Mail-Followup-To: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
	<20110216230953.GT14525@sakrah.homelinux.org>
	<AANLkTikZ1DpDSnj0gPwZVA4uZHTB1uR3B5dM+haW_VWh@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikZ1DpDSnj0gPwZVA4uZHTB1uR3B5dM+haW_VWh@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/13] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Wed, 16 Feb 2011 23:21:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 23:15), Otavio Salvador wrote:
> On Wed, Feb 16, 2011 at 23:09, Khem Raj <raj.khem@gmail.com> wrote:
> ...
> >> +target_libdir := "${libdir}"
> >
> > could you explain more why this is needed
> 
> Used on the qt-native-sdk change.

Could you revert this and see if it fixes your i586 gcc-cross-sdk issue
?

-- 
-Khem


