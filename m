Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q03yM-0000y6-G6
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 04:34:03 +0100
Received: by pxi1 with SMTP id 1so555318pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 20:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Cuz5Je7jhxkQM7qtDxKbDVkvQSb4GZcuwcdlhfA3a2o=;
	b=nkpZYMVkVGqGT9T/eMKAByLuqut3nfHj/S/F2RHdgnool4rrTmfEKsICRrEEwxFSaC
	Zx1++mRXAGLEflc0sy+HqtfToZyCE+vFlG9tdP1eKjs6zzmrQ6PqJpdu+xvNls+aDPbl
	hY73Zh7C2rOHfEGRvsCRCAuvFULvwHsgIjARk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=dBSRVlZO/zGw/eROuksTSPfp6fXWvpI1bqoqhpXlogoCvql/3xeGhRpsZpU5b2T3X7
	zPITmrvenRmf5fkaadiRmp0wEPccEfuxUYcOQXa3MQD9JwRUP0uaW0ndPTOZggacGWT/
	ZuTbv6sQwT1yrUm5X7dVAdvncdAGlbA3Rrh4M=
Received: by 10.142.195.12 with SMTP id s12mr559185wff.307.1300332362950;
	Wed, 16 Mar 2011 20:26:02 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id m10sm1953326wfl.11.2011.03.16.20.25.57
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 20:25:58 -0700 (PDT)
Message-ID: <4D817F36.30900@gmail.com>
Date: Wed, 16 Mar 2011 20:25:42 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300325100-29332-1-git-send-email-denis@denix.org>
	<20110317014349.GN3042@denix.org>
In-Reply-To: <20110317014349.GN3042@denix.org>
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 03:34:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2011 6:43 PM, Denys Dmytriyenko wrote:
> An alternative solution, is to build libatomics-ops with emulated CAS (Compare
> And Swap), as otherwise those non-emulated primitives are not available on
> armel and sparc, according to [1]
>
> Let me know if fixing libatomics-ops is more preferable and I'll make a patch.
> But I figured that since cairo used to build w/o atomic ops anyway, it's safer
> to just forcefully disable the check for them.

I am inclined to get the libatomic-ops if possible.

>
> [1] http://us.generation-nt.com/answer/bug-566850-ao-compare-swap-full-not-available-armel-sparc-help-169012241.html
>
> BTW, the correct name is libatomic-ops and not libatomics-ops, like it's named
> in OE...
>



