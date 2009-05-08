Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1M2KxL-0001W4-Ot
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 09:57:19 +0200
Received: by an-out-0708.google.com with SMTP id b6so734000ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=YY/DDT1B9Uvts7rDlD9aEFgKgxqbwiS5l3y45Hj7euY=;
	b=cxvyfCp87J7UiIZ0quExJshMe89TD017Y08xy7vsoVWBXN0IkA124/HLZhuYz44AYO
	CUTYOBgo+t3EJWzg78tczTmzi4PHz+L1nkO5aH6T3gv7az9KwYTWyeCzNrAV5R91K2sS
	EOXbiOa22uvG9LfkNrbJItG1cyOMss8swFyK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=KQoUoSHyN25Iily3prOm/SDoypWQZ4dKFK+M1c8K0TvhkvfRdRCD6cP5zcYr3Ud+XE
	v6bI2HDVEPSiDoG6ghgGUR8wOSKXxmxj234pKNW6EG2LcrJQ8JFzLuKwDjSN/bFFVfaF
	8YMEUTtgb4P5XQbj22uA6dQHmowI0ndU3E8GQ=
Received: by 10.100.141.12 with SMTP id o12mr577038and.141.1241769068627;
	Fri, 08 May 2009 00:51:08 -0700 (PDT)
Received: from is.home (93-81-71-33.broadband.corbina.ru [93.81.71.33])
	by mx.google.com with ESMTPS id c1sm2416890ana.27.2009.05.08.00.51.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 00:51:07 -0700 (PDT)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 May 2009 11:50:56 +0400
User-Agent: KMail/1.9.10
References: <87eiv05wna.wl%peter@chubb.wattle.id.au>
In-Reply-To: <87eiv05wna.wl%peter@chubb.wattle.id.au>
MIME-Version: 1.0
Message-Id: <200905081150.56405.jay4mail@gmail.com>
Subject: Re: How to boot Cacko from KexecBoot on Collie?
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
X-List-Received-Date: Fri, 08 May 2009 07:57:20 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!
> 	Is there a trick to kexecbooting Cacko on collie?  The issue
> at present is the filesystem on /dev/mtdblk0p1 --- which should
> contain CACKO's root file system (it's hard coded in various scripts)
> --- but which contains the kexecboot initrd.

Kexecboot have no separate initrd. It is kernel+initramfs 'all-in-one'. 
Kexecboot is 'flashed' as ordinary (e.g. Cacko) kernel.

But I have no collie so I can miss something specific..

BTW, I know that some peoples have kexecboot that starting Cacko from NAND 
on akita.

-- 
Yuri Bushmelev


