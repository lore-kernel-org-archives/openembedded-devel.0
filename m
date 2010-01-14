Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NVVmr-00059X-GW
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 20:55:24 +0100
Received: by fxm4 with SMTP id 4so21366117fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 11:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=A9rWgk4sGEB4mQ1T3MqO1lnr9RPzQvtzXrzfJiVw1lk=;
	b=wJNZnVGQfy4c5Cl/oMCyf9Mp3bza3GXjc1lXm5xxmYEXnRH5J/jmzp4auxca4AdY03
	ipKM2W6KFbOG08esdn4SOgVftvYZ38tjsSk+8E9tnPKrMvGocIfh0+qOldo+9bFtK7FR
	UzDhOxyKl3A1MhY6aSgqUDDo+g2Xq5SZvekQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DVF4+JZwCWEa3o70TBruewylg/LtsPnKypcPUlVxOP2lX1GKpm97azdSok+vau5sSa
	/mURT7D0TI/Nd7LedtJqj7pHM+87gEzyjkvjsKm/dpTA9UIjlzMF/vQSCBsJIQO/zhDn
	cpIJl+B51hgd1WiME2raOD98YQFzkeNSVg+ko=
Received: by 10.223.75.136 with SMTP id y8mr1556951faj.69.1263498789692;
	Thu, 14 Jan 2010 11:53:09 -0800 (PST)
Received: from gmail.com ([72.14.240.164])
	by mx.google.com with ESMTPS id 21sm1350114fks.37.2010.01.14.11.53.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 11:53:08 -0800 (PST)
Date: Thu, 14 Jan 2010 11:53:01 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100114195301.GA3529@gmail.com>
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Thu, 14 Jan 2010 19:55:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/01/10 17:19), Guo Hongruan wrote:
> After changing this way, the native tools can be shared with
> different buildings.

They get shared even now. I have my TMPDIR = /scratch/oe/build and
DEPLOY_DIR = ${TMPDIR}/deploy/${LIBC}

I share the native tools all the time

-Khem


