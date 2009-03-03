Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LeQJi-00047k-H2
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 09:49:36 +0100
Received: by bwz9 with SMTP id 9so2289978bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 00:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=qMUlmd/CCsJfz3Vpt0IgkG2I2zXG+ZtiAy2ltPucXIc=;
	b=MOMfgtoQyCqBeOjCdUQG9eI2t7h6Lj92sEqP/KhbyOhS+cC/wxocjVkplF2JeZnU6k
	UMxLGKWiW3SVPKUqzKqWZBibhUFbeY5etDz36VwsjEe0HEPOKy9Asrl8+JLJg508uBjr
	ZGOP6syLnYncIfHzzu+XgCLzJCQ1P4zwjFK84=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=WinaF0ThIx+6bnSaYbJD0gilrkP6Ji3TadgalmT4/UcOknKhPLJzYdtGsO3yKUa58t
	HBMV3epzkrDizPqBx7LegQGGJ+dOaGACNAx9+KK/M+sVUAk36HgOGnzqWvmV2oCShJuP
	Hr05ocFWIbLAtJqqX1XjVwiJivsBP/v1/vTFw=
Received: by 10.103.223.2 with SMTP id a2mr3449636mur.4.1236069930949;
	Tue, 03 Mar 2009 00:45:30 -0800 (PST)
Received: from is.home ([93.81.142.101])
	by mx.google.com with ESMTPS id i7sm1849045mue.44.2009.03.03.00.45.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Mar 2009 00:45:30 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 3 Mar 2009 11:45:26 +0300
User-Agent: KMail/1.9.10
References: <49AB58CA.7090406@tait.co.nz> <49AC87D1.3050505@dls.net>
In-Reply-To: <49AC87D1.3050505@dls.net>
MIME-Version: 1.0
Message-Id: <200903031145.26859.jay4mail@gmail.com>
Subject: Re: fatal: Not a git repository
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
X-List-Received-Date: Tue, 03 Mar 2009 08:49:39 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> Douglas Royds wrote:
> > Anyone else getting this?
> >
> >    NOTE: Handling BitBake files: / (6587/6587) [100 %]
> >    NOTE: Parsing finished. 6302 cached, 0 parsed, 285 skipped, 0
> > masked. NOTE: Cache is clean, not saving.
> >    NOTE: build 200903021645: started
> >    fatal: Not a git repository <----------------------
> >
> >    OE Build Configuration:
> >    BB_VERSION        = "1.8.12"
> >    ...
> >
> > The same complaint seems to crop up at various points during a build,
> > as well.
>
> Yes, I see that as well.  Of course, since I -- at the time -- was
> building from a snapshot and not the original git repo, and the build
> results seemed quite normal, I gave it no further thought.

I have this too.

I think we should add some parameter to conf-files which allows to point 
where is git repository located.

This is useful when publishing build stats to tinderbox.

-- 
Yuri Bushmelev


