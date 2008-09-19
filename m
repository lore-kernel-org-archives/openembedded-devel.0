Received: from [209.85.217.19] (helo=mail-gx0-f19.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1KgcGM-0004Sv-Eh
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Sep 2008 11:26:54 +0200
Received: by gxk12 with SMTP id 12so518375gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2008 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=y/UWyEgOcu+yhVmcxWRQIXjfJvmZnE/PqJGNe6bLFfs=;
	b=Ez0L4EVL2xh63qrpzLfFkiVhY8WZfSJEURmr5/ug/RO7iyqrXLAv7WIEmK3+SOiFjy
	iCNWsPOTNhrS+wP0k743H1fAcsgqD9cwApvJJ5nfCnH8hO37vM45NkmioU+UfqwIhNDW
	yb+ca3Bo/uAli3ipEbGVG/pB+XPVrMBiN+p7w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=Hu5S3auaQI+beHrzOiqnhEn1CT2TeCJNJvNaeqgMSDz9lkKBVZirqIeak4gMuRAAgR
	usnfgdAT5Z9NSrw5KpUFGe7Gobmr9PmrleWSqja3uIrSEbAyBNVLY0995ZiH0gkTCXTP
	0wg40mntVwh3xD2Fj+T19w3eNW0SVYFB0vrzc=
Received: by 10.90.100.17 with SMTP id x17mr6564114agb.89.1221816216694;
	Fri, 19 Sep 2008 02:23:36 -0700 (PDT)
Received: from ?192.168.1.214? ( [68.184.206.142])
	by mx.google.com with ESMTPS id 38sm830310agd.18.2008.09.19.02.23.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Sep 2008 02:23:35 -0700 (PDT)
Message-ID: <48D36F94.4060606@gmail.com>
Date: Fri, 19 Sep 2008 04:23:32 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF3DF@hiob.intern.dresearch.de>
	<48D21CBC.3050507@gmx.net>
In-Reply-To: <48D21CBC.3050507@gmx.net>
Cc: Discussion and review of changes to the stable branch and its policy
	<openembedded-stablebranch@openembedded.org>
Subject: Re: fetching gob2_2.0.14.bb failed :(
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
X-List-Received-Date: Fri, 19 Sep 2008 09:26:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2008 04:17 AM, Robert Schuster wrote:
> Hi Steffen,
> 
> Sledz, Steffen schrieb:
>> NOTE: fetch http://ftp.5z.com/pub/gob/gob2-2.0.14.tar.gz
>> --2008-09-17 12:57:03--  http://ftp.5z.com/pub/gob/gob2-2.0.14.tar.gz
>> Resolving ftp.5z.com... 66.135.50.158
>> Connecting to ftp.5z.com|66.135.50.158|:80... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2008-09-17 12:57:03 ERROR 404: Not Found.
>>
>> It seems that the URL has changed to http://ftp.5z.com/pub/gob/old/gob2-2.0.14.tar.gz
> Fixed for .dev and .stable.
> 
> Regards
> Robert

not for the .stable. but I pushed to stable in 
4d12225c4b2676ce90c3709350981bf7f23207c4. I don't think trivial things 
like this needs review.

Regards
Gordon


