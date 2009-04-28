Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lyu8k-0003bH-5t
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 22:42:54 +0200
Received: by wf-out-1314.google.com with SMTP id 28so528666wfa.6
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=5InLTVQAEjFfKF1OV71N4WNm1ru/3yaVaWTEgN2LuEg=;
	b=RIlcseF8XQDCe+nChfcKwiXH5FdaxWeveblV67bUffnJUHVAf/n5vpwUIZds3hW/lh
	Ri17aUgbmpxWHYfcsb1aDmDKKFN6otWeBU37Rl/HfJ/W2i1oPYpFLgXIENGc1ZbgrsQP
	AikHB9sltJiXOukvsr2asp+9GSOAvz2A6Nzv0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=j7d28ZR4QJka2o/V5QulIIE903RVccjnSF62llgrmKFC3qHmv86j+pZ8lFZ75KjZoV
	e0bKaovrBxRE3kp0ohklehU1Tz6yBJZiFi33qICyrk+M8M3Hxf7tlCg5rYWIBe2qgqvl
	/8zeB/et1PYGBx4yleW7h5NBQfd378Fmhx+24=
Received: by 10.142.192.1 with SMTP id p1mr1493948wff.316.1240951062515;
	Tue, 28 Apr 2009 13:37:42 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id 24sm461986wff.31.2009.04.28.13.37.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:37:41 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:37:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428203738.GI26082@gmail.com>
References: <20090428040959.GT18788@smtp.west.cox.net>
	<gt6a60$sbd$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gt6a60$sbd$2@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] Enable PTHREADS_DEBUG_SUPPORT on all uClibc builds
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
X-List-Received-Date: Tue, 28 Apr 2009 20:42:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/04/09 09:10), Koen Kooi wrote:
> On 28-04-09 06:09, Tom Rini wrote:
>> As has been reported, building uClibc with PTHREADS_DEBUG_SUPPORT=n
>> means that task-sdk-bare won't install due to missing uclibc-thread-db.
>> The following enables it everywhere it was disabled and bumps PRs.  This
>> should be fine given that we already have separate debug packages and
>> the extra files end up in an additional package.
>>
>> Signed-off-by: Tom Rini<trini@embeddedalley.com>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

You should also bump PR for uclibc_nptl recipe.


