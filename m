Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEAE65D5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:14:57 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id v10so555786pde.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=x8ltsLmaSl3KRhvdHsOVVfQMIjmmTUzmX5AGC98b7NI=;
	b=BQjPmvCZ01YcvFifs3oYbGyXe7Wrnu3aCwbwXaq9R5URLBWPloM5U4JN0U6+ZsSQ38
	G7Sjc1m7KU8Er+G78czFZwqN41QTMDnW2L43NIioK7T508k8703lfLp//FlRSpdtJBjp
	57jB3I8q9IUOTv0BjrVRD8AaViw1HazO11yzsGO4un54tocoas18HoAzoBPWfoaD3vOi
	y4XF49ry6PY3GiGlWoZXrS64KCDN7uzXvpB/Ev84tBxREnwRXpcHP8tJCK+fe4Ll6yRc
	hDKFuC7CmuCUQ0gpRb+F5ryqZyun2UA/wjqEmSmW6kWqq4mut7q7vAnL3C07Jbsx9pYC
	JwvA==
X-Received: by 10.68.190.229 with SMTP id gt5mr1041163pbc.15.1407975298995;
	Wed, 13 Aug 2014 17:14:58 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:f465:994a:7e40:209f?
	([2601:c:9380:601:f465:994a:7e40:209f])
	by mx.google.com with ESMTPSA id oz7sm4943080pdb.77.2014.08.13.17.14.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 17:14:57 -0700 (PDT)
Message-ID: <53EBFF7F.9010800@gmail.com>
Date: Wed, 13 Aug 2014 17:14:55 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAP9ODKr7+nzk9sCsHzB+Eg+YG_FpvO5U+X7d86fS4mybg_gNtg@mail.gmail.com>
In-Reply-To: <CAP9ODKr7+nzk9sCsHzB+Eg+YG_FpvO5U+X7d86fS4mybg_gNtg@mail.gmail.com>
Subject: Re: [for-daisy] Backports for merging
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
X-List-Received-Date: Thu, 14 Aug 2014 00:15:06 -0000
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit



On 08/13/2014 04:12 PM, Otavio Salvador wrote:
> Hello,
>
> I am seeing this failure in Daisy branches:
>
> commit 75ca64e5917d0177c48f58f631497a05e2773731
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Wed Jun 4 20:09:39 2014 -0300
>
>      nbench-byte: Fix parallel building error
>
>      This extends the dependencies on pointer.h to fix following error:
>
>      | ./sysinfo.sh arm-poky-linux-gnueabi-gcc ...
>      | In file included from misc.h:36:0,
>      |                  from misc.c:23:
>      | nmglobal.h:29:21: fatal error: pointer.h: No such file or directory
>      |  #include "pointer.h"
>      |                      ^
>      | compilation terminated.
>      | make: *** [misc.o] Error 1
>      | make: *** Waiting for unfinished jobs....
>      | ERROR: oe_runmake failed
>      | WARNING: exit code 1 from a shell command.
>
>      Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Please wait for one more Ack and backport it, if fine.
>

Acked-by: Armin Kuster <akuster808@gmail.com>

