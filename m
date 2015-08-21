Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 547CE60557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 09:15:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L9Ff3A009076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 02:15:41 -0700 (PDT)
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Fri, 21 Aug 2015 02:15:41 -0700
Message-ID: <55D6EC3A.8000007@windriver.com>
Date: Fri, 21 Aug 2015 17:15:38 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1440139197.git.yi.zhao@windriver.com>	<cb06e085a8cd5f4a6251d8c0e4168c022fda564e.1440139197.git.yi.zhao@windriver.com>
	<CAMKF1sp4FKaBu33oYCLX9MZ6+URBtJL_UB_wALMHrO8xJ8USLQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp4FKaBu33oYCLX9MZ6+URBtJL_UB_wALMHrO8xJ8USLQ@mail.gmail.com>
X-Originating-IP: [128.224.163.137]
Subject: Re: [meta-oe][PATCH 1/8] tomoyo-tools: pass correct libdir to make
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
X-List-Received-Date: Fri, 21 Aug 2015 09:15:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2015年08月21日 15:27, Khem Raj 写道:
> On Thu, Aug 20, 2015 at 11:46 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>> -CFLAGS_append += "-D_GNU_SOURCE"
>> +
> why was CFLAGS append removed ?

There is a redefined warning when compile like below:

In file included from tomoyo-diffpolicy.c:23:0:
tomoyotools.h:26:0: warning: "_GNU_SOURCE" redefined
  #define _GNU_SOURCE
  ^
In file included from tomoyo-checkpolicy.c:23:0:
tomoyotools.h:26:0: warning: "_GNU_SOURCE" redefined
  #define _GNU_SOURCE
  ^
<command-line>:0:0: note: this is the location of the previous definition
<command-line>:0:0: note: this is the location of the previous definition
In file included from tomoyo-auditd.c:23:0:
tomoyotools.h:26:0: warning: "_GNU_SOURCE" redefined
  #define _GNU_SOURCE
  ^
<command-line>:0:0: note: this is the location of the previous definition

The _GNU_SOURCE is ready defined in the source and there is not ifdef or 
ifndef for it in the source.

Yi

>
>> +EXTRA_OEMAKE = "-e USRLIBDIR=${libdir}"


