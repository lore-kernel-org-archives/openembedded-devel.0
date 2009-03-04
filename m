Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piernik@gmail.com>) id 1LeoOo-0001x5-1e
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 11:34:18 +0100
Received: by fk-out-0910.google.com with SMTP id f40so1249829fka.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2009 02:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:date:from:to:subject
	:message-id:in-reply-to:references:x-mailer:x-face:mime-version
	:content-type:content-transfer-encoding;
	bh=ERzK+g/bgVrZ2WmVc2Bv3bjdBxHd7aK0klL5gDcDtTo=;
	b=fEwvAnv+1joV0vic883ySXodGiq9uF1d+Ly5Px5lUCIRxQ6J8Z3sXHCL/OXrocDTcY
	j88VLjdo+yW/ABGNYnCHPJHiHs83w445VMOudyIeIifRCMQlDTj88tzyyjEIrxelTnGW
	o+vWliEo6TAZb99wPPN4Qi0ZKKeqDcL7fjwBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:subject:message-id:in-reply-to:references
	:x-mailer:x-face:mime-version:content-type:content-transfer-encoding;
	b=Xkd20bGN2Gj/XZb1yY9UcUwVZPsQ/FwYDPYfeACiWegHAqOLBVS+zTiz5/nlalyL5W
	tzxUlznrhi0aZbdzlE6FjtlYm8qiA4DI1af0jY16HZhW16LaWMCNKbm0c+UTNhzcRYtA
	jxhpGtHV1nFsefbmDqkCdx319N+XMzqKJHgjw=
Received: by 10.86.91.3 with SMTP id o3mr3151455fgb.17.1236162495864;
	Wed, 04 Mar 2009 02:28:15 -0800 (PST)
Received: from mobil.site (87-205-79-201.adsl.inetia.pl [87.205.79.201])
	by mx.google.com with ESMTPS id 3sm1785758fge.18.2009.03.04.02.28.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Mar 2009 02:28:15 -0800 (PST)
Sender: Krzysztof Kotlenga <piernik@gmail.com>
Date: Wed, 4 Mar 2009 11:26:31 +0100
From: Krzysztof Kotlenga <pocek@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090304112631.4cc70f62@mobil.site>
In-Reply-To: <565965130903031700o49cfcaf3r44e81101971f436c@mail.gmail.com>
References: <20090211213312.919E8189338@amethyst.openembedded.net>
	<20090303133626.5706500e@mobil.site>
	<ac9c93b10903030453g6bdfb268ubb30f3854e667d12@mail.gmail.com>
	<20090303182231.2a9b2007@mobil.site>
	<565965130903031700o49cfcaf3r44e81101971f436c@mail.gmail.com>
X-Mailer: Claws Mail 3.7.0 (GTK+ 2.12.9; i586-suse-linux-gnu)
X-Face: U{.sZrXl+;
	-boiB]N4=wPdrR|YT0!fcISDza0Y}=n*z')0S{iZW<Uy$s~&}09$vR^IuFq,E0)iS]JFG0-3Wmow(MTQ!]rN*<Pa(<PO:*9RFU_\(15s:]Pj}lCTcP(,pUZLy"[4/jpF1l^Y4z!>jV!F"n+n2Rpp8jcp53&OWJgn?AJcD2
Mime-Version: 1.0
Subject: Re: [oe-commits] Frans Meulenbroeks : opkg: fix bug that occured with file names of exactly 100 chars in the tar file
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
X-List-Received-Date: Wed, 04 Mar 2009 10:35:13 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Tick wrote:

> Hi kjk,
>   Thanks, patch applied as R203

Thanks Tick.
Since Koen has bumped opkg SRCREV to r203, now we have one problem
left: opkg_unarchive.patch has to be disabled/removed. Otherwise it
breaks what was fixed here.

-- 
kjk


