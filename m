Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1LpRFl-0001OH-JV
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 20:03:29 +0200
Received: by fg-out-1718.google.com with SMTP id 19so375375fgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2009 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=lhlmdfGI2Xt+JXSOGkOcEmbL2eVuS9B0oKDQaHmmykc=;
	b=o1tXQ4nyAr6tRNQ14X17UJ7/ymXdV8FHrCI+pTrmit4/rtSueqmEqUQuqbisoCSoxF
	dWneiiVgoB/V2Sak66EW7XdYbFnAT8AsKV0vRpLesTQC455RZBhzX5643mn3/gLuZfKj
	WTtHLMu2rF1j986TgGAI/5XDWfpsznLnxVKqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=tEYl7HiH5IIi2TMJN7pvwznqAm/bQxQPhdzxGzTrsE8bdFFpKz18GxCG8FV+LlUyrJ
	vHhilWCJV4mrOBjl4qiPzPeQW6rFijXKnzVaR3YN0PJexUlck751hKrLiMcBNa0XL9kS
	Bg2L4uJ8+6p+rfk64RYr3BMo4xQgqaWcBZ91g=
Received: by 10.86.96.18 with SMTP id t18mr362776fgb.25.1238695234877;
	Thu, 02 Apr 2009 11:00:34 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-64-194.t2.dsl.vodafone.it
	[93.144.64.194])
	by mx.google.com with ESMTPS id d4sm3089421fga.8.2009.04.02.11.00.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Apr 2009 11:00:34 -0700 (PDT)
Message-ID: <49D4FD3F.8010104@gmail.com>
Date: Thu, 02 Apr 2009 20:00:31 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49D33527.6050102@gmail.com> <49D46F4D.1010004@bolloretelecom.eu>
In-Reply-To: <49D46F4D.1010004@bolloretelecom.eu>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: castroenrico@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_20,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4-tools-native_4.4.3.bb failed
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
X-List-Received-Date: Thu, 02 Apr 2009 18:03:47 -0000
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Thank you very much, your patch works.

Regards,

Jeremy Lainé ha scritto:
> Enrico,
> 
> I have managed to reproduce your problem in a chrooted environment which did not have the
> zlib development files. I have just commited a patch which fixes the problem for me:
> 
> http://cgit.openembedded.org/cgit.cgi?url=openembedded/commit/&id=8f61b0343b6c56644fdaa8fa3e84e1c29d3f47b9
> 
> Could you please try building qt4-tools-native again and let me know whether it works?
> 
> Cheers,



