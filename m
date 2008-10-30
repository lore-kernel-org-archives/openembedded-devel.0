Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KvQry-0007fZ-P5
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 07:18:58 +0100
Received: by wf-out-1314.google.com with SMTP id 29so447097wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2008 23:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=wlavYTzTiYAe3jc/6f3jYhafT/mrOC5UpUmgfBnJxNY=;
	b=mGk9xSvD1DtFAI5r0YXIoTNkkDK0aiClCiP+Q8WekEjvCUXt3+3NhRQgPWebbhffeU
	iHmVJEiKYu1UPldRo+QVMUTiY+9p+5gGc504u+FwbGEZAMK8qO2Mq3EnPoLOlfeYUh2A
	jEJJyPfgj4rBpuxi081a7ExTEYKYZ3pEn0tA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=H1t67eqrcrrfcTLTo96ixzNA0xEBWsRUsnkUHlNDQ95WyiJNqXMGAi2R6yXQApCMop
	Vu2WSZw+LLTStNpc+JUWilUfCJlkTyrR1e4sJvKGLGDNbUqcWl8+/cp8HiUwN59FAOzS
	dNYME/OTJjlswb6GxTF1dMGQjScTSHAhNm8jM=
Received: by 10.142.109.8 with SMTP id h8mr4463066wfc.150.1225347478113;
	Wed, 29 Oct 2008 23:17:58 -0700 (PDT)
Received: from localhost (adsl-71-146-26-221.dsl.pltn13.sbcglobal.net
	[71.146.26.221])
	by mx.google.com with ESMTPS id 30sm1729722wfa.10.2008.10.29.23.17.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Oct 2008 23:17:57 -0700 (PDT)
Date: Wed, 29 Oct 2008 23:17:56 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081030061756.GB19310@gmail.com>
References: <200810291730.49558.zecke@selfish.org>
MIME-Version: 1.0
In-Reply-To: <200810291730.49558.zecke@selfish.org>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: Packages not honoring our LDFLAGS
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
X-List-Received-Date: Thu, 30 Oct 2008 06:18:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (29/10/08 17:30), Holger Freyther wrote:
> Hey,
> 
> I have enabled --hash-style=gnu some time ago but some packages do not honor 
> this and I could need your help.
> 
> The attached list is a list of binaries and libraries not honoring our LDFLAGS 
> and this list was compiled from a run of bitbake fso-image.
> 
> help would be appreciated.

We could modify gcc LINK_SPEC and add --hash-style=gnu or
--hash-style=both then you dont need the LDFLAGS at all it will happen
automatically.

But this would need binutils/ld supporting this otherwise links would
fail. 

I can prepare a gcc patch if this is interesting approach

Thx

-Khem



