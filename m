Return-Path: <net147@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 769A2619DD;
	Tue,  9 Jul 2013 09:48:41 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so5310276pbc.31
	for <multiple recipients>; Tue, 09 Jul 2013 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lc1IlpqtsBRSUFf85P5j9du2HhlHQvajB05gMYOpY38=;
	b=nLF8TvVvPi7sKUNmNb6W04RFiZUyynf6ZUUR1/DM8lFhPcVXspKeLEmenpl83AGrI+
	zdyD/IK5m+h9bU2Qc3xbPS6f+xjtUyf4XZwSJFh32QoXsob6skcpdPWGFNCLKF8PEwM2
	m/nnsIQfaIEfmAJOLM7A6a1bCWtsLLKMMwue+SBjY25Xvnq2ebiHZ0ALkk5BzTt33nkh
	XK9ewrIkniBgKOf1EedSb7iN4ZS7Tbli0/PjVhm4EIFnEh4v/SDzsawbBKbXLuc9TMTv
	/JyG40rkdTmcGNocvjSqTDX/qqlthyycq7rvnYK667mlzBX9iX0zrgwjIFXy5eVEQA98
	FkPg==
X-Received: by 10.66.179.17 with SMTP id dc17mr14574578pac.85.1373363322304;
	Tue, 09 Jul 2013 02:48:42 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	zn4sm29213438pac.21.2013.07.09.02.48.39 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 02:48:41 -0700 (PDT)
Message-ID: <51DBDB50.7050502@gmail.com>
Date: Tue, 09 Jul 2013 19:43:44 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20130705143917.C20B35040C@opal> <20130708121048.GK3288@jama>
In-Reply-To: <20130708121048.GK3288@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : eglibc: Add 2.18 recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jul 2013 09:48:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/07/2013 10:10 PM, Martin Jansa wrote:
> On Fri, Jul 05, 2013 at 02:39:17PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 59ae9fc07a6a89492c001de0b3322ecd6d3956be
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=59ae9fc07a6a89492c001de0b3322ecd6d3956be
>>
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Wed Jun 26 13:59:01 2013 -0700
>>
>> eglibc: Add 2.18 recipes
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> boost is now failing on all architectures
>
> ./boost/atomic/atomic.hpp: At global scope:
> ./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in this scope
>   typedef atomic<uintptr_t> atomic_uintptr_t;
>                  ^
> ./boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
>   typedef atomic<uintptr_t> atomic_uintptr_t;
>                           ^
> ./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration before ';' token
>   typedef atomic<uintptr_t> atomic_uintptr_t;
>                                             ^
> Adding
> #include <stdint.h> in boost/atomic/atomic.hpp solves that, but
> #include <cstdint> doesn't, is it right fix?
Please file a bug report with boost. stdint.h is not always available 
(e.g. Microsoft Visual C++ 2008 and older).

Regards,
Jonathan

